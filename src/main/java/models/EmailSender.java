package models;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.List;
import java.util.Properties;

public class EmailSender {
    // Update with your email credentials
    private static final String FROM_EMAIL = "tranvanbinh882003@gmail.com";
    private static final String PASSWORD = "ziqo yhou qquz jiel";

    public static void sendRegisterSuccess(String email, String fullname, String phone, String password) throws MessagingException {
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM_EMAIL));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("Gia Dụng Việt cảm ơn quý khách đã tin tưởng sử dụng dịch vụ");
       
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("Thông tin tài khoản của bạn:\n")
                    .append("Tên tài khoản: ").append(fullname).append("\n")
                    .append("Số điện thoại: ").append(phone).append("\n")
                    .append("Email: ").append(email).append("\n")
                    .append("Mật khẩu: ").append(password).append("\n");

        message.setText(emailContent.toString());

        Transport.send(message);
    }
    
    public static void sendOrderConfirmation(String email, String userName, String address, List<OrderItem> orderItems, double totalPrice) throws MessagingException {
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM_EMAIL));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("Xác nhận đơn hàng từ Gia Dụng Việt");

        StringBuilder emailContent = new StringBuilder();
        emailContent.append("Xin chào ").append(userName).append(",\n\n")
                    .append("Cảm ơn bạn đã đặt hàng tại Gia Dụng Việt. Dưới đây là thông tin đơn hàng của bạn:\n\n")
                    .append("Địa chỉ giao hàng: ").append(address).append("\n\n")
                    .append("Danh sách sản phẩm:\n");

        for (OrderItem item : orderItems) {
            emailContent.append("- Sản phẩm: ").append(item.getProductName())
                        .append(", Số lượng: ").append(item.getQuantity())
                        .append(", Giá: ").append(item.getPrice()).append("\n");
        }

        emailContent.append("\nTổng giá trị đơn hàng: ").append(totalPrice).append(" VND\n\n")
                    .append("Trân trọng,\n")
                    .append("Đội ngũ Gia Dụng Việt");

        message.setText(emailContent.toString());

        Transport.send(message);
    }
}
