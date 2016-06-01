//二级目录
var G_deviceName = top.productName || "";
var menu = new Array();
menu[0] = new Array("System Status:status_system.asp");
menu[1] = new Array("2.4GHz Wireless Status:status_wireless.asp","5GHz Wireless Status:status_wireless_5g.asp");
menu[2] = new Array("2.4GHz Traffic Statistics:status_ap.asp","5GHz Traffic Statistics:status_ap_5g.asp");
menu[3] = new Array("2.4GHz Client List:status_wirelesslist.asp","5GHz Client List:status_wirelesslist_5g.asp");
menu[4] = new Array("LAN Setup:lan.asp");
menu[5] = new Array("Wireless Bridge:wireless_mode.asp");
menu[6] = new Array("2.4GHz Basic:wireless_basic.asp","5GHz Basic:wireless_basic_5g.asp");
menu[7] = new Array("2.4GHz Radio:wireless_radio.asp","5GHz Radio:wireless_radio_5g.asp");
menu[8] = new Array("2.4GHz Control:wireless_filter.asp","5GHz Control:wireless_filter_5g.asp");
menu[9] = new Array("2.4GHz Advanced:wireless_advance.asp","5GHz Advanced:wireless_advance_5g.asp");
menu[10] = new Array("Firmware Upgrade:system_upgrade.asp");
menu[11] = new Array("System Time:system_hostname.asp","Login Timeout:system_overtime.asp");
menu[12] = new Array("View Logs:system_log.asp","Log Setup:log_setting.asp");
menu[13] = new Array("Backup & Restore:system_backup.asp","Restore to Factory Default:system_restore.asp");
menu[14] = new Array("User Name & Password:system_password.asp");
menu[15] = new Array("Diagnostics:system_checktool.asp");
menu[16] = new Array("SNMP:snmp.asp");
menu[17] = new Array("System Update:system_rebooting.asp");
menu[18] = new Array("Warning:error.asp");
menu[19] = new Array("Quick Setup:wizard.asp");
menu[20] = new Array("Help:#");
menu[21] = new Array("2.4GHz WDS:wireless_wds.asp","5GHz WDS:wireless_wds_5g.asp");
menu[22] = new Array("2.4GHz QVLAN Setup:wireless_qvlan.asp","5GHz QVLAN Setup:wireless_qvlan_5g.asp");
menu[23] = new Array("DHCP Server:lan_dhcps.asp","DHCP Client List:lan_dhcp_clients.asp");
menu[24] = new Array("2.4GHz Signal Scan:wireless_channel.asp","5GHz Signal Scan:wireless_channel_5g.asp");
menu[25] = new Array("LED:system_led.asp");
menu[26] = new Array("Reboot:system_reboot.asp","Time Reboot:timing_reboot.asp");

function Click(){ 
	window.event.returnValue=false; 
} 
document.oncontextmenu=Click;

function tbl_head(i){
	var childName = window.location.toString().split("?")[0].split("/"),
		len_k = menu[i].length,
		k = 0,
		s = '<table><tr height="24"><td width=5></td>';
	for(; k < len_k; k++){	
		var m =	menu[i][k].split(":");
		if(childName[3] == m[1])
			s += '<td class="cubg1"></td><td class="cubg3"><a href="'+m[1]+'" target="_self" style="color:#fff;">'+_(m[0])+'</a></td><td class="cubg2"></td>';
		else
			s += '<td class="bg1"></td><td class="bg3"><a href="'+m[1]+'" target="_self" style="color:#000">'+ _(m[0])+'</a></td><td class="bg2"></td>';
	}
	s += '</tr></table><div id="red_line"></div>';
	return s;
}

function tbl_tail(help){	
	var m = '<br><input class="button" type="button" id ="btnsubmit"value="' + _("Save") + '" onClick=preSubmit()>';
	m += '<br><br><input class=button type=button value="' + _("Restore") + '" onClick="window.location.reload()">';
	m += '<br><br><input class=button type=button value="' + _("Help") + '" onClick=doHelp("' + help + '")>';
	return m;
}

function doHelp(t){
	window.location='do_help.htm#'+t;
}