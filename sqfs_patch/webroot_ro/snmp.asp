<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SNMP</title>
<link rel="stylesheet" href="public/style.css">
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form name="SetSnmp" method="POST" action="/goform/SetSnmp" id="system_snmp">
			<input type="hidden" name="GO" value="snmp.asp">
			<p class="ml20 mt20">Here you can configure SNMP settings. SNMP v1 and v2c are supported.</p>
			<table class="myTable">
				<tr>
					<td width="25%">SNMP</td>
					<td><input type="radio" name="snmpEn" value="0" >Disable
						<input type="radio" name="snmpEn" value="1" checked="checked" >Enable</td>
				</tr>
				<tr class="none">
					<td>SNMP Version</td>
					<td><input type="radio" name="snmpVer" value="1" checked="checked" >
						SNMP V1&V2
					<input type="radio" name="snmpVer" value="0" >
						SNMP V3</td>
				</tr>
				<tr>
					<td>Administrator Name</td>
					<td><input class="text" maxlength="32" name="snmpAdmin"></td>
				</tr>
				<tr>
					<td>Device Name</td>
					<td><input class="text" maxlength="32" name="snmpDevice"></td>
				</tr>
				<tr>
					<td>Location</td>
					<td><input class="text" maxlength="32" name="snmpPos" id="snmpPos"></td>
				</tr>
				<tr>
					<td>Read Community</td>
					<td><select name="snmpGetcomm">
                    		<option value="public">public</option>
                            <option value="private">private</option>
                        </select>
                    </td>
				</tr>
				<tr>
					<td>Read/Write Community</td>
					<td><select name="snmpSetcomm">
                    		<option value="public">public</option>
                            <option value="private">private</option>
                        </select>
                    </td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>

<script src="public/j.js"></script>
<script src="js/system.js"></script>
<script>
var data = {
	snmpEn:"<%getSysStatus("snmp","enable");%>",
	snmpVer:"<%getSysStatus("snmp","version");%>",
	snmpAdmin:"<%getSysStatus("snmp","name");%>",
	snmpDevice:"<%getSysStatus("snmp","devicename");%>",
	snmpPos:"<%getSysStatus("snmp","position");%>",
	//SNMPUSERNAME:"%aspTendaGetStatus("snmp","snmpusername");%>",
	//SNMPPASSWRD:"%aspTendaGetStatus("snmp","snmppasswrd");%>",
	//SNMPPHASE:"%aspTendaGetStatus("snmp","snmpphase");%>",
	snmpGetcomm:"<%getSysStatus("snmp","getcommunity");%>",
	snmpSetcomm:"<%getSysStatus("snmp","setcommunity");%>"
}

</script>
</body>
</html>