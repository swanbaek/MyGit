<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Cache-Control", "no-cache"); %>	
<jsp:useBean id="mdao" class="movie.model.MovieDAOMyBatis"
	scope="session" />
<% 
	String lcodeStr = request.getParameter("loc_code");
String mcodeStr = request.getParameter("mcode");
int mcode=0, lcode=0;
	if (mcodeStr != null) {
		mcode = Integer.parseInt(mcodeStr.trim());
	}
	if(lcodeStr!=null){
		lcode=Integer.parseInt(lcodeStr.trim());
	}
	
	request.setAttribute("theaterList", mdao.getTheaterList(lcode, mcode)); 
%>

<table class="table table-responsive table-bordered">
<tr>
 
<c:forEach var="t" items="${theaterList}" varStatus="st">
	<c:if test="${t.loc_code mod 3 eq 1 }">
		<c:set var="mybg" value="bg-success"/>
	</c:if>
	<c:if test="${t.loc_code mod 3 eq 2 }">
		<c:set var="mybg" value="bg-warning"/>
	</c:if>
	<c:if test="${t.loc_code mod 3 eq 0 }">
		<c:set var="mybg" value="bg-info"/>
	</c:if>
	<td class="${mybg}" style="width:33%">
	<a href="javascript:getMovie('${t.theater_code}','${t.theater_name}')">${t.theater_name}</a>
	</td>	
	<c:if test="${st.count mod 3 eq 0}">
	</tr><tr>
	</c:if>
</c:forEach>
</tr>
</table>
