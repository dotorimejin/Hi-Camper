<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ģ�� ã�� | Hi-Camper</title>
	<!-- Bootstrap core JS-->
      <!-- �������� �ּ�ȭ�� �ֽ� CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- �ΰ����� �׸� -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">	
	<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
						  <h3 class="center"><b>����� �г���</b></h3>
						  <p id="profile_title">�ȳ��ϼ��� ȥķ�� ���� ���� 20�� �����Դϴ�~!</p>
						  <p>���ɴ� : 20��</p>
						  <p><a href="myProfile" id="profile_button">������ ����</a></p>
					</div>			
  				</div>
  				
  				<div class="col-md-4 " style="border : 1px solid black;">
  				<h3 class="text-center"><b>ģ�� ���</b></h3>
		   			 <table class="table table-striped custab">
						    <thead>
							        <tr>
							            <th>�г���</th>
							            <th>���ɴ�</th>
							            <th class="text-center">Action</th>
							        </tr>
						    </thead>
						            <tr>
							                <td>News</td>
							                <td>News Cate</td>
							                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-zoom-in"></span>�ڼ���</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>����</a></td>
						            </tr>
						            <tr>
							                <td>Products</td>
							                <td>Main Products</td>
							                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-zoom-in"></span>�ڼ���</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>����</a></td>
						            </tr>
						            <tr>
							                <td>Blogs</td>
							                <td>Parent Blogs</td>
							                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-zoom-in"></span>�ڼ���</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>����</a></td>
						            </tr>
						            
										<tr>
							                <td colspan="3" class="text-center">
							                <a href="friendList" type="button"  class="btn" id="profile_button">������</a>
							                	
							                </td>
							           </tr>
						    </table>
  				</div>
  				
  				<div class="col-md-3 center" style=" cursor: pointer; border:1px solid red;" onclick="location.href='www.naver.com'">
    			<div class="page">
					
					  <button class="fun-btn">ģ�� ã��</button>
						
					</div>				
  				</div>
  				
  				<div class="col-md-7 center" >
  					<div style="background-color: gray; width: 800px; height: 300px;"> 
  					<h2 class="center">ä�ù� �κ�</h2>   					
  					</div>
  				</div>
			</div>
			
		</div>
	</section>
</body>
</html>