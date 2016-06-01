<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>System | backup</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/menu.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
		<form name="frmSetup" method="post" action="/goform/ledControl" id="system_led">
			<input type="hidden" name="GO" value="system_led.asp" />
			<input type="hidden" name="led" value="1" />
			<table width="640" class="ml20 mt20">
				<tr>
					<td colspan="2" class="a3" style="padding-left:10px;">LED Control</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><br><input type="button" class="button1 fb" value="Enable all LEDs" name="ledStatus" onClick="clickLed();"/></td>
				</tr>
			</table>
		</form>
		<div id="tail"><br><input class="button" type="button" value="Help" onClick="doHelp('led')"></div>
</div>

<script>
B.setTextDomain("all");
var ledStatus = "<%aspTendaGetStatus("sys","ledstatus");%>";
document.getElementById("head").innerHTML = tbl_head(25);
if (ledStatus == "1") {
	document.frmSetup.ledStatus.value = _("Disable all LEDs");
}
</script>
<script>
	function clickLed() {
		if (parent.userType == "user") {
			alert(_("You must log in as an administrator to make any change."));
			return false;
		}
		if (ledStatus == "1") {
			document.frmSetup.ledStatus.value = _("Disable all LEDs");
			document.frmSetup.led.value = "0";
		}
		document.frmSetup.submit();
	}
</script>
</body>
</html>

