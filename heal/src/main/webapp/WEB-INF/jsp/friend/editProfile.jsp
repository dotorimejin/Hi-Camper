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
	
	<script type="text/javascript">
	
		//이미지 함수
		function setThumbnail(event, obj) { 
			
			pathpoint = obj.value.lastIndexOf('.');
			filepoint = obj.value.substring(pathpoint+1,obj.length);
			filetype = filepoint.toLowerCase();	
			
			if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' ) {
				// 정상적인 이미지 확장자 파일인 경우
				var reader = new FileReader(); 
				reader.onload = function(event) { 
					var img = document.createElement("img"); 
					img.setAttribute("src", event.target.result); 
					
					img.style.width="300";
					img.style.height="300";
					
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
			var intro = document.getElementById('intro').value;
		
			var count = 0; 
			var check = document.getElementsByName('interest'); 
			for (var i = 0; i < check.length; i++) {    // 관심분야 검사 
			  if (check[i].checked) { 
			    count = 1; 
			    break; 
			  } 
			} 
		
			if(formintro.length > 20){
				alert('[안내] 자기소개를 20자 이하로 입력해주세요');
				$('#intro').focus();
				return false ;
			}
			
			//(2) 관심사 
			if (count == 0) {  //관심분야 확인 
				  alert("[안내] 관심분야를 체크해 주세요"); 
				  return false; 
				} else{
					alert("유효성 검사끝!");
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

<!-- CSS -->
<jsp:include page="../inc/css.jsp" />
</head>
<body>

<section>
		<div class="container-fluid " style=" margin-top: 20%; height:50%; width:80%; ">
			<div class="page-wrapper bg-dark p-t-100 p-b-50">
			        <div class="wrapper wrapper--w900">   
			        
			        <!-- 폼 처음 -->
			        <form name = "EditForm" id="EditForm" action="/editProfile" method="post"  enctype="multipart/form-data" onsubmit="return formCheck();">
			            <div class="card card-6">
			                <div class="card-heading">
			                    <h2 class="title" >프로필 수정</h2>
			                </div>
			                <div class="card-body">
			                        <div class="form-row">
			                            <div class="name">자기소개</div>
			                            <div class="value">
			                                <input class="input--style-6" type="text" name="intro" id="intro" maxlength="30" value="${profile.intro }" required="required">
			                                <div class="label--desc">최대 20글자까지 작성해주세요.</div>
			                            </div> 
			                        </div>
			                        
			                        <div class="form-row">
			                            <div class="name">관심사</div>
			                            
				                        	 <div class="value" style="width:600px; height: 150px;">
												 <!-- 처음 -->
												<b>기존 선택하신 관심사 : ${profile.interest } </b><br><br>

												 
											  <label class="x-large side" ><input type="checkbox"  onclick="count_ck(this)" name="interest" value="캠핑">캠핑</label>
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
  												<div class="label--desc" style="padding-bottom: 50px;">최대 5개까지 선택 가능합니다.</div>		

											</div>			
			                        </div>
			                        <div class="form-row" >
			                            <div class="name">프로필 사진 등록</div>
			                            <div class="value">
			                                <div class="input-group js-input-file">
			                                    <input class="input-file" type="file" name="file" id="file"  accept="image/*" onchange="setThumbnail(event, this); " required>

			                                </div>
			                                <div class="label--desc">얼굴이 선명하게 나온 사진을 올려주세요. 파일의 최대 크기는 15mb입니다.</div>
			                            	<div id="image_container" >
			                            	<span><h5><b>기존 프로필 사진 </b></h5> </span><br>
			                            	<img alt=""  src="/profile/${profile.fileName} " style="max-height: 50%; max-height: 50%;">
			                            	</div>
			                            	
			                            </div>
			                        </div>
			                </div>
			                <div class="card-footer" >
			                    <button class="btn btn--radius-2 btn--blue-2" onclick="formCheck();" style="margin-left: 35%">등록하기</button>	                 
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