<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 조회 | Hi-camper</title>

    <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<!-- CSS here -->
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
                                <h2>CAMPSITE</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
	
	 <input type="hidden" id="keyword" name="keyword">
	
	<!-- 본문 테이블 -->
  <div class="favourite-place place-padding">
     <div class="container">
     <form action="/camp/search" method="post">
    <div class="input-form" style="text-align: center;">
       <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" style="font-size:15px;">
       <input class="btn-small" type="submit" value="검색">  
    </div>
    </form>
    <br>
     
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">아영장명</th>
      <th scope="col">주소</th>
      <th scope="col">운영상태</th>
      <th scope="col">전화</th>
      <th scope="col">특징</th>
      <th scope="col">업종<th>
      <th scope="col">위치구분</th>
      <th scope="col">운영기간</th>
      <th scope="col">운영일</th>
      <th scope="col">개인트레일러동반여부</th>
      <th scope="col">개인카라반동반여부</th>
      <th scope="col">애완동물출입여부</th>
    </tr>
  </thead>
  <c:forEach var="d" items="${data}" varStatus="status">
  <tbody>
    <tr>
      <td>${d.facltNm}</td>
      <td>${d.addr1}</td>
      <td>${d.manageSttus}</td>
      <td>${d.tel}</td>
      <td>${d.featureNm}</td>
      <td>${d.induty}</td>
      <td>${d.lctCl}</td>
      <td>${d.operPdCl}</td>
      <td>${d.operDeCl}</td>
      <td>${d.trlerAcmpnyAt}</td>
      <td>${d.caravAcmpnyAt}</td>
      <td>${d.animalCmgCl}</td>
    </tr>
  </tbody>
  </c:forEach>
</table>
</div>
</div>
</main>


  <!-- Pagination-area Start -->
        <div class="pagination-area pb-100 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start">
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow roted left-arrow"></span></a></li>
                                   <li class="page-item active"><a class="page-link" href='/camp/search1'>01</a></li>
                                    <li class="page-item"><a class="page-link" href='/camp/search2'>02</a></li>
                                    <li class="page-item"><a class="page-link" href='/camp/search3'>03</a></li>
                                  <li class="page-item"><a class="page-link" href="search?pageNo=4"><span class="flaticon-arrow right-arrow"></span></a></li>
                                </ul>
                              </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pagination-area End -->
        
		<!-- footer & js -->
		<jsp:include page="../inc/footer.jsp" />
		<jsp:include page="../inc/js.jsp" />
</body>
</html>