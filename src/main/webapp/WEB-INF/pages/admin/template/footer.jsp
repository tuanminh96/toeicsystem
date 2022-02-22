<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
 <div class="toast" style="position: fixed;margin-top: 500px;top: 0;right: 0;">
   <div class="toast-header">
     <strong class="mr-auto">Thông báo</strong>
     <small>Bây giờ</small>
     <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
       <span aria-hidden="true">&times;</span>
     </button>
   </div>
   <div class="toast-body" id="message-content">
   </div>
 </div>
</div>
<audio id="autioNoti" src="${pageContext.request.contextPath}/resources/file/audio/notification.mp3"></audio>
<input type="hidden" value="${loggedInUser.id}" id="idUser"> 
<script type="text/javascript">
		$(document).ready( function() {
			if (eventSource == null) {
				var idUser = $('#idUser').val();
				var urlEndPoint = 'http://localhost:8080/webtoeic/api/subcribe?id='+idUser;
				var eventSource = new EventSource(urlEndPoint);
				console.log("state"+eventSource.readyState);
				eventSource.addEventListener('post',
						function(event) {
							var noti = JSON.parse(event.data)
							$("#message-content").text(noti.content);
							$('.toast').toast({delay: 5000});
							$('.toast').toast('show');
							$('#autioNoti').get(0).play();
							var totalUnseen = $("#totalUnseen").text();
							totalUnseen++;
							$("#totalUnseen").text(totalUnseen);
						});
				eventSource.addEventListener('close', () => {
					eventSource.close();
					eventSource = null;
					});
			}
	});
	</script>