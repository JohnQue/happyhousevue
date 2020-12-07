<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원가입</title>

<!-- AWESOME FONT -->
<script src="https://kit.fontawesome.com/bee4204144.js" crossorigin="anonymous"></script>

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap" rel="stylesheet" />

<!-- RESET CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" />

<link rel="stylesheet" href="${root}/resources/css/main.css" />
<link rel="stylesheet" media="(max-width: 1024px)" href="${root}/resources/css/main_medium.css" />
<link rel="stylesheet" media="(max-width: 768px)" href="${root}/resources/css/main_small.css" />
<link rel="stylesheet" type="text/css" href="${root}/resources/css/login.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/signup.css">

</head>

<body>
		<c:if test="${userinfo eq null}">
				<div class="body__container">
						<header class="section">
								<c:import url="/WEB-INF/views/include/header.jsp" />
						</header>
						<div class="section section--feature">
								<div class="inner" style="padding: 20px">
										<h1>회원가입</h1>
										<div class="form--style">
											<div id="wrapper">
													<div id="wrapper-bgbtm" style="width: 800px; margin: 0 auto;">
															<form role="form" method="post" action="${root}/member/register">
																	<div class="form-group" id="divId">
																			<label for="inputId" class="col-lg-2 control-label">아이디</label>
																			<div class="col-lg-10">
																					<input type="text" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true"
																							name="userid" placeholder="아이디" maxlength="30">
																			</div>
																	</div>
																	<div class="form-group" id="divPassword">
																			<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
																			<div class="col-lg-10">
																					<input type="password" class="form-control" id="pw" name="password" data-rule-required="true"
																							placeholder="패스워드" maxlength="30">
																			</div>
																	</div>
																	<div class="form-group" id="divPasswordCheck">
																			<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
																			<div class="col-lg-10">
																					<input type="password" class="form-control" id="passwordCheck" data-rule-required="true"
																							placeholder="패스워드 확인" maxlength="30">
																			</div>
																	</div>
																	<div class="form-group" id="divName">
																			<label for="inputName" class="col-lg-2 control-label">이름</label>
																			<div class="col-lg-10">
																					<input type="text" class="form-control onlyHangul" id="name" data-rule-required="true" name="name"
																							placeholder="한글만 입력 가능합니다." maxlength="15">
																			</div>
																	</div>
																	<div class="form-group" id="divPhoneNumber">
																			<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
																			<div class="col-lg-10">
																					<input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true"
																							name="phone" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
																			</div>
																	</div>
																	<div class="form-group" id="divEmail">
																			<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
																			<div class="col-lg-10">
																					<input type="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일"
																							name="email" maxlength="40">
																			</div>
																	</div>
																	<div class="form-group regbtn">
																			<div>
																					<button type="submit" class="btn btn--primary">가입</button>
																					<a class="btn btn--danger" href="${root}">취소</a>
																			</div>
																	</div>
															</form>
													</div>
											</div>
										</div>
								</div>
						</div>
						<footer class="section">
								<c:import url="/WEB-INF/views/include/footer.jsp" />
						</footer>
				</div>
		</c:if>
		<c:if test="${userinfo ne null}">
				<script>
					alert("로그인된 상태에서 접근할 수 없습니다!");
				</script>
				<c:redirect url="/index.jsp" />
		</c:if>
		<script>
			$("#cancelBtn").click(function() {
				location.href = "${root}/main.do";
			});
		</script>
</body>
</html>