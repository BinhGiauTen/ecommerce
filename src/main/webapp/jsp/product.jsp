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
<title>Sản phẩm</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"
	integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"
	integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.slick-prev::before, .slick-next::before {
	color: #f68e2e;
	font-size: 30px;
}
</style>

</head>
<body>
	<div class="main">
		<header class="header">
			<div class="grid wide">
				<div class="header__list">
					<div class="header__left">SIÊU THỊ NỘI THẤT & TRANG TRÍ EVO
						NỘI THẤT</div>
					<div class="header__right hide-on-mobile-tablet">
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
					</div>
					<div class="grid__column-3">
						<ul class="nav__list">
							<li class="nav__item "><a href="/Ecommerce/Home">Trang chủ</a></li>
							<li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới
									thiệu</a></li>
							<li class="nav__item nav__item--active"><a href="/Ecommerce/Product">
									Sản phẩm <i class="fa-solid fa-angle-down"></i>
							</a></li>
							<li class="nav__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
							<li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
						</ul>
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
					<a href="/Ecommerce/jsp/login.jsp">Đăng nhập</a> <a href="/Ecommerce/jsp/register.jsp">Đăng
						ký</a>
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
					<li class="nav__item "><a href="/Ecommerce/Home">Trang chủ</a></li>
					<li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới
							thiệu</a></li>
					<li class="nav__item nav__item--active"><a href="/Ecommerce/Product">
							Sản phẩm <i class="fa-solid fa-angle-down"></i>
					</a></li>
					<li class="nav__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
					<li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
				</ul>
			</div>
		</div>
		<nav class="nav__mini">
			<div class="grid wide">
				<span><a href="/Ecommerce/Home">Trang chủ</a> > Sản phẩm</span>
			</div>
		</nav>
		<div class="grid wide ">
			<p class="products__heading">Tất cả sản phẩm</p>
			<img class="products__img"
				src="<%=request.getContextPath()%>/assets/img/cat-banner-1.webp"
				alt="">
			<div class="category hide-on-mobile">
				<div class="row" id="category">
					<div class="grid__column-1_6">
						<a href="" class="products__container__picture"> <img
							class="products__container__img"
							src="<%=request.getContextPath()%>/assets/img/desk.webp" alt="">
							<span class="products__container__label">Bếp điện</span>
						</a>
					</div>
					<div class="grid__column-1_6">
						<a href="" class="products__container__picture"> <img
							class="products__container__img"
							src="<%=request.getContextPath()%>/assets/img/sofa.webp" alt="">
							<span class="products__container__label">Đồ gia dụng lớn</span>
						</a>
					</div>
					<div class="grid__column-1_6">
						<a href="" class="products__container__picture"> <img
							class="products__container__img"
							src="<%=request.getContextPath()%>/assets/img/living-room.webp"
							alt=""> <span class="products__container__label">Đồ gia dụng nhà bếp</span>
						</a>
					</div>
					<div class="grid__column-1_6">
						<a href="" class="products__container__picture"> <img
							class="products__container__img"
							src="<%=request.getContextPath()%>/assets/img/curtains.webp"
							alt=""> <span class="products__container__label">Máy pha cà phê</span>
						</a>
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col l-3 m-0 c-0">

					<ul class="sidebar__left__list">
						<span class="sidebar__left__heading">Danh mục</span>
						<li class="sidebar__left__item"><a href="/Ecommerce/Home">Trang chủ</a></li>
						<li class="sidebar__left__item"><a href="/Ecommerce/jsp/introduce.jsp">Giới thiệu</a></li>
						<li class="sidebar__left__item"><a href="/Ecommerce/jsp/Product">Sản phẩm</a> </li>
						<li class="sidebar__left__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
						<li class="sidebar__left__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>

					</ul>

					<div class="aside__list">
						<div class="aside__heading">TÌM THEO</div>
						<div class="aside__item">
							<div class="aside__title">GIÁ SẢN PHẨM</div>
							<ul class="aside__content__list">
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Giá dưới 100.000đ</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> 100.000đ - 200.000đ</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> 200.000đ - 300.000đ</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> 300.000đ - 500.000đ</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> 500.000đ - 1.000.000đ</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Giá trên 1.000.000đ</label></li>

							</ul>
						</div>
						<div class="aside__item">
							<div class="aside__title">THƯƠNG HIỆU</div>
							<div class="aside__search">
								<input type="text" placeholder="Tìm thương hiệu" value="">
								<i class="fa-solid fa-magnifying-glass"></i>
							</div>
							<ul class="aside__content__list">
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Angelina</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Ant Furni</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Eroomn</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Evo Nội thất</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> HABITAT</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Harmonydeco</label></li>

							</ul>
						</div>
						<div class="aside__item">
							<div class="aside__title">LOẠI</div>
							<div class="aside__search">
								<input type="text" placeholder="Tìm loại" value=""> <i
									class="fa-solid fa-magnifying-glass"></i>
							</div>
							<ul class="aside__content__list">
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Bàn cà phê</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Bàn trang điểm</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Tấm trải giường</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Thảm trải sàn</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Tủ bếp</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Tủ đầu giường</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Tủ giày</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Vỏ gối</label></li>
								<li class="aside__content__item"><input type="checkbox">
									<label for=""> Vỏ gối</label></li>

							</ul>
						</div>
					</div>
					<div class="aside__banner">
						<div class="aside__heading">TÌM THEO</div>
						<img
							src="<%=request.getContextPath()%>/assets/img/aside_banner.webp"
							alt="">
					</div>
				</div>
				<div class="col l-9 m-9 c-12">
					<div class="home-filter hide-on-mobile">
						<span class="home-filter__label">Sắp xếp theo</span>
						<button class="home-filter__btn btn">Phổ biến</button>
						<button class="home-filter__btn btn ">Mới nhất</button>
						<button class="home-filter__btn btn">Bán chạy</button>

						<div class="select-input">
							<span class="select-input__label">Giá</span> <i
								class="select-input__icon fa-solid fa-chevron-down"></i>
							<ul class="select-input__list">
								<li class="select-input__item"><a href=""
									class="select-input__link">Giá: Thấp đến cao</a></li>
								<li class="select-input__item"><a href=""
									class="select-input__link">Giá: Cao đến thấp</a></li>
							</ul>
						</div>

						<div class="home-filter__page">
							<span class="home-filter__page-num"> <span
								class="home-filter__page-current">1</span>/14
							</span>
							<div class="home-filter__page-control">
								<a href=""
									class="home-filter__page-btn home-filter__page-btn--disabled">
									<i class="home-filter__page-icon fa-solid fa-chevron-left"></i>
								</a> <a href="" class="home-filter__page-btn"> <i
									class="home-filter__page-icon fa-solid fa-chevron-right"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="home__product">
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
					<div class="pagination">
						<ul class="pagination__list">
							<li class="pagination__item"><a href=""><i
									class="fa-solid fa-angles-left"></i></a></li>
							<li class="pagination__item pagination__item__active"><a
								href="">1</a></li>
							<li class="pagination__item"><a href="">2</a></li>
							<li class="pagination__item"><a href="">3</a></li>
							<li class="pagination__item"><a href="">4</a></li>
							<li class="pagination__item"><a href=""><i
									class="fa-solid fa-angles-right"></i></a></li>
						</ul>
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
							<li class="footer__item"><a href="/Ecommerce/jsp/introduce.jsp">Giới
									thiệu</a></li>
							<li class="footer__item"><a href="/Ecommerce/Product">Sản phẩm</a></li>
							<li class="footer__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
							<li class="footer__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
						</ul>
					</div>
					<div class="col l-3 m-6 c-12">
						<h3 class="footer__heading">Hỗ trợ khách hàng</h3>
						<ul class="footer__list">
							<li class="footer__item"><a href="/Ecommerce/Home">Trang chủ</a></li>
							<li class="footer__item"><a href="/Ecommerce/jsp/introduce.jsp">Giới
									thiệu</a></li>
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

	<script src="<%=request.getContextPath()%>/assets/js/script.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"
		integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"
		integrity="sha512-eP8DK17a+MOcKHXC5Yrqzd8WI5WKh6F1TIk5QZ/8Lbv+8ssblcz7oGC8ZmQ/ZSAPa7ZmsCU4e/hcovqR8jfJqA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
		$('#category').slick({
			slidesToShow : 6,
			slidesToScroll : 1
		});

		var filtered = false;

		$('.js-filter').on('click', function() {
			if (filtered === false) {
				$('.filtering').slick('slickFilter', ':even');
				$(this).text('Unfilter Slides');
				filtered = true;
			} else {
				$('.filtering').slick('slickUnfilter');
				$(this).text('Filter Slides');
				filtered = false;
			}
		});
	</script>
</body>
</html>