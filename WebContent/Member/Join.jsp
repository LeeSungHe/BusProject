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
	<h2>회원 가입</h2>
	'*' 표시 항목은 필수 입력 항목입니다.
	<form action="Login.do" method="post" name="frm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id" size="20"  id="m_id">* <input
					type="hidden" name="reid" size="20"> <input type="button"
					value="중복 체크" onclick="idCheck()"></td>
			</tr>
			<tr>
				<td>암 호</td>
				<td><input type="password" name="m_pw" size="20">*</td>
			</tr>
			<tr height="30">
				<td width="80">암호 확인</td>
				<td><input type="password" name="m_pw_check" size="20">*</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="m_email" size="20">*</td>
				
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="m_phone" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"
					onclick="return joinCheck()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">
				</td>
			</tr>
			<tr>
				<td colspan="2">${message }</td>
			</tr>
		</table>
	</form>
</body>
</html>