<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/sockjs.js'/>">
	
</script>


<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">



<script type="text/javascript">
var arr=[];

var init=function(){
	$.each(arr,function(i, item){
		alert(item);
		//$('#seat'+item).css('background','red');
	});
}
 
	$(document).ready(function() {
		init();
		$(".cellSeat").click(function() {
			sendMessage(this);
		});		
	});

	//websocket을 지정한 URL로 연결
	var sock = new SockJS("<c:url value="/echo"/>");
	//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
	sock.onmessage = onMessage;
	//websocket 과 연결을 끊고 싶을때 실행하는 메소드
	sock.onclose = onClose;

	
	function sendMessage(obj) {
		var x=$(obj).attr('data-x');
		var y=$(obj).attr('data-y');
		//websocket으로 메시지를 보내겠다.
		/* arr.push({'x':x,'y':y});
		console.log("arr="+JSON.stringify(arr)); */
		var arr=x+""+y;
		sock.send(arr);
	

	}

	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt) { //변수 안에 function자체를 넣음.
		var data = evt.data;

		//alert(JSON.stringify(data));
		$("#data").append(data+"<br/>");
		$('#seat'+data).css('background', 'red');
		$('#seat'+data).unbind('click');
		arr.push(data);
		console.log(arr);
		/* sock.close(); */
	}

	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<H1>Echo Chat</H1>
				<div id="data" class="bg bg-warning"></div>
				<table class="table table-bordered" id="tableSeat">
				<% for(int i=0;i<10;i++){ %>
					<tr>
					<% for(int k=0;k<10;k++){ %>
						<td id='seat<%=k%><%=i%>' class='cellSeat' data-x="<%=k%>" data-y="<%=i%>"><%=i%>,<%=k %></td>
						<%} %>
					</tr>
				<%} %>					
				</table>
			</div>
		</div>
	</div>
</body>
</html>

