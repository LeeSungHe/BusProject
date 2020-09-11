<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function login(){
	var f=document.myForm;
	
	if(!f.userId.value){
		alert("아이디를 입력하세요!");
		f.userId.focus;
		return;
	}
	
	if(!f.userPwd.value){
		alert("패스워드를 입력하세요!");
		f.userPwd.focus;
		return;
	}
	
	
}
</script>
<title>로그인</title>
</head>
<body>
	<form action="" method="post" name="myForm">
		<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="30">
	<td colspan="2" align="center"><b>로그인</b></td>
</tr>
<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center" >아이디</td>
	<td width="120" style="padding-left: 5px;">
	<input type="text" name="userId" maxlength="10" size="15" style="width:150px;height: 22px;"/>
	</td>
</tr>

<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center" >패스워드</td>
	<td width="120" style="padding-left: 5px;">
	<input type="password" name="userPwd" maxlength="10" size="15" style="width:150px;height: 22px;"/>
	</td>
</tr>

<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="30">
	<td colspan="2" align="center"> 
	<input type="button" value="로그인" class="btn2" onclick="login();">
	<input type="button" value="취소"  class="btn2"
	onclick="javascript:location.href='<%=cp %>';"/>
	<input type="button" value="회원가입"  class="btn2"
	onclick="javascript:location.href='<%=cp %>#';"/>
	</td>
</tr>

<c:if test="${!empty message }">
<tr height="30">
	<td colspan="2" align="center">
	<font color="red"><b>${message }</b></font> 
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td colspan="2" align="center">
	<a href="<%=cp %>/join/searchpw.do" >비밀번호 찾기</a>
	</td>
</tr>
<tr height="1"><td colspan="2" bgcolor="#cccccc"></td></tr>
</c:if>
		</table>
	</form>
</body>
</html>
<%@ include file = "../footer.jsp" %>