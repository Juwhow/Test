<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<input type="text" name="username" />
	<input type="password" name="password" />
	<button type="button" id="eamilBtn2" onclick="submitButton()">验证</button>
	<script>
		function submitButton() {
			$.ajax({
				url : "/Test1/jsonTest",
				type : "post",
				dataType : "json",
				data : {
					id : '12323',
					username : '2313123'
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