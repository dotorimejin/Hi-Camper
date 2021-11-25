<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Q&A │ Hi-camper</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">
	
	<jsp:include page="../inc/css.jsp" />
	<script>
		var qnaNo = '${detail.qnaNo}'; //게시글 번호
		
		$('[name=insertReplyBtn]').click(function(){ //댓글 등록 버튼 클릭시 
		    var insertData = $('[name=insertReplyForm]').serialize(); //insertReplyForm의 내용을 가져옴
		    insertReply(insertData); //insertReply 함수호출
		});
		 
		
		//댓글 목록 
		function replyList(){
		    $.ajax({
		        url : '/reply/replyList',
		        type : 'get',
		        data : {'qnaNo':qnaNo},
		        success : function(data){
		            var a =''; 
		            $.each(data, function(key, value){ 
		            		a += '<div class="comment-list">';
							a += '<div class="single-comment justify-content-between d-flex">';
							a += '<div class="user justify-content-between d-flex">';
							a += '<div class="desc">';
							a += '<p class="comment'+value.replyText +'">'+value.replyText+'</p>';
							a += '<div class="d-flex justify-content-between">';
							a += '<div class="d-flex align-items-center'+value.replyNo+'"><h5>'+value.id+'</h5><p class="date">'+${value.replyDate}+'</p>';						
							a += '<div class="reply-btn"><a class="btn-reply text-uppercase" onclick="update('+value.replyNo+',\''+value.replyText+'\');"> 수정 </a></div>';						
							a += '<div class="reply-btn"><a class="btn-reply text-uppercase" onclick="replyDelete('+value.replyNo+');"> 삭제 </a></div>';
							a += '</div></div></div></div></div></div>';
		            });
		            
		            $(".replyList").html(a);
		        }
		    });
		}
		 
		//댓글 등록
		function insertReply(insertData){
		    $.ajax({
		        url : '/reply/insertReply',
		        type : 'post',
		        data : insertData,
		        success : function(data){
		            if(data == 1) {
		                replyList(); //댓글 작성 후 댓글 목록 reload
		                $('[name=replyText]').val('');
		            }
		        }
		    });
		}
		 
		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		function update(replyNo, replyText){
		    var a ='';
		    
			a += '<div class="comment-list">';
			a += '<div class="single-comment justify-content-between d-flex">';
			a += '<div class="user justify-content-between d-flex">';
			a += '<div class="desc">';
			a += '<input type="text" class="form-group" name="replyText_'+replyNo+'" value="'+replyText+'"/>';
			a += '<div class="d-flex justify-content-between">';
			a += '<div class="d-flex align-items-center'+value.replyNo+'"><h5>'+value.id+'</h5><p class="date">'+${value.replyDate}+'</p>';						
			a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="updateReply('+replyNo+');">수정</button> </span>';
			a += '</div></div></div></div></div></div>';
		    
		    $('.replyReplyText'+replyNo).html(a);
		    
		}
		 
		//댓글 수정
		function updateReply(replyNo){
		    var updatereplyText = $('[name=replyText_'+replyNo+']').val();
		    
		    $.ajax({
		        url : '/reply/updateReply',
		        type : 'post',
		        data : {'replyText' : updateReplyText, 'replyNo' : replyNo},
		        success : function(data){
		            if(data == 1) replyList(qnaNo); //댓글 수정후 목록 출력 
		        }
		    });
		}
		 
		//댓글 삭제 
		function deleteReply(replyNo){
		    $.ajax({
		        url : '/reply/deleteReply/'+replyNo,
		        type : 'post',
		        success : function(data){
		            if(data == 1) replyList(qnaNo); //댓글 삭제후 목록 출력 
		        }
		    });
		}
		 
		 
		$(document).ready(function(){
		    replyList(); //페이지 로딩시 댓글 목록 출력 
		});
		
	</script>
</head>

<body>
   <jsp:include page="../inc/header.jsp" />
   <main>
   <!-- slider Area Start-->
   <div class="slider-area ">
      <!-- Mobile Menu -->
      <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/contact_hero.jpg">
          <div class="container">
              <div class="row">
                  <div class="col-xl-12">
                      <div class="hero-cap text-center">
                          <h2>Q & A</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
   </div>
   <!-- slider Area End-->
   <!--================ Q&A Area =================-->
   <section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="single-post">
				<div class="blog_details">
					<form action="/qnaboard/insertBoard" method="post">
						<h1>${detail.qnaTitle}</h1>
						<ul class="blog-info-link mt-3 mb-4">
							<li><i class="fa fa-user"></i>${detail.id}</li>
							<li><i class="far fa-clock"></i>${detail.qnaDate}</li>
						</ul>
						<p class="excert">${detail.qnaText}</p>
						<div class="reply-btn">
							<a href="/qnaboard/update/${detail.qnaNo}" class="btn-reply text-uppercase">수정</a>
							<a href="/qnaboard/delete/${detail.qnaNo}" onclick="return deleteBoard();"class="btn-reply text-uppercase">삭제</a>
						</div>
					</form>
				</div>
			</div>
			
			<div class="navigation-top">
				<div class="d-sm-flex justify-content-between text-center">
			    <!--<p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4 people like this</p>-->
					<div class="col-sm-4 text-center my-2 my-sm-0"></div>
					<ul class="social-icons">
						<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="#"><i class="fab fa-twitter"></i></a></li>
						<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
						<li><a href="#"><i class="fab fa-behance"></i></a></li>
					</ul>
			   </div>
			</div>
			
			<!-- qnaBoardReply -->
			<div class="comments-area">
			   <h4><i class="far fa-comment-dots"></i>${list.qnaReplyCnt} Comments</h4>
			   <div class="comment-list">
			        <form name="insertReplyForm">
			            <div class="input-group">
			               <input type="hidden" name="qnaNo" value="${detail.qnaNo}"/>
			               <input type="text" class="form-control" id="replyText" name="replyText" placeholder="내용을 입력하세요.">
			               <span class="input-group-btn">
			                    <button class="btn btn-default" type="button" name="insertReplyBtn">등록</button>
			               </span>
			            </div>
			        </form>
			   </div>
			</div>
			
			<div class="replyList"></div>
	      
		</div><!--container-->
	</section>
   <!--================ Q&A Area end =================-->
	</main>
	<jsp:include page="../inc/footer.jsp" />
	<jsp:include page="../inc/js.jsp" />
	
   
</body>
</html>