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