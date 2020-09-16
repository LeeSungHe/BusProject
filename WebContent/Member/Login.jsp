<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/member.js"></script>
</head>
<body>
	<h2>로그인</h2>
	<form action="Login.do" method="post" name="frm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id" value="${m_id}"></td>
			</tr>
			<tr>
				<td>암 호</td>
				<td><input type="password" name="m_pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"
					onclick="return loginCheck()">&nbsp;&nbsp; <input
					type="reset" value="취소"> &nbsp;&nbsp; <input type="button"
					value="회원 가입" onclick="location.href='Join.do'"></td>
			</tr>
			<tr>
				<td colspan="2">${message}</td>
			</tr>
		</table>
	</form>
</body>
</html>