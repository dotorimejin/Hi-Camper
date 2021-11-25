<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- BEGIN: Head -->
<head>
<meta charset="utf-8">
<link href="img/logo.svg" rel="shortcut icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Icewall admin is super flexible, powerful, clean & modern responsive tailwind admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Icewall Admin Template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="LEFT4CODE">
<title>회원가입 페이지</title>
<!-- BEGIN: CSS Assets-->
<link rel="stylesheet" href="/css/join.css" />
<!-- END: CSS Assets-->
</head>
<!-- END: Head -->
<body class="login">
	<div class="container sm:px-10">
		<div class="block xl:grid grid-cols-2 gap-4">
			<!-- BEGIN: Register Info -->
			<div class="hidden xl:flex flex-col min-h-screen">
				<a href="" class="-intro-x flex items-center pt-5"> <img
					alt="Icewall Tailwind HTML Admin Template" class="w-6"
					src="../assets/img/logo/logo.png"> <span class="text-white text-lg ml-3">
						산타<span class="font-medium">클로스</span>
				</span>
				</a>
				<div class="my-auto">
					<img alt="Icewall Tailwind HTML Admin Template"
						class="-intro-x w-1/2 -mt-16" src="../assets/img/logo/logo.png">
					<div
						class="-intro-x text-white font-medium text-4xl leading-tight mt-10">
						 <br>
					</div>
					<div
						class="-intro-x mt-5 text-lg text-white text-opacity-70 dark:text-gray-500"> </div>
				</div>
			</div>
			<!-- END: Register Info -->
			<!-- BEGIN: Register Form -->
			
			<form class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0" style="margin-left: 20%" action="/member/join" method="post">
			<div class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0">
				<div class="my-auto mx-auto xl:ml-20 bg-white dark:bg-dark-1 xl:bg-transparent px-5 sm:px-8 py-8 xl:p-0 rounded-md shadow-md xl:shadow-none w-full sm:w-3/4 lg:w-2/4 xl:w-auto">
					<h2
						class="intro-x font-bold text-2xl xl:text-3xl text-center xl:text-left">
						Sign Up</h2>
					<div
						class="intro-x mt-2 text-gray-500 dark:text-gray-500 xl:hidden text-center">A
						few more clicks to sign in to your account. Manage all your
						e-commerce accounts in one place</div>
					<div class="intro-x mt-8">
						<div>
							<input type="text"
								class="intro-x login__input form-control py-3 px-4 border-gray-300 block" placeholder="아이디" id="id"  name="id" onkeyup="javascript:idEvent(this);" maxlength="14" required="required"> 
								<span class="error_id" id="idMsg" aria-live="assertive"></span>
						</div>
						<div>
							<input type="password" class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="비밀번호" id="pw" name="pw" onkeyup="javascript:pwdEvent(this);" required="required">
							<span class="error_pwd" id="pwMsg" aria-live="assertive"></span>
						</div>
						<div>
							<input type="password" class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="비밀번호확인" id="pwConfirm" onkeyup="javascript:confirmEvent(this);" required="required">
							<span class="error_confirm" id="pwConfirmMsg" aria-live="assertive"></span>
						</div>
						<div>
						<input type="text"	class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="닉네임" id="nick" name="nick" onkeyup="javascript:nameEvent(this);" required="required">
							<span class="error_name" id="nameMsg" aria-live="assertive"></span>
						</div>
						<div>
						<input type="text" class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="휴대폰번호" id="mobile" name="mobile" onkeyup="javascript:mobileEvent(this);" required="required">
							<span class="error_name" id="mobileMsg" aria-live="assertive"></span>
						</div>
						
						<select class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" name="gender" id="gender" >
							<option selected value="" >성별</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
						
							<select class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" name="age" id="age" >
							<option selected value="" >연령대</option>
							<option value="20대">20대</option>
							<option value="30대">30대</option>
							<option value="40대">40대</option>
							<option value="50대">50대</option>
						</select>
					</div>

					<div class="intro-x mt-5 xl:mt-8 text-center xl:text-left">
						<button
							class="btn btn-primary py-3 px-4 w-full xl:w-32 xl:mr-3 align-top" id="btn" onclick="checkForm()">가입하기</button>
						<button
							class="btn btn-outline-secondary py-3 px-4 w-full xl:w-32 mt-3 xl:mt-0 align-top" onclick="location.href='/'">취소</button>
					</div>
				</div>
			</div>
			</form>
			<!-- END: Register Form -->
		</div>
	</div>

	<script src="/js/join.js"></script>
</body>
</html>