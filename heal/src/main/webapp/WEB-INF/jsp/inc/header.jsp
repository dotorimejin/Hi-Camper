<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp" %>
<!DOCTYPE html>

	<!-- Preloader -->
   <div id="preloader-active">
      <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
               <div class="preloader-circle"></div>
               <div class="preloader-img pere-text">
                  <img src="../assets/img/logo/logo.png" alt="">
               </div>
            </div>
      </div>
   </div>
   
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
                                <a href="/"><img src="../assets/img/logo/logo.png" alt=""></a>
                              </div>
                          </div>
                          <div class="col-xl-10 col-lg-10 col-md-10">
                              <!-- Main-menu -->
                              <div class="main-menu f-right d-none d-lg-block">
                                  <nav>               
                                      <ul id="navigation">                                                                                                                                     
                                            <li><a href="/">Home</a></li>
                                            <li><a href="#" onclick="return false;">Map</a>
                                                <ul class="submenu">
                                                    <li><a href="../trail/sidoMap">sidoMap</a></li>
                                                    <li><a href="../trail/trailMap">등산로</a></li>
                                                    <li><a href="../camp/list">캠핑장</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="/friend/friendHome">친구 찾기</a></li>
                                            <li><a href="/qnaboard/boardList"> Q & A </a></li>
                                            <li><a href="/review/list">후기 게시판</a></li>
                                            <li><a href="#" onclick="return false;"></a></li>
                                            <c:choose>
												<c:when test="${sessionScope.login eq null}">
													<li><a href="/member/login">Login</a></li>
													<li><a href="/member/joinPolicy">Join</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="/member/info">내정보</a></li>
													<li><a href="/logout">Logout</a></li>
												</c:otherwise>
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