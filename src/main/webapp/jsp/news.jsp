<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cart" scope="session" class="models.Cart" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin tức</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/logo.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/grid.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/responsive.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
</head>
<body>
    <div class="main">
        <header class="header">
            <div class="grid wide">
                <div class="header__list">
                    <div class="header__left">SIÊU THỊ NỘI THẤT & TRANG TRÍ EVO NỘI THẤT</div>
                    <div class="header__right hide-on-mobile-tablet">
                        <div class="header__right-login">
                            <a href="/Ecommerce/jsp/login.jsp">
                                <i class="header__right-login-icon fa-solid fa-right-to-bracket"></i>
                                Đăng nhập
                            </a>
                        </div>
                        <div class="header__right-register">
                            <a href="/Ecommerce/jsp/register.jsp">
                                <i class="header__right-register-icon fa-solid fa-user-plus"></i>
                                Đăng ký
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="grid wide">
			<div class="header-logo-search-cart">
				<button class="res_btn">
					<i class="fa-solid fa-bars"></i>
				</button>
				<div class="header-logo hide-on-mobile">
					<a href="/Ecommerce/Home"><img
						src="<%=request.getContextPath()%>/assets/img/logo1.png" alt=""
						class="header-img"></a>
				</div>
				<div class="header-search">

					<input type="text" placeholder="Bạn muốn tìm gì?"> <i
						class="fa-solid fa-magnifying-glass"></i>
					<!-- <div class="header-search-input">
                        <span>Bạn muốn tìm gì?</span>
                    </div>
                    <div class="header-search-icon">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div> -->
				</div>
				<div class="header-hotline-cart">
					<div class="header-hotline-cart-list">
						<div class="header-hotline hide-on-mobile-tablet">
							<a href="#"> <span class="header-hotline-title">Liên
									hệ Hotline</span> <span class="header-hotline-if">1900 1900</span>
							</a>
						</div>
						<div class="header-address hide-on-mobile-tablet">
							<a href="#"> <span class="header-address-title">Tìm
									địa chỉ</span> <span class="header-address-if">Cửa hàng</span>
							</a>
						</div>
						<div class="header__cart">
							<div class="header__cart-wrap">
								<a href="/Ecommerce/jsp/cart.jsp"><i
									class="header__cart-icon fa-sharp fa-solid fa-cart-shopping"></i></a>
								<span class="header__cart-notice">${cart.lineItemCount}</span>
								<!-- No cart: header__cart-list--no-cart -->
								<div class="header__cart-list header__cart-list--no-cart">
									<c:choose>
										<c:when test="${empty cart.cartItems}">
											<img
												src="<%=request.getContextPath()%>/assets/img/no-cart.png"
												alt="" class="header__cart-no-cart-img">
											<span class="header__cart-list--nocart-msg"> Chưa có
												sản phẩm </span>
										</c:when>
										<c:otherwise>
											<!-- Có sản phẩm -->
											<h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
											<ul class="header__cart-list-item">
												<c:forEach var="cartItem" items="${cart.cartItems}">
													<li class="header__cart-item"><img
														src="${cartItem.img_url }" alt="" class="header__cart-img">
														<div class="header__cart-item-info">
															<div class="header__cart-item-head">
																<h5 class="header__cart-item-name">${cartItem.productName}</h5>
																<div class="header__cart-item-price-wrap">
																	<span class="header__cart-item-price"><fmt:formatNumber
																			value="${cartItem.oldPrice - (cartItem.oldPrice * cartItem.discount / 100)}"
																			type="number" pattern="#,##0" /> đ</span> <span
																		class="header__cart-item-multiply">x</span> <span
																		class="header__cart-item-quantity">${cartItem.quantity}</span>
																</div>
															</div>
														</div></li>
												</c:forEach>
											</ul>
											<a href="/Ecommerce/jsp/cart.jsp"
												class="header__cart-view-cart btn btn--primary">Xem giỏ
												hàng</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="menu hide-on-mobile-tablet">
            <div class="grid wide">
                <div class="row">
                    <div class="grid__column-1">
                        <div class="menu__main">
                            <i class="fa-solid fa-bars"></i>
                            <span>Tất cả sản phẩm</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </div>
                    </div>
                    <div class="grid__column-3">
                        <ul class="nav__list">
                            <li class="nav__item ">
                                <a  href="/Ecommerce/Home">Trang chủ</a>
                            </li>
                            <li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a> </li>
                            <li class="nav__item ">
                                <a href="/Ecommerce/Product">
                                    Sản phẩm
                                    <i class="fa-solid fa-angle-down"></i>
                                </a>
                            </li>
                            <li class="nav__item nav__item--active"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
                            <li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal hide">
            <div class="modal-inner">
                <div class="modal-header">
                    <img src="<%=request.getContextPath()%>/assets/img/logo1.png" alt="">
                    <i class="fa-solid fa-arrow-left"></i>
                </div>
                <div class="modal-content">
                    <a href="/Ecommerce/jsp/login.jsp">Đăng nhập</a>
                    <a href="/Ecommerce/jsp/register.jsp">Đăng ký</a>
                </div>
                <div class="menu__main">
                    <i class="fa-solid fa-bars"></i>
                    <span>Tất cả sản phẩm</span>
                    <i class="fa-solid fa-angle-down"></i>
                </div>
                <ul class="menu__list">
                    <li class="menu__item"><a href="">Nội thất gỗ</a></li>
                    <li class="menu__item"><a href="">Sofa, Ghế thư giãn & Nệm</a></li>
                    <li class="menu__item"><a href="">Đồ trang trí</a></li>
                    <li class="menu__item"><a href="">Đồ dùng vải</a></li>
                    <li class="menu__item"><a href="">Vật dụng bàn ăn</a></li>
                    <li class="menu__item"><a href="">Đồ dùng văn phòng</a></li>
                    <li class="menu__item"><a href="">Đèn</a></li>
                    <li class="menu__item"><a href="">Xem thêm ...</a></li>
                </ul>
                <ul class="nav__list">
                    <li class="nav__item ">
                        <a  href="/Ecommerce/Home">Trang chủ</a>
                    </li>
                    <li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a> </li>
                    <li class="nav__item ">
                        <a href="/Ecommerce/Product">
                            Sản phẩm
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                    </li>
                    <li class="nav__item nav__item--active"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
                    <li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
                </ul>
            </div>
        </div>
        <nav class="nav__mini">
            <div class="grid wide">
                <span><a href="/Ecommerce/Home">Trang chủ</a> > Tin tức</span>
            </div>
        </nav>
        <div class="news">
            <div class="grid wide">
                <div class="row">
                    <div class="col l-3 m-0 c-0">
                        <ul class="sidebar__left__list">
                            <span class="sidebar__left__heading">Danh mục</span>
                            <li class="sidebar__left__item">
                                <a href="/Ecommerce/Home">Trang chủ</a>
                            </li>
                            <li class="sidebar__left__item">
                                <a href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a>
                            </li>
                            <li class="sidebar__left__item">
                                <a href="/Ecommerce/Product">Sản phẩm</a>
                                <i class="fa-regular fa-plus"></i>
                            </li>
                            <li class="sidebar__left__item">
                                <a href="/Ecommerce/jsp/news.jsp">Tin tức</a>
                            </li>
                            <li class="sidebar__left__item">
                                <a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a>
                            </li>
                            
                        </ul>
                        <img class="img_news-left" src="<%=request.getContextPath()%>/assets/img/blog_banner.webp" alt="">
                    </div>
                    <div class="col l-9 m-9 c-12">
                        <h3 class="news__right-heading">TẤT CẢ TIN TỨC</h3>
                        <div class="news__right">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-4 m-4 c-12">
                                        <img class="img__news-right" src="<%=request.getContextPath()%>/assets/img/news-1.webp" alt="">
                                    </div>
                                    <div class="col l-8 m-8 c-12">
                                        <h3 class="news__right-label">TẤM LƯỚI THAY TRẦN NHÀ GIÚP GIA CHỦ SÀI GÒN THƯ GIÃN</h3>
                                        <p class="news__right-content">Ban đầu, ngồi trên chiếc lưới dù treo trên trần phòng khách, chủ nhà cũng thấy "run", nhưng sau khi đã quen, càng ngày họ càng thích. Ngôi nhà 3 tầng 1 lửng tại một khu dân cư mới ở Thủ Dức là tổ ấm của một cặp vợ chồng và hai đứa con tuổi teen....</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="news__right">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-4 m-4 c-12">
                                        <img class="img__news-right" src="<%=request.getContextPath()%>/assets/img/news-2.webp" alt="">
                                    </div>
                                    <div class="col l-8 m-8 c-12">
                                        <h3 class="news__right-label">CĂN HỘ 150 M2 KHÔNG TƯỜNG NGĂN Ở HÀ NỘI</h3>
                                        <p class="news__right-content">Chia phòng bằng hệ thống tủ đựng đồ linh hoạt giúp căn hộ ở Tây Hồ tối giản về thẩm mĩ nhưng tối đa về sử dụng. Căn hộ rộng 150 m2 nằm trên tầng 12, trong một khu chung cư ở quận Tây Hồ được bàn giao mặt bằng trống, không tường xây, để chủ nhà c...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="news__right">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-4 m-4 c-12">
                                        <img class="img__news-right" src="<%=request.getContextPath()%>/assets/img/news-3.webp" alt="">
                                    </div>
                                    <div class="col l-8 m-8 c-12">
                                        <h3 class="news__right-label">5 "Chiêu" đơn giản cho ngôi nhà hợp phong thủy</h3>
                                        <p class="news__right-content">Phong thủy là một yếu tố quan trọng trong văn hóa và đời sống hàng ngày của người phương Đông nói chung và người Việt nói riêng. Ý nghĩa của “phong thủy” bắt nguồn từ sự luân chuyển của “gió” và “nước” - hai nguồn lực tượng trưng cho sức khỏe dồi...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="news__right">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-4 m-4 c-12">
                                        <img class="img__news-right" src="<%=request.getContextPath()%>/assets/img/news-4.webp" alt="">
                                    </div>
                                    <div class="col l-8 m-8 c-12">
                                        <h3 class="news__right-label">BÍ KÍP PHÒNG ĂN CHO NGÔI NHÀ NHỎ MÀ "CÓ VÕ"</h3>
                                        <p class="news__right-content">Đừng để căn phòng nhỏ trở thành rào cản ngăn bạn sáng tạo không gian sống trong mơ. Evo Nội Thất chia sẻ cùng bạn một vài ý tưởng thú vị cho phòng ăn với diện tích khiêm tốn mà vẫn đầy cảm hứng. Nếu bạn thuộc tuýp người thích hội hè tụ tập, p...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="news__right">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-4 m-4 c-12">
                                        <img class="img__news-right" src="<%=request.getContextPath()%>/assets/img/news-5.webp" alt="">
                                    </div>
                                    <div class="col l-8 m-8 c-12">
                                        <h3 class="news__right-label">CẨM NANG NỘI THẤT GỖ CHO TỔ ẤM TRONG MƠ</h3>
                                        <p class="news__right-content">Nội thất gỗ giúp không gian sống của gia đình bạn trở nên thân thiện, đầy sức sống, ấm cúng, thoải mái và dễ chịu. Cùng chúng tôi chọn nội thất gỗ để mang lại phong cách hiện đại có pha chút cổ điển vào trong ngôi nhà của bạn. Gỗ là...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="news__right">
                            <div class="grid wide">
                                <div class="row">
                                    <div class="col l-4 m-4 c-12">
                                        <img class="img__news-right" src="<%=request.getContextPath()%>/assets/img/news-6.webp" alt="">
                                    </div>
                                    <div class="col l-8 m-8 c-12">
                                        <h3 class="news__right-label">7 CÁCH “HÔ BIẾN” NHÀ TẮM THÀNH PHÒNG SPA TẠI GIA</h3>
                                        <p class="news__right-content">Một căn phòng tắm với chức năng thư giãn luôn là mơ ước của mọi gia đình, bởi đây chính là nơi bạn có thể gột sạch những ưu phiền, mệt nhọc sau một ngày làm việc. Còn gì tuyệt vời hơn được tận hưởng không gian spa trong chính ngôi nhà mình một cách đơn giản và nhanh chóng nhất? Cùng chung stooi khám phá vài “chiêu” biến phòng tắm thành góc spa dễ chịu bạn nhé! </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pagination">
                            <ul class="pagination__list">
                                <li class="pagination__item">
                                    <a href=""><i class="fa-solid fa-angles-left"></i></a>
                                </li>
                                <li class="pagination__item pagination__item__active">
                                    <a href="">1</a>
                                </li>
                                <li class="pagination__item">
                                    <a href="">2</a>
                                </li>
                                <li class="pagination__item">
                                    <a href=""><i class="fa-solid fa-angles-right"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <div class="footer">
            <div class="grid wide">
                <div class="row">
                    <div class="col l-3 m-6 c-12">
                        <h3 class="footer__heading">Về chúng tôi</h3>
                        <ul class="footer__list">
                            <li class="footer__item"><a href="/Ecommerce/Home">Trang chủ</a></li>
                            <li class="footer__item"><a href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a></li>
                            <li class="footer__item"><a href="/Ecommerce/Product">Sản phẩm</a></li>
                            <li class="footer__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
                            <li class="footer__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h3 class="footer__heading">Hỗ trợ khách hàng</h3>
                        <ul class="footer__list">
                            <li class="footer__item"><a href="/Ecommerce/Home">Trang chủ</a></li>
                            <li class="footer__item"><a href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a></li>
                            <li class="footer__item"><a href="/Ecommerce/Product">Sản phẩm</a></li>
                            <li class="footer__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
                            <li class="footer__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h3 class="footer__heading">Liên hệ với chúng tôi</h3>
                        <ul class="footer__list">
                            <li class="footer__item">
                                <div class="footer__item__heading">Địa chỉ</div>
                                <div class="footer__item__text"> 70 Lu Gia, Ward 15, District 11, Ho Chi Minh City</div>
                            </li>
                            <li class="footer__item">
                                <div class="footer__item__heading"> Hotline</div>
                                <div class="footer__item__text"><a href="tel:1900 6750"> 1900 6750</a></div>
                            </li>
                            <li class="footer__item">
                                <div class="footer__item__heading"> Email</div>
                                <div class="footer__item__text"><a href="mailto:support@sapo.vn"> support@sapo.vn</a></div>
                            </li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h3 class="footer__heading">Đăng ký nhận bảng tin</h3>
                        <form action="" class="footer__form">
                            <input type="email" placeholder="Email của bạn">
                            <i class="fa-regular fa-paper-plane"></i>
                        </form>
                        <div class="footer__item__text">Bạn là khách hàng mới. Đăng ký email và nhận mã giảm giá 50.000
                            đ.</div>
                        <div class="footer__img">
                            <img src="<%=request.getContextPath()%>/assets/img/payment-1.svg" alt="">
                            <img src="<%=request.getContextPath()%>/assets/img/payment-2.svg" alt="">
                        </div>
                    </div>

                </div>
            </div>
            <div class="footer__bottom">
                <div class="grid wide">
                    <p class="footer__text">© 2015 - Bản quyền thuộc về Evo Themes | Cung cấp bởi Sapo</p>
                </div>
            </div>
        </div>
    </div>

    <script src="<%=request.getContextPath()%>/assets/js/script.js"></script>
</body>
</html>