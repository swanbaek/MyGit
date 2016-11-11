/**
 * http://usejsdoc.org/
 */
var express = require('express');
var routes = require('./routes');
var user = require('./routes/user');
var http = require('http');
var path = require('path');

/* 먼저 아래와 같이 mysql 모듈을 로딩한다. */
var fs=require('fs');
var mysql = require('mysql');

/* 다음 로딩된 모듈로부터 Connection 객체를 생성한다. 이 때 실제적인 Connection 연결은 이루어지지 않는다. */

var connection = mysql.createConnection({
	host : 'localhost',
	port : 3306,
	user : 'james',
	password : 'tiger',
	database : 'testdb'
});

/* 이렇게 명시적으로 connect 메서드를 이용해서 connection을 연결하거나 또는 첫번째 Query가 실행될 */
/* 때, 위의 connection 객체의 정보를 이용해서 connection이 생성된다. */

connection.connect(function(err) {

	if (err) {

		console.error('mysql connection error');

		console.error(err);

		throw err;

	}

});

/* 다음으로, express를 위한 환경을 변수들을 설정한후 에 */

var app = express();

// all environments

app.set('port', process.env.PORT || 3000);

app.set('views', path.join(__dirname, 'views'));

app.set('view engine', 'ejs');

//app.use(express.favicon());
var favicon=require('serve-favicon');
//app.use(favicon(path.join(__dirname, 'public/images','favicon.ico')));
app.use(favicon(__dirname+"/public/images/favicon.ico"));


app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.cookieParser('your secret here'));
app.use(express.session());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', function(req, res, next) {
	fs.readFile("public/index.html", function(err, data) {
		res.send(data.toString());
	});
	//res.send('public/index.html');
});
app.post('/users', function(req,res){
	console.log(req.body.name+"<<<<<<");
	var memo={'name':req.body.name,
			'msg':req.body.msg,
			'wdate':new Date()};
	//var sql='insert into memo(name,msg) values(?,?)'; 이거 쓰면 에러남
	//console.log(memo);
	console.log(JSON.stringify(memo));
	var query=connection.query("insert into memo set ?",memo,
			function(err,result){
				if(err){
					console.error(err);
					throw err;
				}
				console.log(query.sql);
				res.send(200,'success');
	});
	
});
app.get('/users',function(req,res){
	var sql='select * from memo order by idx asc';
	var query=connection.query(sql,function(err,rows){
		console.log(rows);
		res.json(rows);
	});
	console.log(query);
	
});

http.createServer(app).listen(app.get('port'), function() {
	console.log('Express server listening on port ' + app.get('port'));
});
