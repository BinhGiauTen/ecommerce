<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>Danh sách danh mục</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/dashboard/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/dashboard/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/dashboard/styles/style.css">


</head>
<body>

	<div class="header">
		<div class="header-left">
			<div class="menu-icon dw dw-menu"></div>
			<div class="search-toggle-icon dw dw-search2"
				data-toggle="header_search"></div>
			<div class="header-search">
				<form>
					<div class="form-group mb-0">
						<i class="dw dw-search2 search-icon"></i> <input type="text"
							class="form-control search-input"
							placeholder="Tìm kiếm tại đây...">
					</div>
				</form>
			</div>
		</div>
		<div class="header-right">
			<div class="dashboard-setting user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="javascript:;"
						data-toggle="right-sidebar"> <i class="dw dw-settings2"></i>
					</a>
				</div>
			</div>
			<div class="user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="#" role="button"
						data-toggle="dropdown"> <i
						class="icon-copy dw dw-notification"></i> <span
						class="badge notification-active"></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="notification-list mx-h-350 customscroll">
							<ul>
								<li><a href="#"> <img src="vendors/images/img.jpg"
										alt="">
										<h3>John Doe</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
								<li><a href="#"> <img src="vendors/images/photo1.jpg"
										alt="">
										<h3>Lea R. Frith</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button"
						data-toggle="dropdown"> <span class="user-icon"> <img
							src="vendors/images/photo1.jpg" alt="">
					</span> <span class="user-name">Admin</span>
					</a>
					<div
						class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
						<a class="dropdown-item" href="profile.html"><i
							class="dw dw-user1"></i> Tài khoản</a> <a class="dropdown-item"
							href="profile.html"><i class="dw dw-settings2"></i> Cài đặt</a> <a
							class="dropdown-item" href="faq.html"><i class="dw dw-help"></i>
							Trợ giúp</a> <a class="dropdown-item" href="login.html"><i
							class="dw dw-logout"></i> Đăng xuất</a> <a class="dropdown-item"
							href="/Ecommerce/Home"><i class="dw dw-home"></i>Về trang bán
							hàng</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Cài đặt giao diện <span class="btn-block font-weight-400 font-12">Cài
					đặt giao diện người dùng</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Nền tiêu đề</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-white active">Trắng</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary header-dark">Đen</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Nền thanh bên</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light ">Trắng</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-dark active">Đen</a>
				</div>

			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="index.html"> Gia Dụng Việt </a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown"><a href="/Ecommerce/jsp/dashboard.jsp"
						class="dropdown-toggle"> <span class="micon dw dw-house-1"></span><span
							class="mtext">Trang chủ</span>
					</a></li>
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon dw dw-edit2"></span><span
							class="mtext">Sản phẩm</span>
					</a>
						<ul class="submenu">
							<li><a href="/Ecommerce/AddProduct">Thêm sản phẩm</a></li>
							<li><a href="/Ecommerce/ListProduct">Danh sách sản phẩm</a></li>

						</ul></li>
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon dw dw-library"></span><span
							class="mtext">Danh mục sản phẩm</span>
					</a>
						<ul class="submenu">
							<li><a href="/Ecommerce/AddCategory">Thêm danh
									mục</a></li>
							<li><a href="/Ecommerce/ListCategory">Danh sách
									danh mục</a></li>
						</ul></li>
						<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-user"></span><span class="mtext">Tài khoản</span>
						</a>
						<ul class="submenu">
							<li><a href="/Ecommerce/AddAccount">Thêm tài khoản</a></li>
							<li><a href="/Ecommerce/ListAccount">Danh sách tài khoản</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-copy"></span><span class="mtext">Đơn hàng</span>
						</a>
						<ul class="submenu">
							<li><a href="/Ecommerce/ListOrder">Danh sách đơn hàng</a></li>
							<li><a href="/Ecommerce/jsp/orderDetail.jsp">Chi tiết đơn hàng</a></li>
						</ul>
					</li>

				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="card-box pd-20 height-100-p mb-30">
				<div class="row align-items-center">
					<div class="col-md-8">
						<h4 class="font-20 weight-500 mb-10 text-capitalize">Danh
							sách danh mục</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card-box">
						<table class="data-table table stripe hover nowrap">
							<thead>
								<tr>
									<th>Mã danh mục</th>
									<th>Tên danh mục</th>
									<th class="datatable-nosort">Action</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="category" items="${listC}">
									<tr>
										<td>${category.categoryId}</td>
										<td>${category.categoryName}</td>
										<td>
											<div class="dropdown">
												<a
													class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
													href="#" role="button" data-toggle="dropdown"> <i
													class="dw dw-more"></i>
												</a>
												<div
													class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
													<form action="ListCategory" method="post"
														style="display: inline;">
														<input type="hidden" name="action" value="update">
														<input type="hidden" name="categoryId"
															value="${category.categoryId}">
														<button type="submit" class="dropdown-item">
															<i class="dw dw-edit2"></i> Cập nhật
														</button>
													</form>
													<form action="ListCategory" method="post"
														style="display: inline;">
														<input type="hidden" name="action" value="delete">
														<input type="hidden" name="categoryId"
															value="${category.categoryId}">
														<button type="submit" class="dropdown-item"
															onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
															<i class="dw dw-delete-3"></i> Xóa
														</button>
													</form>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- js -->
	<script src="<%=request.getContextPath()%>/dashboard/scripts/core.js"></script>
	<script
		src="<%=request.getContextPath()%>/dashboard/scripts/script.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/dashboard/scripts/layout-settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/dashboard/scripts/apexcharts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/dashboard/scripts/dashboard.js"></script>
</body>
</html>