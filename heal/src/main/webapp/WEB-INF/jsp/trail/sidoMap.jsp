<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Hi-camper │ sidoMap</title>
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
    
    <jsp:include page="../inc/css.jsp" />
    <link rel="stylesheet" href="/css/sidoMap.css" />
	
	
	<!-- sidomap js -->
	<script type="text/javascript" src="https://d3js.org/d3.v5.min.js"></script>
	<script type="text/javascript" src="/js/d3.js"></script>
	<script type="text/javascript" src="/js/sidoMap.js"></script>
</head>
	
<body>
	<jsp:include page="../inc/header.jsp" />
	
    	<!-- slider Area Start-->
     <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>등산로</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
     <!-- slider Area End-->
	<section class="blog_area single-post-area section-padding">
			<div class="container">
				<div id="sidomap"></div>
				<h3>Test 성공!</h3>
			</div>
			<div class="container">
				<h3>!</h3>
				<div id="trailmap"></div>
			</div>
			
	</section>        
    
    <jsp:include page="../inc/footer.jsp" />
	<jsp:include page="../inc/js.jsp" />

</body>
</html>