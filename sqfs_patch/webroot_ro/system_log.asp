<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>System | System Log</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="log">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/SysToolSysLog" method="post" name="frmSetup">
		<input type="hidden" name="TYPE" value="0" />
		<input type="hidden" name="page" value="log">
		<input type="hidden" name="op" value="0">
		<p class="mt20 ml20 w640 tr">Type of logs to display:
			<select name="logtype" style="display:inline">
				<option value="0">All</option>
				<option value="1">System</option>
			</select></p>
		<div id="logs"></div><br/>
		<div id="pages" class="pl30"></div>
		</form>
		<div id="tail"><br><input type="button" name="refresh" class="button" value="Refresh"><br><br>
			<input type="button" name="clear" class="button" value="Clear"><br><br>
		</div>
	</div>
</div>


<script src="js/system_log.js"></script>
<script>
var syslog_list = "<%aspSysLogGet("system","loglist");%>".split("~"),
	wanflag = "<%getSysStatus("wans","flag");%>",
	urlClassFilterEn = "0",//网址分类过滤开启
	logsNum = "<%getSysStatus("sys","logsnum");%>";
</script>
</body>
</html>