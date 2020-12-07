<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<title>안심 병원 정보</title>

<!-- AWESOME FONT -->
<script src="https://kit.fontawesome.com/bee4204144.js" crossorigin="anonymous"></script>

<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap" rel="stylesheet" />

<!-- RESET CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" />

<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" media="(max-width: 1024px)" href="resources/css/main_medium.css" />
<link rel="stylesheet" media="(max-width: 768px)" href="resources/css/main_small.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
th {
	padding: 5px;
}

tr {
	text-align: center;
	padding: 10px;
}

tbody tr {
	margin-top: 5px;
	background: #eaeaea;
}

button {
	color: white;
	outline: none;
	border: none;
	padding: 5px;
	cursor: pointer;
	border-radius: 3px;
	font-weight: bold;
}
</style>
</head>

<body>
		<div class="body__container">
				<header class="section">
						<c:import url="/WEB-INF/views/include/header.jsp" />
				</header>

				<!-- VISUAL -->
				<section class="section section--visual safehospital">
						<div class="inner">
								<div class="summary">
										<h2 class="summary__title">HOSPITAL</h2>
										<p class="summary__description">안심 병원 정보</p>
								</div>
								<div id="sign-form">
										<ul>
												<li><select name="sido" id="sido">
																<option value="sido">시/도</option>
												</select></li>
												<li><select name="gugun" id="gugun">
																<option value="gugun">구/군</option>
												</select></li>
												<li>
														<button onclick="search()" id="chc" class="btn btn--primary">선발진료소 검색하기</button>
												</li>
										</ul>
								</div>
						</div>
				</section>
				<section class="section--feature" style="padding-top: 40px;">
						<h1 style="font-size: 2rem; text-align: center; margin-bottom: 20px;">국민 안심병원 현황</h1>
						<table class="table mt-2" style="width: 70%; margin: 0 auto; height: 100px;">
								<thead>
										<tr>
												<th>시</th>
												<th>군구</th>
												<th>의료기관명</th>
												<th>주소</th>
												<th>A:외래진료만/B:외래진료+입원</th>
												<th>전화번호</th>
										</tr>
								</thead>
								<tbody class="tbody">
								</tbody>
						</table>
						<section id="index_section" style="margin-top: 40px">
								<div class="card col-sm-12 mt-1" style="min-height: 550px;">
										<div class="card-body">
												<script>
													let colorArr = [ 'table-primary', 'table-success',
															'table-danger' ];
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
														var gugun = $("#gugun option:selected").text();
														$.ajax({
															url : "${root}/map/safehospital",
															data : {
																gugun : gugun
															},
															type : 'GET',
															contentType : 'application/json;charset=utf-8',
															dataType : 'json',
															success : function(data) {
																$("#searchResult").empty();
																$.each(data, function(index, vo) {
																	console.log(vo);
																	let str = "<tr class=" + colorArr[index % 3]
																			+ ">" + "<td>" + vo.sido + "</td>" + "<td>"
																			+ vo.gugun + "</td>" + "<td>"
																			+ vo.hospitalname + "</td>" + "<td>"
																			+ vo.address + "</td>" + "<td>"
																			+ vo.diagnosistype + "</td>" + "<td>"
																			+ vo.tel + "</td></tr>";
																	$(".tbody").append(str);
																});//each
															},
															error : function(xhr, status, msg) {
																console.log("상태값 : " + status + " Http에러메시지 : "
																		+ msg);
															}
														});
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
																		$("#gugun")
																				.change(
																						function() {
																							$
																									.ajax({
																										url : "${root}/map/dong",
																										type : 'GET',
																										contentType : 'application/json;charset=utf-8',
																										dataType : 'json',
																										data : {
																											gugun : $("#gugun").val()
																										},
																										success : function(data,
																												status) {
																											$("#dong").empty();
																											$("#dong")
																													.append(
																															'<option value="0">선택</option>');
																											$.each(data, function(
																													index, vo) {
																												$("#dong").append(
																														"<option value='"+vo.dong+"'>"
																																+ vo.dong
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

													function geocode(jsonData) {
														let idx = 0;
														initMap();
														$
																.each(
																		jsonData,
																		function(index, vo) {
																			let tmpLat;
																			let tmpLng;
																			$
																					.get(
																							"https://maps.googleapis.com/maps/api/geocode/json",
																							{
																								key : 'AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg',
																								address : vo.dong + "+"
																										+ vo.aptName + "+"
																										+ vo.jibun
																							},
																							function(data, status) {
																								//alert(data.results[0].geometry.location.lat);
																								tmpLat = data.results[0].geometry.location.lat;
																								tmpLng = data.results[0].geometry.location.lng;
																								$("#lat_" + index).text(tmpLat);
																								$("#lng_" + index).text(tmpLng);
																								addMarker(tmpLat, tmpLng,
																										vo.aptName);
																							}, "json");//get
																		});//each
													}
												</script>
												<div id="map" style="width: 70%; height: 500px; margin: auto;"></div>
												<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
												<script defer
														src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg&callback=initMap"></script>
												<script>
													var multi = {
														lat : 37.5665734,
														lng : 126.978179
													};
													var map;
													function initMap() {
														map = new google.maps.Map(document
																.getElementById('map'), {
															center : multi,
															zoom : 11
														});
													}
													function addMarker(tmpLat, tmpLng, aptName) {
														var marker = new google.maps.Marker(
																{
																	position : new google.maps.LatLng(
																			parseFloat(tmpLat), parseFloat(tmpLng)),
																	label : aptName,
																	icon : {
																		url : 'http://maps.google.com/mapfiles/ms/icons/orange.png',
																		labelOrigin : new google.maps.Point(15, 10)
																	},
																	title : aptName
																});
														marker.addListener('click', function() {
															map.setZoom(17);
															map.setCenter(marker.getPosition());
															callHouseDealInfo(map, marker, aptName);
														});
														marker.setMap(map);
													}
													function addMarker2(lat, lng, dong, storename) {
														var marker = new google.maps.Marker({
															position : new google.maps.LatLng(
																	parseFloat(lat), parseFloat(lng)),
															label : storename,
															title : storename
														});
														console.log(marker);
														console.log(marker.getPosition());
														marker.addListener('click', function() {
															map.setZoom(19);
															map.setCenter(marker.getPosition());
															callStoreInfo(map, marker, dong, storename);
														});
														marker.setMap(map);
													}
													function callHouseDealInfo(map, marker, aptName) {
														console.log("called");
														let infowindow = new google.maps.InfoWindow();
														let content;
														$.ajax({
															url : "${pageContext.request.contextPath}/deal",
															type : "get",
															data : {
																"aptName" : aptName
															},
															error : function(xhr, status, message) {
																alert(error);
															},
															success : function(result) {
																var obj = JSON.parse(result);
																content = obj["dealAmount"] + "만원";
																infowindow.setContent(content);
																infowindow.open(map, marker);
															}//function
														});//get
													}
													function callStoreInfo(map, marker, dong, storename) {
														console.log("called");
														let infowindow = new google.maps.InfoWindow();
														let content;
														$.ajax({
															url : "${pageContext.request.contextPath}/store",
															type : "get",
															data : {
																"storename" : storename
															},
															error : function(xhr, status, message) {
																alert(error);
															},
															success : function(result) {
																var obj = JSON.parse(result);
																content = "건물명 : " + storename + " 주소 : "
																		+ obj["roadname"];
																infowindow.setContent(content);
																infowindow.open(map, marker);
															}//function
														});//get
													}
												</script>
										</div>
								</div>
						</section>
				</section>
				<footer class="section">
						<c:import url="/WEB-INF/views/include/footer.jsp" />
				</footer>
		</div>
</body>
</html>