<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wireless Client List</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="wirelessList_5g">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<div class="fl">
			<table width="640" class="ml20 mt20">
				<tr>
					<td colspan="2">This section displays information of connected clients (if any).</td>
				</tr>
				<tr>
					<td>Host(s) Connected Currently:</td>
					<td align="right"><select name="index" id="index"></select></td>
				</tr>
			</table>
			<table width="640" border="1" class="ml20 tc">
			<thead>
				<tr class="a3">
					<td width="10%">ID</td>
					<td width="25%">MAC Address</td>
					<td width="20%">IP</td>
					<!--<td width="25%">Encryption</td>
					<td width="10%">Bandwidth</td>-->
					<td width="15%">Connection Duration</td>
					<td width="15%">Send Speed</td>
					<td width="15%">Receive Speed</td>
				</tr>
			</thead>     
			<tbody id="list"></tbody>
			</table>
		</div>
		<div id="tail"><br><input class="button" type="button" value="Help" onClick="doHelp('st_wirelesslist')"></div>
	</div>
</div>

<script>
var data = {
	ssid1: "<%wifiMultiBasic5g("0","ssid");%>",//"w45ap_1",//
	ssid2: "<%wifiMultiBasic5g("1","ssid");%>",//"w45ap_2",//
	ssid3: "<%wifiMultiBasic5g("2","ssid");%>",//"w45ap_3",//
	ssid4: "<%wifiMultiBasic5g("3","ssid");%>"//"w45ap_ok";//
}
var curmode = "<%wrlWizard5g("curmode", "something");%>";
</script>

<script src="js/status.js"></script>
</body>
</html>