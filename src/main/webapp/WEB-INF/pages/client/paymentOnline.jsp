<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tài khoản</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
</head>
<body>
	<style>
body {
	background: #f5f5f5
}

.rounded {
	border-radius: 1rem
}

.nav-pills .nav-link {
	color: #555
}

.nav-pills .nav-link.active {
	color: white
}

input[type="radio"] {
	margin-right: 5px
}

.bold {
	font-weight: bold
}
</style>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container">
		<div class="container py-5">
			<!-- For demo purpose -->
			<div class="row mb-4">
				<div class="col-lg-8 mx-auto text-center">
					<h1 class="display-6">Nâng cấp tài khoản VIP</h1>
				</div>
			</div>
			<!-- End -->
			<div class="row">
				<div class="col-lg-6 mx-auto">
					<div class="card ">
						<div class="card-header">
							<div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
								<!-- Credit card form tabs -->
								<ul role="tablist"
									class="nav bg-light nav-pills rounded nav-fill mb-3">
									<li class="nav-item"><a data-toggle="pill"
										href="#credit-card" class="nav-link  "> <i
											class="fas fa-credit-card mr-2"></i> Credit Card
									</a></li>
									<li class="nav-item"><a data-toggle="pill"
										href="#net-banking" class="nav-link active"> <i
											class="fas fa-mobile-alt mr-2"></i> Net Banking
									</a></li>
								</ul>
							</div>

							<!-- bank transfer info -->
							<div id="net-banking" class="tab-pane active pt-3">
								<div class="form-group ">
									<label for="Select Your Bank">
										<h6>Select your Bank</h6>
									</label> <select class="form-control" id="ccmonth">
										<option value="" selected disabled>--Please select
											your Bank--</option>
										<option>Bank 1</option>
										<option>Bank 2</option>
										<option>Bank 3</option>
										<option>Bank 4</option>
										<option>Bank 5</option>
										<option>Bank 6</option>
										<option>Bank 7</option>
										<option>Bank 8</option>
										<option>Bank 9</option>
										<option>Bank 10</option>
									</select>
								</div>
								<div class="form-group">
									<p>
										<button type="button" class="btn btn-primary ">
											<i class="fas fa-mobile-alt mr-2"></i> Proceed Payment
										</button>
									</p>
								</div>
								<p class="text-muted">Note: After clicking on the button,
									you will be directed to a secure gateway for payment. After
									completing the payment process, you will be redirected back to
									the website to view details of your order.</p>
							</div>
							<!-- End -->
							<!-- End -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
			})
		</script>
		<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>