<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang Quản Trị</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="row">
		<jsp:include page="template/sidebar.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- main wrapper -->
		<!-- ============================================================== -->
		<div class="dashboard-main-wrapper col-md-9">

			<div class="">
				<div class="dashboard-ecommerce">
					<div class="container-fluid dashboard-content ">
						<!-- ============================================================== -->
						<!-- pageheader  -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="page-header">
									<h2 class="pageheader-title">Chào mừng bạn đã đến với
										Trang Quản trị</h2>
									<div class="page-breadcrumb">
										<nav aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="#"
													class="breadcrumb-link">BK Toeic</a></li>
												<li class="breadcrumb-item active" aria-current="page">Bạn đang đăng nhập với quyền Quản trị nội dung</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end pageheader  -->
						<!-- ============================================================== -->
						<div class="ecommerce-widget">
							<div class="row">
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
									<div class="card border-3 border-top border-top-primary">
										<div class="card-body">
											<h5 class="text-muted">Số lượng đề thi</h5>
											<div class="metric-value d-inline-block">
												<h1 class="mb-1">${totalExam}</h1>
											</div>
											<div
												class="metric-label d-inline-block float-right text-success font-weight-bold">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
