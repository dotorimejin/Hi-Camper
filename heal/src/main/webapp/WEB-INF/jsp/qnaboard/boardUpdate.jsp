<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hi-camper │ Q&A 수정</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
	
	<jsp:include page="../inc/css.jsp" />
	<jsp:include page="../inc/js.jsp" />
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script>
		<%-- textarea에 summernote 적용 --%>
		$(document).ready(function() {
			$('#qnaText').summernote({
				height: 400,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true
			});
		});
	</script>
</head>

<body>
   <jsp:include page="../inc/header.jsp" />
   
   <!-- slider Area Start-->
   <div class="slider-area ">
      <!-- Mobile Menu -->
      <div class="single-slider slider-height2 d-flex align-items-center" data-background="../assets/img/hero/contact_hero.jpg">
          <div class="container">
              <div class="row">
                  <div class="col-xl-12">
                      <div class="hero-cap text-center">
                          <h2>Q & A 수정</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
   </div>
   <!-- slider Area End-->
   <!--================ Form Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container">
      	<!-- <%=request.getRealPath("/")%> 실제 파일 저장 경로 알아보기 -->
	    <form action="/qnaboard/updateBoard" method="post">
	      <input type="hidden" name="qnaNo" value="${detail.qnaNo}"/>
	      <div class="form-group">
	        <label for="qnaTitle">제목</label>
	        <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요.">
	      </div>
	      	<input type="hidden" name="id" value="${id}"> <!--로그인 세션 id-->
	      <div class="form-group">
	        <label for="qnaText">내용</label>
	        <textarea class="form-control" id="qnaText" name="qnaText"></textarea>
	      </div>
	      <button type="submit" class="btn btn-primary">수정</button>
	    </form>
      </div>
   </section>
   
   
   <!--================ Form Area end =================-->

	<jsp:include page="../inc/footer.jsp" />
	<jsp:include page="../inc/js.jsp" />
</body>
</html>