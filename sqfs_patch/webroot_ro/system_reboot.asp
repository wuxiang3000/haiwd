<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reboot</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/j.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>		
	<form name='frmSetup' method="post" action='/goform/SysTimeReboot' id="system_reboot">
	<table width="640" class="ml20 mt20">
		<tr>
			<td colspan="2">This page allows you to configure the rebooting time, or click the 'Reboot' button to restart your device.</td>
		</tr>
			<td colspan="2">
			<input class="button" onClick="preSubmit();" value="Reboot" type="button" id="rebootBtn" /></td>
		</tr>
	</table>
	</form>
</div>
</body>

<script src="js/system.js"></script>
<script>
var lanip = "<%aspTendaGetStatus("lan","lan_ip");%>",
	reboot_sslenable = "<%aspTendaGetStatus("lan","lan_webiplansslen");%>",
	reboot_time = "<%aspTendaGetStatus("sys","reboot_time");%>";
</script>
</html>