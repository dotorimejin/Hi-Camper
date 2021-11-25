<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>친구 찾기 | Hi-Camper</title>
	<!-- Bootstrap core JS-->
      <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	
	<!-- CSS -->
	<link type="text/css" rel="stylesheet" href="../css/juri.css">

</head>
<body>

	<section>
		<div class="container-fluid " style=" margin-top: 20%; height:50%; width:80%; border : 1px solid black;">
			
			<div class = "row">
				<div class="col-md-3 center">
					<div id="card">
						  <img src="https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et.jpg" alt="user" style="width:100%">
						  <br>
						  <h3 class="center"><b>사용자 닉네임</b></h3>
						  <p id="profile_title">안녕하세요 혼캠핑 자주 가는 20대 여자입니다~!</p>
						  <p>연령대 : 20대</p>
						  <p><a href="myProfile" id="profile_button">프로필 수정</a></p>
					</div>			
  				</div>
  				
  				<div class="col-md-4 " style="border : 1px solid black;">
  				<h3 class="text-center"><b>친구 목록</b></h3>
		   			 <table class="table table-striped custab">
						    <thead>
							        <tr>
							            <th>닉네임</th>
							            <th>연령대</th>
							            <th class="text-center">Action</th>
							        </tr>
						    </thead>
						            <tr>
							                <td>News</td>
							                <td>News Cate</td>
							                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-zoom-in"></span>자세히</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>삭제</a></td>
						            </tr>
						            <tr>
							                <td>Products</td>
							                <td>Main Products</td>
							                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-zoom-in"></span>자세히</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>삭제</a></td>
						            </tr>
						            <tr>
							                <td>Blogs</td>
							                <td>Parent Blogs</td>
							                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-zoom-in"></span>자세히</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>삭제</a></td>
						            </tr>
						            
										<tr>
							                <td colspan="3" class="text-center">
							                <a href="friendList" type="button"  class="btn" id="profile_button">더보기</a>
							                	
							                </td>
							           </tr>
						    </table>
  				</div>
  				
  				<div class="col-md-3 center" style=" cursor: pointer; border:1px solid red;" onclick="location.href='www.naver.com'">
    			<div class="page">
					
					  <button class="fun-btn">친구 찾기</button>
						
					</div>				
  				</div>
  				
  				<div class="col-md-7 center" >
  					<div style="background-color: gray; width: 800px; height: 300px;"> 
  					<h2 class="center">채팅방 부분</h2>   					
  					</div>
  				</div>
			</div>
			
		</div>
	</section>
</body>
</html>