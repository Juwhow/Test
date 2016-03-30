<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中车运力</title>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

<script language="javascript">
	function register_info() {

		if (document.loginInformation.username.value == "") {
			alert("用户名不能为空！");
			document.loginInformation.username.focus();
			return false;
		}

		if (document.loginInformation.password.value == "") {
			alert("密码不能为空！");
			document.loginInformation.password.focus();
			return false;
		}
		if (document.loginInformation.password2.value == "") {
			alert("确认密码不能为空！");
			document.loginInformation.password2.focus();
			return false;
		}
		if (document.loginInformation.password2.value != document.loginInformation.password.value) {
			alert("确认密码与密码不相同！");
			document.loginInformation.password2.focus();
			return false;
		}
	}

	function loadRegister() {
		if ("${register}" == "userExists") {
			alert("用户名已存在！");
		}
	}
</script>
<link href="css/homenewlayout.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">


</head>
<body class="home-layout" onload="loadRegister()">
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
	<div align="center">
		<h2>注册</h2>
		<form action="/Test1/createUser" method="post" accept-charset="utf-8"
			name="loginInformation" onsubmit='return register_info()'>

			<div class="form-group">
				<input type="text" name="username" id="username"
					class="form-control" placeholder="用户名" tabindex="1"
					autocomplete="on" style="width: 250px" />
			</div>

			<div class="form-group">
				<input type="password" name="password" id="password"
					class="form-control" placeholder="密码" autocomplete="off"
					tabindex="2" style="width: 250px" />
			</div>

			<div class="form-group">
				<input type="password" name="password2" id="password2"
					class="form-control" placeholder="确认密码" autocomplete="off"
					tabindex="3" style="width: 250px" />
			</div>
			<div class="form-group">
				
				
					<input type="submit" name="commit" value="提交注册信息"
						class="btn btn-primary" id="signin_button" tabindex="4" />
				
			</div>
		</form>

	</div>
</body>
</html>
