<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>中车运力</title>

<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function modify_onload() {

		if ("${modifyInformation}" == "success") {
			alert("用户头像和用户类型保存成功！");
		}

	}
	$(function() {
		$(":input")
				.blur(
						function() {
							var $parent = $(this).parent();
							$parent.find(".formtips").remove();
							if ($(this).is('#username')) {
								if (this.value == "" || this.value.length < 6) {
									var errorMsg = '请输入至少6位的用户名.';
									$parent
											.append('<span class="formtips onError">'
													+ errorMsg + '<\/span>');
								} else {
									var okMsg = '输入正确.';
									$parent
											.append('<span class="formtips onSuccess">'
													+ okMsg + '<\/span>');
								}
							}

							if ($(this).is('#newEamil')) {
								if (this.value == ""
										|| (this.value != "" && !/.+@.+\.[a-zA-Z]{2,4}$/
												.test(this.value))) {
									var errorMsg = '请输入正确的E-Mail.';
									$parent
											.append('<span class="formtips onError">'
													+ errorMsg + '<\/span>');
								} else {
									var eamil1 = document
											.getElementById("eamil").value;
									var eamil2 = document
											.getElementById("newEamil").value;
									if (eamil1 == eamil2) {
										var sameMsg = '应该输入不一样的邮箱';
										$parent
												.append('<span class="formtips onSuccess">'
														+ sameMsg + '<\/span>');
									} else {
										$(document)
												.ready(

														function() {

															var okMsg = '输入正确.';
															$parent
																	.append('<span class="formtips onSuccess">'
																			+ okMsg
																			+ '<\/span>');

															$
																	.ajax({
																		url : "/Test1/modifyEmail",
																		type : "post",
																		dataType : "text",
																		data : {
																			id : "${user.getId()}",
																			newEmail : eamil2
																		},
																		success : function(
																				responseText) {

																			alert(responseText);
																		},
																		error : function() {
																			alert("邮箱修改失败。");
																		}
																	});
														});

									}
								}
							}
						})
	});

	//重置
	$('#res').click(function() {

		document.getElementById("username").value = "131";
		document.getElementById("job").innerHTMLL = "${user.getUserType()}";
		$(".formtips").remove();
	});

	$(document).ready(function() {
		$("#usernameBtn").click(function() {

		});
	});

	$(document).ready(function() {
		$("#pwdBtn1").click(function() {
			$("#modify_pwd").toggle();
		});
	});

	$(document).ready(function() {
		$("#pwdBtn2").click(function() {
			var pwd1 = document.getElementById("password").value;
			var pwd2 = document.getElementById("oldPwd").value;
			var pwd3 = document.getElementById("newPwd1").value;
			var pwd4 = document.getElementById("newPwd2").value;
			if (pwd1 != pwd2) {
				alert("当前密码错误");
				return;
			} else if (pwd3.length == 0 || pwd4.length == 0) {
				alert("请填写完全");
				return;
			} else if (pwd3 != pwd4) {
				alert("新密码两次填的不一样");
				return;
			} else if (pwd3 == pwd1) {
				alert("新密码应该与旧密码不同");
				return;
			} else {

				$.ajax({
					url : "/Test1/modifyPassword",
					type : "post",
					dataType : "text",
					data : {
						id : "${user.getId()}",
						password : pwd2,
						newPassword : pwd3
					},
					success : function(responseText) {
						alert(responseText);
					},
					error : function() {
						alert("密码修改失败");
					}
				});

			}
		});

		$(diverNameBtn).click(function() {
			
			var diverName = document.getElementById("diverName").value;
			if (diverName == "") {
				alert("驾驶证号不能为空");
				return;
			} else {
				$.ajax({
					url : "/Test1/modifyLicenseNumber",
					type : "post",
					dataType : "text",
					data : {
						id : "${user.getId()}",
						licenseNumber : diverName
					},
					success : function(responseText) {
						alert(responseText);
					},
					error : function() {
						alert("驾驶证号修改失败");
					}
				});

			}

		});
	});

	$(document).ready(function() {
		$("#phoneBtn1").click(function() {
			$("#modify_phone").toggle();
		});
	});

	$(document).ready(function() {
		$("#eamilBtn1").click(function() {
			$("#modify_eamil").toggle();
		});
	});

	$(document).ready(function() {
		$("#phoneBtn2").click(function() {
			var phone1 = document.getElementById("phone").value;
			var phone2 = document.getElementById("newPhone").value;
			if (phone2.length == 11) {
				if (!isNaN(phone2)) {

				} else {
					alert("电话不能包含特殊字符！");
					return false;
				}
			} else {
				alert("电话位数不对!");
				return false;
			}

			$.ajax({
				url : "/Test1/modifyNumber",
				type : "post",
				dataType : "text",
				data : {
					id : "${user.getId()}",
					newNumber : phone2
				},
				success : function(responseText) {
					if (responseText == "fail")
						alert("该手机号已存在，修改失败。");
				},
				error : function() {
					alert("手机号修改失败");
				}
			});

		});

		$("#phoneBtn3").click(function() {
			var phoneYZM = document.getElementById("phoneYZM").value;
			var newPhone = document.getElementById("newPhone").value;
			if (phoneYZM == "") {
				alert("验证码不能为空！");
				return;
			} else {

				$.ajax({
					url : "/Test1/submitMessageCode",
					type : "post",
					dataType : "text",
					data : {
						id : "${user.getId()}",
						newNumber : newPhone,
						messageCode : phoneYZM
					},
					success : function(responseText) {

						alert(responseText);
					},
					error : function() {
						alert("手机号修改失败!");
					}
				});
			}

		});

		$("#emailBtn3").click(function() {
			var eamilYZM = document.getElementById("eamilYZM").value;
			var newEmail = document.getElementById("newEamil").value;
			if (eamilYZM == "") {
				alert("邮箱验证码不能为空！");
				return;
			} else {

				$.ajax({
					url : "/Test1/submitEmailCode",
					type : "post",
					dataType : "text",
					data : {
						id : "${user.getId()}",
						EmailCode : eamilYZM,
						newEmail : newEmail
					},
					success : function(responseText) {

						alert(responseText);
					},
					error : function() {
						alert("邮箱修改失败!");
					}
				});
			}
		});

		$("#emailButton").click(function() {
			var newEmail = document.getElementById("newEamil").value;

			if (newEmail == "") {
				alert("邮箱不能为空！");
				return;
			} else if (!/.+@.+\.[a-zA-Z]{2,4}$/.test(newEmail)) {
				alert("邮箱格式错误！");
				return;
			} else {

				$.ajax({
					url : "/Test1/modifyEmail",
					type : "post",
					dataType : "text",
					data : {
						id : "${user.getId()}",
						newEmail : newEmail,
					},
					success : function(responseText) {

						alert(responseText);
					},
					error : function() {
						alert("邮箱修改失败!");
					}
				});
			}

		});

	});
</script>

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

.chooseFilePic {
	margin-left: 150px;
}

.mid {
	height: 850px;
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

.leftTxt1 {
	float: left;
	width: 140px;
	text-align: right;
	margin-top: 5px;
	color: #3F0;
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
	padding-left: 200px;
	vertical-align: middle;
}

p.a-line {
	height: 25px;
	vertical-align: central;
}

span.txt-gender {
	height: 25px;
	vertical-align: central;
	margin: 5px;
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

button.pwdBtn1, .pwdBtn2 {
	width: 70px;
	height: 30px;
}

button.phoneBtn1, .phoneBtn3, .phoneBtn2 {
	width: 70px;
	height: 30px;
	color: white;
}

button.eamilBtn1, .eamilBtn2 {
	width: 70px;
	height: 30px;
}

button.diverNameBtn, .usernameBtn {
	width: 70px;
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
	margin-left: 130px;
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
	height: 850px;
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

#preview {
	width: 200px;
	height: 190px;
	border: 1px solid #000;
	overflow: hidden;
	margin-left: 150px;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
</style>

<script type="text/javascript">
	//重置
	function resCheck() {
		
		document.getElementById('username').value = "${user.getNickname()}";
		document.getElementById("job").value = "${user.getUserType()}";

	}
	
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
			left : 150,
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

</head>

<body onload="modify_onload()">
	<header>
		<div class="top">
			<div class="top-txt">
				<h1>修改信息</h1>
			</div>
		</div>
	</header>

	<section>
		<div class="mid">
			<div class="midLeft">

				<div id="preview">
					<img id="imghead"
						src='photo/photoCreate.jsp?filename=${user.getPhoto()}'>
				</div>


				<form method="post" action="/Test1/modifyPhoto"
					accept-charset="utf-8" enctype="multipart/form-data">
					<input class="chooseFilePic" type="file"
						onchange="previewImage(this)" name="file" />
					<div class="nameLine">
						<div class="leftTxt">昵称</div>
						<input type="text" name="username" id="username"
							value="${user.getNickname()}" placeholder="请输入名字" />
					</div>

					<div class="phoneLine">
						<div class="leftTxt">密码</div>
						<input type="password" name="password" id="password"
							value="${user.getPassword()}" placeholder="当前密码" readonly />
						<button type="button" id="pwdBtn1" class="pwdBtn1">修改密码</button>
					</div>

					<div id="modify_pwd" class="modify_pwd" style="display: none"">
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>旧密码
							</div>
							<input type="password" name="oldPwd" id="oldPwd" class="oldPwd"
								placeholder="请输入旧密码" />
						</div>
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>新密码
							</div>
							<input type="password" name="newPwd1" id="newPwd1"
								class="newPwd1" placeholder="请输入新密码" />
						</div>
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>确认新密码
							</div>
							<input type="password" name="newPwd2" id="newPwd2"
								class="newPwd2" placeholder="请再输入新密码" />
							<button type="button" class="pwdBtn2" id="pwdBtn2">确定</button>
						</div>

					</div>


					<div class="jobLine">
						<div class="leftTxt">用户类型</div>
						<select class="job" name="job" id="job">
							<option value="${user.getUserType()}">${user.getUserType()}</option>
							<option value="司机">司机</option>
							<option value="快递员">快递员</option>
							<option value="其他">其他</option>
						</select>
					</div>

					<div class="nameLine">
						<div class="leftTxt">姓名</div>
						<input type="text" name="realName" id="realName" class="realName"
							value="${user.getName()}" placeholder="真实姓名" readonly />
					</div>

					<div class="IdLine">
						<div class="leftTxt">身份证号</div>
						<input type="text" name="user_id" id="user_id" class="user_id"
							value="${user.getIDCard()}" placeholder="请输入身份证号" readonly />
					</div>

					<div class="IdDayLine">
						<div class="leftTxt">身份证到期日期</div>
						<input type="text" name="user_id_day" id="user_id_day"
							value="${user.getIDCardEndTime()}" class="user_id_day"
							placeholder="显示身份证到期日期 " readonly />
					</div>

					<div class="nameLine">
						<div class="leftTxt">驾驶证证号</div>
						<input type="text" name="diverName" id="diverName"
							value="${user.getLicenseNumber()}" placeholder="请输入驾驶证号" />
						<button type="button" class="diverNameBtn" id="diverNameBtn">保存</button>
					</div>

					<div class="IdDayLine">
						<div class="leftTxt">驾驶证到期日期</div>
						<input type="text" name="diver_id_day" id="diver_id_day"
							value="${user.getLicenseEndTime()}" class="diver_id_day"
							placeholder="显示驾驶证到期日期 " readonly />
					</div>

					<div class="phoneLine">
						<div class="leftTxt">手机号</div>
						<input type="text" name="phone" id="phone"
							value="${user.getNumber()}" placeholder="当前手机号" readonly>
						<button type="button" id="phoneBtn1" class="phoneBtn1">更改绑定</button>
					</div>
					<div id="modify_phone" class="modify_phone" style="display: none">
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>新手机号
							</div>
							<input type="text" name="newPhone" id="newPhone"
								placeholder="请输入新绑定手机号" />
							<button type="button" id="phoneBtn2" class="phoneBtn2">验证</button>
						</div>
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>验证码
							</div>
							<input type="text" name="phoneYZM" id="phoneYZM"
								placeholder="请输入验证码" />
							<button type="button" id="phoneBtn3" class="phoneBtn3">确定</button>
						</div>
					</div>

					<div class="phoneLine">
						<div class="leftTxt">邮箱</div>
						<input type="text" name="eamil" id="eamil"
							value="${user.getEmail()}" placeholder="当前邮箱" readonly>
						<button type="button" id="eamilBtn1" class="eamilBtn1">更改绑定</button>
					</div>
					<div id="modify_eamil" class="modify_eamil" style="display: none">
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>新邮箱
							</div>
							<input type="text" name="newEamil" id="newEamil"
								placeholder="请输入新绑定邮箱" />
							<button type="button" id="eamilBtn2" class="phoneBtn3">验证</button>
						</div>
						<div class="nameLine">
							<div class="leftTxt1">
								<span class="txt-imp">*</span>验证码
							</div>
							<input type="text" name="eamilYZM" id="eamilYZM"
								placeholder="请输入验证码" />
							<button type="button" id="emailBtn3" class="phoneBtn3">确定</button>
						</div>
					</div>
					<br />
					<div class="registSubmit">
						<input type="submit" name="modify_submit" id="modify_submit"
							value="保存" />
						<button type="button" onClick="resCheck()" class="phoneBtn3"
							name="res" id="resButton">重置</button>
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


