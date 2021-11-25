<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>404 HTML Template by Colorlib</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,700" rel="stylesheet">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="/error/style.css" />
</head>

<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404"></div>
					<c:if test="${not empty title}">
					<h1 >${title}</h1>
					</c:if>
					<c:if test="${not empty message}">
					<h2>${message}</h2>
					</c:if>
		<!--  <p style="color : black;"><b>오류가 발생하여 해당 작업을 실패하였습니다. <br>다시 시도해보시거나 관리자에게 문의해주세요.</b></p>	-->			
			<a href="/">홈으로 돌아가기</a>
		</div>
	</div>

</body>
</html>