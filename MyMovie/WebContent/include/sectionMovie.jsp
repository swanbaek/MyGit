<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />
<%
	request.setAttribute("movieList", mdao.getMovieList());
%>

<div class="section">
	<div class="container">
		<div class="row">
			<div id="sectionmovieCarousel" data-interval="5000"
				class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="item active">
						<c:forEach var="m" items="${movieList }" varStatus="st" begin="0" end="3">
							<div class="col-md-3">
							<a href="movieDetail.jsp?mcode=${m.movie_code}"><img src="images/film/${m.poster1}" class="img-responsive"></a>
								<h3>${m.movie_title }</h3>
								<p> 
								<c:if test="${m.gradename eq '0'}">
								<a href="#"><span class="label label-info">all</span></a><br>
								</c:if>
								<c:if test="${m.gradename eq '12'}">
								<a href="#"><span class="label label-success">${m.gradename}</span></a><br>
								</c:if>
								<c:if test="${m.gradename gt '12'}">
								<a href="#"><span class="label label-danger">${m.gradename}</span></a><br>
								</c:if>
									<b>${m.subtitle}</b>
								</p>
								<p>
								<button class="btn btn-default" onclick="location.href='movieDetail.jsp?mcode=${m.movie_code}'">상세보기</button>
								<button class="btn btn-default">예매하기</button>
								</p>
								
			
							</div>
						</c:forEach>
					</div>
					
					<div class="item">
						<c:forEach var="m" items="${movieList }" varStatus="st" begin="4" end="7">
							<div class="col-md-3">
								<img src="images/film/${m.poster1}" class="img-responsive">
								<h3>${m.movie_title }</h3>
								<p>
								<c:if test="${m.gradename eq '0'}">
								<a href="#"><span class="label label-info">all</span></a><br>
								</c:if>
								<c:if test="${m.gradename eq '12'}">
								<a href="#"><span class="label label-success">${m.gradename}</span></a><br>
								</c:if>
								<c:if test="${m.gradename gt '12'}">
								<a href="#"><span class="label label-danger">${m.gradename}</span></a><br>
								</c:if>
									<b>${m.subtitle}</b>
								</p>
								
								<p>
								<button class="btn btn-default" onclick="location.href='movieDetail.jsp?mcode=${m.movie_code}'">상세보기</button>
								<button class="btn btn-default">예매하기</button>
								</p>
							</div>
						</c:forEach>
					</div>
					<a class="left carousel-control" href="#sectionmovieCarousel"
							data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a><a
							class="right carousel-control" href="#movieCarousel"
							data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
				</div>
			</div>

		</div>
	</div>
</div>
