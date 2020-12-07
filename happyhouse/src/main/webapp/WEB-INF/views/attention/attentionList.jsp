<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>공지사항</title>
<!-- AWESOME FONT -->
<script src="https://kit.fontawesome.com/bee4204144.js"crossorigin="anonymous"></script>
<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap" rel="stylesheet" />
<!-- RESET CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" />

<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" media="(max-width: 1024px)" href="resources/css/main_medium.css" />
<link rel="stylesheet" media="(max-width: 768px)" href="resources/css/main_small.css" />
<link rel="stylesheet" type="text/css" href="resources/css/login.css">

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

				<h1>공지사항 목록</h1>
				<div class="row">
					<table class="table table-striped" id="attentionlist"
						style="text-align: center; border: 1px solid #dddddd">
						<colgroup>
							<col width="60">
							<col width="150">
							<col width="80">
						</colgroup>
						<thead>
							<tr>
								<th height="45"
									style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th colspan="2"
									style="background-color: #eeeeee; text-align: center;">작성자</th>
							</tr>
						</thead>
						<tbody class="article-list">
							<c:forEach var="item" items="${attentions}">
								<tr class="viewitem" data-no="">
									<td style="text-align: center;">${item.no}</td>
									<td style="text-align: center;"><a
										href="${root}/attention/detail?no=${item.no}">${item.title}</a></td>
									<td style="text-align: center;">${item.writer }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="hidden" name="pg" id="pg" value="1">
				</div>
			<div style="display: flex; flex-direction: column;">
				<div style="display: flex; justify-content: flex-end; margin-bottom: 1rem;">
					<button class="btn btn--primary" onclick="location.href='${root}/attention/write'">
						작성하기
					</button>
				</div>
				<form id="searchform" method="get" action="${root}/attention" style="display: flex; justify-content: center;">
					<select class="form-control" name="key" id="skey" style="width: 100px;">
				    <option value="writer" selected="selected">아이디</option>
				    <option value="no">글번호</option>
				    <option value="title">제목</option>
			  	</select>
					<input type="hidden" name="type" value="goAttention" /> <input
						type="text" class="input--text" placeholder="검색어 입력"
						name="word" id="word">
					<button class="btn btn--primary" type="submit">검색</button>
				</form>
			</div>
			</div>
		</div>
		<footer class="section">
				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>