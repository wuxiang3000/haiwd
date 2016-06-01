<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DHCP Client List</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form name="lanDhcpClients">
			<table width="640" class="ml20 mt20">
				<tr>
					<td>Once DHCP is enabled, client list will be refreshed automatically every five seconds.
					<input type="button" class="button" value="Refresh" onClick="location.reload()" />
					</td>
				</tr>
			</table>
			<table width="640" border="1" class="ml20 tc" id="dhcps_table">
			<thead>
				<tr class="a3">
					<td width="10%">ID</td>
					<td width="25%">Hostname</td>
					<td width="25%">IP Address</td>
					<td width="25%">MAC Address</td>
					<td width="15%">Lease Time</td>
				</tr>
			</thead>     
			<tbody id="list"></tbody>
			</table>
		</form>
	</div>
</div>
<script src="public/j.js"></script>
<script src="js/lan.js"></script>
<script>
var dhcpList = [],
	def_DHEN = 1;
</script>
</body>
</html>