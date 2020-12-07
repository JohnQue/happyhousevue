<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session"/>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").click(function() {
		if($("#userid").val() !== "" && $("#password").val() !== "") {
			$("#loginForm").attr("action", "${root}/member/login").submit();
		}
	});
});
</script>
<div class="inner clearfix">
    <div class="menu-group float--left">
        <a href="${root}/"><img src="${root}/resources/img/logo_happy_house.jpg" /> </a>
        <ul class="main-menu toggle" style="margin-bottom: 0">
            <li><a href="${root}/attention">공지 사항</a></li>
            <li><a href="${root}/healthCenter">코로나 선별진료소</a></li>
            <li><a href="${root}/safeHospital">안심병원</a></li>
            <li><a href="${root}/pollution">환경 오염 정보</a></li>
            <li><a href="${root}/interested">관심 지역</a></li>
            <li><a href="http://localhost:8080/">QnA</a></li>
        </ul>
    </div>
    <c:if test="${userinfo eq null }">
    <div class="sign-group float--right toggle">
        <div class="btn-group">
            <a class="btn sign-in" id="login" data-toggle="modal" data-target="#loginModal">로그인</a>
            <a class="btn btn--primary sign-up" href="${root}/member/join">회원가입</a>
        </div>
        <form id="search-form" method="POST" action="">
            <input type="text" id="search" class="input--text" placeholder="검색하기" />
            <input type="submit" value="Submit" />
        </form>
    </div>
    <div id="toggle-btn">Header Menu Toggle Button</div>
    </c:if>
    <c:if test="${userinfo ne null }">
        <div class="sign-group float--right toggle">
        <div class="btn-group">
		        <c:if test="${userinfo.admin eq '1'}">
								<a class="btn sign-in" id="admin" href="${root}/member/admin">회원정보 검색</a>
						</c:if>
            <a class="btn sign-in" id="logout" href="${root}/member/logout">로그아웃</a>
            <a class="btn mypage" id="mypage" href="${root}/member/update">정보수정</a>
        </div>
        <c:if test="${userinfo.admin ne '1'}">
	        <form id="search-form" method="POST" action="">
	            <input type="text" id="search" class="input--text" placeholder="검색하기" />
	            <input type="submit" value="Submit" />
	        </form>
        </c:if>
    </div>
    </c:if>
</div>
<div class="modal" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content animate">
			<form id="loginForm" action="" method="post">
		    <!-- Modal Header -->
		    <div class="modal-header">
		      <h4 class="modal-title">회원등록</h4>
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		    </div>
		    <div class="container">
		        <label for="userid"><b>회원 ID</b></label> <input type="text" placeholder="아이디를 입력하세요." id="userid" name="userid" required>
		        <label for="password"><b>패스워드</b></label> <input type="password" placeholder="패스워드를 입력하세요." id="password" name="password" required>
		        <button class="loginbtn btn btn--primary" id="loginBtn">로그인</button>
		    </div>
	    </form>
    </div>
  </div>
</div>
