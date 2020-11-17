<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>g_map6</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzGutk98vtVunDPtBcQhPibDuCKmFlw6M&callback=initMap"></script>
	<script>
		/////////////////// map 설정///////////////////
		var multi = {lat: 37.5665734, lng: 126.978179};
		var map;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center: multi, zoom: 12
			});
			var marker = new google.maps.Marker({position: multi, map: map});
		}
		function addMarker(tmpLat, tmpLng, aptName) {
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
				//label: aptName,
				title: aptName
			});
			marker.addListener('click', function() {
				map.setZoom(17);
				map.setCenter(marker.getPosition());
				//callHouseDealInfo();
			});
			marker.setMap(map);
		}
		function registerMap(dong) {
			$.get("https://maps.googleapis.com/maps/api/geocode/json"
					,{	key:'AIzaSyDzGutk98vtVunDPtBcQhPibDuCKmFlw6M'
						, address:dong
					}
					, function(data, status) {
						//alert(data.results[0].geometry.location.lat);
						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						map = new google.maps.Map(document.getElementById('map'), {
							center: {lat:parseFloat(tmpLat),lng:parseFloat(tmpLng)}, zoom: 16
						});
						addMarker(tmpLat, tmpLng, dong);
					}
					, "json"
			);//get
		}
		
		/////////////////// selector 설정	/////////////////
		let colorArr = ['table-primary','table-success','table-danger'];
		$(document).ready(function(){
			$.get("/map/sido"				
				,function(data, status){
					$.each(data, function(index, vo) {
						$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
					});//each
				}//function
				, "json"
			);//get
		});//ready
		$(document).ready(function(){
			$("#sido").change(function() {
				$.get("/map/gugun/"
						,{sido:$("#sido").val()}
						,function(data, status){
							$("#gugun").empty();
							$("#gugun").append('<option value="0">시/구/군</option>');
							$.each(data, function(index, vo) {
								$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
							});//each
						}//function
						, "json"
				);//get
			});//change
			$("#gugun").change(function() {
				$.get("/map/dong/"
						,{gugun:$("#gugun").val()}
						,function(data, status){
							$("#dong").empty();
							$("#dong").append('<option value="0">동</option>');
							$.each(data, function(index, vo) {
								$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
							});//each
						}//function
						, "json"
				);//get
			});//change
			
			//////////////// 거래정보 설정///////////////////////
			$("#dong").change(function() {
				registerMap($("#dong").val());
				var contents = $('#houseInfo');
				contents.empty();				//기존에 내용이 있으면 비우기
				$('<h3 class="title">거래 정보</h3><div class="separator-2">').appendTo(contents);
				$.get("/map/apt"
						,{dong:$("#dong").val()}
						,function(data, status){
							$.each(data, function(index, item) {
								var html='</div><h5>'+item.aptName+'</h5><hr>'
								html+='<div class="media margin-clear"><div class="media-body">'
								html+='<h6 class="media-heading">거래금액 :'+item.dealAmount+'만원</h6>'
								html+='<h6 class="media-heading">전용면적: '+item.area+'</h6>'
								html+='<p class="small margin-clear"><i class="fa fa-calendar pr-10"></i>'+item.dealYear+'.'+item.dealMonth+'.'+item.dealDay+'</p><hr>'
								$(html).appendTo(contents)
							});	// each
							console.log(data);
							geocode(data);
						}//function
						, "json"
				);//get
			});//change
		});//ready
		function geocode(jsonData) {
			let idx = 0;
			let flag = true;
			$.each(jsonData, function(index, vo) {
				let tmpLat = vo.lat;
				let tmpLng = vo.lng;
				/* if(flag && tmpLat!=null){
					map = new google.maps.Map(document.getElementById('map'), {
						center: {lat:parseFloat(tmpLat),lng:parseFloat(tmpLng)}, zoom: 16
					});
					flag = false;
				} */
				addMarker(tmpLat, tmpLng, vo.aptName);
			});//each
		}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/views/user/login.jsp"%>
	<div class="container">
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body" style="text-align: center">
					<!-- select start -->
					<div id="selectDiv" class="bg-secondary text-white m-2">
						<select id="sido">
							<option value="0">도/광역시</option>
						</select>
						<select id="gugun">
							<option value="0">시/구/군</option>
						</select>
						<select id="dong">
							<option value="0">동</option>
						</select>
					</div>
					<!-- container start -->
					<div class="container">
			          <div class="row">
			            <!-- main start -->
			            <!-- ================ -->
			            <div class="main col-lg-8 order-lg-2 ml-xl-auto">
			              <!-- page-title start -->
			              <!-- ================ -->
							<div class="row grid-space-10">
			              		<div  class='col-12 justify-content-center' id="map" style="width: 400px; height: 600px"></div>
			            	</div>
			            </div>
			            <!-- main end -->
			            <!-- sidebar start -->
			            <!-- ================ -->
			            <aside class="col-lg-3 order-lg-1">
			              <div class="sidebar">
			                <div class="block clearfix" id='houseInfo'>
			                  <h3 class="title">거래 정보</h3>
			                  <div class="separator-2"></div>
			                </div>
			              </div>
			            </aside>
			            <!-- sidebar end -->
			          </div>
			        </div>
				</div>
			</div>
		</section>
		<!-- section end -->
<!-- 		<footer class="col-ms-12 bg-dark rounded mt-1"></footer> -->
	</div>
	<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>
