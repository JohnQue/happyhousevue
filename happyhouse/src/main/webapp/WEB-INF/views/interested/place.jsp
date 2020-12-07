<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>관심지역 정보</title>

<!-- AWESOME FONT -->
<script src="https://kit.fontawesome.com/bee4204144.js" crossorigin="anonymous"></script>

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

#delete {
	background: #f03e3e;
}

#showInfo {
	background: #51cf66;
}

.table td, .table th {
	vertical-align: middle;
}
</style>
</head>

<body>
		<div class="body__container">
				<!-- HEADER -->
				<header class="section">
						<c:import url="/WEB-INF/views/include/header.jsp" />
				</header>

				<section class="section section--visual store">
						<div class="inner" style="padding: 50px 0;">
								<div class="summary">
										<h2 class="summary__title">INTERESTED</h2>
										<p class="summary__description">관심지역 등록</p>
								</div>
								<form id="sign-form" method="post" action="${root}/interested/register">
										<ul>
												<li><select name="sido" id="sido">
																<option value="sido">시/도</option>
												</select></li>
												<li><select name="gugun" id="gugun">
																<option value="gugun">구/군</option>
												</select></li>
												<li><select name="dong" id="dong">
																<option value="dong">선택</option>
												</select></li>
												<li>
														<button type="submit" class="btn btn--primary">관심 지역 등록하기</button>
												</li>
										</ul>
								</form>
						</div>
				</section>
				<section class="section--feature" style="padding-top: 40px;">
						<h1 style="font-size: 2rem; text-align: center; margin-bottom: 20px;">관심지역 리스트</h1>
						<table class="table mt-2" style="width: 70%; margin: 0 auto; height: 100px;">
								<thead>
										<tr>
												<th>번호</th>
												<th>시</th>
												<th>군/구</th>
												<th>동</th>
												<th>정보보기</th>
												<th>삭제</th>
										</tr>
								</thead>
								<tbody>
										<c:forEach var="l" items="${list}">
												<tr>
														<td>${l.no}</td>
														<td>${l.sido}</td>
														<td>${l.gugun}</td>
														<td>${l.dong}</td>
														<td><button class="button" onclick="showInfo('${l.dong}');" id="showInfo">정보보기</button></td>
														<td><button class="button"
																		onclick="javascript:location.href='main.do?type=removeInterestPlace&no=${l.no}&userid=${l.userid}'"
																		id="delete">삭제</button></td>
												</tr>
										</c:forEach>
								</tbody>
						</table>
						<section id="index_section" style="margin-top: 40px">
								<div class="card col-sm-12 mt-1" style="min-height: 550px;">
										<div class="card-body">
												<script>
					let colorArr = ['table-primary','table-success','table-danger'];
					$(document).ready(function(){
						$.ajax({
							url:"${root}/map/sido",
							type:'GET',
							contentType:'application/json;charset=utf-8',
							dataType:'json',
							success: function(data){
								$.each(data, function(index, vo) {
									$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
								});//each
							},
							error:function(xhr,status,msg){
								console.log("상태값 : " + status + " Http에러메시지 : "+msg);
							}
						})
				});//ready
					function showInfo(dong){
						$.ajax({
							url:"${root}/map/apt",
							type:'GET',
							contentType: 'application/json;charset=utf-8',
							dataType: 'json',
							data: {dong:dong},
							success: function(data, response){
									$("#searchResult").empty();
									$.each(data, function(index, vo) {
										let str = "<tr class="+colorArr[index%3]+">"
										+ "<td>" + vo.no + "</td>"
										+ "<td>" + vo.dong + "</td>"
										+ "<td>" + vo.aptName + "</td>"
										+ "<td>" + vo.jibun + "</td>"
										+ "<td>" + vo.code
										+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
										$(".tbody").append(str);
									});
									geocode(data);
							},
							error:function(xhr,status,msg){
								console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
							}
						});
						$.ajax({
							url:"${root}/map/store",
							type:'GET',
							contentType: 'application/json;charset=utf-8',
							dataType: 'json',
							data: {dong: dong},
							success: function(data, response){
									$("#searchResult2").empty();
									$.each(data, function(index, vo) {
										let str = "<tr class="+colorArr[index%3]+">"
										+ "<td>" + vo.dong + "</td>"
										+ "<td>" + vo.storename + "</td>"
										+ "<td>" + vo.roadname + "</td>"
										+ "<td id='lat_"+index+"'>"+vo.lat+"</td><td id='lng_"+index+"'>"+vo.lng+"</td></tr>";
										$(".tbody2").append(str);
									});
									geostorecode(data);
							},
							error:function(xhr,status,msg){
								console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
							}
						});
					}
					$(document).ready(function(){
						$("#sido").change(function() {
							$.ajax({
								url:"${root}/map/gugun",
								type:'GET',
								contentType:'application/json;charset=utf-8',
								dataType:'json',
								data: {"sido":$("#sido").val()},
								success: function(data){
									$("#gugun").empty();
									$("#gugun").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
									});//each
								},
								error:function(xhr,status,msg){
									console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
								}
							});//get
						});//change
						$("#gugun").change(function() {
							$.ajax({
								url:"${root}/map/dong",
								type: 'GET',
								contentType: 'application/json;charset=utf-8',
								dataType: 'json',
								data: {gugun:$("#gugun").val()},
								success: function(data, status){
										$("#dong").empty();
										$("#dong").append('<option value="0">선택</option>');
										$.each(data, function(index, vo) {
											$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
										});//each
								},
								error:function(xhr,status,msg){
									console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
								}
							});//get
						});//change
						$("#dong").change(function() {
							$.get("${root}/map");//get
						});//change
					});
					function geocode(jsonData) {
						let idx = 0;
						initMap();
						$.each(jsonData, function(index, vo) {
							let tmpLat;
							let tmpLng;
							$.get("https://maps.googleapis.com/maps/api/geocode/json"
									,{	key:'AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg'
										, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
									}
									, function(data, status) {
										//alert(data.results[0].geometry.location.lat);
										tmpLat = data.results[0].geometry.location.lat;
										tmpLng = data.results[0].geometry.location.lng;
										$("#lat_"+index).text(tmpLat);
										$("#lng_"+index).text(tmpLng);
										addMarker(tmpLat, tmpLng, vo.aptName);
									}
									, "json"
							);//get
						});//each
					}
					function geostorecode(jsonData) {
						let idx = 0;
						$.each(jsonData, function(index, vo) {
							addMarker2(vo.lat, vo.lng, vo.dong, vo.storename);
						});//each
					}
					</script>
												<div id="map" style="width: 70%; height: 500px; margin: auto;"></div>
												<table class="table mt-2" style="width: 70%; margin: 0 auto; height: 100%; margin-bottom: 20px;">
														<thead>
																<tr>
																		<th>번호</th>
																		<th>법정동</th>
																		<th>아파트이름</th>
																		<th>지번</th>
																		<th>지역코드</th>
																		<th>위도</th>
																		<th>경도</th>
																</tr>
														</thead>
														<tbody id="searchResult" class="tbody">
														</tbody>
												</table>
												<table class="table mt-2" style="width: 70%; margin: 0 auto; height: 100%; margin-bottom: 20px;">
														<thead>
																<tr>
																		<th>동</th>
																		<th>가게명</th>
																		<th>주소</th>
																		<th>위도</th>
																		<th>경도</th>
																</tr>
														</thead>
														<tbody id="searchResult2" class="tbody2">
														</tbody>
												</table>

												<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
												<script defer
														src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg&callback=initMap"></script>
												<script>
						var multi = {lat: 37.5665734, lng: 126.978179};
		               var map;
		               function initMap() {
		                  map = new google.maps.Map(document.getElementById('map'), {
		                     center: multi, zoom: 14
		                  });
		               }
		               function addMarker(tmpLat, tmpLng, aptName) {
		                  var marker = new google.maps.Marker({
		                     position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
		                     label: aptName,
		                     icon: {
		                         url: 'http://maps.google.com/mapfiles/ms/icons/orange.png',
		                         labelOrigin: new google.maps.Point(15, 10)
		                       },
		                     title: aptName
		                  });
		                  marker.addListener('click', function() {
		                     map.setZoom(20);
		                     map.setCenter(marker.getPosition());
		                     callHouseDealInfo(map, marker, aptName);
		                  });
		                  marker.setMap(map);
		               }
		               function addMarker2(lat, lng, dong, storename) {
		                  var marker = new google.maps.Marker({
		                     position: new google.maps.LatLng(parseFloat(lat),parseFloat(lng)),
		                     label: storename,
		                     title: storename
		                  });
		                  marker.addListener('click', function() {
		                     map.setZoom(20);
		                     map.setCenter(marker.getPosition());
		                     callStoreInfo(map, marker, dong, storename);
		                  });
		                  marker.setMap(map);
		               }
		               function callHouseDealInfo(map, marker, aptName){
		                  let infowindow = new google.maps.InfoWindow();
		                  let content;
		                  $.ajax({
		                     url: "${root}/map/deal",
		                     type: "get",
		                     data: {"aptName": aptName},
			     								contentType: 'application/json;charset=utf-8',
			    								dataType: 'json',
		                     error: function(xhr, status, message){
		                        alert(error);
		                     },
		                     success: function(result){
		                        content = result["dealAmount"]+"만원";
		                        infowindow.setContent(content);
		                        infowindow.open(map, marker);
		                     }//function
		                  });//get
		               }
		               function callStoreInfo(map, marker, dong, storeName){
			                  let infowindow = new google.maps.InfoWindow();
			                  let content;
			                  $.ajax({
			                     url: "${root}/map/storename",
			                     type: "get",
			                     data: {"storeName": storeName},
			     								 contentType: 'application/json;charset=utf-8',
			    								 dataType: 'json',
			                     error: function(xhr, status, message){
			                        alert(error);
			                     },
			                     success: function(result){
			                        content = "건물명 : " +storeName+ " 주소 : " +result["roadname"];
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
					<c:import url="/WEB-INF/views/include/footer.jsp"/>
				</footer>
		</div>
</body>
</html>