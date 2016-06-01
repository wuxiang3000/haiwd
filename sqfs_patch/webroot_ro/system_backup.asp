<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>System | backup</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<form name="frmSetup" method="post" action="/cgi-bin/UploadCfg" enctype="multipart/form-data" id="system_backup">
		<input type="hidden" name="GO" value="system_backup.asp" />
		<table width="640" class="ml20 mt20" id="waitfor">
			<tr>
				<td colspan="2">This section allows you to save current settings or restore previous settings.</td>
			</tr>
			<tr>
				<td width="210">Save Settings to Local Hard Drive</td>
				<td><input type="button" class="button" value="Backup" onClick="DownLoadCfg()"/></td>
			</tr>
			<tr>
				<td >Load Settings from Local Hard Drive</td>
				<td><input type="file" name="fileCfg" id="fileCfg"/>
				<input class="button" type="button" value="Restore" onClick="UpLoadCfg()"/></td>
			</tr>
		</table>
	</form>
</div>

<script src="js/system.js"></script>
</body>
</html>

