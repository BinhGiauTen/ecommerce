<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chi tiết sản phẩm</title>
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
					<a href="/Ecommerce/Home"><img src="<%=request.getContextPath()%>/assets/img/logo1.png" alt=""
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
											<img src="<%=request.getContextPath()%>/assets/img/no-cart.png" alt=""
												class="header__cart-no-cart-img">
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
											<a href="/Ecommerce/jsp/cart.jsp" class="header__cart-view-cart btn btn--primary">Xem
												giỏ hàng</a>
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
							<li class="nav__item"><a href="/Ecommerce/Home">Trang chủ</a></li>
							<li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới
									thiệu</a></li>
							<li class="nav__item "><a href="/Ecommerce/Product"> Sản phẩm
									<i class="fa-solid fa-angle-down"></i>
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
					<img src="<%=request.getContextPath()%>/assets/img/logo1.png" alt=""> <i
						class="fa-solid fa-arrow-left"></i>
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
					<li class="nav__item"><a href="/Ecommerce/Home">Trang chủ</a></li>
					<li class="nav__item "><a href="/Ecommerce/jsp/introduce.jsp">Giới
							thiệu</a></li>
					<li class="nav__item "><a href="/Ecommerce/Product"> Sản phẩm <i
							class="fa-solid fa-angle-down"></i>
					</a></li>
					<li class="nav__item"><a href="/Ecommerce/jsp/news.jsp">Tin tức</a></li>
					<li class="nav__item"><a href="/Ecommerce/jsp/contact.jsp">Liên hệ</a></li>
				</ul>
			</div>
		</div>
		<nav class="nav__mini">
			<div class="grid wide">
				<span><a href="/Ecommerce/Home">Trang chủ</a> > <a
					href="/Ecommerce/Home?categoryName=${category.categoryName}">${category.categoryName }</a>
					> ${product.productName}</span>
			</div>
		</nav>
		<div class="grid wide">
			<div class="product__heading">
				<h3>${product.productName}</h3>
			</div>
		</div>
		<div class="product__detail" id="product__detail-1">
			<div class="grid wide">
				<div class="product__detail__contain">
					<div class="grid__row">
						<div class="grid__column-2">
							<div>
								<img src="${product.img_url}" alt=""
									class="product__detail__img">
								<div class="product__detail__img-mini">
									<img src="${product.img_url}" alt=""> <img
										src="${product.img_url}" alt=""> <img
										src="${product.img_url}" alt="">
								</div>
							</div>
						</div>
						<div class="grid__column-2">
							<div class="product__detail">
								<div class="product__detail__introduce">
									<strong>${product.productName}
								</div>
								<div class="product__detail__if">
									<div class="product__detail__if-first">
										<div class="product__detail__star">
											<div>${product.star}</div>
											<div class="product__detail__rating">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
											</div>
										</div>
										<div class="product__detail__rate">
											<span class="number">${product.rating }</span> <span>Đánh
												giá</span>
										</div>
										<div class="product__detail__sold">
											<span class="number">${product.sold }</span> <span>Đã
												bán</span>
										</div>
									</div>
									<div class="product__detail__if-sc">
										<span>Tố cáo</span>
									</div>
								</div>
								<div class="product__detail__price">
									<span class="product__detail__price-old"><fmt:formatNumber
											value="${product.oldPrice}" type="number" pattern="#,##0" />đ</span>
									<span class="product__detail__price-current"><fmt:formatNumber
											value="${product.oldPrice - (product.oldPrice * product.discount / 100)}"
											type="number" pattern="#,##0" />đ</span> <span
										class="product__detail__price-discount">${product.discount }%
										giảm</span>
								</div>
								<div class="product__detail__discountshop">
									<div class="product__detail__discountshop__label">Mã giảm
										giá của shop</div>
									<div class="product__detail__mini-vouchers">Giảm 10k</div>
								</div>
								<div class="product__detail__insure">
									<span class="insure__first">Bảo Hiểm</span> <span
										class="insure__second"> <span
										class="insure__second__first">Bảo hiểm Quyền lợi tiêu
											dùng</span> <span class="insure__second__new">Mới</span>
									</span> <span class="insure__thirt"><a href="">Tìm hiểu
											thêm</a></span>
								</div>
								<div class="product__detail__transport">
									<div class="product__detail__transport__label">Vận chuyển
									</div>
									<div class="product__detail__transport__info">
										<div class="transport__info__container">
											<div class="transport__info__left">
												<i class="fa-solid fa-truck-fast"></i>
											</div>
											<div class="transport__info__right">
												<div class="transport__info__first">
													<span class="transport__info__first__left">Vận
														Chuyển Tới</span> <span class="transport__info__first__right">
														Phường Tràng Tiền, quận Hoàn Kiếm <i
														class="fa-solid fa-angle-down"></i>
													</span>
												</div>
												<div class="transport__info__second">
													<span class="transport__info__second__left">Phí Vận
														Chuyển</span> <span class="transport__info__second__right">15.000đ</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="product__detail__quantity">
									<div>Số lượng:</div>
									<div class="quantity__updown">
										<button type="button" class="quantity__down">-</button>
										<input type="number" id="quantityInput" name="quantity"
											value="1" min="1">
										<button type="button" class="quantity__up">+</button>
									</div>
									<div>${product.quantity } sản phẩm có sẵn</div>
								</div>
								<div class="product__detail__buy">

									<form action="Cart" method="post">
										<input type="hidden" name="action" value="add"> <input
											type="hidden" name="productId" value="${product.productId}">
										<input type="hidden" name="productName"
											value="${product.productName}"> <input type="hidden"
											name="img_url" value="${product.img_url}"> <input
											type="hidden" name="oldPrice" value="${product.oldPrice}">
										<input type="hidden" name="discount"
											value="${product.discount}"> <input type="hidden"
											name="quantity" value="1" min="1" id="hiddenQuantityInput">
										<button type="submit" class="product__detail__addcart">
											<i class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng
										</button>

									</form>
									<button class="product__detail__buynow">Mua ngay</button>
								</div>
								<div class="product__detail__final">
									<div class="product__detail__final_first">
										<i class="fa-solid fa-shield"></i> <span>Evo đảm bảo</span>
									</div>
									<div class="product__detail__final_second">3 Ngày Trả
										Hàng / Hoàn Tiền</div>
								</div>
								<div class="product__detail__share">
									<div>
										<span> Chia sẻ: </span> <i
											class="fa-brands fa-facebook-messenger"></i> <i
											class="fa-brands fa-facebook"></i> <i
											class="fa-brands fa-twitter"></i>
									</div>
									<div>
										<i class="fa-regular fa-heart"></i> <span>Đã thích
											(2,2k)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="grid wide">
				<div class="detail">
					<div class="detail__label">CHI TIẾT SẢN PHẨM</div>
					<div class="grid__row">
						<c:forEach items="${productDetail}" var="productDetail">
							<div class="grid__column-1_7">
								<ul class="detail__list__left">
									<li class="detail__item__left">${productDetail.specKey }</li>

								</ul>
							</div>
							<div class="grid__column-6_7">
								<ul class="detail__list__right">
									<li class="detail__item__right">${productDetail.specValue }</li>

								</ul>
							</div>
						</c:forEach>
					</div>
					<div class="detail__label">MÔ TẢ SẢN PHẨM</div>
					<div class="detail__label">Đánh Giá - Nhận Xét Từ Khách Hàng</div>
					<div class="customer__reviews__top">
						<div class="grid__row">
							<div class="grid__column-1">
								<div class="customer__reviews__top__left">
									<div class="review__rating__summary">
										<div class="review__rating__point">${product.star }</div>
										<div class="review__rating__stars">
											<div class="product__rating__star">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
											</div>
											<div class="review__rating__total">${product.rating }
												nhận xét</div>
										</div>
									</div>
									<div class="review__rating__detail">
										<div class="review__rating__level">
											<div class="review__rating__level__stars">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
											</div>
											<div class="review__rating__level__border"></div>
											<div class="review__rating__level__number">441</div>
										</div>
										<div class="review__rating__level">
											<div class="review__rating__level__stars">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__rating__level__border"></div>
											<div class="review__rating__level__number">40</div>
										</div>
										<div class="review__rating__level">
											<div class="review__rating__level__stars">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class=" fa-solid fa-star"></i> <i
													class=" fa-solid fa-star"></i>
											</div>
											<div class="review__rating__level__border"></div>
											<div class="review__rating__level__number">8</div>
										</div>
										<div class="review__rating__level">
											<div class="review__rating__level__stars">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class=" fa-solid fa-star"></i> <i
													class=" fa-solid fa-star"></i> <i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__rating__level__border"></div>
											<div class="review__rating__level__number">3</div>
										</div>
										<div class="review__rating__level">
											<div class="review__rating__level__stars">
												<i class="product__rating__star--gold fa-solid fa-star"></i>
												<i class=" fa-solid fa-star"></i> <i
													class=" fa-solid fa-star"></i> <i class=" fa-solid fa-star"></i>
												<i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__rating__level__border"></div>
											<div class="review__rating__level__number">5</div>
										</div>

									</div>
								</div>

							</div>
							<div class="grid__column-3">
								<div class="customer__reviews__top__left">
									<div class="review__images__heading">Tất cả hình ảnh
										(100)</div>
									<div class="review__images__img">
										<img src="<%=request.getContextPath()%>/assets/img/img1.webp" alt=""> <img
											src="<%=request.getContextPath()%>/assets/img/img1_3.webp" alt="">
									</div>
									<div class="review__images__filter">
										<div class="review__images__filter__label">Lọc xem theo
											:</div>
										<div class="review__images__filter__list">
											<div class="review__images__filter__item">Mới nhất</div>
											<div class="review__images__filter__item">Có hình ảnh</div>
											<div class="review__images__filter__item">Đã mua hàng</div>
											<div class="review__images__filter__item">
												5 <i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__images__filter__item">
												4 <i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__images__filter__item">
												3 <i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__images__filter__item">
												2 <i class=" fa-solid fa-star"></i>
											</div>
											<div class="review__images__filter__item">
												1 <i class=" fa-solid fa-star"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="customer__reviews">
						<div class="grid__row">
							<div class="grid__column-1">
								<div class="customer__reviews__left">
									<div class="customer__reviews__first">
										<div class="customer__reviews__avt">
											<span>TH</span>
										</div>
										<div class="customer__reviews__if">
											<div class="customer__reviews__name">Le Thu Ha</div>
											<div class="customer__reviews__time">Đã tham gia 3 năm
											</div>
										</div>
									</div>
									<div class="customer__reviews__second">
										<i class="fa-solid fa-clipboard"></i> <span
											class="customer__reviews__second--writed">Đã viết:</span> <span>6
											Đánh giá</span>
									</div>
									<div class="customer__reviews__thirt">
										<i class="fa-regular fa-thumbs-up"></i> <span
											class="customer__reviews__thirt--received">Đã nhận:</span> <span>5
											Lượt cảm ơn</span>
									</div>

								</div>
							</div>
							<div class="grid__column-3">
								<div class="customer__reviews__right">
									<div class="customer__reviews__right__first">
										<div class="product__rating__star">
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
										</div>
										<div class="customer__reviews__right__first--glad">Rất
											hài lòng ❤️❤️</div>
									</div>
									<div class="review__bought">
										<i class="fa-solid fa-circle-check"></i> <span>Đã mua
											hàng</span>
									</div>
									<p class="review__comment__content">Rất lăn tăn khi mua đồ
										nội thất online nhưng lần này thật sự bất ngờ vì màu sắc đẹp
										hơn cả hình ảnh. Tủ rất đẹp rất chắc chắn, cánh cửa đóng êm,
										tủ kéo mượt lắm, Tủ chắc chắn mình nghĩ phải chịu lực cả trăm
										kí. Hỗ trợ của các bạn kỹ thuật của Evo rất nhanh và chuyên
										nghiệp ❤️❤️</p>
									<div class="review__comment__img">
										<img src="<%=request.getContextPath()%>/assets/img/img1.webp" alt=""> <img
											src="<%=request.getContextPath()%>/assets/img/img1_3.webp" alt="">
									</div>
									<div class="review__comment__created-date">
										<span>Màu gỗ: Thân Vàng Mặt Trắng</span><br> <span>Đánh
											giá vào 2 năm trước . Đã dùng 1 tháng</span>
									</div>
									<span class="review__comment__final review__comment__useful">
										<i class="fa-regular fa-thumbs-up"></i> Hữu ích (1)
									</span> <span class="review__comment__final">Bình luận</span> <span
										class="review__comment__final">Chia sẻ</span>
								</div>
							</div>
						</div>
					</div>
					<div class="customer__reviews">
						<div class="grid__row">
							<div class="grid__column-1">
								<div class="customer__reviews__left">
									<div class="customer__reviews__first">
										<div class="customer__reviews__avt">
											<span>TK</span>
										</div>
										<div class="customer__reviews__if">
											<div class="customer__reviews__name">Dao Tu Khue</div>
											<div class="customer__reviews__time">Đã tham gia 8 năm
											</div>
										</div>
									</div>
									<div class="customer__reviews__second">
										<i class="fa-solid fa-clipboard"></i> <span
											class="customer__reviews__second--writed">Đã viết:</span> <span>41
											Đánh giá</span>
									</div>
									<div class="customer__reviews__thirt">
										<i class="fa-regular fa-thumbs-up"></i> <span
											class="customer__reviews__thirt--received">Đã nhận:</span> <span>1
											Lượt cảm ơn</span>
									</div>

								</div>
							</div>
							<div class="grid__column-3">
								<div class="customer__reviews__right">
									<div class="customer__reviews__right__first">
										<div class="product__rating__star">
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
										</div>
										<div class="customer__reviews__right__first--glad">Cực
											kì hài lòng</div>
									</div>
									<div class="review__bought">
										<i class="fa-solid fa-circle-check"></i> <span>Đã mua
											hàng</span>
									</div>
									<p class="review__comment__content">Nhân viên lắp ráp làm
										rất nhanh và chắc chắn</p>
									<div class="review__comment__created-date">
										<span>Màu gỗ: Thân Vàng Mặt Trắng</span><br> <span>Đánh
											giá vào 1 năm trước . Đã dùng 2 ngày</span>
									</div>
									<span class="review__comment__final review__comment__useful">
										<i class="fa-regular fa-thumbs-up"></i> Hữu ích
									</span> <span class="review__comment__final">Bình luận</span> <span
										class="review__comment__final">Chia sẻ</span>
								</div>
							</div>
						</div>
					</div>
					<div class="customer__reviews">
						<div class="grid__row">
							<div class="grid__column-1">
								<div class="customer__reviews__left">
									<div class="customer__reviews__first">
										<div class="customer__reviews__avt">
											<span>KM</span>
										</div>
										<div class="customer__reviews__if">
											<div class="customer__reviews__name">Kim Mijung</div>
											<div class="customer__reviews__time">Đã tham gia 4 năm
											</div>
										</div>
									</div>
									<div class="customer__reviews__second">
										<i class="fa-solid fa-clipboard"></i> <span
											class="customer__reviews__second--writed">Đã viết:</span> <span>1
											Đánh giá</span>
									</div>
									<div class="customer__reviews__thirt">
										<i class="fa-regular fa-thumbs-up"></i> <span
											class="customer__reviews__thirt--received">Đã nhận:</span> <span>0
											Lượt cảm ơn</span>
									</div>

								</div>
							</div>
							<div class="grid__column-3">
								<div class="customer__reviews__right">
									<div class="customer__reviews__right__first">
										<div class="product__rating__star">
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class="product__rating__star--gold fa-solid fa-star"></i>
											<i class=" fa-solid fa-star"></i>
										</div>
										<div class="customer__reviews__right__first--glad">Chưa
											hài lòng</div>
									</div>
									<div class="review__bought">
										<i class="fa-solid fa-circle-check"></i> <span>Đã mua
											hàng</span>
									</div>
									<div class="review__comment__labels">
										<div class="review__comment__label">Giá tốt</div>
										<div class="review__comment__label">Chất lượng tốt</div>
										<div class="review__comment__label">Giao hàng nhanh</div>
									</div>
									<div class="review__comment__created-date">
										<span>Màu gỗ: Thân Vàng Mặt Trắng</span><br> <span>Đánh
											giá vào 2 năm trước . Đã dùng 3 ngày</span>
									</div>
									<span class="review__comment__final review__comment__useful">
										<i class="fa-regular fa-thumbs-up"></i> Hữu ích (1)
									</span> <span class="review__comment__final">Bình luận</span> <span
										class="review__comment__final">Chia sẻ</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="products">
				<div class="grid wide">
					<div class="detail__label">Sản Phẩm Liên Quan</div>
					<div class="grid__row">
						<div class="grid__column-1">
							<a class="product__item" href="/Ecommerce/Product"> <img
								src="<%=request.getContextPath()%>/assets/img/kệ gỗ.jfif" alt="" class="product__img">
								<h4 class="product__name">Kệ giá sách cho bé, kệ gỗ đa năng
									để sách cho bé theo Montessori của MINDESIGN,trang trí phòng
									học,gỗ Thông tự nhiên!</h4>
								<div class="product__price">
									<span class="product__price-old">659.000đ</span> <span
										class="product__price-current">625.000đ</span>
								</div>
								<div class="product__action">
									<span
										class="product__action__like product__action__like--liked">
										<i
										class="product__action__like-icon-empty fa-regular fa-heart"></i>
										<i class="product__action__like-icon-fill fa-solid fa-heart"></i>
									</span>
									<div class="product__rating">
										<i class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i>
									</div>
									<span class="product__sold">Đã bán 522</span>
								</div>
								<div class="product__origin">
									<span class="product__origin__brand">MINDESIGN</span> <span
										class="product__origin__origin-name">Hà Nội</span>
								</div>
								<div class="product__favourite">
									<i class="fa-solid fa-check"></i> Yêu thích
								</div>
								<div class="product__sale-off">
									<span class="product__sale-off-percent">5%</span> <span
										class="product__sale-off-label">GIẢM</span>
								</div>
							</a>
						</div>
						<div class="grid__column-1">
							<a class="product__item" href="/Ecommerce/Product"> <img
								src="<%=request.getContextPath()%>/assets/img/img1.webp" alt="" class="product__img">
								<h4 class="product__name">Tủ bếp bằng gỗ tự nhiên nhỏ gọn
									đa năng tiện lợi</h4>
								<div class="product__price">
									<span class="product__price-old">12.500.000đ</span> <span
										class="product__price-current">10.000.000đ</span>
								</div>
								<div class="product__action">
									<span
										class="product__action__like product__action__like--liked">
										<i
										class="product__action__like-icon-empty fa-regular fa-heart"></i>
										<i class="product__action__like-icon-fill fa-solid fa-heart"></i>
									</span>
									<div class="product__rating">
										<i class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="fa-solid fa-star"></i>
									</div>
									<span class="product__sold">Đã bán 2,3k</span>
								</div>
								<div class="product__origin">
									<span class="product__origin__brand">Evo Nội thất</span> <span
										class="product__origin__origin-name">Hà Nội</span>
								</div>
								<div class="product__favourite">
									<i class="fa-solid fa-check"></i> Yêu thích
								</div>
								<div class="product__sale-off">
									<span class="product__sale-off-percent">20%</span> <span
										class="product__sale-off-label">GIẢM</span>
								</div>
							</a>
						</div>
						<div class="grid__column-1">
							<a class="product__item" href="/Ecommerce/Product"> <img
								src="<%=request.getContextPath()%>/assets/img/kệ để giày.jfif" alt="" class="product__img">
								<h4 class="product__name">Kệ để giày dép,Kệ gỗ 5 tầng sang
									trọng.mẫu mới 2022</h4>
								<div class="product__price">
									<span class="product__price-old">169.000đ</span> <span
										class="product__price-current">125.000đ</span>
								</div>
								<div class="product__action">
									<span
										class="product__action__like product__action__like--liked">
										<i
										class="product__action__like-icon-empty fa-regular fa-heart"></i>
										<i class="product__action__like-icon-fill fa-solid fa-heart"></i>
									</span>
									<div class="product__rating">
										<i class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
									</div>
									<span class="product__sold">Đã bán 132</span>
								</div>
								<div class="product__origin">
									<span class="product__origin__brand">Kệ gỗ</span> <span
										class="product__origin__origin-name">Hà Nội</span>
								</div>
								<div class="product__favourite">
									<i class="fa-solid fa-check"></i> Yêu thích
								</div>
								<div class="product__sale-off">
									<span class="product__sale-off-percent">25%</span> <span
										class="product__sale-off-label">GIẢM</span>
								</div>
							</a>
						</div>
						<div class="grid__column-1">
							<a class="product__item" href="/Ecommerce/Product"> <img
								src="<%=request.getContextPath()%>/assets/img/Kệ sách.jfif" alt="" class="product__img">
								<h4 class="product__name">Kệ sách Gỗ treo tường hiện đại đa
									năng chính hãng IGA phòng sách- GP14</h4>
								<div class="product__price">
									<span class="product__price-old">328.000đ</span> <span
										class="product__price-current">291.000đ</span>
								</div>
								<div class="product__action">
									<span
										class="product__action__like product__action__like--liked">
										<i
										class="product__action__like-icon-empty fa-regular fa-heart"></i>
										<i class="product__action__like-icon-fill fa-solid fa-heart"></i>
									</span>
									<div class="product__rating">
										<i class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i> <i
											class="product__rating__star--gold fa-solid fa-star"></i>
									</div>
									<span class="product__sold">Đã bán 572</span>
								</div>
								<div class="product__origin">
									<span class="product__origin__brand">IGA</span> <span
										class="product__origin__origin-name">TP HCM</span>
								</div>
								<div class="product__favourite">
									<i class="fa-solid fa-check"></i> Yêu thích
								</div>
								<div class="product__sale-off">
									<span class="product__sale-off-percent">11%</span> <span
										class="product__sale-off-label">GIẢM</span>
								</div>
							</a>
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
							<li class="footer__item"><a href="/Ecommerce/jsp/introduce.jsp">Giới
									thiệu</a></li>
							<li class="footer__item"><a href="/Ecommerce/Product">Sản
									phẩm</a></li>
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
							<li class="footer__item"><a href="/Ecommerce/Product">Sản
									phẩm</a></li>
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
							<img src="<%=request.getContextPath()%>/assets/img/payment-1.svg" alt=""> <img
								src="<%=request.getContextPath()%>/assets/img/payment-2.svg" alt="">
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

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const quantityInput = document.getElementById('quantityInput');
			const hiddenQuantityInput = document
					.getElementById('hiddenQuantityInput');
			const quantityDown = document.querySelector('.quantity__down');
			const quantityUp = document.querySelector('.quantity__up');

			quantityDown.addEventListener('click', function() {
				if (quantityInput.value > 1) {
					quantityInput.value = parseInt(quantityInput.value) - 1;
					hiddenQuantityInput.value = quantityInput.value;
				}
			});

			quantityUp.addEventListener('click', function() {
				quantityInput.value = parseInt(quantityInput.value) + 1;
				hiddenQuantityInput.value = quantityInput.value;
			});

			quantityInput.addEventListener('input', function() {
				hiddenQuantityInput.value = quantityInput.value;
			});
		});
	</script>
	<script src="<%=request.getContextPath()%>/assets/js/script.js"></script>

</body>

</html>