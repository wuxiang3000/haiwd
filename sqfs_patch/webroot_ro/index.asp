<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link href="public/style.css" rel="stylesheet" />
<link href="public/index.css" rel="stylesheet" />
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script> 
<script src="public/j.js"></script> 

<!--[if IE 6]>
    <style>
     .nav_top{behavior: url("../public/csshover3.htc");}
    </style>
<![endif]-->
</head>
<body class="topbody">
<div id="top">
	<div id="top_left"></div>
	<div id="top_right"></div>
</div>
<div id="middle">
	<div id="top_right_title"><span id="userType">User Name:</span>[<span style="color: #FF0000;font-weight: bold;" id="userName">admin</span>]&nbsp;<span id="FirwareVerion"></span></div>
	<div id="middle_left"> 
	<ul>
		<li class="Bborder"><span class="red"></span><a name="status" target="rightFrame" href="status_system.asp">Status</a>
			<ul id="status" class="none ml20">
				<li><span></span><a target="rightFrame" href="status_system.asp">System Status</a></li>
				<li><span></span><a target="rightFrame" href="status_wireless.asp">Wireless Status</a></li>
				<li><span></span><a target="rightFrame" href="status_ap.asp">Traffic Statistics</a></li>
				<li><span></span><a target="rightFrame" href="status_wirelesslist.asp">Wireless Clients</a></li>
			</ul>
		</li>
		<li class="Bborder"><span></span><a target="rightFrame" href="wizard.asp">Quick Setup</a></li>
        <li class="Bborder"><span></span><a name="status" target="rightFrame" href="lan.asp">Network</a>
			<ul id="network" class="none ml20">
				<li><span></span><a target="rightFrame" href="lan.asp">LAN Setup</a></li>
				<li><span></span><a target="rightFrame" href="lan_dhcps.asp">DHCP Server</a></li>
			</ul>
        </li>
		<li class="Bborder"><span></span><a name="wl" target="rightFrame" href="wireless_basic.asp">Wireless</a>
			<ul id="wl" class="none ml20">
				<!--<li><span></span><a target="rightFrame" href="wireless_mode.asp">无线桥接</a></li>-->
				<li><span></span><a target="rightFrame" href="wireless_basic.asp">Basic</a></li>
				<li><span></span><a target="rightFrame" href="wireless_radio.asp">Radio</a></li>
				<li><span></span><a target="rightFrame" href="wireless_channel.asp">Channel Scan</a></li>
				<!--<li><span></span><a target="rightFrame" href="wireless_wds.asp">WDS</a></li>-->
				<li><span></span><a target="rightFrame" href="wireless_advance.asp">Advanced</a></li>
				<li><span></span><a target="rightFrame" href="wireless_filter.asp">Access Control</a></li>
				<li><span></span><a target="rightFrame" href="wireless_qvlan.asp">QVLAN</a></li>
			</ul>
		</li>
		<li class="Bborder"><span></span><a target="rightFrame" href="snmp.asp">SNMP</a></li>
		<li class="Bborder"><span></span><a name="tool" target="rightFrame" href="system_upgrade.asp">Tools</a>
			<ul id="tool" class="none ml20">
				<li><span></span><a target="rightFrame" href="system_upgrade.asp">Maintenance</a></li>
				<li><span></span><a target="rightFrame" href="system_hostname.asp">Time &amp; Date</a></li>
				<li><span></span><a target="rightFrame" href="system_log.asp">Logs</a></li>
				<li><span></span><a target="rightFrame" href="system_backup.asp">Configuration</a></li>
				<li><span></span><a target="rightFrame" href="system_password.asp">Username & Password</a></li>
				<li><span></span><a target="rightFrame" href="system_checktool.asp">Diagnostics</a></li>
				<li><span></span><a target="rightFrame" href="system_reboot.asp">Reboot</a></li>
				<li><span></span><a target="rightFrame" href="system_led.asp">LED</a></li>
			</ul>
		</li>
	</ul>
	</div>
	<div id="middle_right">
		<!--<div id="iframe_contain">-->
		<iframe src="status_system.asp" name="rightFrame" width="100%" height="100%" frameborder="no" scrolling="auto"></iframe>
		<!--</div>-->
	</div>
     
</div>
<div style=" position: absolute; top: 92%; height: 8%; left: 202px; background: #fafafa; width: 100%;">
	<hr>
	<i>Copyright (c) 2014 by SHENZHEN HAIWD TECHNOLOGY CO., LTD. All rights reserved.</i>
</div>
<script src="js/macro_config.js"></script>
<script>
var FirwareVerion = CONFIG_FIRWARE_VERION;

var userType = "<%getSysStatus("syslogin","usertype");%>",//"admin|user",//
	adminName = "<%getSysStatus("sys","username");%>",
	userName = "<%getSysStatus("sys","baseusername");%>",
	productName = "W100";
</script> 

<script src="js/index.js"></script>
<script src="public/menu.js"></script>
</body>
</html>
