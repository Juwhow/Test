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


<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->


<script language="javascript">
	function login_info() {

		if (document.loginInformation.email.value == "") {
			alert("邮箱不能为空！");
			document.loginInformation.email.focus();
			return false;
		}

		if (document.loginInformation.password.value == "") {
			alert("密码不能为空！");
			document.loginInformation.password.focus();
			return false;
		}

	}

	function reloadCode() {
		var time = new Date().getTime();
		document.getElementById("imagecode").src = "/Test1/createCode?d="
				+ time;
	}

	function window_onload() {

		if ("${login}" == "noActivateMail") {
			alert("邮箱未激活！");
		}

		if ("${login}" == "noEmail") {
			alert("邮箱不存在！");
		}

		if ("${login}" == "wrongPassword") {
			alert("密码错误！");
		}

		if ("${login}" == "noLogin") {
			alert("用户未登录，请先登录！");
		}

	}
</script>
</head>

<body class="home-layout" onload="window_onload()">

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

	<div class="container" id="page" align="center">



		<h2>登录</h2>
		<form action="/Test1/checkUser" name="loginInformation"
			accept-charset="UTF-8" method="post" onsubmit='return login_info()'>
			<div class="form-group">
				<input type="email" class="form-control" name="email" id="email"
					placeholder="邮箱" tabindex="1" autocomplete="on"
					style="width: 250px" />
			</div>



			<div class="form-group">


				<input type="password" class="form-control" name="password"
					id="password" class="text-field" placeholder="密码"
					autocomplete="off" tabindex="2" style="width: 250px" />

			</div>

			<div class="form-group">
				<input type="submit" class="btn btn-default" name="commit"
					value="登录" tabindex="4" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">忘记密码?</a>
			</div>


		</form>

		<div class="account-extras">
			<p>
				注册一个新用户? <a href="/Test1/register">注册</a> <br>
			</p>
		</div>

	</div>

</body>
</html>
