<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中车运力</title>
<link href="css/homenewlayout.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
</head>
<body class="home-layout">
	<header>
		<div class="nav-right mw-8">

			<div class="nav-right">
				<div class="unauthenticated">
					<a href="/Test1/login"> 登录 </a> <span> </span> <a
						href="/Test1/register"> 注册 </a>
				</div>
			</div>

			<ul class="nav nav-right">
				<li><a> 发帖 </a>
					<ul class="nav-list single">
						<li class="nav-list-item"><a href="/devtools"
							class="nav-link"> 开发工具 </a></li>
						<li class="nav-list-item"><a
							href="http://community.apicloud.com/bbs/forum.php"
							class="nav-link" target="_blank"> 在线社区 </a></li>
						<li class="nav-list-item"><a href="http://docs.apicloud.com/"
							class="nav-link" target="_blank"> 文档 </a></li>
						<li class="nav-list-item"><a
							href="http://docs.apicloud.com/APICloud/videos-and-codes"
							class="nav-link"> 教程视频 </a></li>
						<li class="nav-list-item"><a href="/cases" class="nav-link">
								案例 </a></li>
					</ul></li>
				<li><a href="/Test1/order"> 订单 </a></li>
				<li><a href="/Test1/index"> 首页 </a></li>
			</ul>
		</div>


		<div class="navbar-collapse collapse">
			<div class="nav nav-right">
				<form class="navbar-form" role="form" style="margin-top: 20px;">
					<div class="form-group">
						<input type="text" placeholder="搜索帖子" class="form-control"
							style="width: 300px;">
					</div>
					<button type="submit" class="btn btn-success">搜索</button>
				</form>
			</div>
		</div>


	</header>


	<br>
	<br>
	<br>
	<br>
	<br>

	<div align="center">
		<form action="/Test1/postFile" method="post"
			enctype="multipart/form-data">
			<input type="file" name="file" /> <input type="submit" value="提交" />
		</form>

	</div>
	<img src="photo/photoCreate.jsp?filename=1.jpg" />


	<div align="center">


		<input type="text" name="username" /> 
		<input type="password" name="password" />
		<button type="button" id="eamilBtn2" onclick="submitButton()">验证</button>
    </div>
	<!-- /.carousel -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		function submitButton() {
			$.ajax({
				url : "/Test1/jsonTest",
				type : "post",
				dataType : "json",
				data : {
					json1:"{id:"12323", username:"2313123"}"
				},
				success : function(responseText) {

					alert(responseText);
				},
				error : function() {
					alert("失败!");
				}
			});
		}
	</script>

</body>
</html>
