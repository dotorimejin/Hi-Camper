<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">
<title>후기 게시판 | Hi-camper</title>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
		<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">

	<!-- CSS -->
	<jsp:include page="../inc/css.jsp" />

   </head>
   <body>
   
    <header>
      <jsp:include page="../inc/header.jsp" />
    </header>

    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="../assets/img/hero/contact_hero.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>후기 게시판</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>등산로, 캠핑장, 카라반 등의 후기를 남겨주세요.</span>
                            <h2>REVIEWS</h2>
                        </div>
                    </div>
                </div>
                <input type="checkbox"><a href="/review/list/like" style="color:black">좋아요 순으로 보기</a>
				<p>
                <div class="row">
                
                <!-- &memberId=${user.member_id} -->
				                
                 <c:forEach var="review" items="${review}" varStatus="status">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                	<!-- 별점 -->
                                    <span><i class="fas fa-star"></i><span>${review.re_star}</span> </span>
                                    
                                    <!-- 제목 -->
                                    <h3><a href="detail?re_no=${review.re_no}">${review.re_title}</a></h3>
                                    
                                    <!-- 작성자 -->
                                    <p>${review.re_writer}</p>
                                </div>
                                <div class="place-cap-bottom">
                                    
                                    <!-- 작성일 및 좋아요 -->
                                    <ul>
                                        <li><i class="far fa-clock"></i>${review.re_date}</li>
                                        <li><i class="ti-heart" style="color:red" aria-hidden="true"></i>${review.re_like}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </div>
                    
                <!-- 글쓰기 버튼 -->
				<div class="text-center">
				<a href="form"><button type="button" class="button boxed-btn">글쓰기</button></a>
				</div>
				</div>
                </div>
            	</div>
        <!-- Favourite Places End -->

    </main>
    
 	<!-- Footer & JS -->  
	<jsp:include page="../inc/footer.jsp" />
	<jsp:include page="../inc/js.jsp" />

    </body>
</html>