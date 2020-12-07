<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원 정보</title>
<!-- AWESOME FONT -->
<script src="https://kit.fontawesome.com/bee4204144.js"crossorigin="anonymous"></script>
<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap" rel="stylesheet" />
<!-- RESET CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" />

<link rel="stylesheet" href="../resources/css/main.css" />
<link rel="stylesheet" media="(max-width: 1024px)" href="../resources/css/main_medium.css" />
<link rel="stylesheet" media="(max-width: 768px)" href="../resources/css/main_small.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="body__container">
		<header class="section">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</header>
		<div class="section section--feature">
			<div class="inner" style="padding: 20px">
				<div class="searchcontainer" align="center">
				<table class="table table-borderless">
					<tr>
						<td align="right">
						<form id="searchform" method="get"  class="form-inline"
									action="${root}/member/admin">
							<select class="form-control" name="key" id="key">
								<option value="userid" selected="selected">아이디</option>
							</select>
							<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
							<button type="submit" class="btn btn--primary">검색</button>
							</form>
						</td>
					</tr>
				</table>
			<c:if test="${list.size() != 0}">
				<table class="table table-active">
					<tbody class="article-list">	
						<tr class="table-info">
							<td>아이디</td>
							<td>이름</td>
							<td>전화번호</td>
							<td>이메일</td>
							<td width="30"></td>
						</tr>
						<c:forEach var="member" items="${members}">
							<tr class="viewitem">
								<td>${member.userid}</td>
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.email}</td>
								<td width="30"><input type="button" class="btn btn--danger" onclick="location.href='${root}/member/delete?id=${member.userid}'" value="삭제" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${articles.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
			</div>
		</div>
		<footer class="section">
				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>