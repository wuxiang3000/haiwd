<!DOCTYPE html>
<html style="display:none;">
<head>
<meta charset="utf-8" />
<title>SYSTEM | status</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
</head>
<body id="system">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<div class="fl">
			<table class="myTable mt20">
				<tr class="a3">
					<td>System Status</td>
					<td width="450px">&nbsp;</td>
				</tr>
				<tr>
					<td>Device Name</td>
					<td id="apName"></td>
				</tr>
				<tr>
					<td>System Time</td>
					<td id="systime"></td>
				</tr>
				<tr>
					<td>Up Time</td>
					<td id="uptime"></td>
				</tr>
				<tr>
					<td>Number of Wireless Clients</td>
					<td id="clients"></td>
				</tr>
				<tr>
					<td>Firmware Version</td>
					<td id="run_code_ver"></td>
				</tr>
				<tr>
					<td>Hardware Version</td>
					<td id="hw_ver"></td>
				</tr>
				<tr class="a3">
					<td>LAN Status</td>
					<td></td>
				</tr>
				<tr>
					<td>MAC Address</td>
					<td id="lan_mac"></td>
				</tr>
				<tr>
					<td>IP Address</td>
					<td id="ipAddr"></td>
				</tr>
				<tr>
					<td>Subnet Mask</td>
					<td id="mask"></td>
				</tr>
                <tr>
					<td>Primary DNS Server</td>
					<td id="dns1"></td>
				</tr>
				<tr>
					<td>Secondary DNS Server</td>
					<td id="dns2"></td>
				</tr>
			</table>
		</div>
		<div id="tail"><br><input class="button" type="button" value="Help" onClick="doHelp('st_system')"></div>
	</div>
</div>
<script src="js/macro_config.js"></script>
<script>
B.setTextDomain("all");	

var run_code_ver = CONFIG_FIRWARE_VERION,
	
	apName = "W100V1.0",

	clients = "<%getSysStatus("sys","conclient");%>",
	uptime = "<%getSysStatus("sys","runtime");%>",//"20min",//
	systime = "<%getSysStatus("sys","systime");%>",//"09:00",//
	hw_ver = "<%getSysStatus("sys","hwver");%>",
	
	ipAddr ="<%getSysStatus("lan_status","ip");%>", //"192.168.0.1",//
	mask = "<%getSysStatus("lan_status","mask");%>",//"255.255.255.0",//
	dns1 = "<%getSysStatus("lan_status","dns1");%>",
	dns2 = "<%getSysStatus("lan_status","dns2");%>",
	lan_mac = "<%getSysStatus("lan","macaddr");%>".toUpperCase();//"12:12:12:12:12:12",//
	

</script>
<script src="public/j.js"></script>
<script src="public/menu.js"></script>
<script src="js/status.js"></script>
</body>
</html>
