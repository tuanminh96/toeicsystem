<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	/* Height of the footer */
	height: 45px;
	text-align: center;
	background: #f5f5f5;
	color: #ccc;
	border-top: 1px solid #eee;
	z-index: 999;
}

.iconImg {
	width: 40px;
}

.footer_text {
	line-height: 45px;
	width: 100%;
}
</style>
<footer class="footer">
	<div class="container" id="footer">
		<div class="row">
			<div class="footer_text" align="center">
				Copyright &copy; TuanPM144928 | All Rights Reserved<br> <small>HA
					NOI UNIVERSITY OF SCIENCE AND TECHNOLOGY</small>
			</div>
		</div>
	</div>

</footer>
<div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
  <div class="toast" style="position: fixed;margin-top: 500px;top: 0;right: 0;">
    <div class="toast-header">
      <strong class="mr-auto">Thông báo</strong>
      <small>Bây giờ</small>
      <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="toast-body">
      Hello, world! This is a toast message.
    </div>
  </div>
</div>
<%-- <audio autoplay id="autioNoti" src="${pageContext.request.contextPath}/resources/file/audio/notification.mp3"></audio> --%>
<p id="clickaudio"></p>
</body>
	<script type="text/javascript">
		$(document).ready( function() {
			$("#clickaudio").on('click', function() {
				$('#autioNoti').get(0).play();
			});
		/* 	if ($("#vip").val() == 'vip') {
				var urlEndPoint = 'http://localhost:8080/webtoeic/api/subcribe';
				var eventSource = new EventSource(urlEndPoint);
				eventSource.addEventListener('remark',
				function(event) {
				}); 

			}*/
			$('.toast').toast({delay: 50000});
			$('.toast').toast('show');
			
			if($('.toast').css('display') == 'block') {
				$("#clickaudio").click();
				console.log("showwn");
			}
			
	});
	</script>
</html>