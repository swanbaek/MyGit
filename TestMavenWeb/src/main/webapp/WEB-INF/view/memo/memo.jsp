<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.co.hanbit.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:::한줄 메모장:::</title>

<style type="text/css">
	body, th, td, input{
		font-size:13px;/*글자크기*/
		color:navy;/*글자색*/
		font-family:verdana;/*서체*/
		padding: 2px;/*안쪽 여백*/
	}
	
	table{
		border-collapse:collapse;
		margin-top:30px;/*바깥 탑 여백*/
	}
	
	table th{
		background-color:#efefef;
		font-size:16px;
		height:25px;
	}
	.box{
		border: 1px dashed navy;
	}
</style>


</head>
<body>
<%
	java.util.List<MemoVO> mList=(java.util.List<MemoVO>)request.getAttribute("mList");
	//new MemoDAO().selectAllMemo();
	out.println("mList="+mList);
%>
</body>
</html>








