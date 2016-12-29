<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/top2.jsp"/>
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />
<script type="text/javascript">

	var reserve=function(){
		$('#rf').submit();
		
	}

</script>	
	
<%
	String mcodeStr=request.getParameter("mcode");
	if(mcodeStr==null||mcodeStr.trim().isEmpty()){
		response.sendRedirect("main.jsp");
		return;
	}
	int mcode=Integer.parseInt(mcodeStr.trim());
	request.setAttribute("movie", mdao.getMovieDetail(mcode));
%>
<form id="rf" name="rf" action="movieReserve.jsp" method="get">
	<input type="hidden" name="mcode" id="mcode" value="${movie.movie_code}"/>
</form>

<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<img
						src="images/film/${movie.poster1}"
						class="img-responsive">
				</div>
				<div class="col-md-5">
					<h1>${movie.movie_title }&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="images/ing.png">&nbsp;
					<img src="images/${movie.gradeimage}">
					<button class="btn btn-success" type="button" onclick="reserve()">예매하기</button>
					</h1>
					<h3>${movie.subtitle }</h3>
					<h4 class="text-primary">예매율: a위 ${movie.rate}%</h4>
					<p>${movie.story }</p>
					<hr>
					<b>감독</b>&nbsp;:${movie.director }&nbsp;&nbsp;
					<b>배우</b>&nbsp;:${movie.actor }&nbsp;&nbsp;<br>
					<b>개봉일</b>&nbsp;:${movie.opendate }<br>
					<b>장르</b>&nbsp;&nbsp;: ${movie.genrename }<br>
					<b>기본정보</b>&nbsp;&nbsp;: ${movie.makeCountry}&nbsp;(${movie.runtime})분
					<p>
					
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="carousel-example" data-interval="false"
						class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<div class="item active">
								<img
									src="https://unsplash.imgix.net/photo-1423439793616-f2aa4356b37e?w=1024&amp;q=50&amp;fm=jpg&amp;s=3b42f9c018b2712544debf4d6a4998ff">
								<div class="carousel-caption">
									<h2>Title</h2>
									<p>Description</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example"
							data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a><a
							class="right carousel-control" href="#carousel-example"
							data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>




<jsp:include page="/foot.jsp"/>