/**
 * http://usejsdoc.org/
 */
var fs=require('fs');
var server=require('http').createServer();
server.listen(3333,function(){
	console.log("Server Started at 3333port");
});

server.on('request',function(req,res){
	fs.readFile('public/chat.html',function(error,data){
		res.writeHead(200,{'Content-Type':'text/html'});
		res.end(data);
		
	});
});
var io=require('socket.io').listen(server);//소켓 서버 실행
io.sockets.on('connection',function(socket){
	//클라이언트가 접속해 오면 connection이벤트가 발생하고 클과 통신할 소켓을 전달한다.
	socket.on('join',function(data){
		//'join'이벤트는 클을 특정방에 포함시키고자 할 때 시용
		socket.join(data);//사용자가 생성한 방에 소켓을 포함시킴
		socket.room=data;//소켓에 room이라는 속성을 추가하고 여기에 방 이름을 저장
		console.log("join>>>"+data);
	});
	socket.on('message',function(data){
		//io.socket.in(socket.room).emit('message',data);
		//console.log(data.id+">>"+data.message+" ["+data.date+"]");
		io.sockets.emit('message',data);
	});
});





