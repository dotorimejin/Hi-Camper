<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Q&A │ Hi-camper</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
	  
	<jsp:include page="../inc/css.jsp" />
	
</head>

<body>
    <jsp:include page="../inc/header.jsp" />
    
  	<main>
	     <!-- slider Area Start-->
	     <div class="slider-area ">
	        <!-- Mobile Menu -->
	        <div class="single-slider slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
	            <div class="container">
	                <div class="row">
	                    <div class="col-xl-12">
	                        <div class="hero-cap text-center">
	                            <h2>Q & A</h2>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	     </div>
	     <!-- slider Area End-->
	    <!-- List Places Start -->
	    <!--================ Section Area =================-->
	    <section class="blog_area single-post-area section-padding">
	    	<div class="container box_1170 border-top-generic">
		      	<div class="row">
		            <div class="col-xl-12">
		                <!-- form 
		                 <form action="#" method="post" class="search-box">
					        <div class="input-form mb-30">
					            <input type="text" name="keyword" placeholder="Search" tabindex="0">
					        </div>
					        <div class="select-form mb-30">
					            <div class="select-itms">
					                <select name="select" id="select1" tabindex="0" style="display: none;">
					                    <option value="">Choose</option>
					                    <option value="">Title</option>
					                    <option value="">ID</option>
					                </select>
					                <div class="nice-select" tabindex="0">
					                	<span class="current">When</span>
					                	<ul class="list">
					                		<li data-value="" class="option selected">When</li>
					                		<li data-value="" class="option">Title</li>
					                		<li data-value="" class="option">ID</li>
					                	</ul>
					                </div>
					            </div>
					        </div>
					        <div class="search-form mb-30">
					            <a href="#" tabindex="0">SEARCH</a>
					        </div>	
					    </form>
					    <a href="/qnaboard/insert"><button type="button" class="button button-contactForm btn_1 boxed-btn">글 쓰기</button></a>
		            </div>
		        </div>
	    	</div>
	    </section>-->
	   <a href="/qnaboard/insert"><button type="button" class="button button-contactForm btn_1 boxed-btn">글 쓰기</button></a>
	   <!--================ Section Area end =================-->
        <div class="favourite-place place-padding">
            <div class="container">
                <div class="row">
                	<c:choose>
                		<c:when test="${empty list}" >
                			<section class="sample-text-area">
								<div class="container box_1170">
									<h3 class="text-heading">Text Sample</h3>
									<p class="sample-text">
										<b>데이터가 없습니다.</b> 
									</p>
								</div>
							</section>
                		</c:when> 
                		<c:when test="${!empty list}">
                			<c:forEach var="list" items="${list}">
			                    <div class="col-xl-4 col-lg-4 col-md-6">
			                        <div class="single-place mb-30">
			                            <div class="place-img">
			                                <img src="../assets/img/service/services1.jpg" alt="">
			                            </div>
			                            <div class="place-cap">
			                                <div class="place-cap-top">
			                                    <h3><a onclick="location.href='/qnaboard/boardDetail/${list.qnaNo}'">
			                                    		<c:out value="${list.qnaTitle}"/></a></h3>
			                                    <p class="dolor"><i class="far fa-clock"></i><c:out value="${list.qnaDate}"/></p>
			                                </div>
			                                <div class="place-cap-bottom">
			                                    <ul>
			                                    	<li><i class="far fa-eye"></i><c:out value="${list.qnaViewCnt}"/></li>
			                                    </ul>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </c:forEach>
		                </c:when> 
	                 </c:choose>
	                 
                </div>
            </div>
        </div>
        <!-- List Places End -->
	</main>        
    <jsp:include page="../inc/footer.jsp" />
	<jsp:include page="../inc/js.jsp" />

</body>
</html>