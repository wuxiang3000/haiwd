<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>System | Configuration Tools</title>
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
		<form name='frmSetup' method="post" action='/goform/SysToolRestoreSet' id="system_restore">
			<input type="hidden" name="CMD" value="SYS_CONF" />
			<input type="hidden" name="GO" value="system_reboot.asp" />
			<input type="hidden" name="CCMD" value="0" />
			<table width="640" class="ml20 mt20">
				<tr>
					<td>Click this button to reset the device to factory default values.</td>
				</tr>
				<tr>
					<td><input onClick="preSubmit(document.frmSetup);" value="Restore to Factory Default" type="button" class="button1"/></td>
				</tr>
			</table>	
		</form>
		<div id="tail"><input class="button mt20" type="button" value="Help" onClick="doHelp('restore')"></div>
	</div>
</div>

<script src="js/system.js"></script>
</body>
</html>