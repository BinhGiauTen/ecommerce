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
<title>Trang chủ</title>
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
<script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('orderSuccess')) {
                alert('Đặt hàng thành công!');
            }
        }
    </script>

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
							<i class="fa-solid fa-bars"></i> <span>Tất cả sản phẩm</span> <i
								class="fa-solid fa-angle-down"></i>
						</div>
						<ul class="menu__list">
							<c:forEach items="${listC}" var="category">
								<li class="menu__item"><a
									href="/Ecommerce/Home?categoryName=${category.categoryName}">${category.categoryName}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="grid__column-3">
						<ul class="nav__list">
							<li class="nav__item nav__item--active"><a
								href="/Ecommerce/Home">Trang chủ</a></li>
							<li class="nav__item "><a
								href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a></li>
							<li class="nav__item "><a href="/Ecommerce/Product"> Sản
									phẩm <i class="fa-solid fa-angle-down"></i>
							</a></li>
							<li class="nav__item"><a href="/Ecommerce/jsp/news.jsp">Tin
									tức</a></li>
							<li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên
									hệ</a></li>
						</ul>
						<a href=""> <img
							src="<%=request.getContextPath()%>/assets/img/slider_1.webp"
							alt="" class="nav__img">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide">
			<div class="modal-inner">
				<div class="modal-header">
					<img src="<%=request.getContextPath()%>/assets/img/logo1.png"
						alt=""> <i class="fa-solid fa-arrow-left"></i>
				</div>
				<div class="modal-content">
					<a href="/Ecommerce/jsp/login.jsp">Đăng nhập</a> <a
						href="/Ecommerce/jsp/register.jsp">Đăng ký</a>
				</div>
				<div class="menu__main">
					<i class="fa-solid fa-bars"></i> <span>Tất cả sản phẩm</span> <i
						class="fa-solid fa-angle-down"></i>
				</div>
				<ul class="menu__list">
					<c:forEach items="${listC}" var="category">
						<li class="menu__item"><a
							href="/Ecommerce/Home?categoryName=${category.categoryName}">${category.categoryName}</a></li>
					</c:forEach>
				</ul>
				<ul class="nav__list">
					<li class="nav__item nav__item--active"><a
						href="/Ecommerce/Home">Trang chủ</a></li>
					<li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới
							thiệu</a></li>
					<li class="nav__item "><a href="/Ecommerce/Product"> Sản
							phẩm <i class="fa-solid fa-angle-down"></i>
					</a></li>
					<li class="nav__item"><a href="/Ecommerce/jsp/news.jsp">Tin
							tức</a></li>
					<li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên
							hệ</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<div class="grid wide">
				<h2 class="container__first ">Sản phẩm mới về</h2>
				<ul class="container__list hide-on-mobile">
					<c:forEach items="${listC}" var="category">
						<li class="container__item"><a
							href="/Ecommerce/Home?categoryName=${category.categoryName}">${category.categoryName}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="products">
			<div class="grid wide">
				<div class="row">
					<c:forEach items="${listP}" var="product">
						<div class="col l-3 m-4 c-6">
							<a class="product__item"
								href="/Ecommerce/ProductDetail?productId=${product.productId}">
								<img src="${product.img_url}" alt="" class="product__img">
								<h4 class="product__name">${product.productName}</h4>
								<div class="product__price">
									<span class="product__price-old"><fmt:formatNumber
											value="${product.oldPrice}" type="number" pattern="#,##0" />đ</span>
									<span class="product__price-current"><fmt:formatNumber
											value="${product.oldPrice - (product.oldPrice * product.discount / 100)}"
											type="number" pattern="#,##0" />đ</span>
								</div>
								<div class="product__action">
									<div class="product__rating">
										<!-- Add your star rating display logic here -->
									</div>
									<span class="product__sold">Đã bán ${product.sold}</span>
								</div>
								<div class="product__origin">
									<span class="product__origin__brand"></span> <span
										class="product__origin__origin-name">${product.location}</span>
								</div> <c:if test="${product.discount > 0}">
									<div class="product__sale-off">
										<span class="product__sale-off-percent">${product.discount}%</span>
										<span class="product__sale-off-label">GIẢM</span>
									</div>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="product__bottom">
			<div class="grid wide">
				<div class="row">
					<div class="col l-4 m-12 c-12">
						<h2 class="container__bottom">NỔI BẬT</h2>
						<c:forEach items="${top3Rating}" var="product">
							<a href="/Ecommerce/ProductDetail?productId=${product.productId}"
								class="product__outstanding">
								<div>
									<img src="${product.img_url }" alt=""
										class="product__outstanding-img">
								</div>
								<div>
									<p class="product__outstanding-introduce">${product.productName }</p>
									<div class="product__price">
										<span class="product__price-old"><fmt:formatNumber
												value="${product.oldPrice}" type="number" pattern="#,##0" />đ</span>

										<span class="product__price-current"><fmt:formatNumber
												value="${product.oldPrice - (product.oldPrice * product.discount / 100)}"
												type="number" pattern="#,##0" />đ</span>
									</div>
								</div> <c:if test="${product.discount > 0}">
									<div class="product__sale-off">
										<span class="product__sale-off-percent">${product.discount}%</span>
										<span class="product__sale-off-label">GIẢM</span>
									</div>
								</c:if>
							</a>
						</c:forEach>
					</div>
					<div class="col l-4 m-12 c-12">
						<h2 class="container__bottom">BÁN CHẠY</h2>
						<c:forEach items="${top3Sold}" var="product">
							<a href="/Ecommerce/ProductDetail?productId=${product.productId}"
								class="product__outstanding">
								<div>
									<img src="${product.img_url }" alt=""
										class="product__outstanding-img">
								</div>
								<div>
									<p class="product__outstanding-introduce">${product.productName }</p>
									<div class="product__price">
										<span class="product__price-old"><fmt:formatNumber
												value="${product.oldPrice}" type="number" pattern="#,##0" />đ</span>

										<span class="product__price-current"><fmt:formatNumber
												value="${product.oldPrice - (product.oldPrice * product.discount / 100)}"
												type="number" pattern="#,##0" />đ</span>
									</div>
								</div> <c:if test="${product.discount > 0}">
									<div class="product__sale-off">
										<span class="product__sale-off-percent">${product.discount}%</span>
										<span class="product__sale-off-label">GIẢM</span>
									</div>
								</c:if>
							</a>
						</c:forEach>
					</div>
					<div class="col l-4 m-12 c-12">
						<h2 class="container__bottom">Khuyến mãi</h2>
						<c:forEach items="${top3Discount}" var="product">
							<a href="/Ecommerce/ProductDetail?productId=${product.productId}"
								class="product__outstanding">
								<div>
									<img src="${product.img_url }" alt=""
										class="product__outstanding-img">
								</div>
								<div>
									<p class="product__outstanding-introduce">${product.productName }</p>
									<div class="product__price">
										<span class="product__price-old"><fmt:formatNumber
												value="${product.oldPrice}" type="number" pattern="#,##0" />đ</span>

										<span class="product__price-current"><fmt:formatNumber
												value="${product.oldPrice - (product.oldPrice * product.discount / 100)}"
												type="number" pattern="#,##0" />đ</span>
									</div>
								</div> <c:if test="${product.discount > 0}">
									<div class="product__sale-off">
										<span class="product__sale-off-percent">${product.discount}%</span>
										<span class="product__sale-off-label">GIẢM</span>
									</div>
								</c:if>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="section__brands">
			<div class="grid wide">
				<div class="row">
					<a href="" class="col l-2 m-0 c-0"><img
						src="<%=request.getContextPath()%>/assets/img/brand1.webp" alt=""></a>
					<a href="" class="col l-2 m-0 c-0"><img
						src="<%=request.getContextPath()%>/assets/img/brand2.webp" alt=""></a>
					<a href="" class="col l-2 m-0 c-0"><img
						src="<%=request.getContextPath()%>/assets/img/partner_3.webp"
						alt=""></a> <a href="" class="col l-2 m-0 c-0"><img
						src="<%=request.getContextPath()%>/assets/img/partner_4.webp"
						alt=""></a> <a href="" class="col l-2 m-0 c-0"><img
						src="<%=request.getContextPath()%>/assets/img/partner_5.webp"
						alt=""></a> <a href="" class="col l-2 m-0 c-0"><img
						src="<%=request.getContextPath()%>/assets/img/partner_6.webp"
						alt=""></a>
				</div>
			</div>

		</div>
		<footer class="footer">
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
							<li class="footer__item"><a href="/Ecommerce/jsp/Home">Trang
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
		</footer>
	</div>

	<script src="<%=request.getContextPath()%>/assets/js/script.js"></script>
</body>

</html>