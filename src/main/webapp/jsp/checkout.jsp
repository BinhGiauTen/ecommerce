<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="cart" scope="session" class="models.Cart" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/img/logo.png">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/grid.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/responsive.css">
<style type="text/css">
.checkout__container {
	padding: 20px;
	background-color: #f8f8f8;
	border-radius: 8px;
}

.checkout__title {
	text-align: center;
	font-size: 24px;
	margin-bottom: 20px;
}

.checkout__form {
	display: flex;
	flex-direction: column;
}

.checkout__section {
	margin-bottom: 20px;
}

.checkout__section-title {
	font-size: 20px;
	margin-bottom: 10px;
}

.checkout__input-group {
	margin-bottom: 15px;
}

.checkout__input-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	font-size: 14px;
}

.checkout__input-group input[type="text"], .checkout__input-group input[type="email"]
	{
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.checkout__input-group input[type="radio"] {
	margin-right: 10px;
}

.checkout__summary {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
}

.checkout__summary-list {
	list-style: none;
	padding: 0;
}

.checkout__summary-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 14px;
    padding: 10px 0;
}

.checkout__total {
	display: flex;
	justify-content: space-between;
	font-weight: bold;
	margin-top: 20px;
}

.checkout__button {
	width: 100%;
	padding: 15px;
	background-color: #ff5722;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	cursor: pointer;
	text-align: center;
	margin-top: 10px;
}

.checkout__button:hover {
	background-color: #e64a19;
}
</style>
</head>
<body>
	<div class="main">
		<header class="header">
			<div class="grid wide">
				<div class="header__list">
					<div class="header__left">
						<span>SIÊU THỊ GIA DỤNG</span>
						<c:if test="${sessionScope.account.isAdmin == true}">
							<a href="/Ecommerce/jsp/dashboard.jsp"
								class="header__left-dashboard">Đến trang quản trị </a>
						</c:if>
					</div>
					<div class="header__right hide-on-mobile-tablet">
						<c:choose>
							<c:when test="${not empty sessionScope.account}">
								<div class="header__right-account">
									<span>Xin chào, ${sessionScope.account.userName}</span> <a
										href="/Ecommerce/Logout" class="header__right-logout" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất không?');"><i
										class="header__right-login-icon fa-solid fa-right-from-bracket"></i>Đăng
										xuất</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="header__right-login">
									<a href="/Ecommerce/jsp/login.jsp"> <i
										class="header__right-login-icon fa-solid fa-right-to-bracket"></i>
										Đăng nhập
									</a>
								</div>
								<div class="header__right-register">
									<a href="/Ecommerce/jsp/register.jsp"> <i
										class="header__right-register-icon fa-solid fa-user-plus"></i>
										Đăng ký
									</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</header>
		<div class="grid wide">
			<nav class="nav__mini">
				<span><a href="/Ecommerce/Home">Trang chủ</a> > <a
					href="/Ecommerce/jsp/cart.jsp">Giỏ hàng</a> > Đặt hàng</span>
			</nav>
			<div class="checkout__container">
				<form action="/Ecommerce/Checkout" method="post">
					<div class="checkout__section">
						<h3 class="checkout__section-title">Thông tin giao hàng</h3>
						<div class="checkout__input-group">
							<label for="userName">Họ và tên:</label> <input type="text"
								id="userName" name="userName" value="${sessionScope.account.userName}" required>
						</div>
						<div class="checkout__input-group">
							<label for="phone">Số điện thoại:</label> <input type="text"
								id="phone" name="phone" value="${sessionScope.account.phone}" required>
						</div>
						<div class="checkout__input-group">
							<label for="email">Email:</label> <input type="email" id="email"
								name="email" value="${sessionScope.account.email}" required>
						</div>
						<div class="checkout__input-group">
							<label for="address">Địa chỉ:</label> <input type="text"
								id="address" name="address" required>
						</div>
					</div>
					<div class="checkout__section">
						<h3 class="checkout__section-title">Phương thức thanh toán</h3>
						<div class="checkout__input-group">
							<input type="radio" id="cod" name="paymentMethod" value="COD"
								checked> <label for="cod">Thanh toán khi nhận
								hàng (COD)</label>
						</div>
						<div class="checkout__input-group">
							<input type="radio" id="bankTransfer" name="paymentMethod"
								value="BankTransfer"> <label for="bankTransfer">Chuyển
								khoản ngân hàng</label>
						</div>
					</div>
					<div class="checkout__summary">
						<h3 class="checkout__section-title">Tóm tắt đơn hàng</h3>
						<ul class="checkout__summary-list">
							<c:forEach var="cartItem" items="${cart.cartItems}">
								<li class="checkout__summary-item"><span>${cartItem.productName}
										(x${cartItem.quantity})</span> <span><fmt:formatNumber
											value="${cartItem.totalCost}" type="number" pattern="#,##0" />
										đ</span></li>
							</c:forEach>
						</ul>
						<div class="checkout__total">
							<span>Tổng cộng:</span>
							<span><fmt:formatNumber value="${cart.totalPrice}" type="number" pattern="#,##0"/> đ</span>
						</div>
					</div>
					<button type="submit" class="checkout__button btn btn--primary">Đặt
						hàng</button>
				</form>
			</div>
		</div>
		<div class="footer">
			<div class="grid wide">
				<div class="row">
					<div class="col l-3 m-6 c-12">
						<h3 class="footer__heading">Về chúng tôi</h3>
						<ul class="footer__list">
							<li class="footer__item"><a href="/Ecommerce/Home">Trang
									chủ</a></li>
							<li class="footer__item"><a
								href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a></li>
							<li class="footer__item"><a href="/Ecommerce/Product">Sản
									phẩm</a></li>
							<li class="footer__item"><a href="/Ecommerce/jsp/news.jsp">Tin
									tức</a></li>
							<li class="footer__item"><a
								href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
						</ul>
					</div>
					<div class="col l-3 m-6 c-12">
						<h3 class="footer__heading">Hỗ trợ khách hàng</h3>
						<ul class="footer__list">
							<li class="footer__item"><a href="/Ecommerce/Home">Trang
									chủ</a></li>
							<li class="footer__item"><a
								href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a></li>
							<li class="footer__item"><a href="/Ecommerce/jsp/Product">Sản
									phẩm</a></li>
							<li class="footer__item"><a href="/Ecommerce/jsp/news.jsp">Tin
									tức</a></li>
							<li class="footer__item"><a
								href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
						</ul>
					</div>
					<div class="col l-3 m-6 c-12">
						<h3 class="footer__heading">Liên hệ với chúng tôi</h3>
						<ul class="footer__list">
							<li class="footer__item">
								<div class="footer__item__heading">Địa chỉ</div>
								<div class="footer__item__text">70 Lu Gia, Ward 15,
									District 11, Ho Chi Minh City</div>
							</li>
							<li class="footer__item">
								<div class="footer__item__heading">Hotline</div>
								<div class="footer__item__text">
									<a href="tel:1900 6750"> 1900 6750</a>
								</div>
							</li>
							<li class="footer__item">
								<div class="footer__item__heading">Email</div>
								<div class="footer__item__text">
									<a href="mailto:support@sapo.vn"> support@sapo.vn</a>
								</div>
							</li>
						</ul>
					</div>
					<div class="col l-3 m-6 c-12">
						<h3 class="footer__heading">Đăng ký nhận bảng tin</h3>
						<form action="" class="footer__form">
							<input type="email" placeholder="Email của bạn"> <i
								class="fa-regular fa-paper-plane"></i>
						</form>
						<div class="footer__item__text">Bạn là khách hàng mới. Đăng
							ký email và nhận mã giảm giá 50.000 đ.</div>
						<div class="footer__img">
							<img src="<%=request.getContextPath()%>/assets/img/payment-1.svg"
								alt=""> <img
								src="<%=request.getContextPath()%>/assets/img/payment-2.svg"
								alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="footer__bottom">
				<div class="grid wide">
					<p class="footer__text">© 2015 - Bản quyền thuộc về Evo Themes
						| Cung cấp bởi Sapo</p>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/script.js"></script>
</body>
</html>
