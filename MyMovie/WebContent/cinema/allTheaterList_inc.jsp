<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Cache-Control", "no-cache"); %>	
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />
<%
	String mcodeStr = request.getParameter("mcode");
	if (mcodeStr == null) {
		mcodeStr="1";
	}
	int mcode = Integer.parseInt(mcodeStr.trim());
	session.setAttribute("mcode", mcode);
	request.setAttribute("locList", mdao.getLocListByMovieCnt(mcode));  
%>

<table class="table table-responsive table-striped table-bordered">
<c:forEach var="loc" items="${locList}" varStatus="st">
<tr>
	<td>
	<a href="javascript:getTheaterByMovie('${loc.loc_code}','${mcode}')">${loc.loc_name}&nbsp; (${loc.cnt })</a>
	</td>	
</tr>
</c:forEach>
</table>
