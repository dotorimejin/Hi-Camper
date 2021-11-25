<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- BEGIN: Head -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Icewall admin is super flexible, powerful, clean & modern responsive tailwind admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Icewall Admin Template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="LEFT4CODE">
<title>로그인</title>
<!-- BEGIN: CSS Assets-->
<link rel="stylesheet" href="/css/app.css" />
<!-- END: CSS Assets-->
</head>
<!-- END: Head -->

<body class="login">
	<div class="container sm:px-10">
		<div class="block xl:grid grid-cols-2 gap-4">
			<!-- BEGIN: Login Info -->
			<div class="hidden xl:flex flex-col min-h-screen">
				<a href="/" class="-intro-x flex items-center pt-5"> <img
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
						class="-intro-x mt-5 text-lg text-white text-opacity-70 dark:text-gray-500"></div>
				</div>
			</div>
			<!-- END: Login Info -->
			<!-- BEGIN: Login Form -->
			<form action="/member/userLogin" name="loginForm" id="loginForm"  method="post"
				class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0">
				<div class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0">
					<div
						class="my-auto mx-auto xl:ml-20 bg-white dark:bg-dark-1 xl:bg-transparent px-5 sm:px-8 py-8 xl:p-0 rounded-md shadow-md xl:shadow-none w-full sm:w-3/4 lg:w-2/4 xl:w-auto">
						<h2
							class="intro-x font-bold text-2xl xl:text-3xl text-center xl:text-left">
							로그인</h2>
						<div class="intro-x mt-2 text-gray-500 xl:hidden text-center">
							--소개글 --?</div>
						<div class="intro-x mt-8">
							<input type="text"
								class="intro-x login__input form-control py-3 px-4 border-gray-300 block"
								name="id" placeholder="아이디"> <input
								type="password"
								class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4"
								name="pw" placeholder="비밀번호">
						</div>
						<div
							class="intro-x flex text-gray-700 dark:text-gray-600 text-xs sm:text-sm mt-4">
							<div class="flex items-center mr-auto">
								<input id="remember-me" type="checkbox"
									class="form-check-input border mr-2"> <label
									class="cursor-pointer select-none" for="remember-me">
									로그인상태유지</label>
							</div>
							<a href="">비밀번호찾기</a>
						</div>
						<div class="intro-x mt-5 xl:mt-8 text-center xl:text-left">
							<button
								class="btn btn-primary py-3 px-4 w-full xl:w-32 xl:mr-3 align-top">로그인</button>
							<button
								class="btn btn-outline-secondary py-3 px-4 w-full xl:w-32 mt-3 xl:mt-0 align-top"
								onclick="location.href='/member/joinPolicy'">회원가입</button>
						</div>

					</div>
				</div>
			</form>
			<!-- END: Login Form -->
		</div>
	</div>

	<script src="/js/join.js"></script>
</body>
</html>