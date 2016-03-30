<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中车运力</title>
<link href="css/homenewlayout.css" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<style type="text/css">
body {
	width: 100%;
}

.top {
	width: 800px;
	height: 40px;
	margin: 0 auto;
	background-color: #598aba;
}

.top-txt {
	margin: auto;
}

.top-txt h1 {
	color: #ffffff;
	font-size: 14px;
	font-weight: normal;
	line-height: 36px;
	text-indent: 20px;
}

.mid {
	height: 650px;
	width: 800px;
	margin: 0 auto;
	font-family: "Hiragino Sans GB", "Microsoft Yahei", Arial, sans-serif;
	border: 1px solid #aaaaaa;
}

.midLeft {
	width: 70%;
	height: 630px;
	float: left;
	font-family: verdana, ​sans-serif;
	font-size: 13px;
	color: #555;
	line-height: 17px;
	padding: 10px;
	vertical-align: middle;
}

.leftTxt {
	float: left;
	width: 140px;
	text-align: right;
	margin-top: 5px;
}

input, input[type="text"] {
	height: 25px;
	width: 200px;
	line-height: normal;
	border-color: #949494 #a6a6a6 #a6a6a6;
	border-style: solid;
	border-radius: 3px;
	border-width: 1px;
	outline: 0 none;
	margin: auto 10px;
}

input[type="radio"] {
	height: 10px;
	width: 10px;
	margin: auto 10px;
	margin-top: 10px;
}

input.sex {
	margin: auto;
}

span.txt-imp {
	color: #c00;
	margin-right: 3px;
}

.nameLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.genderLine {
	height: 30px;
	padding-left: 140px;
	vertical-align: middle;
}

p.a-line {
	height: 25px;
	vertical-align: central;
}

span.txt-gender {
	height: 25px;
	vertical-align: central;
	margin: auto 10px;
}

.jobLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

select.job {
	height: 25px;
	width: 200px;
	line-height: normal;
	border-color: #949494 #a6a6a6 #a6a6a6;
	border-style: solid;
	border-radius: 3px;
	border-width: 1px;
	outline: 0 none;
	margin: auto 10px;
}

.IdLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.IdDayLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.phoneLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.phoneCheckSendLine {
	height: 30px;
	margin-left: 150px;
	margin-top: 10px;
}

button.phoneCheckSendBtn {
	width: 150px;
	height: 30px;
}

.phoneCheckInputLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.emailLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.drivingLine {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.drivingDay {
	height: 30px;
	margin-top: 10px;
	vertical-align: middle;
}

.checkCodeLine {
	height: 70px;
	vertical-align: middle;
}

.checkCodeLfetPart {
	margin-top: 20px;
	float: left;
}

.checkCodeImg {
	float: right;
	margin-top: 10px;
	margin-right: 70px;
}

.checkChangeLine {
	height: 20px;
	font-size: 10px;
}

.checkChangeLine a:link, a:visited {
	color: blue;
	text-decoration: none;
}

.checkChangeLine a:hover, a:active {
	color: #bc0808;
	text-decoration: underline;
}

.checkCodeChangeTxt {
	width: 110px;
	text-align: center;
	margin: auto;
	margin-right: 75px;
}

.userAttentionLine {
	height: 20px;
	margin-top: 10px;
}

.userAttention {
	font-size: 10px;
	margin-left: 150px;
	width: 350px;
	text-algin: left;
	vertical-align: middle;
}

.userAttentionLine a:link, a:visited {
	color: blue;
	text-decoration: none;
}

.userAttentionLine a:hover, a:active {
	color: #bc0808;
	text-decoration: underline;
}

.userAttentionLine input[type="checkbox"] {
	width: 15px;
	height: 15px;
	line-height: 14px;
	margin-left: 0;
	text-algin: left;
	vertical-align: middle;
}

.registSubmit {
	margin-top: 10px;
	margin-left: 140px;
	height: 30px;
}

.registSubmit input[type="submit"] {
	color: white;
	width: 100px;
	background-color: #60b54c;
	border: 1px solid #aaaaaa;
}

.midRight {
	width: 25%;
	height: 650px;
	float: right;
	top: 10px;
	vertical-align: central;
	text-align: center;
	border-left: 1px solid #aaaaaa;
	background-color: #e5e5e5;
}

.midRightImg {
	margin: auto;
	margin-top: 100px;
}

.bottom {
	font-family: Verdana;
	font-size: 12px;
	line-height: 20px;
	color: #848585;
	text-align: center;
}

.copyright {
	margin: 0 auto;
	padding: 0 auto;
	width: 700px;
	text-align: right;
}
</style>

<script>
	function reloadCode() {
		var time = new Date().getTime();
		document.getElementById("imagecode").src = "/Test1/createCode?d="
				+ time;
	}
</script>
</head>

<body>
	<header>


		<div class="nav-right mw-8">

			<div class="nav-right">
				<div class="unauthenticated">
					<a href="/Test1/login"> 登录 </a> <span> </span> <a href=""> 注册 </a>
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
	
	<div class="top">
		<div class="top-txt">
			<h1>欢迎注册中车互联用户账号！</h1>
		</div>
	</div>
	<section>
		<div class="mid">
			<div class="midLeft">
				<form action="/Test1/createUser" method="post"
					accept-charset="utf-8" onsubmit="">
					<div class="nameLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>名字
						</div>
						<input type="text" name="username" id="username"
							placeholder="请输入名字" />
					</div>

					<div class="genderLine">
						<span class="txt-gender">男</span><input type="radio" name="sex"
							id="man" value="male"> <span class="txt-gender">女</span><input
							type="radio" name="sex" id="woman" value="female">
					</div>


					<div class="jobLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>工作
						</div>
						<select class="job" name="job" id="job">
							<option value="司机">司机</option>
							<option value="快递员">快递员</option>
							<option value="其他">其他</option>
						</select>
					</div>

					<div class="IdLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>身份证号
						</div>
						<input type="text" name="user_id" id="user_id"
							placeholder="请输入身份证号" />
					</div>

					<div class="IdDayLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>身份证到期日期
						</div>
						<input type="text" name="user_id_day" id="user_id_day"
							placeholder="请输入身份证号" />
					</div>

					<div class="phoneLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>手机
						</div>
						<input type="text" name="phone" id="phone" placeholder="请输入手机号" />
					</div>

					<div class="phoneCheckSendLine">
						<button type="button" class="phoneCheckSendBtn">免费获取验证码</button>
					</div>

					<div class="phoneCheckInputLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>短信验证码
						</div>
						<input type="text" name="phone_check_code" id="phone_check_code"
							placeholder="请输入短信验证码" />
					</div>

					<div class="emailLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>邮箱
						</div>
						<input type="email" name="email" id="email" placeholder="请输入邮箱" />
					</div>

					<div class="drivingLine">
						<div class="leftTxt">
							<span class="txt-imp">*</span>驾驶证编号
						</div>
						<input type="text" name="driving_num" id="driving_num"
							placeholder="请输入驾驶证编号" />
					</div>

					<div class="drivingDay">
						<div class="leftTxt">
							<span class="txt-imp">*</span>驾驶证到期日期
						</div>
						<input type="text" name="driving_day" id="driving_day"
							placeholder="请输入驾驶证到期日期" />
					</div>

					<div class="checkCodeLine">
						<div class="checkCodeLfetPart">
							<div class="leftTxt">
								<span class="txt-imp">*</span>图片验证码
							</div>
							<input type="text" name="pic_check_code" id="pic_check_code"
								placeholder="请输入验证码（不区分大小写）" />
						</div>
						<div class="checkCodeImg">
							<a href="javascript:reloadCode();" title="更换验证码"> <img
								alt="验证码" id="imagecode" src="/Test1/createCode" alt="验证码图片" />
							</a>
						</div>

					</div>

					<div class="checkChangeLine">

						<div class="checkCodeChangeTxt">

							<a href="javascript:reloadCode();" title="更换验证码">看不清楚换张图片？</a>
						</div>
					</div>

					<div class="userAttentionLine">
						<div class="userAttention">
							<input type="checkbox" name="user_attention" id="user_attention"
								checked="checked" />同意<a href="" title="服务条款">"服务条款"</a>和<a
								href="" title="用户须知">"用户须知"</a>、<a href="">"隐私权相关政策"</a>
						</div>
					</div>

					<div class="registSubmit">
						<input type="submit" name="regist_submit" id="regist_submit"
							value="注册" />
					</div>
				</form>
			</div>

			<div class="midRight">
				<img src="images/logo.jpg" class="midRightImg" alt="中车Logo" /> <br />
				<h4>中车互联，运力无限</h4>
			</div>
		</div>
	</section>


	<footer>
		<div class="bottom">
			<div class="copyright">中车互联运力科技有限公司版权所有&copy;2015-2016</div>
		</div>
	</footer>
</body>
</html>


