<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Cache-Control", "no-cache"); %>	
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />
<% 
	  
	request.setAttribute("mList", mdao.getMovieListByRate());   
%>

<table class="table">

<c:forEach var="t" items="${mList}" varStatus="st">
<tr>	
	<td class="${mybg}" style="width:33%">
	<div class="col-md-6">
	<img src="images/${t.gradeimage}">
	<%-- <a href="javascript:getSchedule('1','${t.movie_code}','${t.movie_title}')">${t.movie_title}</a> --%>
	${t.movie_title }
	</div>
	</td>	
</tr>
</c:forEach>
</table>                                                                   