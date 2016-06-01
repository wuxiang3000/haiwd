<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<title>Basic</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
</head>
<body id="basic">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/wifiSSIDset" method="post" name="wireless_basic">
			<input type="hidden" id="GO" name="GO" value="wireless_basic.asp" />
			<input name="wl_radio" type="hidden" value="0" />
			<input type="hidden" id="enableWireless" name="enableWireless" />
			<input type="hidden" id="broadcast" name="broadcast" />
			<table class="myTable mt20">
				<tr>
					<td width="180">SSID</td>
					<td><select name="index">
							<option value="1"></option>
							<option value="2"></option>
							<option value="3"></option>
							<option value="4"></option></select></td>
				</tr>
				<tr>
					<td>Enable</td>
					<td><input type="checkbox" value="1" name="enable"></td>
				</tr>
				<tr>
					<td>Hide SSID automatically</td>
					<td><input type="checkbox" value="1" name="hideSsid"></td>
				</tr>
				<tr>
					<td>Broadcast SSID</td>
					<td><select name="broadcastSsid" >
							<option value="1">Disable</option>
							<option value="0">Enable</option>
						</select></td>
				</tr>
				<tr>
					<td>AP isolation</td>
					<td><input type="radio" name="isolate" value="0" checked="checked" />
						Disable
						<input type="radio" name="isolate" value="1" />
						Enable</td>
				</tr>
				<tr>
					<td>WMF</td>
					<td><input type="radio" name="wmf_enable" value="0" checked="checked" />
						Disable
						<input type="radio" name="wmf_enable" value="1" />
						Enable</td>
				</tr>
				<tr>
					<td>Maximum clients</td>
					<td><input type="text" name="maxclients" size="5" maxlength="3" value="10">
					(Rangle:1-64)</td>
				</tr>
				<tr>
					<td>SSID</td>
					<td><input type="text" name="ssid" maxlength="32"></td>
				</tr>
                <tr>
					<td>Chinese SSID Encode</td>
					<td><select name="ssid_encode">
                    	<option value="utf-8">UTF-8</option>
                        <option value="gb2312">GB2312</option>
                    </select></td>
				</tr>
				<tr>
					<td>Security Mode</td>
					<td><select name="secType">
							<option value="0">None</option>
							<option value="1">WEP</option>
							<option value="2">WPA - PSK</option>
							<option value="3">WPA2 - PSK</option>
							<option value="4">Mixed WPA/WPA2 - PSK</option>
							<option value="5">WPA</option>
							<option value="6">WPA2</option>
						</select></td>
				</tr>
				<tr id="wepAuth">
					<td>Encryption Type</td>
					<td><select name="wepSecOpt">
					<option value="open">Open</option>
					<option value="shared">Shared</option>
					<option value="802.1x">802.1x</option>
					</select></td>
				</tr>
			</table>
			<!-- 802.1x -->
			<table id="div_802" class="myTable none">
			<tbody>
				<tr>
					<td> RADIUS Server:</td>
					<td colspan="2"><input type="text" name="radius_svrip" id="wl_radius_ipaddr" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td>RADIUS Port:</td>
					<td><input type="text" name="radius_port" id="radius_port" size="5" maxlength="5">(Rangle: 1-65535,default: 1812)</td>
				</tr>
				<tr>
					<td>RADIUS Password:</td>
					<td><input name="radius_pass" id="radius_pass" maxlength="64" type="password"></td>
				</tr>
			</tbody>
			</table>
			<!-- WEP -->
			<table id="div_wep" class="myTable none">
			<tbody>
				<tr>
					<td>Default Key</td>
					<td colspan="2"><select name="wep_default_key">
					<option value="1" selected="selected">Security Key 1</option>
					<option value="2">Security Key 2</option>
					<option value="3">Security Key 3</option>
					<option value="4">Security Key 4</option>
					</select></td>
				</tr>
				<tr>
					<td>WEP Key 1 </td>
					<td width="150px"><input type="text" name="wep1" maxlength="26"/></td>
					<td><select id="WEP1Select" name="WEP1Select">
					<option value="1">ASCII</option>
					<option value="0">Hex</option>
					</select></td>
				</tr>
				<tr>
					<td>WEP Key 2 </td>
					<td><input type="text" name="wep2" maxlength="26" /></td>
					<td><select id="WEP2Select" name="WEP2Select">
					<option value="1">ASCII</option>
					<option value="0">Hex</option>
					</select></td>
				</tr>
				<tr>
					<td>WEP Key 3 </td>
					<td><input type="text" name="wep3" maxlength="26"/></td>
					<td><select id="WEP3Select" name="WEP3Select">
					<option value="1">ASCII</option>
					<option value="0">Hex</option>
					</select></td>
				</tr>
				<tr>
					<td>WEP Key 4</td>
					<td><input type="text" name="wep4" maxlength="26"/></td>
					<td><select id="WEP4Select" name="WEP4Select">
					<option value="1">ASCII</option>
					<option value="0">Hex</option>
					</select></td>
				</tr>
			 </tbody>
			 </table>
			<!-- WPA -->
			<table id="div_wpa" class="myTable none">
			<tbody>
				<tr>
					<td width="180">Cipher Type</td>
					<td><input name="cipher" value="1" type="radio" checked="checked" />AES &nbsp;
					<input name="cipher" value="3" type="radio" />TKIP &nbsp;
					<input name="cipher" value="2" type="radio" />TKIP&amp;AES
					</td>
				</tr>
				<tr id="wpaPasswd">
					<td>Key</td>
					<td><input name="passphrase" size="28" maxlength="64"/></td>
				</tr>
				<tr>
				<td>Key Update Interval</td>
					<td><input name="keyPeriod" size="4" maxlength="5"/> s(Range: 60—99999 seconds. If set to 0, key will not be updated.)</td>
				</tr>
			</tbody>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>

<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
<script src="js/wireless.js"></script>
<script>
var ssid1 = "<%wifiMultiBasic("0","ssid");%>",//"w45ap_1",//
	ssid2 = "<%wifiMultiBasic("1","ssid");%>",//"w45ap_2",//
	ssid3 = "<%wifiMultiBasic("2","ssid");%>",//"w45ap_3",//
	ssid4 = "<%wifiMultiBasic("3","ssid");%>",//"w45ap_ok";//
	ssid5 = "<%wifiMultiBasic("4","ssid");%>",//"w45ap_1",//
	ssid6 = "<%wifiMultiBasic("5","ssid");%>",//"w45ap_2",//
	ssid7 = "<%wifiMultiBasic("6","ssid");%>",//"w45ap_3",//
	ssid8 = "<%wifiMultiBasic("7","ssid");%>",//"w45ap_ok";//
	curmode = "<%wrlWizard("curmode", "something");%>",
	qvlan_en = "<%QvlanGet("qvlan_enable");%>",
	clientNum;
</script>
</body>
</html>