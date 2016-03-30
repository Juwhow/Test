<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script>
	function showHint() {
		var xmlhttp;
		var str = "Juwhow";
		if (str.length == 0) {
			document.getElementById("txtHint").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "/Test1/testAJAX?str=" + str, true);
		xmlhttp.send();
	}
</script>
</head>
<body>

	<div id="txtHint">
		<h2>使用 AJAX 修改该文本内容</h2>
	</div>
	<input type="text" name="username" />
	<button type="button" onclick="showHint()">修改内容</button>

</body>
</html>
