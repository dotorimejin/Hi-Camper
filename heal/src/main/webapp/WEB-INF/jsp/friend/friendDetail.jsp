<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 프로필 보기 | HI-CAMPER</title>

	 	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
     <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- CSS -->
	<link type="text/css" rel="stylesheet" href="../css/juri.css">
		<jsp:include page="../inc/css.jsp" />
			 <!-- Google Font -->
	 <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
			
		  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
	
	<style>
	
			h1, h2, h3, h4, h5, h6, p, label{
	     font-family: 'Nanum Gothic', sans-serif; !important;
	    }
	    
		.portfolio{
		padding:6%;
		text-align:center;
	}
	.heading{
		background: #fff;
		padding: 1%;
		text-align: left;
		box-shadow: 0px 0px 4px 0px #545b62;
	}
	.heading img{
		width: 10%;
	}
	.bio-info{
		padding: 5%;
		background:#fff;
		box-shadow: 0px 0px 4px 0px #b0b3b7;
	}
	.name{
		font-family: 'Charmonman', cursive;
		font-weight:600;
	}
	.bio-image{
		text-align:center;
	}
	.bio-image img{
		border-radius:50%;
	}
	.bio-content{
		text-align:left;
	}
	.bio-content p{
		font-weight:600;
		font-size:30px;
	}

		h1, h2, h3, h4, h5, h6, p, label{
	     font-family: 'Nanum Gothic', sans-serif; !important;
	    } 
	    
	    	    .nick{
	    	background-color:#4169e1	;
	    	color: white;
	    }
	    

/* a-style */
a {color: #fff; text-decoration: none; outline: none}
a:hover, a:active {text-decoration: none; color:#fff; background-color:#f59000;}
	</style>
	
</head>
<body>
<!-- Header -->
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
		<div class="container-fluid portfolio " style=" height:50%; width:80%;">
				<div class="row">
					<div class="col-md-12">
						<div class="heading">				
							<img src="https://image.ibb.co/cbCMvA/logo.png" />
						</div>
					</div>	
				</div>
				<div class="bio-info">
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-12">
									<div class="bio-image" >
										<img src="/profile/${profile.fileName}" style="height: 300px; width: 300px;" alt="image" />
									</div>			
								</div>
							</div>	
						</div>
						<div class="col-md-6">
							<div class="bio-content">
								<h1  style="margin-top: 20%;"><span class="nick">${profile.nick } 님</span> </h1>
								<h4>
									<c:forTokens items="${profile.interest} " delims="," var="item">
										  <b># ${item}</b>
										</c:forTokens>
								</h4>
								<p>${profile.intro }</p>
							</div>
						</div>
						
						<span style="float: right; margin-left:95%;"><button  class="btn-primary" onclick="history.back()" ><i class="fas fa-arrow-circle-left fa-4x"></i></button></span>
				</div>
			</div>
		</div>
	</section>		
</body>
</html>