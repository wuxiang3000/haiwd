<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Diagnostics</title>
<link rel=stylesheet type=text/css href="public/style.css">
<script src="lang/b28n.js"></script>
<script src="public/menu.js"></script>
<script src="public/gozila.js"></script>
<script src="public/j.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<form name="frmSetup" method="post" action="/goform/exeCommand" id="system_checktool">
	<input type=hidden name=go value=checktools.asp>
	<table width="640" class="ml20 mt20">
		<tbody>
			<tr> 
				<td>Input an IP(eg: 192.168.0.254) address or a domain name(eg: www.google.com):<!--(仅支持IP)-->
				</td>
			</tr>
			<tr>
				<td>Please enter:
				<input name="cmdinput" type="text" class="text" id="ipaddress" value="ping "/>
				<input name="pingbutton" type="button" class="button ml15" value="ping"/></td>
			</tr>
			<tr>
				<td><textarea name="result" cols="70" rows="10" class="p10" readonly="readonly" style="background:#000; color:#FFF" ></textarea></td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</body>
<script src="js/system.js"></script>

</html>