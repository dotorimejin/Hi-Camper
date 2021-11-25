<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>후기 게시판 | Hi-camper </title>
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- <link rel="manifest" href="site.webmanifest"> -->
   <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
   <!-- Place favicon.ico in the root directory -->
  
  <!-- CSS here -->
 <jsp:include page="../inc/css.jsp" />
  <style >
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

:root {
  --button-color: #ffffff;
  --button-bg-color: #0d6efd;
  --button-hover-bg-color: #025ce2;
}

button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  
  background: var(--button-bg-color);
  color: var(--button-color);
  
  margin: 0;
  padding: 0.5rem 1rem;
  
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  
  border: none;
  border-radius: 4px;
  
  display: inline-block;
  width: auto;
  
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  
  cursor: pointer;
  
  transition: 0.5s;
}

button.success {
  --button-bg-color: #28a745;
  --button-hover-bg-color: #218838;
}

button.error {
  --button-bg-color: #dc3545;
  --button-hover-bg-color: #c82333;
}

button.warning {
  --button-color: #212529;
  --button-bg-color: #ffc107;
  --button-hover-bg-color: #e0a800;
}

button:active,
button:hover,
button:focus {
  background: var(--button-hover-bg-color);
  outline: 0;
}
button:disabled {
  opacity: 0.5;
  
}

  </style>
  <script>
	function likeHeart() {
		document.getElementById("like_img").src = "../img/2589197.png";
	}
  </script>
  
   <script>
	function dislikeHeart() {
		document.getElementById("dislike_img").src = "../img/2589175.png";
	}
  </script>
  
	<!-- 삭제 여부 확인창 -->
	<script>
	function deleteConfirm() { 
		alert("삭제하면 복구되지 않습니다. 정말 삭제하시겠습니까?");
		alert("삭제되었습니다.");
	}
	</script>

	<script>
	function dislike() {
		location.replace("/review/dislike${dto.re_no}"); 
		}
	</script>
	
	<script>
	function like() {
		location.replace("/review/like${dto.re_no}"); 
		}
	</script>
	
	<!-- 카카오톡 공유 api -->
	<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
	  Kakao.init('26016e2c821266cce72f941b320eaea2'); // 초기화
	  var title = $('#title').val();
	  var url = $('#url').val();
	
  	function sendLink() { // 카카오톡 공유하기
		  
		  Kakao.Link.sendDefault({
	      objectType: 'text',
	      text: '${dto.re_title}',
	      link: {
	        mobileWebUrl: 'http://localhost:8070/review/detail?re_no=${dto.re_no}',
	        webUrl: 'http://localhost:8070/review/detail?re_no=${dto.re_no}'
	      },
	    })
	  }
	</script>
</head>

<body>
   
   <header>
    <jsp:include page="../inc/header.jsp" />
  </header>
  
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
   				<!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="../img/${dto.re_img}" alt="">
                  </div>
                  
                  <!-- 글번호 -->
                  <div class="blog_details">
                   	<input type="hidden" value="${dto.re_no}" id="url" name="url">
                  
                  <!-- 제목 -->
                     <h2>${dto.re_title}</h2>
                   
                  <!-- 작성자 -->  
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="fa fa-user"></i> ${dto.re_writer}</a></li>
                     </ul>
                     
                  <!-- 내용 -->
                    <p wrap=hard>${dto.re_content}</p>
               </div>
               
              	<!-- 좋아요 한 회원수 표시 -->
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> ${dto.re_like}
                         명이 이 글을 추천합니다!</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                    
                    <input type="hidden" value="${dto.re_no}" id="re_no" name="re_no">
                   	<input type="hidden" value="${dto.member_id}" id="member_id" name="member_id">
                   	
                   	<!--  좋아요  -->
					<div>
    					<a onclick="like();"><img src='../img/like.png' height="30px" width="30px" id='like_img'></a>
						&nbsp	
    					<a onclick="dislike();"><img src='../img/dislike.png' height="30px" width="30px" id='dislike_img'></a>
					
					</div>
										
				</div>	
				<hr>
				<br>	
				<!-- 목록으로 가기 -->
				<button class="success" onclick="location.href='/review/list'">목록으로 가기</button>	
                 
                <!-- 수정/삭제 --> 
                  <c:choose>
				  <c:when test="${(not empty id) || empty dto}">
				  <c:if test="${ id == dto.re_writer }">
                  <div style='float:right;'>
                  <button onclick="location.href='updateForm?re_no=${dto.re_no}'">수정</button>
                  <button class="warning" onclick="deleteConfirm(); location.href='delete?re_no=${dto.re_no}';">삭제</button>
                  </div>
                  </c:if>
                  </c:when>
                  </c:choose>
				</div>
				</div>
				</div>

            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                  <!-- 
                  <aside class="single_sidebar_widget popular_post_widget">
                     <h3 class="widget_title">좋아요 순</h3>
					<c:forEach var="review" items="${review}" varStatus="status">
                     <div class="media post_item">
                        <img src="../assets/img/post/post_1.png" alt="post">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>${review.re_title}</h3>
                           </a>
                           <p>January 12, 2019</p>
                        </div>
                     </div>
                     </c:forEach>
                  </aside>
                  <aside class="single_sidebar_widget tag_cloud_widget">
                     <h4 class="widget_title">Tag Clouds</h4>
                     <ul class="list">
                        <li>
                           <a href="#">project</a>
                        </li>
                        <li>
                           <a href="#">love</a>
                        </li>
                        <li>
                           <a href="#">technology</a>
                        </li>
                        <li>
                           <a href="#">travel</a>
                        </li>
                        <li>
                           <a href="#">restaurant</a>
                        </li>
                        <li>
                           <a href="#">life style</a>
                        </li>
                        <li>
                           <a href="#">design</a>
                        </li>
                        <li>
                           <a href="#">illustration</a>
                        </li>
                     </ul>
                  </aside>
                  <aside class="single_sidebar_widget instagram_feeds">
                     <h4 class="widget_title">Instagram Feeds</h4>
                     <ul class="instagram_row flex-wrap">
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="assets/img/post/post_5.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="assets/img/post/post_6.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="assets/img/post/post_7.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="assets/img/post/post_8.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="assets/img/post/post_9.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="assets/img/post/post_10.png" alt="">
                           </a>
                        </li>
                     </ul>
                  </aside>
                  -->
                  <aside class="single_sidebar_widget newsletter_widget">
                     <h4 class="widget_title">공유하기</h4>
                       <input type="hidden" value="${dto.re_title}" id="title" value="title">
                        <input type="hidden" value="${dto.re_no}" id="url" name="url">
                        <div class="d-flex">
                        <ol>
                           <li><a id="kakao-link-btn" href="javascript:sendLink()" style="color:black; font-size: 15px;"> 
                           <img src="../img/2111466.png" height="40px" width="40px"> 
                           &nbsp 카카오톡으로 공유하기</a></li>
                           <li><img src="../img/link.png" height="40px" width="40px"><a href="#" style="color:black" onclick="clip(); return false;">
                           &nbsp URL 주소 복사하기</a></li>
                        </ol>
                        </div>
                  </aside>
               </div>
            </div>
         </div>
      </div>
      
   </section>
   <!--================ Blog Area end =================-->

<!-- footer & js -->
<jsp:include page="../inc/footer.jsp" />
<jsp:include page="../inc/js.jsp" />

</body>

<script type="text/javascript">

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다."  +  url)
}

</script>
</html>