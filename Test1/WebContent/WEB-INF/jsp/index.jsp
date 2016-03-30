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
				<li><a href="/Test1/index"> 首页 </a></li></ul>
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

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/1.jpg" alt="First slide" class="img-rounded">
				<div class="container">
					<div class="carousel-caption">
						<h1>第一页</h1>
						<p>第一页。</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#" role="button">Sign
								up today</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="images/2.jpg" alt="Second slide" class="img-rounded">
				<div class="container">
					<div class="carousel-caption">
						<h1>第二页</h1>
						<p>第二页。</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#" role="button">Learn
								more</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="images/3.jpg" alt="Third slide" class="img-rounded">
				<div class="container">
					<div class="carousel-caption">
						<h1>第三页</h1>
						<p>第三页。</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#" role="button">Browse
								gallery</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<!-- /.carousel -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>
