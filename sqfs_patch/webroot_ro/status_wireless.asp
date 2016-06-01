<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wireless Status</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
</head>
<body id="wireless">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<div class="fl">
			<table class="w640 ml20 mt20 tc" border="1">
				<tr class="a3">
					<td colspan="2">Radio Status</td>
				</tr>
				<tr>  
					<td width="50%">Radio (On/Off)</td> 
					<td id="wlEnable"></td>
				</tr>
				<tr>  
					<td>Network Mode</td> 
					<td id="mode"></td>
				</tr>
				<tr>
					<td>Channel</td> 
					<td id="cur_channel"></td>
				</tr>
			</table>
			<table class="w640 tc ml20 mt20" border="1">
				<thead>
					<tr class="a3">
						<td colspan="4">SSID Status</td>
					</tr>
					<tr>
						<td width="35%">SSID</td>
						<td width="30%">MAC Address</td>
						<td width="15%">Working Status</td>
						<td>Security Mode</td>
					</tr>
				</thead>
				<tbody id="wireless_status">
				</tbody>
			</table>
			<table class="w640 tc ml20 mt20 none" border="1" id="wdsStatus">
				<thead>
					<tr class="a3">
						<td colspan="4">WDS Status</td>
					</tr>
					<tr>
						<td width="25%">ID</td>
						<td width="50%">MAC Address</td>
						<td width="25%">Connection Status</td>
					</tr>
				</thead>
				<tbody id="wds_status">
				</tbody>
			</table>
			<div style="height:30px; width:100%; "></div>
		</div>
		<div id="tail"><br><input class="button" type="button" value="Help" onClick="doHelp('st_wireless')"></div>
	</div>
</div>

<script>
B.setTextDomain("all");	

var data = {
	basic_mode: "<%wifiMultiBasic("0", "mode_basic");%>",
	basic_channel: "<%wifiMultiBasic("0", "channel_basic");%>",
	basic_enable: "<%wifiMultiBasic("0", "enable_basic");%>",
	ssid1: "<%wifiMultiBasic("0","ssid");%>",
	ssid2: "<%wifiMultiBasic("1","ssid");%>",
	ssid3: "<%wifiMultiBasic("2","ssid");%>",
	ssid4: "<%wifiMultiBasic("3","ssid");%>",
	ssid5: "<%wifiMultiBasic("4","ssid");%>",
	ssid6: "<%wifiMultiBasic("5","ssid");%>",
	ssid7: "<%wifiMultiBasic("6","ssid");%>",
	ssid8: "<%wifiMultiBasic("7","ssid");%>",
	mac1: "<%wifiMultiBasic("0","mac");%>".toUpperCase(),
	mac2: "<%wifiMultiBasic("1","mac");%>".toUpperCase(),
	mac3: "<%wifiMultiBasic("2","mac");%>".toUpperCase(),
	mac4: "<%wifiMultiBasic("3","mac");%>".toUpperCase(),
	mac5: "<%wifiMultiBasic("4","mac");%>".toUpperCase(),
	mac6: "<%wifiMultiBasic("5","mac");%>".toUpperCase(),
	mac7: "<%wifiMultiBasic("6","mac");%>".toUpperCase(),
	mac8: "<%wifiMultiBasic("7","mac");%>".toUpperCase(),
	ssidOF1: "<%wifiMultiBasic("0","status");%>",
	ssidOF2: "<%wifiMultiBasic("1","status");%>",
	ssidOF3: "<%wifiMultiBasic("2","status");%>",
	ssidOF4: "<%wifiMultiBasic("3","status");%>",
	ssidOF5: "<%wifiMultiBasic("4","status");%>",
	ssidOF6: "<%wifiMultiBasic("5","status");%>",
	ssidOF7: "<%wifiMultiBasic("6","status");%>",
	ssidOF8: "<%wifiMultiBasic("7","status");%>",
	security1: "<%wifiMultiBasic("0","securitymode");%>",
	security2: "<%wifiMultiBasic("1","securitymode");%>",
	security3: "<%wifiMultiBasic("2","securitymode");%>",
	security4: "<%wifiMultiBasic("3","securitymode");%>",
	security5: "<%wifiMultiBasic("4","securitymode");%>",
	security6: "<%wifiMultiBasic("5","securitymode");%>",
	security7: "<%wifiMultiBasic("6","securitymode");%>",
	security8: "<%wifiMultiBasic("7","securitymode");%>"
},
	sec = [_("None"),_("WEP"),_("WPA-PSK"),_("WPA2-PSK"),_("Mixed WPA/WPA2-PSK"),_("WPA"),_("WPA2")],
	sta = [_("Disabled"),_("Enabled")],
	macAddr = "<%wrlWizard("wds","extra_mac");%>",
	macsta = "<%WDSStausGet("wds_sta","24g");%>",
	macstr = [_("Disconnected"),_("Connected"),_("Unknown")],
	curmode = "<%wrlWizard("curmode", "something");%>";

</script>
<script src="public/j.js"></script>
<script src="public/menu.js"></script>
<script src="js/status.js"></script>
</body>
</html>