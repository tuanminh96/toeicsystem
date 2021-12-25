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
	<div class="container mainListExam">
		<div class="container py-5">
			<!-- For demo purpose -->
			<div class="row mb-4">
				<div class="col-lg-8 mx-auto text-center">
					<h3 class="display-6">Nâng cấp tài khoản VIP</h3>
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
										<h6>Ngân hàng</h6>
									</label> 
									<select class="form-control" id="bankselect">
										<option value="" selected disabled>--Chọn ngân hàng
											thanh toán--</option>
										<option value="TPBANK">TPBank</option>
										<option value="VIETCOMBANK">VietcomBank</option>
										<option value="PVCOMBANK">PVCOMBANK-Ngân hàng TMCP
											Đại Chúng Việt Nam</option>
										<option value="SAIGONBANK">SAIGONBANK-Ngân hàng
											thương mại cổ phần Sài Gòn Công Thương</option>
										<option value="VPBANK">VPBANK-Ngân hàng Việt Nam
											Thịnh vượng (VPBank)</option>
										<option value="SEABANK">SEABANK-Ngân Hàng TMCP Đông
											Nam Á</option>
										<option value="VIETINBANK">VIETINBANK-Ngân hàng Công
											thương (Vietinbank)</option>
									</select> 
									<label for="Select Your Bank">Số tiền: <span
										style="font-family: cursive; font-size: 30px; color: red;">500.000</span>
										VNĐ
									</label>
									<div class="input-group">
										<label class="input-group-prepend">Thông tin thanh toán: </label>
										<input id="payment-desc" type="text" class="form-control" value="Nâng cấp tài khoản lên VIP">
									</div>
								</div>
								<div class="form-group">
									<p>
										<button type="button" class="btn btn-primary "
											id="process-payment">
											<i class="fas fa-mobile-alt mr-2"></i> Thanh toán
										</button>
									</p>
								</div>
								<p class="text-muted">Hướng dẫn: Chọn tài khoản ngân hàng
									liên kết với ví VNPay.</p>
							</div>
							<!-- End -->
							<!-- payment parameter -->
							<%-- <input type="hidden" value="${vnp_TmnCode}" id="vnp_TmnCode">
							<input type="hidden" value="${vnp_HashSecret}" id="vnp_HashSecret">
							<input type="hidden" value="${vnp_Url}" id="vnp_Url"> --%>
							<input type="hidden" value="500000" id="amount"> <input
								type="hidden" id="appContext"
								value="${pageContext.request.contextPath}">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin: auto; width: 50%;">
			<img alt=""
				src="https://polarisvietnam.com/primary_polaris/resources/images/logo/logo_partner_vnpay.png">
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#process-payment").on("click", function() {
				var amount = $("#amount").val();
				var bank = $("#bankselect").val();
				var appContext = $("#appContext").val();
				var payment = {
					vnp_Amount : amount,
					vnp_BankCode : bank,
					vnp_OrderInfo : $("#payment-desc").val(),
					vnp_ReturnUrl : "http://localhost:8080/webtoeic"
				};
				$.ajax({
					url : appContext + "/processPayment",
					type : 'POST',
					data : JSON.stringify(payment),
					contentType : "application/json",
					success : function(response) {
						var presp = JSON.parse(response);
						var url = presp.data;
						$(location).attr('href', url);
					},
					error : function() {
						alert("Có lỗi xảy ra vui lòng thử lại");
					}
				});
			});
		});
	</script>
	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>