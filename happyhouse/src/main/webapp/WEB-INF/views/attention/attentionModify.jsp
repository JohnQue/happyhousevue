<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <title>공지사항</title>

    <!-- AWESOME FONT -->
    <script src="https://kit.fontawesome.com/bee4204144.js" crossorigin="anonymous"></script>

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap" rel="stylesheet" />

    <!-- RESET CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" />

    <link rel="stylesheet" href="${root}/resources/css/main.css" />
    <link rel="stylesheet" media="(max-width: 1024px)" href="${root}/resources/css/main_medium.css" />
    <link rel="stylesheet" media="(max-width: 768px)" href="${root}/resources/css/main_small.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${root}/resources/css/signup.css">
</head>

<body>
    <div class="body__container">
       <header class="section"><c:import url="/WEB-INF/views/include/header.jsp" /></header>
        <div class="section section--feature">
            <div class="inner" style="padding:20px">
                <div class="row">
                    <form class = "w-100" method="post" action="${root}/attention/modify">
                        <input type="hidden" name="no" value="${attention.no}" />
                        <h1>공지사항 글 등록</h1>
                        <table class="table table-striped" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td><input type="text" class="form-control" placeholder="글 제목" name="title"
                                            maxlength="50" style="width: 98%;" value="${attention.title}"/></td>
                                </tr>
                                <tr>
                                    <td><textarea class="form-control" placeholder="글 내용" name="content"
                                            maxlength="2000" style="width: 100%; height: 300px;">${attention.content}</textarea></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn-group">
                            <input type="submit" class="btn btn--primary" value="수정" />
                            <input type="button" id="cancelBtn" class="btn btn--danger" value="취소" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
		$("#cancelBtn").click(function() {
			location.href = "${root}/main.do";
		});
	</script>
    <footer class="section"><%@ include file="/WEB-INF/views/include/footer.jsp"%></footer>
</body>
</html>