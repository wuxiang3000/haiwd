<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wireless | Wireless Settings</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="radio">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/WifiRadioSet" method="post" name="wireless_radio">
			<input type="hidden" id="GO" name="GO" value="wireless_radio_5g.asp"/>
			<input name="wl_radio" type="hidden" value="1" />
			<input type="hidden" name="radioEnable" value="1"/>
			<input name="hidden_channel" type="hidden"/>
			<input name="hidden_bandwidth" type="hidden"/>
			<input name="hidden_ext" type="hidden"/>
			<input name="hidden_country" type="hidden">
			<input name="hidden_netmode" type="hidden">
			<table class="myTable mt20">
				<tr>
					<td width="180">Enable Wireless</td>
					<td><input type="checkbox" name="wlRadio"></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><select name="country" id="country" size="1">
						</select></td>
				</tr>
				<tr>
					<td>Network Mode</td>
					<td><select name="wirelessmode" id="wirelessmode" size="1">
							<option value="0">11a</option>
							<option value="1">11ac</option>
							<option value="2">11a/n</option>
						</select></td>
				</tr>
				<tr id="div_channel" name="div_channel">
				<td>Channel</td>
				<td><select name="channel" id="channel">
						</select></td>
				</tr>
			<tr id="channelBand">
				<td>Channel Bandwidth</td>
				<td><input type="radio" name="bandwidth" value="0">
					20MHz
					<input type="radio" name="bandwidth" value="1">
					40MHz
					<input type="radio" name="bandwidth" value="2">
					80MHz
				</td>
			</tr>
			<tr id="channelExtra" class="none">
				<td>Extension Channel</td>
				<td><select id="extra" name="extra" size="1">
					</select></td>
			</tr>
			<tr >
				<td>Channel Lockout</td>
				<td><input type="checkbox" name="lockChannel" value="1"></td>
			</tr>
			<tr>
					<td>SSID isolation</td>
				<td><input type="radio" name="ssidIsolate" value="0" checked="checked" />
						Disable
					<input type="radio" name="ssidIsolate" value="1" style="margin-left:10px;"/>
						Enable</td>
			</tr>
			<tr>
				<td>WMM Capable</td>
				<td><input type="radio" name="wmm_capable" value="1">
					Enable
					<input type="radio" name="wmm_capable" value="0" style="margin-left:10px;">
					Disable </td>
			</tr>
			<tr id="apsdCapable">
				<td>APSD Capable</td>
				<td><input type="radio" name="apsd_capable" value="1">
					Enable
					<input type="radio" name="apsd_capable" value="0" style="margin-left:10px;">
					Disable</td>
			</tr>
			<tr class="none">
				<td>Channel Scan</td>
				<td><input name="wlScan" id="wlScan" type="button" class="button bc" value="Enable Scan" /></td>
			</tr>
		</table>
		<!--<div class="tc">信道扫描:&nbsp;&nbsp;<input name="wlScan" id="wlScan" type="button" class="button bc" value="开启扫描" /></div>-->
		<table class="w640 tc ml20" border="1" id="wlScanTab">
		</table>
		</form>
		<div id="tail"></div>
	</div>
</div>
<script>
var curmode = "<%wrlWizard5g("curmode", "5");%>";
</script>
<script src="js/country_code.js"></script>
<script src="js/wireless.js"></script>

</body>
</html>