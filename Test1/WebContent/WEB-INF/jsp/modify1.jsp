<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/centerIU.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$('#userPic').popover('show')

	$(document).ready(function() {
		$("#pwd_button").click(function() {
			$("#pwd_form").toggle();
		});
	});

	$(document).ready(function() {
		$("#phone_button1").click(function() {
			$("#phone_form").toggle();
		});
	});

	$(document).ready(function() {
		$("#youxiang_button1").click(function() {
			$("#youxiang_form").toggle();
		});
	});
</script>

<style type="text/css">
#preview {
	width: 260px;
	height: 190px;
	border: 1px solid #000;
	overflow: hidden;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
</style>

<script type="text/javascript">
	function previewImage(file) {
		var MAXWIDTH = 260;
		var MAXHEIGHT = 180;
		var div = document.getElementById('preview');
		if (file.files && file.files[0]) {
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
						img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				img.style.marginTop = rect.top + 'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				img.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else //兼容IE
		{
			var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
					img.offsetHeight);
			status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width
					+ ',' + rect.height);
			div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
		}
	}
	function clacImgZoomParam(maxWidth, maxHeight, width, height) {
		var param = {
			top : 0,
			left : 0,
			width : width,
			height : height
		};
		if (width > maxWidth || height > maxHeight) {
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;

			if (rateWidth > rateHeight) {
				param.width = maxWidth;
				param.height = Math.round(height / rateWidth);
			} else {
				param.width = Math.round(width / rateHeight);
				param.height = maxHeight;
			}
		}

		param.left = Math.round((maxWidth - param.width) / 2);
		param.top = Math.round((maxHeight - param.height) / 2);
		return param;
	}
</script>


<title>modify</title>

</head>

<body>

	<div class="container">
		<div class="header">
			<ul class="nav nav-pills pull-right">
				
				<li><a href="/Test1/loginIndex">返回主页</a></li>
			</ul>
			<h3 class="text-muted">修改个人信息</h3>
		</div>

		<div id="preview">
			<img id="imghead" src='images/1.jpg'>
		</div>
		<input type="file" onchange="previewImage(this)" />


		<!--核心-->
		<div class="row marketing">
			<div class="col-lg-6">
				<!--需要修改的-->
				<div class="input-group">
					<h3>用户名:</h3>
					<hr>
					<div class="input-group">
						<input type="text" class="form-control"> <span
							class="input-group-btn">
							<button class="btn btn-default" id="user_button" type="button">保存</button>
						</span>
					</div>
				</div>

				<div class="password">
					<div class="input-group">
						<h3>密码:</h3>
						<hr>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="当前密码"
								readonly> <span class="input-group-btn">
								<button class="btn btn-default" id="pwd_button" type="button">修改</button>
								<br />
							</span>
						</div>
					</div>
					<form role="form" id="pwd_form" style="display: none">
						<div class="form-group">
							<label>新密码</label> <input type="password" class="form-control"
								id="new_pwd1" placeholder="输入新密码">
						</div>
						<div class="form-group">
							<label>确认新密码</label> <input type="password" class="form-control"
								id="new_pwd2" placeholder="确认新密码">
						</div>
						<button type="submit" class="btn btn-default">确定更改</button>
					</form>
				</div>

				<div class="userType">
					<h3>用户类型:</h3>
					<hr>
					<div class="input-group">
						<input type="text" list="userType_list" id="userType_name"
							class="form-control" placeholder="选择用户类型" />
						<datalist id="userType_list">
							<option label="userType1" value="驾驶员" />
							<option label="userType2" value="运输公司" />
						</datalist>
					</div>
				</div>


				<div class="phone">
					<h3>手机号码:</h3>
					<hr>
					<div class="input-group">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" id="phone_button1" type="button">更改绑定</button>
							</span>
						</div>
					</div>
					<form role="form" id="phone_form" style="display: none">
						<div class="input-group">
							<label>新手机号码</label>
							<div class="input-group">
								<input type="text" class="form-control"> <span
									class="input-group-btn">
									<button class="btn btn-default" id="phone_button2"
										type="button">发送验证码</button>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label>输入验证码</label> <input type="password" class="form-control"
								id="phone_yanzhengma" placeholder="输入验证码">
						</div>
						<button type="submit" class="btn btn-default">确定更改</button>
					</form>
				</div>


				<div class="youxiang">
					<h3>邮箱:</h3>
					<hr>
					<div class="input-group">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" id="youxiang_button1"
									type="button">更改绑定</button>
							</span>
						</div>
					</div>
					<form role="form" id="youxiang_form" style="display: none">
						<div class="input-group">
							<label>新邮箱</label>
							<div class="input-group">
								<input type="text" class="form-control"> <span
									class="input-group-btn">
									<button class="btn btn-default" id="youxiang_button2"
										type="button">激活</button>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label>输入验证码</label> <input type="password" class="form-control"
								id="youxiang_yanzhengma" placeholder="输入验证码">
						</div>
						<button type="submit" class="btn btn-default">确定更改</button>
					</form>
				</div>
				<!--需要修改结束-->
			</div>

			<div class="col-lg-6">
				<!--个人身份信息-->

				<div class="input-group">
					<h3>姓名:</h3>
					<hr>
					<input type="text" class="form-control" id="realName"
						class="realName" placeholder="用户真实名字" readonly>
				</div>

				<div class="input-group">
					<h3>身份证号:</h3>
					<hr>
					<input type="text" class="form-control" id="realIdCard"
						class="realIdCard" placeholder="用户身份证号" readonly>
				</div>

				<div class="input-group">
					<h3>驾驶证号:</h3>
					<hr>
					<input type="text" class="form-control" id="realIdCard"
						class="realIdCard" placeholder="用户身份证号" readonly>
				</div>
				<div class="input-group">
					<h3>性别:</h3>
					<hr>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios1" value="option1" checked> 男
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios2" value="option2"> 女
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios2" value="option2"> 其他
						</label>
					</div>
				</div>
				<!--个人身份信息结束-->
			</div>
		</div>
		<!--核心结束-->

		<div class="footer">
			<p>&copy; Company 2016</p>
		</div>

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
