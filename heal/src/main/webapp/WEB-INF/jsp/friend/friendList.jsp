<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
      <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- CSS -->

	<jsp:include page="../inc/css.jsp" />
	<link type="text/css" rel="stylesheet" href="../css/juri.css">
	
	<script>
	
		function profileDelete() {
		var cancel = confirm("[안내] 친구를 삭제하시겠습니까?");
		
		if(cancel == true){		
			alert('[안내] 삭제 되었습니다.');
	    	$('#deleteForm').submit();
		}else{
			return false;
		}
	}

	</script>
	
	
	<style type="text/css">
		
	h5 {
	    font-size: 1.28571429em;
	    font-weight: 700;
	    line-height: 1.2857em;
	    margin: 0;
	}
	
	.card {
	    font-size: 1em;
	    overflow: hidden;
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
	    top: 0;
	    left: 0;
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
	
			h1, h2, h3, h4, h5, h6, p, label, a{
	     font-family: 'Nanum Gothic', sans-serif; !important;
	    }
	    
	    	    .nick{
	    	background-color:#4169e1	;
	    	color: white;
	    }
	    
	
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
		<div class="container-fluid " style=" height:50%; width:80%; border : 1px solid black;">
				<div class="row">
<c:forEach var="list" items="${profile}" varStatus="status"> 
		
					<!-- 카드 콘텐츠 -->
					<div class="col-sm-6 col-md-4 col-lg-3 mt-4">
			                <div class="card">
			                    <img class="card-img-top" src="/profile/${list.fileName} ">
			                    <div class="card-block">
			                        <h3 class="nick">${list.nick}</h3>
			            <!--  <span style="float:right;"><button  type="button" class="btn btn-danger btn-circle "><i class="glyphicon glyphicon-heart"></i></button></span>--> 
			                        <div class="meta">
			                            <h5>연령대 : ${list.age}</h5>
								       <h5> 관심사 : ${list.interest}</h5>
			                        </div>
			                        <div class="card-text">
										<h4>${list.intro}</h4>
			                        </div>
			                    </div>
			                     <div class="card-footer">
			                        <small>Last updated 3 mins ago</small>
			                        <p><a href="/friend/friendDetail?id=${list.id }" id="profile_button">프로필 자세히</a></p>	                       
			                      <button type="button" class="btn btn-danger btn-block" onclick="profileDelete();">삭제하기</button>
			                      </div>
			                </div>
			            </div>
			            <!-- 카드 콘텐츠 끝 -->
			             <form action="/deleteProfile" method="post" name="deleteForm" id="deleteForm">
  							<input type="hidden" id='id' name="id" value="${list.id} ">  					
  						</form>
</c:forEach>			            
				</div>
				
				<!-- 페이징 -->
				<div class="pagination" style="margin-left: 35%">
					  <a href="#">&laquo;</a>
					  <a href="#">1</a>
					  <a href="#" class="active">2</a>
					  <a href="#">3</a>
					  <a href="#">4</a>
					  <a href="#">5</a>
					  <a href="#">6</a>
					  <a href="#">&raquo;</a>
					</div>
			</div>
			<div style="margin-top: 20%">
			</div>
	</section>		
			
</body>
</html>