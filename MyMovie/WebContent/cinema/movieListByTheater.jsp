<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Cache-Control", "no-cache"); %>	
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />
<% 
	String mcodeStr = request.getParameter("tcode");
int tcode=0;
	if (mcodeStr != null) {
		tcode = Integer.parseInt(mcodeStr.trim());
	}
	request.setAttribute("mList", mdao.getMovieList(tcode)); 
	request.setAttribute("tcode", tcode);
	
%>

<table class="table">
<c:if test="${mList eq null or empty mList }">
	<tr><td>준비중입니다.</td></tr>
</c:if>
<c:forEach var="t" items="${mList}" varStatus="st">
<tr>	
	<td class="${mybg}" style="width:63%">
	<div class="col-md-6">
	<img src="images/${t.gradeimage}">
	${t.movie_title}
	<%-- ${t.movie_title } --%>
	</div>
	</td>
	<td>
	<%-- ${mcode }//${t.movie_code } --%>
	<c:if test="${mcode eq t.movie_code }">
		<button class='btn btn-warning'onclick="getSchedule('${tcode}','${t.movie_code}','${t.movie_title}')">스케줄 보기</button>
	</c:if>
	
	<c:if test="${mcode ne t.movie_code }">
		<button class='btn btn-default'onclick="getSchedule('${tcode}','${t.movie_code}','${t.movie_title}')">&nbsp;&nbsp;   다시 선택  &nbsp;&nbsp; </button>
	</c:if>
	</td>	
</tr>
</c:forEach>
</table>