<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<title>회원 탈퇴 | Hi-camper</title>
<!-- BEGIN: CSS Assets-->
<link rel="stylesheet" href="/css/join.css" />
<!-- END: CSS Assets-->
</head>
<script>
function check() {
	alert("탈퇴하시겠습니까?")
}
</script>
<!-- END: Head -->
<body class="login">
	<div class="container sm:px-10">
		<div class="block xl:grid grid-cols-2 gap-4">
			<!-- BEGIN: Register Info -->
			<div class="hidden xl:flex flex-col min-h-screen">
				<a href="" class="-intro-x flex items-center pt-5"> <img
					alt="Icewall Tailwind HTML Admin Template" class="w-6"
					src="../assets/img/logo/logo_footer.png"> <span class="text-white text-lg ml-3">
						Hi-camper
				</span>
				</a>
				<div class="my-auto">
					<img alt="Icewall Tailwind HTML Admin Template"
						class="-intro-x w-1/2 -mt-16" src="../assets/img/logo/logo_footer.png">
					<div
						class="-intro-x text-white font-medium text-4xl leading-tight mt-10">
						
					</div>
					<div
						class="-intro-x mt-5 text-lg text-white text-opacity-70 dark:text-gray-500"></div>
				</div>
			</div>
			<!-- END: Register Info -->
                                    
			<form class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0" style="margin-left: 20%" action="deleteDone" method="post">
			<div class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0">
				<div class="my-auto mx-auto xl:ml-20 bg-white dark:bg-dark-1 xl:bg-transparent px-5 sm:px-8 py-8 xl:p-0 rounded-md shadow-md xl:shadow-none w-full sm:w-3/4 lg:w-2/4 xl:w-auto">
					<h2
						class="intro-x font-bold text-2xl xl:text-3xl text-center xl:text-left">
						탈퇴하기</h2>
					<div class="intro-x mt-8">
						<div>
							<input type="text"
								class="intro-x login__input form-control py-3 px-4 border-gray-300 block" placeholder="아이디" id="id" name="id" required="required"> 
								<span class="error_id" id="idMsg" aria-live="assertive"></span>
						</div>
						<div>
							<input type="password" class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="비밀번호" id="pw" name="pw" required="required">
							<span class="error_pwd" id="pwMsg" aria-live="assertive"></span>
						</div>
						<div>
							<input type="password" class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="비밀번호 확인" id="pwChk" name="pwChk" onkeyup="javascript:confirmEvent(this);" required="required">
							<span class="error_confirm" id="pwConfirmMsg" aria-live="assertive"></span>
						</div>
						<div>
					</div>
					<div class="intro-x mt-5 xl:mt-8 text-center xl:text-left">
						<input type="submit" value="탈퇴하기" class="btn btn-primary py-3 px-4 w-full xl:w-32 xl:mr-3 align-top" onclick="check()">
						<button
							class="btn btn-outline-secondary py-3 px-4 w-full xl:w-32 mt-3 xl:mt-0 align-top" onclick="location.href='/'">취소</button>
					</div>
				</div>
			</div>
			</form>
			<!-- END: Register Form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
	<script src="/js/join.js"></script>
</body>

</html>