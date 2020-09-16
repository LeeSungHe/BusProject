<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/member.js"></script>
</head>
<body>
	<h2>회원 수정</h2>
	<form action="memberUpdate.do" method="post" name="frm">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20"
					value="${mVo.name}" readonly></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="m_id" size="20"
					value="${dto.m_id}" readonly></td>
			</tr>
			<tr>
				<td>암 &nbsp; 호</td>
				<td><input type="password" name="m_pw" size="20">*</td>
			</tr>
			<tr height="30">
				<td width="80">암호 확인</td>
				<td><input type="password" name="m_pw_check" size="20">*</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="m_email" size="20"
					value="${dto.m_email}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="m_phone" size="20"
					value="${dto.m_phone}"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"
					onclick="return joinCheck()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>