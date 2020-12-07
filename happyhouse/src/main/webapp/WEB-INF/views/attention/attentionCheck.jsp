<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       <header class="section"><c:import url="/WEB-INF/views/include/header.jsp" /></header>
        <div class="section section--feature">
            <div class="inner" style="padding:20px">
                <h1>글 보기</h1>
                <div class="row">
                    <table class="table table-striped" style="text-align: center;">
                        <tbody>
                            <tr>
                                <td style="width:20%;"> 글 제목 </td>
                                <td colspan="2" style="text-align: left;">${dto.title}</td>
                            </tr>
                            <tr>
                                <td style="width:20%;"> 날짜 </td>
                                <td colspan="2" style="text-align: left;">${dto.time}</td>
                            </tr>
                            <tr>
                                <td>작성자</td>
                                <td colspan="2" style="text-align: left;">${dto.writer}</td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td colspan="2" style="min-height: 200px; text-align: left;">
                               ${dto.content}
                            </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-group">
                        <input type="button" class="btn btn--primary" onclick="location.href='${root}/attention'" value="목록" />
                        <input type="button" class="btn btn--primary" onclick="location.href='${root}/attention/modify?no=${dto.no}'"
                            value="수정" />
                        <input type="button" class="btn btn--danger" onclick="location.href='${root}/attention/delete?no=${dto.no}'" value="삭제" />
                    </div>
                </div>
            </div>
        </div>
        <footer class="section"><%@ include file="/WEB-INF/views/include/footer.jsp"%></footer>
    </div>
</body>

</html>