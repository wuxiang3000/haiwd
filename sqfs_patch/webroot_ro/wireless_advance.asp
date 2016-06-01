<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wireless-Advanced</title>
<link rel="stylesheet" href="public/style.css" />
<script src="lang/b28n.js"></script>
</head>
<body id="advance">
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/WifiAdvanceSet" method="post" name="wireless_advance" >
			<input name="GO" type="hidden" value="wireless_advance.asp" />
			<input name="wl_radio" type="hidden" value="0" />
			<table class="myTable mt20">
				<!--<tr>
					<td width="150">无线AP隔离</td>
					<td><input type="checkbox" name="enable_isolation" value="1" />
						启用 </td>
				</tr>-->
				<tr>
					<td>Beacon Interval</td>
					<td><input type="text" name="beacon" size="5" maxlength="3" />
						(Range: 20 - 999; Default: 100)</td>
				</tr>
				<tr>
					<td>Fragment Threshold</td>
					<td><input type="text" name="fragment" size="5" maxlength="4" />
						(Range: 256 - 2346; Default: 2346)</td>
				</tr>
				<tr>
					<td>RTS Threshold</td>
					<td><input type="text" name="rts" size="5" maxlength="4" />
						(Range: 1 - 2347; Default: 2347)</td>
				</tr>
				<tr>
					<td>DTIM Interval</td>
					<td><input type="text" name="dtim" size="5" maxlength="3" />
						(Range: 1 - 255; Default: 1)</td>
				</tr>
				<tr>
					<td>Receive Signal strength</td>
					<td><input type="text" name="RSSI" size="5" maxlength="4" />
						(dBm,Range: -90 - -60; Default: -80)</td>
				</tr>
				<tr> 
					<td>Interference mitigation</td>
					<td><!--<input type="text" name="txPower" size="5" maxlength="2" />-->
						<select  name="interference">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select> (Range: 0 - 4; Default: 2)</td>
				</tr>
				<tr> 
					<td>TX Power</td>
					<td><!--<input type="text" name="txPower" size="5" maxlength="2" />-->
						<select  name="txPower">
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select> (dBm,Range: 17 - 23; Default: 23)</td>
				</tr>
				<tr>
				<td>Power Lockout</td>
					<td><input type="checkbox" name="setPower" value="1"></td>
				</tr>
				<tr id="div_ap_led" name="div_ap_led" class="none">
					<td>Wireless LED</td>
					<td><input type="radio" name="wlLed" value="1" checked="">Enable
						<input type="radio" name="wlLed" value="0" style="margin-left:10px;">Disable
					</td>
				</tr>
                <tr>
					<td>Preamble</td>
					<td><input type="radio" name="Plcp" value="1" checked="" >Long Preamble
						<input type="radio" name="Plcp" value="0" style="margin-left:10px;">Short Preamble
					</td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>

<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
<script src="js/wireless.js"></script>
</body>
</html>