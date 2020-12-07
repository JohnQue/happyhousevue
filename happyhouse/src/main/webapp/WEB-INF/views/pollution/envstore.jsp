<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>동네 환경 점검</title>

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
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/signup.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
       th{
          padding: 5px;
       }
    </style>
    <script>
    	let englishgungu = {
    		"서대문구": ["sdm", "Seodaemun"],
    		"강서구": ["gangseo", "Gangseo"],
    		"금천구": ["geumcheon", "Geumcheon"],
    		"성북구": ["sb", "Sb"],
    		"성동구": ["sd", "Sd"],
    		"중랑구": ["jungnang", "Jungnang"],
    		"노원구": ["nowon", "Nw"],
    		"동대문구": ["ddm", "Dongdeamoon"],
    		"양천구": ["yangcheon", "Yc"],
    		"강동구": ["gd", "Gd"],
    		"종로구": ["jongno", "Jongno"],
    		"송파구": ["songpa", "Sp"],
    		"중구": ["junggu", "Junggu"],
    		"마포구": ["mapo", "Mp"],
    		"동작구": ["dongjak", "Dj"],
    		"강남구": ["gangnam", "Gn"],
    		"영등포구": ["ydp", "Ydp"],
    		"도봉구": ["dobong", "Dobong"],
    		"구로구": ["guro", "Guro"],
    		"용산구":	 ["yongsan", "Ys"],
    		"서초구": ["seocho", "Sc"],
    		"광진구": ["gwangjin", "Gwangjin"],
    		"관악구": ["gwanak", "Ga"],
    		"은평구": ["ep", "Ep"]
    };
    </script>
</head>

<body>
    <div class="body__container">
        <!-- HEADER -->
       <header class="section">
       	<c:import url="/WEB-INF/views/include/header.jsp" />
       </header>
   
        <section class="section section--visual pollution">
            <div class="inner"  style="padding: 50px 0;">
                <div class="summary">
                    <h6 class="summary__title">
                      POLLUTION
                    </h6>
                    <p class="summary__description">
                       동네 주변에 있는 <br> 환경 점검 업소에 관련하여 알려줍니다.
                    </p>
                </div>
								<div id="sign-form">
										<ul>
												<li>
													<select name="sido" id="sido">
														<option value="sido">시/도</option>
													</select>
												</li>
												<li>
													<select name="gugun" id="gugun">
														<option value="gugun">구/군</option>
													</select>
												</li>
												<li>
														<button onclick="search()" id="chc" class="btn btn--primary">환경정보 검색하기</button>
												</li>
										</ul>
								</div>
            </div>
        </section>
        <section id="index_section" style="margin-top: 40px">
            <div class="card col-sm-12 mt-1" style="min-height: 550px;">
               <div class="card-body">
               <script>
               let colorArr = ['table-primary','table-success','table-danger'];
               $(document)
								.ready(
										function() {
											$
													.ajax({
														url : "${root}/map/sido",
														type : 'GET',
														contentType : 'application/json;charset=utf-8',
														dataType : 'json',
														success : function(data) {
															$.each(data, function(index, vo) {
																$("#sido").append(
																		"<option value='"+vo.sido_code+"'>"
																				+ vo.sido_name
																				+ "</option>");
															});//each
														},
														error : function(xhr, status, msg) {
															console.log("상태값 : " + status
																	+ " Http에러메시지 : " + msg);
														}
													})
										});//ready
										function search() {
											let value = $('#gugun option:selected').text();
											if(value === '강북구') alert("강북구는 환경 정보가 없습니다!");
											else{
												let go = '.go';
												
												if(value === '강서구' || value === '중구' || value === '송파구') go = '.seoul';
												let eng = englishgungu[value];
												$(".tbody").empty();
												$.ajax({
													url : "http://openAPI."+eng[0]+go+".kr:8088/6c6162565665787539396a72686b4b/json/"+eng[1]+"ListEnvGuideCheck/1/12",
													type : 'GET',
													dataType : 'json',
													success : function(vo) {
														let data = vo[eng[1]+"ListEnvGuideCheck"].row;
														$.each(data, function(index, vo) {
															let str = "<tr class=" + colorArr[index % 3]
															+ ">" + "<td>" + vo["WRKP_NM"] + "</td>" + "<td>"
															+ vo["DRT_INSP_ITEM"] + "</td>" + "<td>"
															+ vo["WRKP_ADDR"] + "</td></tr>";
															$(".tbody").append(str);
														});
													},
													error : function(xhr, status, msg) {
														console.log("상태값 : " + status + " Http에러메시지 : "
																+ msg);
													}
												});
											}
										}
										$(document)
												.ready(
														function() {
															$("#sido")
																	.change(
																			function() {
																				$
																						.ajax({
																							url : "${root}/map/gugun",
																							type : 'GET',
																							contentType : 'application/json;charset=utf-8',
																							dataType : 'json',
																							data : {
																								"sido" : $("#sido").val()
																							},
																							success : function(data) {
																								$("#gugun").empty();
																								$("#gugun")
																										.append(
																												'<option value="0">선택</option>');
																								$.each(data, function(
																										index, vo) {
																									$("#gugun").append(
																											"<option value='"+vo.gugun_code+"'>"
																													+ vo.gugun_name
																													+ "</option>");
																								});//each
																							},
																							error : function(xhr,
																									status, msg) {
																								console.log("상태값 : "
																										+ xhr.status
																										+ " Http에러메시지 : "
																										+ xhr.responseText);
																							}
																						});//get
																			});//change
												
														});

               </script>
               <table class="table mt-2" style="width: 70%; margin: 0 auto;">
                  <thead>
                     <tr>
                        <th>업종명</th>
                        <th>점검사항</th>
                        <th>주소</th>
                     </tr>
                     <tr></tr>
                  </thead>
                  <tbody class="tbody">
                  </tbody>
               </table>
         </div>
      </div>
      </section>
        <footer class=" section">
        	<c:import url="/WEB-INF/views/include/footer.jsp" />
        </footer>
    </div>
    <div id="id01" class="modal"></div>
</body>

</html>