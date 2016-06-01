<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>QVLAN</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="qvlan">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/QvlanSet" method="post" name="wireless_filter">
			<input type="hidden" id="GO" name="GO" value="wireless_qvlan.asp" />
			<input name="wl_radio" type="hidden" value="0" />
			<input type="hidden" id="maclist" name="maclist" />
			<input type="hidden" name="enable_qvlan"/>
			<p class="w640 mt20 ml20">
				<span style="padding-left:130px; padding-right:50px">Enable</span><input type="checkbox" name="enable_qv"/>
			</p>
			<table class="w638 ml20" border="1">
				<tr class="a3">
					<td align="right" class="w150 pr40">SSID</td>
					<td class="pl10">VLAN ID (2-4095)</td>
				</tr>
				<tr>
					<td id="ssid1" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan1" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td id="ssid2" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan2" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td id="ssid3" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan3" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td id="ssid4" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan4" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td id="ssid5" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan5" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td id="ssid6" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan6" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td id="ssid7" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan7" size="4" maxlength="4"></td>
				</tr>
				<tr id="qvlan_8">
					<td id="ssid8" align="right" class="pr40"></td>
					<td class="pl10"><input type="text" name="qvlan8" size="4" maxlength="4"></td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>

<script src="js/wireless.js"></script>
<script>
var ssid1 = "<%wifiMultiBasic("0","ssid");%>",
	ssid2 = "<%wifiMultiBasic("1","ssid");%>",
	ssid3 = "<%wifiMultiBasic("2","ssid");%>",
	ssid4 = "<%wifiMultiBasic("3","ssid");%>",
	ssid5 = "<%wifiMultiBasic("4","ssid");%>",
	ssid6 = "<%wifiMultiBasic("5","ssid");%>",
	ssid7 = "<%wifiMultiBasic("6","ssid");%>",
	ssid8 = "<%wifiMultiBasic("7","ssid");%>",
	qvlan_en = "<%QvlanGet("qvlan_enable");%>",
	qvlans = "<%QvlanGet("qvlan_value");%>",
	qvlan_en_5g = "<%QvlanGet5g("qvlan_enable");%>",
	curmode = "<%wrlWizard("curmode", "something");%>";
	qvlans_5g = "<%QvlanGet5g("qvlan_value");%>";
	//qvlans = "10,11,12,13,10,11,12,13";
</script>
</body>
</html>
