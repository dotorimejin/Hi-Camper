<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>내 프로필 | Hi-Camper</title>
	<!-- Bootstrap core JS-->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
      <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- CSS -->
	 <link  rel="stylesheet" href="../css/profileForm.css" media="all">
	 
	 <!-- Google Font -->
	 <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
		<!-- CSS -->
<jsp:include page="../inc/css.jsp" />
	
		<script type="text/javascript">
	
		//이미지 함수
		function setThumbnail(event, obj) { 
			
			pathpoint = obj.value.lastIndexOf('.');
			filepoint = obj.value.substring(pathpoint+1,obj.length);
			filetype = filepoint.toLowerCase();	

			var div_height = 300;
			var div_width = 300;
			
			
			if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' ) {
				// 정상적인 이미지 확장자 파일인 경우
				var reader = new FileReader(); 
				reader.onload = function(event) { 
					
					var img = document.createElement("img"); 
					img.setAttribute("src", event.target.result); 
					
					var img_height = img.width;
					var img_width= img.height;
					
					img_height=div_height;
					img_width=div_width;
					
					document.querySelector("div#image_container").appendChild(img); 
					}; 
					reader.readAsDataURL(event.target.files[0]); 
			}else {
				alert('[안내] 이미지 파일 확장자만 업로드 가능합니다.');
				parentObj  = obj.parentNode
				node = parentObj.replaceChild(obj.cloneNode(true),obj);
				
			    $("#profile").val("");
				document.saveForm.file.select("profile"); //file name
				document.selection.clear();

				return false;
			}			
		}
		
		//이미지 함수 끝

		//체크박스 체크 
		function count_ck(obj) {
			
	    	var chkbox = document.getElementsByName("interest");
	    	var chkCnt  = 0; // 설정 끝
	    	
	    	for(var i=0;i<chkbox.length; i++){
	    		if(chkbox[i].checked){
	    			chkCnt++;
	    		}
	    	}
	    	if(chkCnt>5){
	    		alert("[안내] 최대 5개까지만 선택할 수 있습니다.");
	    		obj.checked = false;
	    		return false;
	    	}
		}

		//폼  체크 
		function formCheck() {
			
			//(1) 자기소개 
			var intro = document.getElementById("intro").value;
			
			if(intro.trim() == ""){
				alert('[안내] 자기소개를 입력해주세요');
				$('#intro').focus();			
				return false ;
			} 
			
			if(intro.length > 20){
				alert('[안내] 자기소개를 20자 이하로 입력해주세요');
				$('#intro').focus();
				return false;
			}
			
		}
		
	</script>
	
	<style>
		h1, h2, h3, h4, h5, h6, p, label{
	     font-family: 'Nanum Gothic', sans-serif; !important;
	    }
	    
	    .x-large{
	    font-size: medium;
	   }
	    
	    .side{
	     margin-left:5%; margin-right:5%
	    }
	    .second{
	    	margin-left:5%; margin-right:5%
	    }
	    .image_container{
	    	height: 50px; width:100px;
	    }
	</style>	

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
		<div class="container-fluid " style=" height:50%; width:80%;" >
			<div class="page-wrapper bg-dark p-t-100 p-b-50"  >
			        <div class="wrapper wrapper--w900" >   
			        <!-- 폼 처음 -->
			        <form name = "profileForm" id="profileForm" action="/saveProfile" method="post"  enctype="multipart/form-data" >
			              <div class="card card-6">
			                <div class="card-heading">
			                    <h2 class="title" >프로필 작성</h2>
			                </div>
			                <div class="card-body">
			                        <div class="form-row">
			                            <div class="name">자기소개</div>
			                            <div class="value">
			                                <input class="input--style-6" type="text" name="intro" id="intro" maxlength="30" >
			                                <div class="label--desc">최대 20글자까지 작성해주세요.</div>
			                            </div> 
			                        </div>
			                        
			                        <div class="form-row">
			                            <div class="name">관심사</div>
				                        	 <div class="value" style="width:600px; height: 100px; margin-bottom: 5%;">
												 <!-- 처음 -->
											  <label class="x-large side" ><input type="checkbox" onclick="count_ck(this)" name="interest" value="캠핑">캠핑</label>
										      <label class="x-large side"><input type="checkbox" onclick="count_ck(this)" name="interest" value="등산"> 등산</label>
										      <label class="x-large side"><input type="checkbox" onclick="count_ck(this)" name="interest" value="차박"> 차박</label>
										      <label class="x-large side"><input type="checkbox" onclick="count_ck(this)" name="interest" value="캠핑카">캠핑카</label>
										      <label class="x-large side"><input type="checkbox"onclick="count_ck(this)"  name="interest" value="드라이브">드라이브</label>
										      
										      <label class="x-large " style="margin-left:2.3%" ><input type="checkbox" onclick="count_ck(this)"name="interest" value="여행">여행</label>
											  <label class="x-large second"  ><input type="checkbox" onclick="count_ck(this)" name="interest" value="사진">사진</label>
											  <label class="x-large second" ><input type="checkbox" onclick="count_ck(this)" name="interest" value="영상">영상</label>
											  <label class="x-large second" style="margin-left:3.7%"><input type="checkbox" onclick="count_ck(this)" name="interest" value="친구구함">친구구함</label>
  									    	 <label class="x-large side" style="margin-left:4%"><input type="checkbox" onclick="count_ck(this)" name="interest" value="맛집">맛집</label>
										      <label class="x-large side"style="margin-left:2.5%"><input type="checkbox" onclick="count_ck(this)" name="interest" value="반려동물과함께">반려동물과함께</label>		
  												<!-- 끝 -->
  												<div class="label--desc" >최대 5개까지 선택 가능합니다.</div>		

											</div>			
			                        </div>
			                        <div class="form-row"  style="margin-top: 2%;">
			                            <div class="name">프로필 사진 등록</div>
			                            <div class="value">
			                                <div class="input-group js-input-file">
			                                    <input class="input-file" type="file" name="file" id="file"  accept="image/*" onchange="setThumbnail(event, this); " required>

			                                </div>
			                                <div class="label--desc">얼굴이 선명하게 나온 사진을 올려주세요. 파일의 최대 크기는 15mb입니다.</div>
			                           		 	<div id="image_container" ></div>   	
			                         	   </div>
			                        </div>
			                </div>
			                <div class="card-footer">
			                    <button class="btn btn--radius-2 btn--blue-2" onclick="formCheck();" style="margin-left: 40%">등록하기</button>	                 
			                </div>
			            </div>
			            </form>
			            <!-- 폼 마지막 -->
			        </div>
			    </div>
		</div>
</section>	
</body>
</html>