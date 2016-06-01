<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>System | Administrator Settings</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form name='frmSetup' method='post' action='/goform/SysToolChangePwdNew' id="system_password">
		<input type="hidden" name="GO" value="system_password.asp" />
		<input type="hidden" name="operate">
		<input type="hidden" name="usertype">
		<table width="640" class="ml20 mt20">
			<tr>
				<td colspan="2" nowrap="nowrap">Use this section to change your login user name and password.<br />
			Note: User name and password can only include 1～32 letters, numbers or underscore!</td>
			</tr>
		</table>
		<table id="userInfo" border="1" class="ml20 tc">
			<tr>
				<td width="80">Access Mode</td>
				<td width="120">User Name</td>
				<td width="80">Enable</td>
				<td width="120">Action</td>
			</tr>
			<tr>
				<td>Administrator Name</td>
				<td id="admin"></td>
				<td><input type="checkbox" name="adminEn" checked disabled></td>
				<td><button type="button" class="button1 moduser" name="modadmin">Change</button></td>
			</tr>
			<tr>
				<td>User</td>
				<td id="user"></td>
				<td><input type="checkbox" name="userEn" value="1" disabled></td>
				<td><button type="button" class="button1 deluser">Delete</button>
					<button type="button" class="button1 moduser" name="moduser">Add</button></td>
			</tr>
		</table>
		<table id="olduserInfo" class="w640 ml20 none">
			<tr>
				<td width="160" class="tr pr40">Old User Name</td>
				<td><input class="text" type="text" maxlength="32" name="oldUser"  size="15" /></td>
			</tr>
			<tr>
				<td class="tr pr40">Old Password</td>
				<td><input class="text" type="password" maxlength="32" name="oldPwd"  size="15" /></td>
			</tr>
		</table>
		<table id="newuserInfo" class="w640 ml20 none">
			<tr>
				<td width="160" class="tr pr40">New User Name</td>
				<td><input class="text" type="text" maxlength="32" name="newUser" size="15" /></td>
			</tr>
			<tr>
				<td  class="tr pr40">New Password</td>
				<td><input class="text" type="password" maxlength="32" name="newPwd" size="15" /></td>
			</tr>
			<tr>
				<td class="tr pr40">Confirm New Password</td>
				<td><input class="text" type="password" maxlength="32" name="newPwd2" size="15" /></td>
			</tr>
		</table>
		</form>
		<div id="tail"></div>
	</div>
</div>


<script src="js/system.js"></script>
<script>
var userExist = "<%getSysStatus("sys","baseuserexist");%>";
var userName = "<%getSysStatus("sys","baseusername");%>";
</script>
</body>
</html>