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
<!-- sockjs.js라이브러리 참조----------------------------- -->
<script type="text/javascript" src="<c:url value='/js/sockjs.js'/>"></script>
<!-- ----------------------------------------------------- -->	
</script>

<script type="text/javascript">
	$(function(){
		$('#sendBtn').click(function(){
			sendMessage();
		});
		$('#message').keydown(function(e){
			//alert(e.keyCode);
			if(e.keyCode == 13){ //엔터 쳤을 때
				sendMessage();
			}
		});
		
	});
	
	//sockjs.js라이브러리에 있는 객체
	var sock=new SockJS("<c:url value='/echo'/>");
	//웹소켓 연결
	
	//메시지가 도착했을 때 호출해줄 콜백함수를 onMessage로 지정
	sock.onmessage = onMessage;
	
	//웹소켓 연결이 끊길 때 호출할 콜백함수 onClose로 지정
	sock.onclose = onClose;
	
	var sendMessage=function(){
		//대화명 얻기
		var nickName=$('#nickName').val();
		//메시지 얻기
		var msg=$('#message').val();
		sock.send(nickName+">> "+msg);
		$('#message').val("");
		$('#message').focus();
	}
	
	function onMessage(evt){
		//evt파라미터는 websocket이 보내준 데이터
		var data=evt.data;
		$('#data').append(data+"<br>");	
		$("#data").scrollTop($("#data")[0].scrollHeight);
	}
	
	function onClose(evt){
		$('#data').append("연결 끊김..");
	}
	
</script>



<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">



<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<H1>Echo Chat</H1>
				<label for="nickName">Nick Name:</label><input type="text" id="nickName" placeholder="참여자 닉네임을 입력하세요"  class="form-control">
				<label for="message">Message:</label><input type="text" id="message" class="form-control" placeholder="전송할 메시지를 입력하세요" /> 
				<input type="button" id="sendBtn" value="전송" class="btn btn-success" />
				<div id="data" style="width:100%;height: 400px;overflow-x:hidden;overflow-y:auto;border:3px solid silver;padding:12px" ></div>
			</div>
		</div>
	</div>
</body>
</html>

