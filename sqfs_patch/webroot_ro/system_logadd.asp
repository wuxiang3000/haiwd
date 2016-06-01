<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>system | log add</title>
<link rel="stylesheet" href="public/style.css">
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="logadd">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form name="frmSetup" method="POST" action="/goform/LogsSetting">
			<table class="myTable mt20" id="MyTable">
				<tr>
					<td>Log Server IP</td>
					<td><input class="text" type="text" name="innerIP"></td>
				</tr>
				<tr>
					<td>Log Server Port</td>
					<td><input class="text" type="text" name="port"></td>
				</tr>
				<tr>
					<td>Enable</td>
					<td><input type="checkbox" name="isenable"></td>
				</tr>
			</table>
			<input type="hidden" name="entrys">
			<input type="hidden" name="op" value="add">
		</form>
		<div id="tail"></div>
	</div>
</div>
</body>


<script src="js/system_log.js"></script>
<script>
var reqStr  = "<%TendaGetLongString("logs_list");%>",//"",//
	lanip = "<%aspTendaGetStatus("lan","lan_ip");%>",
	lanmask = "<%aspTendaGetStatus("lan","lan_mask");%>";
</script>
</html>