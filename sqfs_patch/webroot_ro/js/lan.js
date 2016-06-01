// JavaScript Document
var f;	

$(function(){
	f = document.forms[0];
	if (f.name == "lan") {
		$("#head").html(tbl_head(4));
		$("#tail").html(tbl_tail("lan"));
		f.ipMode.value = ipMode;
		$("#lanMac").html(lanMac);
		f.ip.value = ip;
		f.mask.value = mask;
		f.gateway.value = gateway;
		f.dns1.value = dns1;
		f.dns2.value = dns2;
		f.apName.value = decodeSSID(apName);
		modeChange();
		$("select[name=ipMode]").change(modeChange);
		$("#continu-lan").on("click",function() {
			top.location.href = "http://" + f.ip.value;	
		});
	} else {
		$("#head").html(tbl_head(23));
		if (f.name == "lanDhcp"){
			$("#tail").html(tbl_tail("dhcpserverset"));
			if(def_dhcpen == "1") {
				f.dhcpEnable.checked = true;
			} else {
				f.dhcpEnable.checked = false;
			}
			f.startIp.value = def_sip;
			f.endIp.value = def_eip;
			f.mask.value = def_mask;
			f.lease.value = def_lease;
			f.gateway.value = def_gateway
			f.dns1.value = def_dns1;
			f.dns2.value = def_dns2;
		} else {
			$("#dhcps_table").addClass("table-fixed");
			if (def_DHEN == 1) {
				setInterval(getDhcpStatus,5000);
				getDhcpStatus();
			}
		}
	}
});

function modeChange() {
	if (f.ipMode.value == "0") {
		$("#ipAddr,#subnet,#gateWay,#lan_dns1,#lan_dns2").addClass("none");
	} else {
		$("#ipAddr,#subnet,#gateWay,#lan_dns1,#lan_dns2").removeClass("none");
	}
}

function getDhcpStatus(){
	var my_random = Math.random();
	$.ajax({
		type: "GET",
		url: "/goform/ajaxTendaGetDhcpClients?" + my_random ,
		success: function(msg){
			var dhcp_list = msg.split(',');
			for (var i = 0; i < dhcp_list.length; i++) {
				dhcpList[i] = dhcp_list[i];
			}
			showList();
		}
	});
}

function showList() {	
	var tbd = document.getElementById("list");
	$("#list tr").remove();
	for (i = 0; i < dhcpList.length; i++) {
		var datas = dhcpList[i].split(";");
		if (datas.length!=4) break;
		tbd.insertRow(i);
		tbd.rows[i].insertCell(0).innerHTML = i+ 1;
		tbd.rows[i].insertCell(1).innerHTML = datas[0];
		tbd.rows[i].insertCell(2).innerHTML = datas[1];
		tbd.rows[i].insertCell(3).innerHTML = datas[2];
		tbd.rows[i].insertCell(4).innerHTML = timeStr(datas[3]);
	}
	for(var i = 0; i < dhcpList.length; i++) {
		$("#list").children().eq(i).find("td").eq(1).addClass("fixed");
		$("#list").children().eq(i).find("td").eq(1).addClass("fixed");
		$("#list").children().eq(i).find("td").eq(1).attr("title",$("#list").children().eq(i).find("td").eq(1).text());
	}
	
}

function preSubmit() {
	if (parent.userType == "user") {
		alert(_("You must log in as an administrator to make any change."));
		return false;
	}
	if (f.name == "lan") {
		if (ipMode == f.ipMode.value && ip == f.ip.value && mask == f.mask.value
			 && gateway == f.gateway.value && f.dns1.value == dns1 && f.dns2.value == dns2) {
			 if (apName == f.apName.value) {
				alert(_("You have already saved the settings. No need to do it again."));
				return false;
			 } else {
				 f.reboot.value = "0";
			 }
		}
		if (f.ipMode.value == 1) {//静态IP	
			if (!checkIp(f.ip,_("IP Address"))) {
				return false;
			}
			f.mask.value = f.mask.value.replace(/\d+/g,function(s){return +s;});
			if (!checkMask(f.mask)) {
				return false;
			}
			if (f.mask.value == "255.255.255.255") {
				alert(_("Subnet mask cannot be 255.255.255.255!"));
				return false;
			}
			
			if (!checkIp(f.gateway,"ISP Gateway")) {
				return ;
			}
			if (!checkMulticastIp(f.gateway.value,f.mask.value))	{
				alert(_("Please specify a valid gateway IP address!"));
				return false;
			}
			if (!checkVerifyIp(f.ip.value,f.mask.value)) {
				alert(_("Please specify a valid IP address!"));
				return false;
			}
			if (!checkMulticastIp(f.ip.value,f.mask.value)) {
				alert(_("The gateway IP address you entered is a broadcast IP address. Please specify a valid gateway IP address!"));
				return false;
			}
			if(f.ip.value.split(".")[3] == "255") {
				alert(_("Please input a valid IP address!"));
				return false;	
			}
			
			var oldmsk = mask.split("."),	
				checklanip = f.ip.value.split("."),
				checkgwip = f.gateway.value.split("."),
				checkmask = f.mask.value.split("."),		
				oldmskvalue = (((((oldmsk[0]*256)+oldmsk[1])*256)+oldmsk[2])*256)+oldmsk[3],
				newmskvalue = (((((checkmask[0]*256)+checkmask[1])*256)+checkmask[2])*256)+checkmask[3];
			if (newmskvalue > oldmskvalue) {
				if(!confirm( _('The new subnet mask is smaller than the old one, which may affect other functionalities. Are you sure you want to save the change?') )) {
					return false;
				}
			}
			if (f.ip.value == f.gateway.value) {
				alert(_("LAN IP address should not be the same as that of gateway!"));
				return false;
			}
			
			for (var i = 0; i < 4; i++) {
				if( (checklanip[i] & checkmask[i]) != (checkgwip[i] & checkmask[i])) {
					alert(_("LAN IP address should be on the same subnet as gateway!"));
					return false;
				}
			}
			if (ip != f.ip.value) {
				alert( _('If you change this LAN IP address, you must use the new one to re-log on to this utility. Are you sure you want to continue?') )
			}
			
			if (!checkIp(f.dns1,_("Primary DNS Server"))) {
				//alert(_("Please specify a valid primary DNS server address!"));
				return false;
			}
			if (!verifyIP0(f.dns2,_("Secondary DNS Server"))) {
				//alert(_("Please specify a valid secondary DNS server address!"));
				return false;
			}
			if(f.apName.value == "") {
				alert(_("Please enter a valid Device Name!"));
				return false;	
			}
			
			
			//f.submit();
		}
		if(f.apName.value == "") {
			alert(_("Please enter a valid Device Name!"));
			return false;	
		}
		
		var rel_apname = /^[0-9a-zA-Z-._\u4E00-\u9FA5]+$/;
		
		if(f.apName.value.replace(/[\u4E00-\u9FA5]/g, "aaa").length > 32) {
			alert(_("The length of device name should not be greater than 32 bits."));
			return false	
		}
		var subData = $("form[name='lan']").serialize();
		$.post("/goform/AdvSetLan",subData,function(str) {
			if(str == "0") {
				$(".divbody").addClass("none");
				$("#lan-wait").removeClass("none");
			} else if(str == "1") {
				window.location.reload(true);
			} else {
				top.location.href = "http://" + f.ip.value;	
			}
		});
		
		//return;
	} else {
		var ipe = f.endIp.value.split("."),
			ips = f.startIp.value.split("."),
			masks = f.mask.value.split("."),
			lanIps = ip.split("."),
			lanMasks = mask.split("."),
			i = 0; 
		if (!checkIp(f.startIp,_("Start IP"))) {
			return ;
		}
		if (!checkIp(f.endIp,"End IP Address")) return ;
		
		
		if (f.mask.value == "255.255.255.255") {
			alert(_("Subnet mask cannot be 255.255.255.255!"));
			return false;
		}
		if (!checkMask(f.mask)) {
			return false;
		}
		if (!checkIp(f.gateway,_("Gateway"))) {
			return false;
		}
		
		var tmp = lanMasks[0]*Math.pow(2,24) + lanMasks[1]*Math.pow(2,16) + lanMasks[2]*Math.pow(2,8) + (+lanMasks[3]),
			tmpt = masks[0]*Math.pow(2,24) + masks[1]*Math.pow(2,16) + masks[2]*Math.pow(2,8) + (+masks[3]);
		for (i = 0; i < 4; i++) {
		
			if( tmp - tmpt > 0) {
				alert(_("The Subnet mask must large or equal than LAN IP's Subnet mask!"));
				return false;
			}			
		}
		
		for (i = 0; i < 4; i++) {
			if( (ips[i] & masks[i]) != (lanIps[i] & masks[i])) {
				alert(_("The start IP and LAN IP should be in the same network segment!"));
				return false;
			}			
		}
		for (i = 0; i < 4; i++) {
			if( (ipe[i] & masks[i]) != (lanIps[i] & masks[i])) {
				alert(_("The end IP and  LAN IP should be in the same network segment!"));
				return false;
			}			
		}
		if (!checkMulticastIp(f.startIp.value,f.mask.value))	{
			alert(_("The start IP address you entered is a broadcast IP address. Please specify a valid start IP address!"));
			return false;
		}
		if (!checkVerifyIp(f.startIp.value,f.mask.value)) {
			alert(_("Please specify a valid start IP address!"));
			return false;
		}
		
		if (!checkMulticastIp(f.endIp.value,f.mask.value)) {
			alert(_("The end IP address you entered is a broadcast IP address. Please specify a valid end IP address!"));
			return false;
		}
		if (!checkVerifyIp(f.endIp.value,f.mask.value)) {
			alert(_("Please specify a valid end IP address!"));
			return false;
		}
		
		if (!checkVerifyIp(f.gateway.value,f.mask.value)) {
			alert(_("Please specify a valid gateway IP address!"));
			return false;
		}
		if(!checkIpInSameSegment(ip, mask, f.gateway.value, f.mask.value)) {
			alert(_("LAN IP address should be on the same subnet as gateway!"));
			return false;	
		}
		if (!checkMulticastIp(f.gateway.value,f.mask.value)) {
			alert(_("The gateway IP address you entered is a broadcast IP address. Please specify a valid gateway IP address!"));
			return false;
		}
		if (!checkIp(f.dns1,_("Primary DNS Server"))) {
			//alert(_("Please specify a valid primary DNS server address!"));
			return false;
		}
		if (!verifyIP0(f.dns2,_("Secondary DNS Server"))) {
			//alert(_("Please specify a valid secondary DNS server address!"));
			return false;
		}
		var tmp = ips[0]*Math.pow(2,24) + ips[1]*Math.pow(2,16) + ips[2]*Math.pow(2,8) + (+ips[3]),
			tmpt = ipe[0]*Math.pow(2,24) + ipe[1]*Math.pow(2,16) + ipe[2]*Math.pow(2,8) + (+ipe[3]);
		if(tmp > tmpt) {
			alert(_("The start IP address should be smaller than the end IP address!"));
			return false;
		}
		
		f.submit();
	}
	
}
