<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>친구 찾기 | Hi-Camper</title>
	<!-- Bootstrap core JS-->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
      <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

		 <!-- Google Font -->
	 <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	

	<!-- CSS -->
		    	<!-- CSS -->
<jsp:include page="../inc/css.jsp" />

	
		<style>
	.card {
	    font-size: 1em;
	    overflow: hidden;
	    width : 300px;
	    height : 500px;
	    padding: 0;
	    border: none;
	    border-radius: .28571429rem;
	    box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
	}
	
	.card-block {
	    font-size: 1em;
	    position: relative;
	    margin: 0;
	    padding: 1em;
	    border: none;
	    border-top: 1px solid rgba(34, 36, 38, .1);
	    box-shadow: none;
	}
	
	.card-img-top {
	    display: block;
	    width: 100%;
	    height: auto;
	}
	
	.card-title {
	    font-size: 1.28571429em;
	    font-weight: 700;
	    line-height: 1.2857em;
	}
	
	.card-text {
	    clear: both;
	    margin-top: .5em;
	    color: rgba(0, 0, 0, .68);
	}
	
	.card-footer {
	    font-size: 1em;
	    position: static;
	    left: 0;
	    bottom:0;
	    max-width: 100%;
	    padding: .75em 1em;
	    color: rgba(0, 0, 0, .4);
	    border-top: 1px solid rgba(0, 0, 0, .05) !important;
	    background: #fff;
	}
	
	.card-inverse .btn {
	    border: 1px solid rgba(0, 0, 0, .05);
	}
	
	.profile {
	    position: absolute;
	    top: -12px;
	    display: inline-block;
	    overflow: hidden;
	    box-sizing: border-box;
	    width: 25px;
	    height: 25px;
	    margin: 0;
	    border: 1px solid #fff;
	    border-radius: 50%;
	}
	
	.profile-avatar {
	    display: block;
	    width: 100%;
	    height: 100%;
	    border-radius: 50%;
	}
	
	.profile-inline {
	    position: relative;
	    top: 0;
	    display: inline-block;
	}
	
	.profile-inline ~ .card-title {
	    display: inline-block;
	    margin-left: 4px;
	    vertical-align: top;
	}
	
	.text-bold {
	    font-weight: 700;
	}
	
	.meta {
	    font-size: 1em;
	    color: rgba(0, 0, 0, .4);
	}
	
	.meta a {
	    text-decoration: none;
	    color: rgba(0, 0, 0, .4);
	}
	
	.meta a:hover {
	    color: rgba(0, 0, 0, .87);
	}
	
	/* Tabs Card */
	.tab-card {
	  border:1px solid #eee;
	}
	
	.tab-card-header {
	  background:none;
	}
	/* Default mode */
	.tab-card-header > .nav-tabs {
	  border: none;
	  margin: 0px;
	}
	.tab-card-header > .nav-tabs > li {
	  margin-right: 2px;
	}
	.tab-card-header > .nav-tabs > li > a {
	  border: 0;
	  border-bottom:2px solid transparent;
	  margin-right: 0;
	  color: #737373;
	  padding: 2px 15px;
	}
	
	.tab-card-header > .nav-tabs > li > a.show {
	    border-bottom:2px solid #007bff;
	    color: #007bff;
	}
	.tab-card-header > .nav-tabs > li > a:hover {
	    color: #007bff;
	}
	
	.tab-card-header > .tab-content {
	  padding-bottom: 0;
	}
	
	.size{
		width: 300px; height: 300px;
		object-fit: cover;
		background-size : contain;
		display: block;
		
	}
	
	.last{
	 text-align: center;
	 margin-left: 15%;
	}
	
		h1, h2, h3, h4, h5, h6, p, label, a{
	     font-family: 'Nanum Gothic', sans-serif; !important;
	    }
	    
	    .nick{
	    	background-color:#4169e1	;
	    	color: white;
	    }
	
	    </style>
	    
	    <script type="text/javascript">
	    function addFriend() {
			var result = confirm("친구 추가 하시겠습니까?");
			
			if(result == true){
				$('#addForm').submit();
			}
		}
	    </script>
	    
</head>
<body>

<header>
     <div class="header-area">
          <div class="main-header ">
              <div class="header-top top-bg d-none d-lg-block">
                 <div class="container">
                  <div class="row justify-content-between align-items-center">
                      <div class="col-lg-8">
                          <div class="header-info-left">
                              <ul>                          
                                  <li>https://github.com/FinalpjTeam1/Final_PJ</li>
                              </ul>
                          </div>
                      </div>
                   </div>
                 </div>
              </div>
             <div class="header-bottom  header-sticky">
                  <div class="container">
                      <div class="row align-items-center">
                          <!-- Logo -->
                          <div class="col-xl-2 col-lg-2 col-md-1">
                              <div class="logo">
                                <a href="index.html"><img src="../assets/img/logo/logo.png" alt=""></a>
                              </div>
                          </div>
                          <div class="col-xl-10 col-lg-10 col-md-10">
                              <!-- Main-menu -->
                              <div class="main-menu f-right d-none d-lg-block">
                                  <nav>               
                                      <ul id="navigation">                                                                                                                                     
                                            <li><a href="../index.jsp">Home</a></li>
                                            <li><a href="#" onclick="return false;">Map</a>
                                                <ul class="submenu">
                                                    <li><a href="../trail/sidoMap">sidoMap</a></li>
                                                    <li><a href="../trail/trailMap">등산로</a></li>
                                                    <li><a href="../camp/list">캠핑장</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="/friend/friendHome">친구 찾기</a></li>
                                            <li><a href="/qnaboard/boardList"> Q & A </a></li>
                                            <li><a href="/review/list">리뷰 게시판</a></li>
                                            <li><a href="#" onclick="return false;"></a></li>
                                            <c:choose>
												<c:when test="${(empty memberId && empty grade) || empty dto}">
													<li><a href="/loginForm">Login</a></li>
													<li><a href="/member/joinPolicy">Join</a></li>
												</c:when>
												<c:when test="${(not empty memberId && not empty grade) || not empty dto}">
													<li><a href="/logout">Logout</a></li>
												</c:when>
											</c:choose>
                                       </ul>
                                  </nav>
                              </div>
                          </div>
                          <!-- Mobile Menu -->
                          <div class="col-12">
                              <div class="mobile_menu d-block d-lg-none"></div>
                          </div>
                      </div>
                  </div>
             </div>
          </div>
     </div>
      <!-- Header End -->
  </header>

	<section>
		<div class="container-fluid " style=" height:50%; width:80%; padding-bottom: 5%">
			
				<h2 class="center" style="margin-top:2%; margin-bottom: 10%; text-align: center; !important"><b>${id } 님에게 잘 어울릴 것 같은 친구를 추천해드릴게요</b><hr></h2>
				
				<!-- 프로필 컨텐츠가 없거나, 추천 친구가 없을 때  -->
				<c:if test="${ empty sameAge && empty sameInterest }">
				<h3 class ="center" style="margin-top: -5%">추천 친구를 보여드리기에는 아직 정보가 부족해요!  &#128546;<br> 프로필 작성을 하거나, 새로운 친구들이 프로필을 등록할 때까지 잠시만 기다려주세요. </h3>
				</c:if>
				
				
				<div class = "row" style="margin-top:-10%;">
						<!-- 추천 친구 있음 
						<c:if test="${!empty profile }">
						<h3  style="margin-top:-5%; margin-bottom: 5%; height:2%; text-align: center; !important">${id } 님에게 잘 어울릴 것 같은 친구로 하이캠퍼가 뽑아봤어요! &#128522; </h3>
						</c:if> -->
						<!-- 카드 콘텐츠 : 같은 연령대 추천-->				
						<c:if test="${!empty sameAge }">
							<c:forEach var="listAge" items="${sameAge}" varStatus="status"> 		
										<div class="col-sm-6 col-md-4 col-lg-3 mt-4 d-flex align-items-stretch"  >
								                <div class="card" style="height:500px !important">
								                	<div style="height:300px; width:300px;"> 
								                    <img class="card-img-top size" src="/profile/${listAge.fileName}" >
								                    </div>
								                    <div class="card-block" >
								                        <h3 class="nick">${listAge.nick}</h3>
								            <!--  <span style="float:right;"><button  type="button" class="btn btn-danger btn-circle "><i class="glyphicon glyphicon-heart"></i></button></span>--> 
								                        <div class="meta">
								                            <h5>연령대 : ${listAge.age}</h5>
								                          <h5> 
									                          <c:forTokens items="${profile.interest} " delims="," var="item">
																  <b># ${item}</b>
																</c:forTokens>
														</h5>
								                        </div>
								                        <div class="card-text">
															<h4>${listAge.intro}</h4>
								                        </div>
								                    </div>
								                     <div class="card-footer" >
								                        <small>마지막 접속: 2021-10-31</small>
								                        <button class="btn btn-secondary last btn-sm" onclick="addFriend()">친구 추가하기</button>
								                        
								                        <form action="/friend/addFriend" method="post" name="addForm" id="addForm">
								                        <input type="hidden" id="friend" name="friend" value="${listAge.id }">
								                        </form>
								                    </div>
								                </div>
								            </div> <!-- 카드 콘텐츠 끝 -->
									</c:forEach>     
								</c:if>	   
								
								<!-- 같은 관심사 추천 -->
								<c:if test="${!empty sameInterest }">
									<c:forEach var="listInterest" items="${sameInterest}" varStatus="status"> 		
												<div class="col-sm-6 col-md-4 col-lg-3 mt-4 d-flex align-items-stretch">
										                <div class="card">
										                    <img class="card-img-top size" src="/profile/${listInterest.fileName} ">
										                    <div class="card-block">
					
										                        <h3 class="nick">${listInterest.nick}</h3>
										            <!--  <span style="float:right;"><button  type="button" class="btn btn-danger btn-circle "><i class="glyphicon glyphicon-heart"></i></button></span>--> 
										                        <div class="meta">
										                           <h5>연령대 : ${listInterest.age} </h5>
										                            <h5>
											                            <c:forTokens items="${listInterest.interest} " delims="," var="item">
											  								<b># ${item}</b>
																		</c:forTokens>
																	</h5>
										                        </div>
										                        <div class="card-text">
																		<h4><b>${listInterest.intro}</b></h4>
																</div>
										                    </div>
										                     <div class="card-footer">
										                        <h5>마지막 접속: 2021-10-31</h5>
										                        <button class="btn btn-secondary btn-sm last" onclick="addFriend()">친구 추가하기</button>
										                        
										                        <form action="/friend/addFriend" method="post" name="addForm" id="addForm">
										                        <input type="hidden" id="friend" name="friend" value="${listInterest.id }">
										                        </form>
										                    </div>
										                </div>
										            </div> <!-- 카드 콘텐츠 끝 -->
											</c:forEach>     
									</c:if>
								<!-- 같은 관심사 추천 끝  -->
							</div>
						</div> <!-- row 끝 -->		
				<div style="margin-top: 5%"></div>
</section>	
</body>
</html>