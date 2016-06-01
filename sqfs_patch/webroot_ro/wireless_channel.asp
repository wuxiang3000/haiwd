<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wireless | Wireless Settings</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="channel">
<div class="divbody">
	<div id="head"></div>
	<div style="min-width:880px">
		<form action="/goform/WifiRadioSet" method="post" name="wireless_channel">
			<input type="hidden" id="GO" name="GO" value="wireless_channel.asp"/>
			<input name="wl_radio" type="hidden" value="0" />
			<table class="myTable mt20">
			<tr>
				<td>Channel Scan</td>
				<td><input name="wlScan" id="wlScan" type="button" class="button1 bc" value="Enable Scan" /></td>
			</tr>
		</table>
		<!--<div class="tc">Channel Scan:&nbsp;&nbsp;<input name="wlScan" id="wlScan" type="button" class="button bc" value="Enable Scan" /></div>-->
		<table class="tc ml20" border="1" id="wlScanTab" style="min-width:735px">
		</table>
		<div style="height:60px;width:100%"></div>
		</form>
		<div id="tail">
			<br><input class="button" type="button" value="Help" onClick="doHelp('wl_channel')">
		</div>
	</div>
</div>

<script src="js/wireless.js"></script>
</body>
</html>