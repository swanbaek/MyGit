/**
 * http://usejsdoc.org/
 */
var express = require('express');
var routes = require('./routes');
var user = require('./routes/user');
var http = require('http');
var path = require('path');
var ejs = require('ejs');
var url = require('url');
var multer=require('multer');

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
//multer 파일 업로드 위해 사용하겠다고 명시
app.use(multer());

var storage=multer.diskStorage({destination: function(req,file,cb){
	cb(null,'./public/images');
},
filename:function(req,file,cb){
	cb(null,file.originalname+"_"+Date.now());
}});

var mymulter=multer({storage:storage});

app.post('/memos', mymulter.single('photo'), function(req,res){
	//console.log(req.body.name+"<<<<<<");
	console.log(req.file);
	
	var memo={'name':req.body.name,
			'msg':req.body.msg,
			'wdate':new Date(),
			'image':req.file.filename,
			'originfile':req.file.originalname,
			'filesize':req.file.size};
	//var sql='insert into memo(name,msg) values(?,?)'; 이거 쓰면 에러남.  객체로 넣을 때는 set ?
	
	//console.log(memo);
	//console.log(JSON.stringify(memo));
	var query=connection.query("insert into memo set ?",memo,
			function(err,result){
				if(err){
					console.error(err);
					throw err;
				}
				//console.log(query.sql);
				//res.send(200,'success');
				res.redirect("/memos");
	});
	
});
var cnt=0;//게시판 총 게시글 수
var pageSize=6;
var pageCount=0;
var pagingData=[];
var start=0;
app.get('/memos',function(req,res){
	res.redirect("/memos/1");
});
app.get('/memos/:cpage',function(req,res){
	var cpage=req.params.cpage; //[x] ==> /memos/:cpage 했을 경우
	
	start=(cpage-1)*pageSize;
	console.log("start==="+start+", cpage="+cpage);
	pagingData=[start,pageSize];
	/*var parseObj=url.parse(req.url,true);*/
	//console.log(parseObj);
	//var cpage=parseObj.query.cpage;
	
	//console.log('cpage===='+cpage);
	
	
	fs.readFile("public/list2.html",'utf8',function(error,data){
		if(error){
			console.log('readFile error: ',error.message);
		}else{
			
			//connection.beginTransaction(function(err2){
				/*if(err2){ //트랜잭션 오류 발생시
					throw err2;
				}*/
				
			var cntSql="select count(*) cnt from memo";
			
			var query0=connection.query(cntSql,function(err,rows,filed){
				cnt=rows[0].cnt;
				console.log("cnt=====*********"+cnt);
				pageCount=Math.floor((cnt-1)/pageSize)+1;
				
				/*console.log("cnt====="+cnt);
				console.log("cnt/pageSize==="+(cnt/pageSize));
				console.log("pageCount==="+pageCount);
				console.log("start===="+start);
				console.log("pageSize===="+pageSize);*/
				
				
			});
			console.log("********pagingData="+pagingData);
			
			
			var sql='select idx,msg,name, date_format(wdate,"%Y-%m-%d %H:%i") wdate, image, filesize,originfile  from memo order by idx desc limit ?,?';
			
			
			var query=connection.query(sql,pagingData,function(err,rows,field){
				if(err){
					console.log('err: '+err.message);
				}else{
				
				//console.log(rows);
				//console.log(field);
				//res.json(rows);
				res.send(ejs.render(data,{memoList:rows,cp:cpage,total:cnt,pageCnt:pageCount}));
				}
				
			});
			//console.log(query);
			//});//beginTransaction
		}
	});
});
app.get("/delete/:idx",function(req,res){
	var delIdx=req.params.idx;
	var sql="delete from memo where idx=?";
	var query=connection.query(sql,[delIdx],function(error,result){
		if(error){
			console.log("delete Error");
		}else{
			console.log("delete ok: idx="+delIdx);
			//res.send(200,'delete success');
			res.redirect("/memos");
		}
	});
});

app.get("/edit/:idx",function(req,res){
	fs.readFile("public/edit.html",'utf8',function(error,data){
		var vidx=req.params.idx;
		var sql="select idx, msg, name, date_format(now(),'%Y-%m-%d') wdate from memo where idx=?";
		var query=connection.query(sql,[vidx],function(err,rows,field){
			if(err){
				console.log('edit error: '+err.message);
			}else{
				//res.json(rows);
				res.send(ejs.render(data,{memo:rows[0]}));
			}
		});
	});
});

app.post("/edit",function(req,res){
	var memo=[ req.body.name, req.body.msg,req.body.idx];
	var sql="update memo set name=?, msg=?, wdate=now() where idx=?";
	var query=connection.query(sql,memo,function(err,result){
		if(err){
			console.log('edit end err: '+err.message);
		}else{
			//res.send(200,'Edit success');
			res.redirect("/memos");
		}
	});
});

http.createServer(app).listen(app.get('port'), function() {
	console.log('Express server listening on port ' + app.get('port'));
});
