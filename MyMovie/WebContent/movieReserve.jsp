<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control", "no-cache"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/top2.jsp"/>
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />  
<%
	String mcodeStr=request.getParameter("mcode");
	if(mcodeStr==null||mcodeStr.trim().isEmpty()){
		response.sendRedirect("main.jsp");
		return;
	}
	int mcode=Integer.parseInt(mcodeStr.trim());
	request.setAttribute("movie", mdao.getMovieDetail(mcode));
%>
<c:set var="mcode" value="${param.mcode}"/>
<html>
  
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
    <script type="text/javascript">
    $(function(){
    	$('#allTheater').click(function(){
    		$('#choiceShow1').empty();
    		$('#choiceShow2').empty();
    		$.ajax({
    			type:'get',
    			url:'cinema/allTheaterList.jsp?mcode=${mcode}',
    			dataType:'html',
    			success:function(res){
    				//alert(res);
    				$('#allTheaterShow').empty();    				
    				$('#allTheaterShow').html(res);
    			},
    			error:function(e){
    				alert(JSON.stringify(e));
    			}
    		});
    	});
    	$('#orderRate').click(function(){
    		$.ajax({
    			type:'get',
    			url:'cinema/movieListByRate_inc.jsp',
    			dataType:'html',
    			success:function(res){
    				//alert(res);
    				$('#allMovieShow').empty();    				
    				$('#allMovieShow').html(res);
    			},
    			error:function(e){
    				alert(JSON.stringify(e));
    			}
    		});
    	});
    });
    /*특정 지역의 영화관 가져오기*/
    var getTheater=function(loc_code){
    	$.ajax({
			type:'get',
			url:'cinema/allTheaterList2.jsp?loc_code='+loc_code,
			dataType:'html',
			success:function(res){
				//$('#allMovieShow').empty();
				$('#allTheaterShow2').html(res);
				
			},
			error:function(e){
				alert(JSON.stringify(e));
			}
		});
    }
    /**특정 영화를 상영하는 특정 지역의 영화관 가져오기*/
    var getTheaterByMovie=function(loc_code, mcode){
    	$.ajax({
			type:'get',
			url:'cinema/allTheaterList3.jsp?loc_code='+loc_code+"&mcode="+mcode,
			dataType:'html',
			success:function(res){
				//$('#allMovieShow').empty();				
				$('#allTheaterShow2').html(res);
				
			},
			error:function(e){
				alert(JSON.stringify(e));
			}
		});
    }
    var getMovie=function(tcode, tname){
    	$.ajax({
			type:'get',
			url:'cinema/movieListByTheater.jsp?tcode='+tcode,
			dataType:'html',
			success:function(res){
				//alert(res);				
				$('#theaterTitle').show();
				$('#choiceShow2').empty();
				//clearSelect();
				$('#choiceShow2').append(tname);
				$('#allMovieShow').html(res);
			},
			error:function(e){
				alert(JSON.stringify(e));
			}
		});
    }
    var getSchedule=function(tcode,mcode,mtitle){
    	//alert(tcode+"/"+mcode+"/"+mtitle);
    	//clearSelect();
    	$('#choiceShow1').html(mtitle);
    	//getTheaterByMovie(1,mcode);
    }
    var clearSelect=function(){
    	$('#choiceShow1').empty();
    	$('#choiceShow2').empty();
    	
    }
    </script>
  </head>
  
  <body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12"></div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <h1>Theater</h1>
            <ul class="nav nav-pills">
              <li class="active">
                <a href="#" id="allTheater">전체 영화관</a>
                
              </li>
              <li>
                <a href="#">스페셜관
                </a>
              </li>
            </ul>
            <hr>
          </div>
          <div class="col-md-6">
            <h1>Movie</h1>
            <ul class="nav nav-pills">
              <li class="active">
                <a href="#" id="orderRate">예매순</a>
              </li>
              <li>
                <a href="#">평점순</a>
              </li>
              <li>
                <a href="#">최신개봉작
                </a>
              </li>
            </ul>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2" id="allTheaterShow">
          <!--전체 지역 보여주기 ----------------------------- -->
          <jsp:include page="cinema/allTheaterList_inc.jsp?mcode=${mcode }"/>
          <!-------------------------------------------  -->
          </div>
          <div class="col-md-4" id="allTheaterShow2"></div>
          <div class="col-md-6" id="allMovieShow">
          <!-- 예매순 영화 보여주기------------------------- -->
          <jsp:include page="cinema/movieListByRate_inc.jsp"/>
          <!-- -------------------------------------- -->
          </div>
        </div>
        <div class="row">
        	<div class="col-md-12 well">
        	<div class="row">
        	<div class="col-md-6">
<span  style='font-size:18pt;margin-right:30px' id="movieTitle">영화: &nbsp;</span><span id="choiceShow1" style='font-size:18pt'>${movie.movie_title}</span>
&nbsp;
			</div>
			<div class="col-md-6">
<span  style='font-size:18pt;display:none' id="theaterTitle" >영화관: &nbsp;</span><span id="choiceShow2" style='font-size:18pt'></span>
			</div>
        	</div>
        </div>
      </div>
    </div>
  </body>

</html>