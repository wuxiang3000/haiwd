<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wireless Access Control</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
</head>
<body id="filter">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/WifiMacFilterSet" method="post" name="wireless_filter">
			<input type="hidden" id="GO" name="GO" value="wireless_filter_5g.asp" />
			<input name="wl_radio" type="hidden" value="1" />
			<input type="hidden" id="maclist" name="maclist" />
			<p class="w640 mt20 ml20">Specify a list of devices to allow or disallow a connection to your wireless network via the devices' MAC addresses. This can be set seperately on each SSID.</p>
			<table class="w640">
				<tr>
					<td width="190" align="right">SSID</td>
					<td class="pl20">
						<select name="index">
							<option value="1">1</option>
							<option value="2"></option>
							<option value="3"></option>
							<option value="4"></option>
						</select></td>
				</tr>
				<tr>
					<td align="right">MAC Filter Mode</td>
					<td class="pl20">
						<select size="1" name="filterMode" id="filterMode">
							<option value="disabled">Disable</option>
							<option value="allow">Allow</option>
							<option value="deny">Deny</option>
						</select></td>
				</tr>
			</table>
			<table width="640" border="1" class="ml20 tc">
			<thead>
				<tr class="a3">
					<td width="10%">ID</td>
					<td width="25%">MAC Address</td>
					<td width="20%">IP</td>
					<!--<td width="15%">加密</td>
					<td width="10%">带宽</td>-->
					<td width="20%">Connection Duration</td>
					<td width="25%">Add to List</td>
				</tr>
			</thead>     
			<tbody id="clientList"></tbody>
			</table>
			<table id="filterTab" class="w640 ml20 tc">
				<tr>
					<td width="75%">MAC Address</td>
					<td width="25%">Action</td>
				</tr>
				<tr>
					<td><input type="text" name="mac1" size="2" maxlength="2"/>:
						<input type="text" name="mac2" size="2" maxlength="2" />:
						<input type="text" name="mac3" size="2" maxlength="2"/>:
						<input type="text" name="mac4" size="2" maxlength="2"/>:
						<input type="text" name="mac5" size="2" maxlength="2"/>:
						<input type="text" name="mac6" size="2" maxlength="2"/></td>
					<td><input type="button" class="button" id="add" value="Add" /></td>
				</tr>
				<tr>
					<td colspan="2" id="list"></td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>


<script src="public/j.js"></script>
<script src="js/wireless.js"></script>
<script>
var ssid1 = "<%wifiMultiBasic5g("0","ssid");%>",
	ssid2 = "<%wifiMultiBasic5g("1","ssid");%>",
	ssid3 = "<%wifiMultiBasic5g("2","ssid");%>",
	ssid4 = "<%wifiMultiBasic5g("3","ssid");%>",
	flist;
var curmode = "<%wrlWizard5g("curmode", "something");%>";
</script>
</body>
</html>