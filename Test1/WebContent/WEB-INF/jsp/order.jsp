<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中车运力</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/homenewlayout.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
</head>

<body class="home-layout">
	<header>
		<div class="nav-right mw-8">

			<div class="nav-right">
				<div class="unauthenticated">
					<a > ${username} </a> <span> </span> <a
						href="/Test1/index"> 退出 </a>
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
				<li><a> 订单 </a></li>
				<li><a href="/Test1/loginIndex"> 首页 </a></li></ul>
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
	<br><br><br><br>
	<h1 style="text-align: center">我的订单</h1>

	<ul class="nav nav-tabs">
		<li><a href="#order" data-toggle="tab">全部订单</a></li>
		<li><a href="#add_order" data-toggle="tab">添加订单</a></li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane active" id="order">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>物品名</th>
						<th>数量</th>
						<th>单价</th>
						<th>金额</th>
						<th>下单时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td>${order.getName()}</td>
							<td>${order.getNumber()}</td>
							<td>${order.getPrice()}</td>
							<td>${order.getTotal()}</td>
							<td>${order.getOrderTime()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="tab-pane" id="add_order">
			<div class="input-group input-group-lg">
				<form role="form" action="/Test1/addOrder" method="post"
					accept-charset="utf-8" onsubmit='return Check()'>
					<div class="form-group">
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<span class="input-group-addon">物品名</span> <input type="text"
									list="object_list" id="object_name" name="object_name"
									class="form-control" placeholder="选择相应物品"
									onChange="ShowPrice()" />
								<datalist id="object_list">
									<option label="clothes" value="衣服" />
									<option label="fruit" value="水果" />
									<option label="food" value="食物" />
								</datalist>
							</div>
							<div class="col-md-4"></div>
						</div>
					</div>
					<br />


					<div class="form-group">
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<span class="input-group-addon">数量</span> <input type="number"
									name="quantity" id="quantity" min="1" max="10"
									value="输入1到10间任意数字" class="form-control"
									placeholder="输入1到10间任意数字" />
							</div>
							<div class="col-md-4"></div>
						</div>
					</div>
					<br />

					<div class="form-group">
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<span class="input-group-addon">单价</span> <input id="price"
									name="price" class="form-control" readonly />
							</div>
							<div class="col-md-4"></div>
						</div>
					</div>
					<br />

					<div class="form-group">
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-4">
								<span class="input-group-addon">金额</span> <input id="sum"
									class="form-control" readonly />
							</div>
							<div class="col-md-4"></div>
						</div>
					</div>
					<br />


					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-6">
							<button type="submit" class="btn btn-default navbar-btn">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function Check() {
			if (document.getElementById('object_name').value == "") {
				alert("没有选择订单物品名");
				return false;
			} else if (document.getElementById('quantity').value == "") {
				alert("没有选择订单数量");
				return false;
			} else if (document.getElementById('quantity').value < 1
					|| document.getElementById

					('quantity').value > 10) {
				alert("订单数量只能为1~10");
				return false;
			} else {
				document.getElementById('sum').value = document.getElementById

				('price').value * document.getElementById('quantity').value;
				return validate();
			}
		}

		function ShowPrice() {
			if (document.getElementById('object_name').value == "衣服") {
				document.getElementById('price').value = 100;
				return true;
			} else if (document.getElementById('object_name').value == "水果") {
				document.getElementById('price').value = 50;
				return true;
			} else if (document.getElementById('object_name').value == "食物") {
				document.getElementById('price').value = 25;
				return true;
			}
		}

		function validate() {
			if (confirm("提交表单?")) {
				return true;
			} else
				return false;
		}
	</script>
</body>
</html>
