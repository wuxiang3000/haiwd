<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<title>Haiwd | LOGIN</title>
<link rel=stylesheet type=text/css href=public/style.css />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script> 
<script src="public/j.js"></script>
</head>
<body onLoad="init()" onkeydown="keydown(event)">
	<div id="mid_content" class="none">
		<div class="loagin_title">
			<div id="productName"></div>
        	<div style="float: right; margin-right: 10px; margin-top: -35px;">
        		<select id="select-lang">
            	</select>
            </div>
        </div>
		<form method="post" action="/login/Auth" class="fn">
		<input type="hidden" name="usertype" value="admin">
            <input type="hidden" name="mitUSERNAME">
   		    <input type="hidden" name="password">
			<input type="hidden" name="time">
		<table id="login">
			<tr>
				<td colspan="2"><div id="massage_text" class="red"></div></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td align="left"><input type="text" class="w110" id="username" name="username" maxlength="32"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td align="left"><input type="password" class="w110" id="pass" name="pass" maxlength="32"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" style="width: 80px;" value=" Login " onClick="preSubmit()"></td>
			</tr>
		</table>
		</form>
	</div>


<script>
var	adminName = "<%getSysStatus("sys","username");%>",
	userName = "<%getSysStatus("sys","baseusername");%>",
	productName = "W100";

var	login_status = 0,f;	
	
function init() {
	var pathname_arr = window.location.toString().split('?');
	f = document.forms[0];
	$("#productName").html(productName);
	$("#mid_content").removeClass("none");
	login_status = pathname_arr[1];
	if (login_status == 0){
		$('#massage_text').text(_('User name or password is incorrect!'));
	}
	if(parent.window!=window) { 
		parent.window.location = window.location.toString();
	}
	f.username.focus();
}

function preSubmit()
{
	if (f.username.value == adminName) {
		f.usertype.value = "admin";
	} else {
		f.usertype.value = "user";
	}
	if(f.username.value == "")
	{
		$('#massage_text').text(_('Please enter a user name!'));
		f.username.focus();
		return false;	
	}	
	if(f.pass.value == "")
	{
		$('#massage_text').text(_('Please enter a password!'));
		f.pass.focus();
		return false;	
	}
	f.password.value = str_encode(f.pass.value);
	
	var today=new Date();
	var data = today.getFullYear().toString();
	data += ';'+(parseInt(today.getMonth(),10)+1);
	data += ';'+today.getDate();
	data += ';'+ today.getHours();
	data += ';'+today.getMinutes();
	data += ';'+today.getSeconds();
	f.time.value = data;
	f.submit();
}

function keydown(evt)
{
	var keyCode = evt.keyCode ? evt.keyCode : evt.which ? evt.which : evt.charCode;
	if (keyCode==13) {
		preSubmit();
	}
}
</script>
</body>
</html>
