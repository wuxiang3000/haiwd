<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LAN Setup</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/AdvSetLan" method="post" name="lan">
			<input type="hidden" name="GO" value="lan.asp" />
			<input type="hidden" name="reboot" value="1" />
			<table class="myTable mt20">
				<tr>
					<td>MAC Address</td>
					<td id="lanMac"></td>
				</tr>
				<tr>
					<td>Address Mode</td>
					<td><select name="ipMode">
							<option value="0">Dynamic IP</option>
							<option value="1" selected>Static IP</option>
						</select></td>
				</tr>
				<tr id="ipAddr">
					<td>IP Address</td>
					<td><input class="text" maxlength="15" name="ip" />For example: 192.168.1.1</td>
				</tr>
				<tr id="subnet">
					<td>Subnet Mask</td>
					<td><input class="text" maxlength="15" name="mask" />For example: 255.255.255.0</td>
				</tr>
				<tr id="gateWay">
					<td>Gateway</td>
					<td id="lan_gateway"><input class="text" maxlength=15 name="gateway"></td>		 
				</tr>
                <tr id="lan_dns1">
					<td width=35%>Primary DNS Server</td>
					<td><input name="dns1" class="text" size=15 maxlength=15 ></td>
				</tr>
				<tr id="lan_dns2">
					<td>Secondary DNS Server(optional)</td>
					<td><input name="dns2" class="text" size=15 maxlength=15 ></td>
				</tr>
				<tr>
					<td>Device Name</td>
					<td><input name="apName" class="text" maxlength="32" /></td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>
<div class="divbody greater-label none" id="lan-wait">
    <div class="control-notice">
        <p>Please wait for 10 seconds to save new ip.</p>
        <p style="margin-top:15px; text-align:right">
            <input type="button" id="continu-lan" class="button1" value="Continue" style="font-weight:normal"/>
        </p>
    </div>
</div>
</body>
<script src="public/j.js"></script>
<script>
var ipMode = "<%getSysStatus("lan","type");%>",//0:dhcp,1:static//
	ip = "<%getSysStatus("lan","ip");%>",//"192.168.0.11",//
	mask = "<%getSysStatus("lan","mask");%>",//"255.255.255.0",//
	gateway = "<%getSysStatus("lan","gw");%>",//"192.168.0.1";//
	lanMac = "<%getSysStatus("lan","macaddr");%>",
	dns1 = "<%getSysStatus("lan","dns1");%>",
	dns2 = "<%getSysStatus("lan","dns2");%>",
	apName = "<%getSysStatus("snmp","devicename");%>"
</script>
<script src="js/lan.js"></script>
</html>