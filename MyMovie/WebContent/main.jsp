<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="myctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html> 
 <html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${myctx }/css/mystyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
#movieCarousel .carousel-inner {
    position: relative;
    overflow: hidden;
    width: 100%;
    min-height: 450px;
    max-height: 450px;
}

</style>
<script type="text/javascript">
$(function(){
	$('#logoBrand').hover(function(){
	
		$(this).attr("src","images/logo2.PNG");
		$(this).parent().parent().attr("href","siteMap.jsp");
	},function(){
	
		$(this).attr("src","images/logo.PNG");
		$(this).parent().parent().attr("href","index.jsp");
	});
});	
</script>

</head>
<body>

	<div class="navbar navbar-default navbar-static-top" >
		<div class="container">
		
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand hidden-xs" href="#"><span><img id="logoBrand" src="images/logo.PNG" class="img img-thumbnail"></span></a>
				<a class="navbar-brand hidden-md hidden-lg hidden-sm" href="#"><span style="font-weight:bold">MegaBox</span></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="${myctx}/main.jsp">HOME</a></li>
					<li><a href="#">LOGIN</a></li>
					<li><a href="#">SignUp</a></li>
					<li><a href="#">Membership</a></li>
					<li><a href="#">Customer</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="section bg-danger">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-md-offset-2">
				<img src="images/banner1.PNG" class="img img-responsive">
					<!-- <blockquote>
						<p>Lorem ipsum dolor sit amet</p>
						<footer>Someone famous </footer>
					</blockquote> -->
				</div>
			</div>
		</div>
	</div>
	<div class="section" style="border:3px solid #85144b">
		<div class="container">
			<div class="row">
				
				<div class="col-md-2 col-md-offset-1 col-xs-2 col-sm-2">
						<a href="#"><i class="fa fa-3x fa-fw fa-film"></i><span  class="hidden-xs hidden-sm">Movie</span></a>
				</div>		
				<div class="col-md-2 col-xs-2 col-sm-2">
						<a href="#"><i class="fa fa-3x fa-fw fa-building-o"></i><span  class="hidden-xs hidden-sm">Theater</span></a>
				</div>
				<div class="col-md-2 col-xs-2 col-sm-2">		
						<a href="#"><i class="fa fa-3x fa-fw fa-ticket"></i><span  class="hidden-xs hidden-sm">Ticketting</span></a>
				</div>		
				<div class="col-md-2 col-xs-2 col-sm-2">
						<a><i class="fa fa-3x fa-fw hub fa-gift"></i><span  class="hidden-xs hidden-sm">Gift Shop</span></a>
				</div>
				<div class="col-md-2 col-xs-2 col-sm-2">
					<a><i class="fa fa-3x fa-fw hub fa-bell-o"></i><span  class="hidden-xs hidden-sm">Event</span></a>
				</div>
					
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="movieCarousel" data-interval="4000"
						class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<div class="item active">
								<img src="${myctx }/images/movie1.PNG" class="img img-responsive">
								<div class="carousel-caption">
									<h2></h2>
									<p></p>
								</div>
							</div>
							<div class="item">
							<img src="${myctx }/images/movie3.PNG" class="img img-responsive">
							<div class="carousel-caption">
									<h3>나의 위대한 친구 세잔</h3>
									<a href="#" class="btn btn-warning">상세보기</a>
								</div>
							</div>
							<div class="item">
							<img src="${myctx }/images/movie2.PNG" class="img img-responsive">
							<div class="carousel-caption">
									<h3>호비와 동화나라의 대모험</h3>
									<a href="#" class="btn btn-success">상세보기</a>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#movieCarousel"
							data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a><a
							class="right carousel-control" href="#movieCarousel"
							data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
					</div>
					<!-- <h1>A title</h1>
					<p></p>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisici elit, <br>sed
						eiusmod tempor incidunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud
					</p>
					<p></p> -->
				</div>
				<div class="col-md-6">
				<!-- src="http://www.youtube.com/embed/i__1Z5a9Sak" -->
					<div class="embed-responsive embed-responsive-16by9">
					
					<iframe  class="embed-responsive-item" width="560" height="315" src="https://www.youtube.com/embed/7-MPcx4jnvE" frameborder="0" allowfullscreen></iframe>						
					</div>
					<h1>Sing</h1>
					<h2>
						꿈의 오디션이 시작된다.
					</h2>
					<p>
						2016년 당신의 심장을 뛰게 할 꿈의 무대!
인생 최고의 SING나는 쇼가 펼쳐진다!
					</p>
					<p></p>
				</div>
			</div> 
		</div>
	</div>
	<!-- ----------------------------------------------------------------------------------- -->
	<jsp:include page="/include/sectionMovie.jsp"></jsp:include>
	<!-- ----------------------------------------------------------------------------------- -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<ul class="list-group">
						<li class="list-group-item"><a><i class="fa fa-2x fa-fw fa-list-ul"></i>&nbsp;NOTICE</a></li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-group">
						<li class="list-group-item"><a><i class="fa fa-2x fa-fw -o fa-cc-paypal"></i>&nbsp;할인카드</a></li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="media-list">
						<li class="media"><a class="pull-left" href="#"><img
								class="media-object"
								src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
								height="64" width="64"></a>
						<div class="media-body">
								<h4 class="media-heading">Media heading</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin commodo. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis.</p>
							</div></li>
						<li class="media"><a class="pull-left" href="#"><img
								class="media-object"
								src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
								height="64" width="64"></a>
						<div class="media-body">
								<h4 class="media-heading">Media heading</h4>
								<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
									metus scelerisque ante sollicitudin commodo. Cras purus odio,
									vestibulum in vulputate at, tempus viverra turpis.</p>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<footer class="section section-info">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h1>Footer header</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisici elit, <br>sed
						eiusmod tempor incidunt ut labore et dolore magna aliqua. <br>Ut
						enim ad minim veniam, quis nostrud
					</p>
				</div>
				<div class="col-sm-6">
					<p class="text-info text-right">
						<br>
						<br>
					</p>
					<div class="row">
						<div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
							<a href="#"><i
								class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a> <a
								href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
							<a href="#"><i
								class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a> <a href="#"><i
								class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 hidden-xs text-right">
							<a href="#"><i
								class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a> <a
								href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
							<a href="#"><i
								class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a> <a href="#"><i
								class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>