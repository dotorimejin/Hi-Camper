<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Hi-camper │ Trail </title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd05da10602829a175491ee97133a73a"></script>
	<script type="text/javascript" src="/js/trailMap.js"></script>
</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	
	<!-- slider Area Start-->
	     <div class="slider-area ">
	        <!-- Mobile Menu -->
	        <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
	            <div class="container">
	                <div class="row">
	                    <div class="col-xl-12">
	                        <div class="hero-cap text-center">
	                            <h2>Trail</h2>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	     </div>
	     <!-- slider Area End-->
	<h3>지도 API 연결 테스트 성공!</h3>
	<div id="kakaomap" style="width:60%;height:700px;"></div>    
	
	<jsp:include page="../inc/footer.jsp" />
	<jsp:include page="../inc/js.jsp" />

</body>
</html>