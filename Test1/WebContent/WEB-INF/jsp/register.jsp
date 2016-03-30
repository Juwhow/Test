<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>中车运力</title>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!--日历插件-->
<link href="js/datepicker/skin/WdatePicker.css" rel="stylesheet" />
<script type="text/javascript" src="js/datepicker/WdatePicker.js" xml:space="preserve"></script>
<style type="text/css">
body{
	width:100%;
	}

.top{
	width:800px;
	height:40px;
	margin:0 auto;
	background-color:#598aba;
	}	
.top-txt{
	margin:auto;
	}
.top-txt h1{
	color: #ffffff;
    font-size: 14px;
    font-weight: normal;
    line-height: 36px;
    text-indent: 20px;
	}

.mid{
	height:650px;
	width:800px;
	margin:0 auto;
	font-family: "Hiragino Sans GB","Microsoft Yahei",Arial,sans-serif;
	border:1px solid #aaaaaa;
	}
.midLeft{
	width:70%;
	height:630px;
	float:left;
	font-family:verdana,sans-serif;
	font-size:13px;
	color:#555;
	line-height:17px;
	padding:10px;
	vertical-align:middle;
	}
.leftTxt{
	float:left;
	width:140px;
	text-align:right;
	margin-top:5px;
	}
.rightTxt{
	display:none;
	margin-left:5px;
	text-align:left;
	font-size:12px;
	color:#bc0808;
	}
	
input,input[type="text"]{
	height:25px;
	width:185px;/*次长度是为了适应JS日期插件*/
	line-height:normal;
	border-color: #949494 #a6a6a6 #a6a6a6;
	border-style:solid;
	border-radius:3px;
	border-width:1px;
	outline: 0 none;
	margin:auto 10px;
	}
input[type="radio"]{
	height:15px;
	width:15px;
	margin:auto 10px;
	margin-top:10px;
	}
input.sex{
	margin:auto;
	}

span.txt-imp{
	color:#c00;
	margin-right:3px;
	}
.nameLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
	
.genderLine{
	height:30px;
	padding-left:140px;
	vertical-align:middle;
	}
span.txt-gender{
	height:30px;
	margin-left:10px;
	}	
	
.jobLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
select.job{
	height:25px;
	width:190px;
	line-height:normal;
	border-color: #949494 #a6a6a6 #a6a6a6;
	border-style:solid;
	border-radius:3px;
	border-width:1px;
	outline: 0 none;
	margin:auto 10px;
	}

.IdLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.IdDayLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.phoneLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.phoneCheckSendLine{
	height:30px;
	margin-left:150px;
	margin-top:10px;
	}
button.phoneCheckSendBtn{
	border-color: #949494 #a6a6a6 #a6a6a6;
	border-style:solid;
	border-radius:3px;
	border-width:1px;
	outline: 0 none;
	width:150px;
	height:30px;
	color:white;
	background-color:#60b54c;
	}
.phoneCheckInputLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.emailLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.drivingLine{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.drivingDay{
	height:30px;
	margin-top:10px;
	vertical-align:middle;
	}
.checkCodeLine{
	height:70px;
	vertical-align:middle;
	}
.checkCodeLfetPart{
	margin-top:20px;
	float:left;
	}	
.checkCodeImg{
	float:right;
	margin-top:10px;
	margin-right:70px;
	width:120px;
	height:50px;
	text-align:center;
	vertical-align:middle;
	}
.checkCodeImg a,a:link,a:visited{
	color:blue;
	text-decoration:none;
	}
.checkCodeImg a:hover,a:active{
	color:#bc0808;
	text-decoration:underline;
	}

.checkChangeLine{
	height:20px;
	font-size:10px;
	}
.checkChangeLine a:link,a:visited{
	color:blue;
	text-decoration:none;
	}
.checkChangeLine a:hover,a:active{
	color:#bc0808;
	text-decoration:underline;
	}

.checkCodeChangeTxt{
	width:130px;
	text-align:center;
	margin:auto;
	margin-right:65px;
	}

.userAttentionLine{
	height:20px;
	margin-top:10px;
	}
.userAttention{
	font-size:10px;
	margin-left:150px;
	width:350px;
	text-align:left;
	vertical-align:middle;
	}
.userAttentionLine a:link,a:visited{
	color:blue;
	text-decoration:none;
	}
.userAttentionLine a:hover,a:active{
	color:#bc0808;
	text-decoration:underline;
	}
.userAttentionLine input[type="checkbox"]{
	width:15px;
	height:15px;
	line-height:14px;
	margin-left:0;
	text-align:left;
	vertical-align:middle;
	}
	
.registSubmit{
	margin-top:10px;
	margin-left:140px;
	height:30px;
	}
.registSubmit input[type="submit"]{
	color:#888;
	width:100px;
	background-color:#f4f9fd;
	border:1px solid #aaaaaa;
	}
.loginErrorLine
{
	margin-left:150px;
	text-align:left;
	vertical-align:middle;
	line-height:30px;
}
.loginErrorTxt
{
	display:none;
	width:300px;
	font-size:12px;
	color:#bc0808;
}

.midRight{
	width:25%;
	height:650px;
	float:right;
	top:10px;
	vertical-align:central;
	text-align:center;
	border-left:1px solid #aaaaaa;
	background-color:#e5e5e5;
	}
.midRightImg{
	margin:auto;
	margin-top:100px;
	}

.bottom{
	font-family:Verdana;
	font-size:12px;
	line-height:20px;
	color:#848585;
	text-align:center;
	}
.copyright{	
	margin:0 auto;
	padding:0 auto;
	width:800px;
	text-align:right;
	}

</style>

<script >

var errorTxt;

function validateName(name)
{
	with(name)
	{
		if((value=="") || (value==null))
		{
			document.getElementById("username_error").style.display="inline";
			document.getElementById("username_error").innerHTML="请输入您的姓名";
			document.getElementById("username").style.borderColor="#bc0808";
			return false;	
		}
	}
	return true;
}

/*
*旧式身份证号：15位格式为：dddddd yymmdd xx p
*dddddd:地区码
*yymmdd:出生年月日
*xx:顺号类编码，无法确定
*p:性别，男的奇数女的偶数


*新一代身份证：总共有18位号码组成。 
*1-3位是省、自治区、直辖市的编号； 
*4-6位是地区、县、旗、盟、区的编号； 
*7-10位是出生的年份； 
*11-12位是出生的月份； 
*13-14位是出生的日子； 
*15-17位是自然编号，其中第17位单号是男性，双号是女性； 
*18位是校验位，是前17个号码经过很复杂的算术计算的结果，结果为1-9以及X（代表10）
*/
function isLegalUserId(id)
{
	var re15=/^[0-9]{15}$/;
	var re18=/^[0-9]{17}[0-9xX]$/;
	if(!re15.test(id) && !re18.test(id) ) 
	{
		document.getElementById("user_id_error").style.display="inline";
		document.getElementById("user_id_error").innerHTML="身份证有误请检查";
		document.getElementById("user_id").style.borderColor="#bc0808";
		return false;
	}
	return true;
}

function validateUserId(user_id)
{
	with(user_id)
	{
		if(value=="" || value==null)
		{
			document.getElementById("user_id_error").style.display="inline";
			document.getElementById("user_id_error").innerHTML="请输入您的身份证号";
			document.getElementById("user_id").style.borderColor="#bc0808";
			return false;
		}
		
		if(!isLegalUserId(value))
		{
			return false;
		}
	}	
	return true;
}

function validateUserIdDay(user_id_day)
{
	with(user_id_day)
	{
		if(value==null||value=="")
		{
			document.getElementById("user_id_day_error").style.display="inline";
			document.getElementById("user_id_day_error").innerHTML="请输入身份证到期日期";
			document.getElementById("user_id_day").style.borderColor="#bc0808";
			return false;
		}
	}
	return true;
}

function isLegalPhone(phone)
{
	var re=/^1\d{10}$/;
	if(!re.test(phone))
	{
		document.getElementById("phone_error").style.display="inline";
		document.getElementById("phone_error").innerHTML="手机号有误请检查";
		document.getElementById("phone").style.borderColor="#bc0808";
		return false;
	}
	return true;
}

function validatePhone(phone)
{
	with(phone)
	{
		if(value==""||value==null)
		{
			document.getElementById("phone_error").style.display="inline";
			document.getElementById("phone_error").innerHTML="请输入您的手机号";
			document.getElementById("phone").style.borderColor="#bc0808";
			return false;
		} 
		if(!isLegalPhone(value))
		{
			return false;
		}
	}
	return true;
}

function validatePhoneCheckCode(pCheckCode)
{
	with(pCheckCode)
	{
		if(value==null||value=="")
		{
			document.getElementById("phone_check_error").style.display="inline";
			document.getElementById("phone_check_error").innerHTML="请输入您的手机验证码";
			document.getElementById("phone_check_code").style.borderColor="#bc0808";
			return false;
		}
	}
	return true;
}

function isLegalEmail(email)
{
	var re=re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	if(!re.test(email))
	{
		document.getElementById("email_error").style.display="inline";
		document.getElementById("email_error").innerHTML="邮箱有误请检查";
		document.getElementById("email").style.borderColor="#bc0808";
		return false;
	}
	return true;
}

function validateEmail(email)
{
	with(email)
	{
		if(value==""||value==null)
		{
			document.getElementById("email_error").style.display="inline";
			document.getElementById("email_error").innerHTML="请输入您的邮箱";
			document.getElementById("email").style.borderColor="#bc0808";
			return false;
			
		} else if(!isLegalEmail(value))
		{
			return false;
		}
	}
	return true;
}

function isLegalDrivingNum(num)
{
	
	var re=/^[0-9]{12}$/;
	//var re=/\d{12}$/;
	if(!re.test(num))
	{
		document.getElementById("driving_num_error").style.display="inline";
		document.getElementById("driving_num_error").innerHTML="驾驶证编号有误请检查";
		document.getElementById("driving_num").style.borderColor="#bc0808";
		return false;
	}
	return true;	
}

function validateDrivingNum(driving)
{
	with(driving)
	{
		if(value==null || value=="")
		{
			document.getElementById("driving_num_error").style.display="inline";
			document.getElementById("driving_num_error").innerHTML="请输入驾驶证编号";
			document.getElementById("driving_num").style.borderColor="#bc0808";
			return false;
		}
		else if(!isLegalDrivingNum(value))
		{
			return false;	
		}
	}
	return true;
}

function validateDrivingDay(day)
{
	with(day)
	{
		if(value==null||value=="")
		{
			document.getElementById("driving_day_error").style.display="inline";
			document.getElementById("driving_day_error").innerHTML="请输入驾驶证到期日期";
			document.getElementById("driving_day").style.borderColor="#bc0808";
			return false;
		}
	}
	return true;
}

function validatePicCheckCode(picCheckCode)
{
	with(picCheckCode)
	{
		if(value==null||value=="")
		{
			document.getElementById("pic_check_code").style.borderColor="#bc0808";
			return false;
		}
	}
	return true;
}

function validateForm(form)
{
	var isOk=true;
	with(form)
	{
		//isOk放置后边，放置函数不执行
		isOk=validateName(username) && isOk;
		isOk=validateUserId(user_id) && isOk;
		isOk=validateUserIdDay(user_id_day) && isOk;
		isOk=validateDrivingNum(driving_num) && isOk;
		isOk=validateDrivingDay(driving_day) && isOk;
		isOK=validatePhone(phone) && isOk;
		isOk=validatePhoneCheckCode(phone_check_code) && isOk;
		isOk=validateEmail(email) && isOK;
		isOk=validatePicCheckCode(pic_check_code) && isOk;
		
		if( !isOk )
		{	
			loginErrorDisplay(true);
			return false;
		}
	}
	return true;	
}

/*
*对input onFocus()和onBlur()行为统一处理
*使用参数对函数进行处理
*/
function inputOnFocus(index)
{
	//隐藏登录错误提示信息
	loginErrorDisplay(false);
	switch(index)
	{
		case 0:
		{
			document.getElementById("username_error").style.display="none";
			document.getElementById("username").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 1:
		{
			document.getElementById("user_id_error").style.display="none";
			document.getElementById("user_id").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 2:
		{
			document.getElementById("user_id_day_error").style.display="none";
			document.getElementById("user_id_day").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 3:
		{
			document.getElementById("driving_num_error").style.display="none";
			document.getElementById("driving_num").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 4:
		{
			document.getElementById("driving_day_error").style.display="none";
			document.getElementById("driving_day").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 5:
		{
			document.getElementById("phone_error").style.display="none";
			document.getElementById("phone").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 6:
		{
			document.getElementById("phone_check_error").style.display="none";
			document.getElementById("phone_check_code").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 7:
		{
			document.getElementById("email_error").style.display="none";
			document.getElementById("email").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
		case 8:
		{
			//document.getElementById("pic_check_code_error").style.display="none";
			document.getElementById("pic_check_code").style.borderColor="#949494 #a6a6a6 #a6a6a6";
			break;
		}
	}
}
function inputOnBlur(index)
{
	var field;
	switch(index)
	{
		case 0:
		{
			field=document.getElementById("username");
			validateName(field);
			break;
		}
		case 1:
		{
			field=document.getElementById("user_id");
			validateUserId(field);
			break;
		}
		case 2:
		{
			field=document.getElementById("user_id_day");
			validateUserIdDay(field)
			break;
		}
		case 3:
		{
			field=document.getElementById("driving_num");
			!validateDrivingNum(field); 
			break;
		}
		case 4:
		{
			field=document.getElementById("driving_day");
			validateDrivingDay(field);
			break;
		}
		case 5:
		{
			field=document.getElementById("phone");
			validatePhone(field);
			break;
		}
		case 6:
		{
			field=document.getElementById("phone_check_code");
			validatePhoneCheckCode(field);
			break;
		}
		case 7:
		{
			field=document.getElementById("email");
			validateEmail(field);
			break;
		}
		case 8:
		{
			field=document.getElementById("pic_check_code");
			validatePicCheckCode(field);
			break;
		}
	}
}

function userAttentionClicked(box)
{
	if(box.checked)
	{
		document.getElementById("regist_submit").disabled=false;
		document.getElementById("regist_submit").style.color="white";
		document.getElementById("regist_submit").style.backgroundColor="#60b54c";
	} 
	else
	{
		document.getElementById("regist_submit").disabled=true;
		document.getElementById("regist_submit").style.color="#888";
		document.getElementById("regist_submit").style.backgroundColor="#f4f9fd";
	}
}

function bodyOnLoad()
{
	//初始化，注册的法律条文项确认框
	document.getElementById("user_attention").checked=false;
	document.getElementById("regist_submit").disabled=true;
	document.getElementById("regist_submit").style.color="#888";
	document.getElementById("regist_submit").style.backgroundColor="#f4f9fd";
	//设置计时结束后的button效果
	document.getElementById("phone_checkcode_send_btn").disabled=false;
	document.getElementById("phone_checkcode_send_btn").style.color="white";
	document.getElementById("phone_checkcode_send_btn").style.backgroundColor="#60b54c";
	document.getElementById("phone_checkcode_send_btn").innerHTML="免费获取验证码";
	
	document.getElementById("login_error_txt").style.display="none";
}

var InterValObj;	//timer变量，控制时间
var count=60;	//总时间间隔
var curCount;	//当前剩余秒数

function phoneCheckcodeSendBtnClicked(btn)
{
	curCount=count;
	//设置button效果，开始倒计时
	btn.disabled=true;
	btn.style.color="#888";
	btn.style.backgroundColor="#f4f9fd";
	document.getElementById("phone_checkcode_send_btn").innerHTML=curCount+"秒后可重新发送";
	
	InterValObj=window.setInterval(setRemainTime,1000); //启动计时
	$.ajax({
		type: "POST",
		dataType: "text",//数据格式json
		url:'url',	//目标地址
		data:{
			
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			alert("向服务器，请求手机验证码，成功");
			
		},
		success: function(msg){
			alert("向服务器，请手机验证码，成功");
			
		}
	});
}

function setRemainTime()
{
	if(curCount==0)
	{
		window.clearInterval(InterValObj);	//停止计时器
		//设置计时结束后的button效果
		document.getElementById("phone_checkcode_send_btn").disabled=false;
		document.getElementById("phone_checkcode_send_btn").style.color="white";
		document.getElementById("phone_checkcode_send_btn").style.backgroundColor="#60b54c";
		document.getElementById("phone_checkcode_send_btn").innerHTML="重新发送验证码";
	}
	else
	{
		curCount--;
		document.getElementById("phone_checkcode_send_btn").innerHTML=curCount+"秒后可重新发送";
	}
}

function getNewCheckcodeImg()
{
	var time=new Date().getTime();
	document.getElementById("imagecode").src = "/Test1/createCode?d=" + time;
	
/*	
	$.ajax({
		type: "POST",
		dataType: "text",//数据格式json
		url:'url',	//目标地址
		data:{
			
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			alert("向服务器，请求图片验证码，成功");
		},
		success: function(msg){
			alert("向服务器，请求图片验证码，成功");
			//更换应验证码
			
			
		}
	});
*/	
}

function loginErrorDisplay(yes_no)
{
	if(yes_no)
	{
		document.getElementById("login_error_txt").style.display="inline";
	}
	else
	{
		document.getElementById("login_error_txt").style.display="none";
	}
}

function datepickerClicked()
{
	var today=new Date();
	var y=today.getYear();
	y = Number(y)+1900;
	var m=today.getMonth();
	m = Number(m)+1;
	var d=today.getDate();
	WdatePicker({minDate:y+"-"+m+"-"+d});
}


</script>
</head>

<body onLoad="bodyOnLoad()">
<header>
<div class="top">
	<div class="top-txt">
		<h1> 欢迎注册中车互联用户账号！</h1>
    </div>
</div>
</header>

<section>
<div class="mid">
    <div class="midLeft">
    <form enctype="application/json" action="/Test1/createUser" method="post" target="_blank" onSubmit="return validateForm(this);">
        <div class="nameLine">
        	<div class="leftTxt">
            <span class="txt-imp">*</span>名字
            </div>
            <input type="text" name="username" id="username" maxlength="20" onFocus="inputOnFocus(0)" onBlur="inputOnBlur(0)" placeholder="请输入名字" /><span class="rightTxt" name="username_error" id="username_error"></span>
        </div>
        
        <div class="genderLine">
            <span class="txt-gender">男</span><input type="radio" name="sex" id="man" value="male" checked="checked"> 
            <span class="txt-gender">女</span><input type="radio" name="sex" id="woman" value="female">
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
        	<input type="text" name="user_id" id="user_id" onFocus="inputOnFocus(1)" onBlur="inputOnBlur(1)" placeholder="请输入身份证号" maxlength="20" onKeyUp="value=value.replace(/[\W]/g,'')"/><span class="rightTxt" name="user_id_error" id="user_id_error"></span>
        </div>
        
        <div class="IdDayLine">
            <div class="leftTxt">
            <span class="txt-imp">*</span>身份证到期日期
            </div>
        	<input type="text" name="user_id_day" id="user_id_day" placeholder="请输入身份证到期日期" maxlength="10" onFocus="inputOnFocus(2)" onBlur="inputOnBlur(2)" onClick="datepickerClicked()"/><span class="rightTxt" name="user_id_day_error" id="user_id_day_error"></span>
        </div>
        
        <div class="drivingLine">
            <div class="leftTxt">
            <span class="txt-imp">*</span>驾驶证编号
            </div>	
            <input type="text" name="driving_num" id="driving_num" placeholder="请输入驾驶证编号" maxlength="12" onFocus="inputOnFocus(3)" onBlur="inputOnBlur(3)" onkeyup="this.value=this.value.replace(/\D/g,'')"/><span class="rightTxt" name="driving_num_error" id="driving_num_error"></span>
        </div>
        
        <div class="drivingDay">
            <div class="leftTxt">
            <span class="txt-imp">*</span>驾驶证到期日期
            </div>
        	<input type="text" name="driving_day" id="driving_day" placeholder="请输入驾驶证到期日期" maxlength="10" onFocus="inputOnFocus(4)" onBlur="inputOnBlur(4)" onClick="datepickerClicked()"/><span class="rightTxt" name="driving_day_error" id="driving_day_error"></span>
        </div>
        
        <div class="phoneLine">
            <div class="leftTxt">
            <span class="txt-imp">*</span>手机
            </div>	
            <input type="text" name="phone" id="phone" placeholder="请输入手机号" maxlength="11" onFocus="inputOnFocus(5)" onBlur="inputOnBlur(5)" onkeyup="this.value=this.value.replace(/\D/g,'')"/><span class="rightTxt" name="phone_error" id="phone_error"></span>
        </div>
        
        <div class="phoneCheckSendLine">
        <button type="button" class="phoneCheckSendBtn" id="phone_checkcode_send_btn" name="phone_checkcode_send_btn" onClick="phoneCheckcodeSendBtnClicked(this)" >免费获取验证码</button>
        </div>
        
        <div class="phoneCheckInputLine">
            <div class="leftTxt">
            <span class="txt-imp">*</span>短信验证码
            </div>
        	<input type="text" name="phone_check_code" id="phone_check_code" placeholder="请输入短信验证码" maxlength="6" onFocus="inputOnFocus(6)" onBlur="inputOnBlur(6)" onkeyup="this.value=this.value.replace(/\D/g,'')"/><span class="rightTxt" name="phone_check_error" id="phone_check_error"></span>
        </div>
        
        <div class="emailLine">
            <div class="leftTxt">
            <span class="txt-imp">*</span>邮箱
            </div>	
            <input type="email" name="email" id="email" placeholder="请输入邮箱" onFocus="inputOnFocus(7)" onBlur="inputOnBlur(7)"/><span class="rightTxt" name="email_error" id="email_error"></span>
        </div>
        
        <div class="checkCodeLine">
            <div class="checkCodeLfetPart">
                <div class="leftTxt">
                <span class="txt-imp">*</span>图片验证码
                </div>	
                <input type="text" name="pic_check_code" id="pic_check_code" placeholder="请输入验证码（不区分大小写）" maxlength="20" onFocus="inputOnFocus(8)" onBlur="inputOnBlur(8)" onKeyUp="value=value.replace(/[\W]/g,'')"/>
            </div>
            
            <div class="checkCodeImg">
            <a href="javascript:getNewCheckcodeImg();" title="更换验证码">
            <img class="" id="imagecode" src="/Test1/createCode" alt="验证码图片" />
            </a>
            </div>
        </div>
        
        <div class="checkChangeLine">
            <div class="checkCodeChangeTxt">
            <a href="javascript:getNewCheckcodeImg();" title="更换验证码">看不清楚，换张图片？</a>
            </div>
        </div>
        
        <div class="userAttentionLine">
            <div class="userAttention">
            <input type="checkbox" name="user_attention" id="user_attention" onClick="userAttentionClicked(this)" />同意<a href="" title="服务条款">"服务条款"</a>和<a href="" title="用户须知">"用户须知"</a>、<a href="">"隐私权相关政策"</a>
            </div>
        </div>
        
        <div class="registSubmit">
        <input type="submit" name="regist_submit" id="regist_submit" value="注册" disabled
        ="true"/>
        </div>
        
        <div class="loginErrorLine" >
        	<div class="loginErrorTxt" id="login_error_txt" name="login_error_txt">
            	注册信息填写有误，请检查！
            </div>
        </div>
        
    </form>
    </div>
    
    <div class="midRight">
    <img src="images/logo.jpg" class="midRightImg" alt="中车Logo"/>
    <br/>
    <h4> 中车互联，运力无限</h4>
    </div>
</div>
</section>


<footer>
<div class="bottom">
        <div class="copyright">
        中车互联运力科技有限公司版权所有&copy;2015-2016
        </div>
    </div>
</footer>
</body>
</html>


