<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>해피하우스</title>

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
					$.ajax({
						url:"${root}/map/apt",
						type:'GET',
						contentType: 'application/json;charset=utf-8',
						dataType: 'json',
						data: {dong:$("#dong").val()},
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
									$("tbody").append(str);
									//$("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
									geocode(data);
								});
						},
						error:function(xhr,status,msg){
							console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
						}
					});//change
				});//ready
		});
		function geocode(jsonData) {
			let idx = 0;
			initMap();
			$.each(jsonData, function(index, vo) {
				let tmpLat;
				let tmpLng;
				$.ajax({
					url:"https://maps.googleapis.com/maps/api/geocode/json",
					type:'GET',
					dataType: 'json',
					data: {
						key:'AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg', 
						address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
					},
					success: function(data, response){
						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						$("#lat_"+index).text(tmpLat);
						$("#lng_"+index).text(tmpLng);
						addMarker(tmpLat, tmpLng, vo.aptName);
					},
					error:function(xhr,status,msg){
						console.log("상태값 : " + xhr.status + " Http에러메시지 : "+xhr.responseText);
					}
				});
			});//each
		}
	</script>
</head>

<body>
  <div class="body__container">
    <!-- HEADER -->
    <header class="section">
    	<c:import url="include/header.jsp"/>
    </header>
	
    <!-- VISUAL -->
    <section class="section section--visual">
      <div class="inner">
        <div class="summary">
          <h2 class="summary__title">
            HAPPY&nbsp;HOUSE
          </h2>
          <p class="summary__description">
						행복한 우리집은 도대체 어디에..
          </p>
        </div>
        <form id="sign-form" method="GET" action="search.html">
          <ul>
            <li>
							<select id="sido">
								<option value="0">시/도</option>
							</select>
            </li>
            <li>
              <select id="gugun">
								<option value="0">구/군</option>
							</select>
            </li>
            <li>
							<select id="dong">
								<option value="0">선택</option>
							</select>
            </li>
          </ul>
        </form>
      </div>
    </section>
    <!-- FEATURE -->
    <section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 550px;">
				<div class="card-body">
				<table class="table mt-2" style="width: 70%; margin: 0 auto;">
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
					<tbody id="searchResult">
					</tbody>
				</table>

				<div id="map" style="width: 70%; height: 500px; margin: auto;"></div>
				<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTQIlxBn5AfKGvsfJiormAE1esN3fcCkg&callback=initMap"></script>
				<script>
				var multi = {lat: 37.5665734, lng: 126.978179};
	               var map;
	               function initMap() {
	                  map = new google.maps.Map(document.getElementById('map'), {
	                     center: multi, zoom: 12
	                  });
	               }
	               function addMarker(tmpLat, tmpLng, aptName) {
	                  var marker = new google.maps.Marker({
	                     position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
	                     label: aptName,
	                     title: aptName
	                  });
	                  marker.addListener('click', function() {
	                     map.setZoom(17);
	                     map.setCenter(marker.getPosition());
	                     callHouseDealInfo(map, marker, aptName);
	                  });
	                  marker.setMap(map);
	               }
	               function callHouseDealInfo(map, marker, aptName){
	                  console.log("called");
	                  let infowindow = new google.maps.InfoWindow();
	                  let content;
	                  $.ajax({
	                     url: "${pageContext.request.contextPath}/deal",
	                     type: "get",
	                     data: {"aptName": aptName},
	                     error: function(xhr, status, message){
	                        alert(error);
	                     },
	                     success: function(result){
	                        var obj = JSON.parse(result);
	                        content = obj["dealAmount"]+"만원";
	                        infowindow.setContent(content);
	                        infowindow.open(map, marker);
	                     }//function
	                  });//get
	               }
				</script>
				</div>
			</div>
		</section>
    <section class="section section--feature">
      <div class="tiles">
        <div class="inner">
          <ul class="clearfix">
            <li>
              <img src="${root}/resources/img/sideAD.jpg" alt="build" style="width: 100%" />
            </li>
            <li>
              <h3>주택 관련 기사</h3>
              <div class="separator"></div>
              <p>&lt;인사&gt; 신동아건설</p>
              <p>12.16 대책 후 '매수·매도자 모두 일단 관망세'</p>
              <p>구미시, 낙동강 변 국가3산단에 민간공원 조성</p>
              <p>'은행'과 '보험사'의 주택담보대출 조건, 어떻게 다를까?</p>
              <div class="separator"></div>
            </li>
            <li>
              <h3>오늘의 뉴스</h3>
              <div class="separator"></div>
              <ul>
                <li>
                  <a href="#">
                    KB국민은행, '디지털헌금바구니'출시
                  </a>
                </li>
                <li>
                  <a href="#">
                    존슨콘트롤즈, OpenBlue 공개 "135년 쌓아온 빌딩 전문성과 최첨단 기술 결합"
                  </a>
                </li>
                <li>
                  <a href="#">
                    산업통상자원부, 업종별 비대면·온라인 수출 기반 본격 가동
                  </a>
                </li>
                <li>
                  <a href="#">
                    장상인 대표, 제6회 INAK사회공헌대상 프레스클럽부문 '시민봉사대상'수상
                  </a>
                </li>
                <li>
                  <a href="#">
                    삼성전자, 한샘과 공동사업 강화 위한 업무협약 체결
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </section>
    <footer class="section">
    	<c:import url="/WEB-INF/views/include/footer.jsp" />
    </footer>
  </div>
</body>
</html>