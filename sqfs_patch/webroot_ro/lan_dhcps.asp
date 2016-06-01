<!DOCTYPE html>
<html style="display:none;">
<head>
<meta charset="utf-8" />
<title>DHCP Setup</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form name="lanDhcp" method="post" action="/goform/DhcpSetSer">
			<input type="hidden" name="GO"  value="lan_dhcps.asp">
			<table class="myTable mt20">
				<tr>
					<td>DHCP Server</td>
					<td><input type="checkbox" name="dhcpEnable" value=1>
						Enable</td>
				</tr>
				<tr>
					<td>Start IP</td>
					<td><input name="startIp" class="text" maxlength="15" ></td>
				</tr>
				<tr>
					<td>End IP</td>
					<td><input name="endIp" class="text" maxlength="15" ></td>
				</tr>
				<tr>
					<td>Lease Time</td>
					<td><select name="lease">
							<option value="604800">7 days</option>
							<option value="259200">3 days</option>
							<option value="86400">1 day</option>
							<option value="43200">12 hours</option>
							<option value="21600">6 hours</option>
							<option value="3600">1 hour</option>
							<option value="1800">30 minutes</option>
						</select></td>
				</tr>
				<tr>
					<td>Subnet Mask</td>
					<td><input name="mask" class="text" maxlength="15" ></td>
				</tr>
				<tr>
					<td>Gateway</td>
					<td><input name="gateway" class="text" maxlength="15"></td>
				</tr>
				<tr>
					<td width=35%>Primary DNS Server</td>
					<td><input name="dns1" class="text" size=15 maxlength=15 ></td>
				</tr>
				<tr>
					<td>Secondary DNS Server(optional)</td>
					<td><input name="dns2" class="text" size=15 maxlength=15 ></td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>
</body>
<script src="public/j.js"></script>
<script>
var ip = "<%getSysStatus("lan","ip");%>",
	mask = "<%getSysStatus("lan","mask");%>",
	lanip1 = "<%getSysStatus("lan1","ip");%>",
	lanmask1 = "<%getSysStatus("lan1","mask");%>",
	wifiguestEn = "0",
	def_gateway = "<%getSysStatus("dhcps","gw");%>",
	def_dns1 = "<%getSysStatus("dhcps","dns1");%>",
	def_dns2 = "<%getSysStatus("dhcps","dns2");%>",
	def_sip = "<%getSysStatus("dhcps","start");%>",
	def_eip = "<%getSysStatus("dhcps","end");%>",
	def_mask = "<%getSysStatus("dhcps","mask");%>",
	def_dhcpen = "<%getSysStatus("dhcps","en");%>",
	def_lease = "<%getSysStatus("dhcps","leasetime");%>";
</script>
<script src="js/lan.js"></script>
</html>