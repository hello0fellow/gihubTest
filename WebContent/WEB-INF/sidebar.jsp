<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Montserrat", sans-serif;
}
.w3-sidebar {
	width: 120px;
	background: #222;
}
</style>
<title>홈페이지 만들기</title>
</head>
<body class="w3-black">
	<div>
		<nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="width:250px;font-weight:bold;">
			<div class="w3-wide w3-container">
				<h2>
					<a href="/01_BBS/Index.do">HOME</a>
				</h2>
			</div>
			<div class="w3-bar-block">
				<div>
					<ul>
						<c:if test="${ id == null }">
							<li><a href="/01_BBS/LoginForm.do" class="w3-bar-item w3-button w3-hover-white">로그인</a></li>
							<li><a href="/01_BBS/MemberJoinForm.do" class="w3-bar-item w3-button w3-hover-white">회원가입</a></li>
						</c:if>
						<c:if test="${ id != null }">
							<li><a href="/01_BBS/MemberUpdateForm.do" class="w3-bar-item w3-button w3-hover-white">${ nickname }(${ id })</a></li>
							<li><a href="/01_BBS/LogOut.do" class="w3-bar-item w3-button w3-hover-white">로그아웃</a></li>
						</c:if>
						<c:if test="${ id.equals('joker') }">
							<li><a href="#" class="w3-bar-item w3-button w3-hover-white">관리자 모드</a></li>
						</c:if>
					</ul>
				</div>
				<div>
					<ul>
						<li><a href="#" class="w3-bar-item w3-button w3-hover-white">메뉴1</a></li>
						<li><a href="#" class="w3-bar-item w3-button w3-hover-white">메뉴2</a></li>
						<li><a href="#" class="w3-bar-item w3-button w3-hover-white">메뉴3</a></li>
						<li><a href="#" class="w3-bar-item w3-button w3-hover-white">메뉴4</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>