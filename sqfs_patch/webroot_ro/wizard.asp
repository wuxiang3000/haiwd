<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quick Setup</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
</head>
<body id="mode">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form name="frmSetup" method="post" action="/goform/wifiWizard">
		<!--<input type="hidden" name="wl_radio" value="0">-->
		<input type="hidden" name="extend_wl">
			<div id="page0">
				<table class="myTable mt20" >
					<tr>
						<td>WIFI Radio</td>
						<td><select name="wl_radio" id="wl_radio">
							<option value="0">2.4GHz</option>
							<option value="1">5GHz</option>
                            </select>
						</td>
					</tr>
					<tr>
						<td>Mode</td>
						<td><label class="pr20">
							<input type="radio" name="workmode" value="ap" checked>AP Mode
								</label>
							<label class="pr20">
								<input type="radio" name="workmode" value="wds">WDS Mode
							</label>
							<label class="pr20">
								<input type="radio" name="workmode" value="apclient">APClient Mode
							</label>
						</td>
					</tr>
				</table>
			</div>
			<div id="page1">
				<table class="myTable" >
					<tr>
						<td>SSID</td>
						<td><input type="text" id="ssid" name="ssid" maxlength="32" value=""></td>
					</tr>
 	 	
					<tr>
						<td>Security Mode</td>
						<td><select name="secType" id="secType">
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
						<td>Authentication Type</td>
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
						<td>RADIUS Server:</td>
						<td colspan="2"><input type="text" name="radius_svrip" size="15" maxlength="15"></td>
					</tr>
					<tr>
						<td>RADIUS Port:</td>
						<td><input type="text" name="radius_port" size="5" maxlength="5"></td>
					</tr>
					<tr>
						<td>RADIUS Password:</td>
						<td><input name="radius_pass" maxlength="64" type="password"></td>
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
						<td>WEP Key 4 </td>
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
						<td>Security Key</td>
						<td><input name="passphrase" size="28" maxlength="64"/></td>
					</tr>
					<!--<tr>
						<td>密钥更新周期</td>
						<td><input name="keyPeriod" size="4" maxlength="5"/> 秒（范围：60—99999，0代表不更新。）</td>
					</tr>-->
				</tbody>
				</table>
				<div id="page10" class="none">
					<table class="myTable" id="wdsMac">
						<tr class="none">
							<td width="30%">MAC Address</td>
							<td><input type="text" name="wdsMac1" size=20 maxlength=17 value="">
								(Status:<span id="macSta1"></span>)<input type="hidden" name="wdslist" value="c8:3a:35:3c:10:b8~~~">
								</td>
						</tr>
						<tr class="none">
							<td>MAC Address</td>
							<td><input type="text" name="wdsMac2" size=20 maxlength=17 value="">
								(Status:<span id="macSta2"></span>)</td>
						</tr>
						<tr class="none">
							<td>MAC Address</td>
							<td><input type="text" name="wdsMac3" size=20 maxlength=17 value="">
								(Status:<span id="macSta3"></span>)</td>
						</tr>
						<tr class="none">
							<td>MAC Address</td>
							<td><input type="text" name="wdsMac4" size=20 maxlength=17 value="">
								(Status:<span id="macSta4"></span>)</td>
						</tr>
						<tr id="apclientMac" class="none">
							<td>Uplink AP MAC Address</td>
							<td><input type="text" name="upMac" size=20 maxlength=17 value=""></td>
						</tr>
						<tr id="apNetmode" class="none">
							<td>The Uplinked AP's Network Mode</td>
							<td><input type="text" name="nettype" id="nettype" readOnly></td>
						</tr>
						<tr id="apChannel">
							<td>The Uplinked AP's channel</td>
							<td><input type="text" name="channel" id="channel" readOnly></td>
						</tr>
						<tr id="apWdsChannel" class="none">
							<td>The Uplink AP's Channel Bandwidth</td>
							<td><input type="text" id="band_width" name="band_width" readOnly></td>
						</tr>
						
                        <tr id="extend" class="none">
							<td>The Uplinked AP's Extension Channel</td>
							<td><input type="text" id="extend_channel" name="extend_channel" readOnly></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
		<div id="stepNext" class="fl w80 ml10">
			<br><input type="button" class="button" value="Save" name="save">
			<br><br><input type="reset" class="button" value="Restore" name="cancel" onClick="window.location.reload()">
			<br><br><input type="button" class="button" value="Help" name="help"  onclick="doHelp('wl_wizard')">
		</div>
	</div>
	<!--scan-->
	<div class="tc" style="width:640px; clear:both"><input name="wlScan" id="wlScan" type="button" class="button1 bc" value="Enable Scan" /></div>
	<table class="tc ml20" style="min-width:700px" border="1" id="wlScanTab">
		&nbsp;
	</table>
</div>


<script src="js/wireless.js"></script>
<script>
var step = 0,
	curmode = "<%wrlWizard("curmode", "something");%>",//0:ap;1:wds;2:apclient
	curmode5g = "<%wrlWizard5g("curmode", "5");%>",//0:ap;1:wds;2:apclient
	enableCliNum = "<%wrlWizard("enableCliNum", "something");%>",
	apwdsDate = {
		ssid:"<%wrlWizard("ap","ssid");%>",
		secType:"<%wrlWizard("ap","securitymode");%>",
		wep_auth:"<%wrlWizard("ap","wepmode");%>",
		wep_default_key:"<%wrlWizard("ap","wepindex");%>",
		wep_key_1:"<%wrlWizard("ap","wepkey1");%>",
		wep_key_2:"<%wrlWizard("ap","wepkey2");%>",
		wep_key_3:"<%wrlWizard("ap","wepkey3");%>",
		wep_key_4:"<%wrlWizard("ap","wepkey4");%>",
		radius_svrip:"<%wrlWizard("ap","radius_svrip");%>",
		radius_port:"<%wrlWizard("ap","radius_port");%>",
		radius_pass:"<%wrlWizard("ap","radius_pass");%>",
		cipher:"<%wrlWizard("ap","wpaalgo");%>",
		passphrase:"<%wrlWizard("ap","wpapasswd");%>",
		macAddr:"<%wrlWizard("wds","extra_mac");%>",
		nettype:"<%wrlWizard("wds","extra_netmode");%>",
		channel:"<%wrlWizard("wds","channel");%>",
		extend_channel:"<%wrlWizard("wds","extend_channel");%>",
		band_width:"<%wrlWizard("wds","band_width");%>"
	},
	apclientDate = {
		ssid:"<%wrlWizard("apclient","ssid");%>",
		secType:"<%wrlWizard("apclient","securitymode");%>",
		wep_auth:"<%wrlWizard("apclient","wepmode");%>",
		wep_default_key:"<%wrlWizard("apclient","wepindex");%>",
		wep_key_1:"<%wrlWizard("apclient","wepkey1");%>",
		wep_key_2:"<%wrlWizard("apclient","wepkey2");%>",
		wep_key_3:"<%wrlWizard("apclient","wepkey3");%>",
		wep_key_4:"<%wrlWizard("apclient","wepkey4");%>",
		radius_svrip:"<%wrlWizard("apclient","radius_svrip");%>",
		radius_port:"<%wrlWizard("apclient","radius_port");%>",
		radius_pass:"<%wrlWizard("apclient","radius_pass");%>",
		cipher:"<%wrlWizard("apclient","wpaalgo");%>",
		passphrase:"<%wrlWizard("apclient","wpapasswd");%>",
		macAddr:"<%wrlWizard("apclient","extra_mac");%>",
		channel:"<%wrlWizard("apclient","channel");%>"
	},
	apwdsDate5g = {
		ssid:"<%wrlWizard5g("ap","ssid");%>",
		secType:"<%wrlWizard5g("ap","securitymode");%>",
		wep_auth:"<%wrlWizard5g("ap","wepmode");%>",
		wep_default_key:"<%wrlWizard5g("ap","wepindex");%>",
		wep_key_1:"<%wrlWizard5g("ap","wepkey1");%>",
		wep_key_2:"<%wrlWizard5g("ap","wepkey2");%>",
		wep_key_3:"<%wrlWizard5g("ap","wepkey3");%>",
		wep_key_4:"<%wrlWizard5g("ap","wepkey4");%>",
		radius_svrip:"<%wrlWizard5g("ap","radius_svrip");%>",
		radius_port:"<%wrlWizard5g("ap","radius_port");%>",
		radius_pass:"<%wrlWizard5g("ap","radius_pass");%>",
		cipher:"<%wrlWizard5g("ap","wpaalgo");%>",
		passphrase:"<%wrlWizard5g("ap","wpapasswd");%>",
		macAddr:"<%wrlWizard5g("wds","extra_mac");%>",
		nettype:"<%wrlWizard5g("wds","extra_netmode");%>",
		channel:"<%wrlWizard5g("wds","channel");%>",
		extend_channel:"<%wrlWizard5g("wds","extend_channel");%>",
		band_width:"<%wrlWizard5g("wds","band_width");%>"
	},
	apclientDate5g = {
		ssid:"<%wrlWizard5g("apclient","ssid");%>",
		secType:"<%wrlWizard5g("apclient","securitymode");%>",
		wep_auth:"<%wrlWizard5g("apclient","wepmode");%>",
		wep_default_key:"<%wrlWizard5g("apclient","wepindex");%>",
		wep_key_1:"<%wrlWizard5g("apclient","wepkey1");%>",
		wep_key_2:"<%wrlWizard5g("apclient","wepkey2");%>",
		wep_key_3:"<%wrlWizard5g("apclient","wepkey3");%>",
		wep_key_4:"<%wrlWizard5g("apclient","wepkey4");%>",
		radius_svrip:"<%wrlWizard5g("apclient","radius_svrip");%>",
		radius_port:"<%wrlWizard5g("apclient","radius_port");%>",
		radius_pass:"<%wrlWizard5g("apclient","radius_pass");%>",
		cipher:"<%wrlWizard5g("apclient","wpaalgo");%>",
		passphrase:"<%wrlWizard5g("apclient","wpapasswd");%>",
		macAddr:"<%wrlWizard5g("apclient","extra_mac");%>",
		channel:"<%wrlWizard5g("apclient","channel");%>"
	};
var macsta = "<%WDSStausGet("wds_sta", "24g");%>",
	macsta5g = "<%WDSStausGet("wds_sta", "5g");%>",
	macstr = [_("Disconnected"),_("Connected"),_("Unknown")],
	macClass = ["red","blue",""];
var g2_ssid1 = "<%wifiMultiBasic("0","ssid");%>",//"w45ap_1",//
	g2_ssid2 = "<%wifiMultiBasic("1","ssid");%>",//"w45ap_2",//
	g2_ssid3 = "<%wifiMultiBasic("2","ssid");%>",//"w45ap_3",//
	g2_ssid4 = "<%wifiMultiBasic("3","ssid");%>",//"w45ap_ok";//
	g2_ssid5 = "<%wifiMultiBasic("4","ssid");%>",//"w45ap_1",//
	g2_ssid6 = "<%wifiMultiBasic("5","ssid");%>",//"w45ap_2",//
	g2_ssid7 = "<%wifiMultiBasic("6","ssid");%>",//"w45ap_3",//
	g2_ssid8 = "<%wifiMultiBasic("7","ssid");%>";//"w45ap_ok";//
var g5_ssid1 = "<%wifiMultiBasic5g("0","ssid");%>",//"w45ap_1",//
	g5_ssid2 = "<%wifiMultiBasic5g("1","ssid");%>",//"w45ap_2",//
	g5_ssid3 = "<%wifiMultiBasic5g("2","ssid");%>",//"w45ap_3",//
	g5_ssid4 = "<%wifiMultiBasic5g("3","ssid");%>";//"w45ap_ok";//
</script>
</body>
</html>