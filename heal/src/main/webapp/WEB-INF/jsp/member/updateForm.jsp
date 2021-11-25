<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html lang="en" class="light">
<!-- BEGIN: Head -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Icewall admin is super flexible, powerful, clean & modern responsive tailwind admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Icewall Admin Template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="LEFT4CODE">
<title>내 프로필보기</title>
<!-- BEGIN: CSS Assets-->
<jsp:include page="../inc/css.jsp" />
<link rel="stylesheet" href="/css/join.css" />
<!-- END: CSS Assets-->
</head>
<!-- END: Head -->
<body class="main">
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
	<!-- BEGIN: Content -->
	<div class="content">
		<div class="intro-y flex items-center mt-8">
			<h2 class="text-lg font-medium mr-auto">내 정보</h2>
		</div>
		<div class="grid grid-cols-12 gap-6">
			<!-- BEGIN: Profile Menu -->
			<div
				class="col-span-12 lg:col-span-4 2xl:col-span-3 flex lg:block flex-col-reverse">
				<div class="intro-y box mt-5">
					<div class="relative flex items-center p-5">
						<div class="w-12 h-12 image-fit">
							<img alt="Icewall Tailwind HTML Admin Template"
								class="rounded-full" src="/img/profile-3.jpg">
						</div>
						<div class="ml-4 mr-auto">
							<div class="font-medium text-base"></div>
						</div>
					</div>
					<div class="p-5 border-t border-gray-200 dark:border-dark-5">
						<a
							class="flex items-center text-theme-17 dark:text-gray-300 font-medium"
							href=""> <i data-feather="activity" class="w-4 h-4 mr-2"></i>
							내 정보
						</a> <a class="flex items-center mt-5" href="/member/changePassword">
							<i data-feather="lock" class="w-4 h-4 mr-2"></i> 비밀번호 변경하기
						</a> <a class="flex items-center mt-5" href=""> <i
							data-feather="box" class="w-4 h-4 mr-2"></i> -
						</a> <a class="flex items-center mt-5" href="/delete"> <i
							data-feather="settings" class="w-4 h-4 mr-2"></i> 회원탈퇴
						</a>
					</div>
				</div>
			</div>
			<!-- END: Profile Menu -->
			<div class="col-span-12 lg:col-span-8 2xl:col-span-9">
				<!-- BEGIN: Display Information -->
				<div class="intro-y box lg:mt-5">
					<div
						class="flex items-center p-5 border-b border-gray-200 dark:border-dark-5">
						<h2 class="font-medium text-base mr-auto">내 정보</h2>
					</div>
					<div class="p-5">
						<div class="flex flex-col-reverse xl:flex-row flex-col">
							<div class="flex-1 mt-6 xl:mt-0">
								<div class="grid grid-cols-12 gap-x-5">
									<div class="col-span-12 2xl:col-span-6">
										<div>
											<label for="update-profile-form-1" class="form-label">닉네임</label>
											<input id="update-profile-form-1" type="text"
												class="form-control" value="${login.nick}" disabled>
										</div>


									</div>
									<div class="col-span-12 2xl:col-span-6">

										<div class="mt-3">
											<label for="update-profile-form-4" class="form-label">휴대폰
												번호</label> <input id="update-profile-form-4" type="text"
												class="form-control" value="${login.mobile}">
										</div>
									</div>
									<div class="col-span-12">
										<div class="mt-3">
											<label for="update-profile-form-5" class="form-label">-</label>
											<textarea id="update-profile-form-5" class="form-control"
												placeholder="Adress"></textarea>
										</div>
									</div>
								</div>
								<button type="button" class="btn btn-primary w-20 mt-3">변경</button>
							</div>
							<div class="w-52 mx-auto xl:mr-0 xl:ml-6">

							</div>
						</div>
					</div>
				</div>
				<!-- END: Display Information -->

			</div>
		</div>
	</div>
	<!-- END: Content -->

	<!-- BEGIN: JS Assets-->
	<script
		src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script src="js/join.js"></script>
	<!-- END: JS Assets-->
	
	<!-- footer & js -->
<jsp:include page="../inc/footer.jsp" />
<jsp:include page="../inc/js.jsp" />
</body>
</html>