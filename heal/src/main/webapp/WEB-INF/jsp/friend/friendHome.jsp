<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
       <meta http-equiv="x-ua-compatible" content="ie=edge">
		<link rel="shortcut icon" type="image/x-icon" href="../resources/assets/img/favicon.ico">

	
        
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
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

	
		<script>
	
		function profileDelete() {
		var cancel = confirm("[안내] 프로필을 삭제하시겠습니까?");
		
		if(cancel == true){		
			alert('[안내] 삭제 되었습니다.');
	    	$('#deleteForm').submit();
		}else{
			return false;
		}
	}

	</script>
	<!-- CSS -->
<jsp:include page="../inc/css.jsp" />
<link type="text/css" rel="stylesheet" href="/css/juri.css">
		<style>
		h1, h2, h3, h4, h5, h6, p, label{
	     font-family: 'Nanum Gothic', sans-serif; !important;
	    } 
	    
	    	    .nick{
	    	background-color:#4169e1	;
	    	color: white;
	    }
	    </style>
	    
</head>
<body>

   <header>
<jsp:include page="../inc/header.jsp" />
</header>

	<section>
		<div class="container-fluid " style=" margin-top:10%;  height:50%; width:80%; ">
			
			<!-- 내 프로필 부분 -->
			<div class = "row">
					<div class="col-md-3 center">
						<div id="card">
							 <!-- 프로필이 비어있을 때 -->
							  <c:if test="${empty profile}">
								  <img src="/img/none.png" alt="user" style="width:100%">
								  <br>
								  <h3 class="center"><b>이름없음</b></h3>
								  <p id="profile_title"></p>
								  <p></p>
								  <span class="tag"></span>
								  <p><a href="myProfile" id="profile_button">프로필 추가</a></p>
							</c:if>
							<c:if test="${!empty profile}">
							  <img src="/profile/${profile.fileName} " alt="user" style="width:100%">
								  <br>
								  <h3 class="center" style="margin-top: 5%;"><b class="nick">${profile.nick} / ${profile.age}</b></h3>
								  <h4 class="center" >
								  		<c:forTokens items="${profile.interest} " delims="," var="item">
										  <b># ${item}</b>
										</c:forTokens>
								  </h4>
								  <p>${profile.intro}</p>			
								  <p><a href="/friend/editProfile" id="profile_button">프로필 수정</a></p>
							   	<button type="button" class="btn btn-danger btn-block" onclick="profileDelete();">삭제하기</button>
							</c:if>
						</div>
  				</div>
  				 <form action="/deleteProfile" method="post" name="deleteForm" id="deleteForm">
  					<input type="hidden" id='id' name="id" value="${profile.id} ">  					
  				</form>
  			<!-- 내 프로필 부분 끝  -->	
  			
  				<div class="col-md-4 " style=" height:300px; " >
  				<h3 class="text-center"><b>친구 목록</b><hr></h3>
		  				
		  				<c:if test="${empty friendProfile }">
		  				<h5 class="center" style="margin-top:20%;">친구 추가한 내역이 없습니다.</h5>
		  				</c:if>
		  				
		  				<c:if test="${!empty friendProfile}">
				   			 <table class="table table-striped custab">
								    <thead>
									        <tr>
									            <th><h5>닉네임</h5></th>
									            <th><h5>연령대</h5></th>
									            <th class="text-center"><h5>관리</h5></th>
									        </tr>
								    </thead>
								<c:forEach var="list" items="${friendProfile}" varStatus="status"> 
								            <tr>
									                <td ><h5>${list.nick }</h5></td>
									                <td><h5>${list.age }</h5></td>
									                <td class="text-center">
										                <a class=' btn-info btn-xs' href="/friend/friendDetail?id=${list.id }"><span class="glyphicon glyphicon-zoom-in"></span>자세히</a> 
										                <a href="/friend/friendDelete?id=${list.id }" class=" btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>삭제</a>
									                </td>
								            </tr>
								   </c:forEach>
								   		<tr>
									                <td colspan="3" class="text-center">
									                <a href="/friend/friendList" id="profile_button"> 친구 전체 보기</a>      	
									                </td>
									  </tr>
							 </table>
						</c:if>	 
  				</div>
  					<div class="col-md-5 center"style=" height:30%;" >
			  					<h3 class="center" > <b>* 친구 찾기 안내 사항 *</b><hr></h3>
			  					<h5 class="center">1. 상대방에게 예의를 지켜주세요. </h5>
			  					<h5 class="center">2. 욕설 / 싸움 / 상대방을 불쾌하게 만드는 언행  등으로 <br> 잦은 신고 접수시 해당 서비스를 이용할 수 없습니다.</h5>
			  					<h5 class="center">3. 개인 정보, 사생활을 지나치게 묻거나 공개하는 것을 지양해주세요.</h5><hr>
			  					
			  				<div style=" cursor: pointer;" onclick="location.href='/friend/findFriend'">
			    				<div class="page"> 
								  <button class="fun-btn center" style="margin-top:-5%; width:300px; height:100px;"><h3><b style="color:white;">친구 찾기</b></h3></button>
								</div>				
			  				</div>	
  					</div>
  					
  		<!-- 		<div class="col-md-10 center" style="background-color: gray; width: 800px; height: 300px;" >
  					<div > 
  					<h2 class="center">채팅방 부분</h2>   					
  					</div>
  				</div> -->
			</div>
		</div>
		
				<div style="margin-top: 20%">
			</div>
	</section>
	
	<!-- footer & js -->
<jsp:include page="../inc/footer.jsp" />
<jsp:include page="../inc/js.jsp" />
</body>
</html>