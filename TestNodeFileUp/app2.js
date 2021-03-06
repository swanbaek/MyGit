
/**
 * Module dependencies.
 * https://opentutorials.org/course/2136/11959
 * http://bcho.tistory.com/1078
 * http://blog.naver.com/hyoun1202/220670669034
 */

var express = require('express')
  , routes = require('./routes')
  , user = require('./routes/user')
  , http = require('http')
  , path = require('path'),
    fs=require('fs');
//파일업로드시 multer를 쓰던지 bodyParser를 쓰던지..둘 중 하나만 해야 파일 업로드가 됨
//var bodyParser=require('body-parser'); 
////////////////////////////////////
var multer=require('multer');
///////////////////////////////////
//첨부파일을 구분하기 위한 변수 선언
var maxFileCount=3;//첨부파일 허용 갯수
var maxFileSize=10*1024*1024;//첨부 가능한 최대 파일 사이즈 설정

//////////////////////////////////
var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(express.favicon());
app.use(express.logger('dev'));
//app.use(express.bodyParser()); 
//파일업로드시 multer를 쓰던지 bodyParser를 쓰던지..둘 중 하나만 해야 파일 업로드가 됨
//app.use(bodyParser.json());
////////////////////////
app.use(multer());
////////////////////////
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));


// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', routes.index);
app.get('/users', user.list);
//파일 입력 폼 요청 처리
app.get('/form', function(req, res, next) {
	fs.readFile("public/input2.html", function(err, data) {
		res.send(data.toString());
	});	
});
//multer를 이용해 저장할 곳 지정 및 파일명 중복을 피하기 위해 업로드한 날짜와 파일명을 결합한다.
var storage=multer.diskStorage({
	destination: function(req,file,callback){
		callback(null,"./public/Upload/");
	},
	filename: function(req,file,callback){
		callback(null,Date.now()+"_"+file.originalname);
		console.log(">>>"+file.originalname);
	}
});

var upmulter=multer({storage:storage, 
	limits:{fileSize: maxFileSize}});

//app.post("/uploadEnd",upmulter.single('myfile1'),function(req,res){
app.post("/uploadEnd",upmulter.array('myfile1',maxFileCount),function(req,res){
	console.log("File: "+req.files);
	//파일 정보는 req.files (복수형임에 주의 files)로, 파라미터값은 req.body.파라미터명 으로 추출
	res.json({'filename':req.files,
		'username':req.body.username});
	//업로드된 파일 정보를 json형태로 브라우저에 출력해보자.
	
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server2 listening on port ' + app.get('port'));
});
