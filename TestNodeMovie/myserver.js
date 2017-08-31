/**
 * http://usejsdoc.org/
 */
var socketio=require('socket.io');
var express=require('express');
var http=require('http');
var fs=require('fs');

//좌석정보값  초기값(0: 통로  1:예약가능 좌석, 2:예약완료 좌석)
var seats=[
  [1,1,0,1,1,0,0,0,0,1,1,0,1,1],
  [1,1,0,1,1,1,1,1,1,1,1,0,1,1],
  [1,1,0,1,1,1,1,1,1,1,1,0,1,1],
  [1,1,0,1,1,1,1,1,1,1,1,0,1,1],
  [1,1,0,1,1,1,1,1,1,1,1,0,1,1],
  [1,1,0,1,1,1,1,1,1,1,1,0,1,1],
  [1,1,0,1,1,1,1,1,1,1,1,0,1,1]
];

var app=express();

app.get("/",function(req,res,next){
	fs.readFile("public/movie.html",function(error,data){
		res.send(data.toString());
	});
});
app.get("/seats",function(req,res,next){
	console.log("Server Seats Call");
	res.send(seats);
});


var server=http.createServer(app);
server.listen(3333,function(){
	console.log("Served at localhost:3333");
});

var io=socketio.listen(server);
io.sockets.on('connect',function(socket){
	socket.on('reserve',function(data){
		seats[data.y][data.x]=2;
		io.sockets.emit('reserver',data);
	});
});



