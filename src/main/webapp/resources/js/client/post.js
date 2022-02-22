$(document).ready(function() {
	if (eventSource2 == null) {
	var idUser = $('#idUser').val();
	var urlEnd = 'http://localhost:8080/webtoeic/subcribePost?id='+idUser;
	var eventSource2 = new EventSource(urlEnd);
	
	eventSource2.addEventListener('post_realtime', function(event) {
		console.log("realtime");
		var idGroup = $("#idGroup").val();
		var appContext = $("#appContext").val();
		$.ajax({
			url: appContext+"/clientFeed/"+idGroup+"",
			success : function(response) {
				$("#appendContent").html(response);
			}
		});
	});
	eventSource2.addEventListener('close', () => {
		eventSource2.close();
		eventSource2 = null;
		});
	}
});