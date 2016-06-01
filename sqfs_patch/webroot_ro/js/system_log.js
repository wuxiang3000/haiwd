// JavaScript Document
var pagesz = 15,
	entrynum = 0,
	editIndex = null,
	f;
	
$(function(){
	var bodyId = document.body.id;
	f = document.forms[0];
	if (bodyId == "log") {
		var selIndex = 0;
		document.getElementById("head").innerHTML = tbl_head(12);
		if (location.href.split("?").length == 2) {
			selIndex = location.href.match(/\d$/)[0];
		}
		$("select[name=logtype]").change(function(){
			document.location.href = "system_log.asp?type=" + f.logtype.value;
		});
		$("input[name=refresh]").click(function(){
			document.location.href = "system_log.asp?type=" + f.logtype.value;
		});
		$("input[name=clear]").click(function(){
			f.submit();
		})
		showLog(parseInt((syslog_list.length-1)/pagesz));
		f.logtype.value = selIndex;
	}
	if (bodyId == "logset") {
		f.check.checked = (ischeck == 1 ? true : false);
		document.getElementById("head").innerHTML = tbl_head(12);
		document.getElementById("tail").innerHTML = tbl_tail("logsetting");
		f.logsNum.value = logsNum;
		initList();
		$("#addToList").click(function(){
			if (entrynum >= 4) {
				alert(_("Up to 4 entries can be configured!"));
			} else {
				window.location="system_logadd.asp?opt=add";
			}
		});
	}
	if (bodyId == "logadd") {
		var itms = location.href.split("?")[1].split("&"),
			op = itms[0].split("=");
		var idx;
		document.getElementById("head").innerHTML = tbl_head(12);
		document.getElementById("tail").innerHTML = tbl_tail("logsetting");
		if (itms.length > 1) {
			idx = itms[1].split("=");
			if(op[1] == "edit") {
				f.op.value = "edit";
				//onEdit(idx[1]);
				var itm = reqStr.split("~")[idx[1]],
					em = itm.split(";");
				f.innerIP.value = em[0];
				f.port.value = em[1];
				f.isenable.checked = (em[2] == "1" ? true : false);
				editIndex = idx[1];
			}
		} else {
			if(op[1] == "add") {
				f.port.value = "514";	
			}	
		}
	}
})

function showLog(pg) {
	var loghtm = '',
		logtable = '',
		pagehtml = '',
		begin = pg*pagesz,
		end = (pg+1)*pagesz;
	if (syslog_list.length > logsNum) {
		syslog_list.splice(0,syslog_list.length - logsNum);
		//f.submit();
	}
	if (end > syslog_list.length) {
		end = syslog_list.length;
	}
	if (syslog_list != '') {
		for(var i = end - 1; i >= begin; i--) {
			var logs = syslog_list[i].split(";");
			loghtm += '<tr><td>' + logs[0] + '</td><td>' + logs[1] + '</td><td>' +
				logs[2] + '</td><td>' + logs[3] + '</td></tr>';
		}
	}
	logtable += '<table border="1" class="w640 tc ml20 mt20"><thead>';
	logtable += '<tr class="a4"><td width="50">' + _("Index") + '</td><td width="170">' + _("Time") + '</td><td width="70">' + _("Type") + '</td><td>' + _("Log Content") + '</td></tr>';
	logtable += '</thead><tbody id="MyTable">';
	logtable += loghtm;
	logtable += '</tbody></table>';
	document.getElementById("logs").innerHTML = logtable;
	for (var i = (parseInt((syslog_list.length-1)/pagesz));i >= 0;i--) {
		if (pg == i) {
			pagehtml += '<a href="#" style="color:black" onclick="showLog('+i+')">'+(i+1)+'</a> ';
		} else {
			pagehtml += '<a href="#" onclick="showLog('+i+')">'+(i+1)+'</a> ';
		}
	}
	if (pagehtml == '') {
		return;
	}
	document.getElementById("pages").innerHTML = _('Page %s',[pagehtml]) ;
}

function initList() {
	var strtmp = "";
	var t = document.getElementById("List");
	var itms = reqStr.split("~");
	if (reqStr == "") {
		entrynum = 0;
	} else {
		entrynum = itms.length;  //赋予目前记录条数。
	}
	strtmp += '<table width="100%" class="tc">';
	strtmp += '<thead class="a4"><tr>' +
		'<td width="50">ID</td><td width ="180">' + _("Log Server IP") + '</td>' + 
		'<td width ="120">' + _("Log Server Port") + '</td><td width ="100">' + _("Enable") + '</td><td>' + _("Action") + '</td>' +
		'</tr></thead><tbody id="MyTable">';
	for (var i = 0; i < entrynum; i++) {
		var cl = itms[i].split(";");
		strtmp +='<tr align="center"><td>'+(i+1)+'</td>';
		strtmp +='<td>'+cl[0]+'</td>';
		strtmp +='<td>'+cl[1]+'</td>';
		strtmp +='<td>'+(cl[2]==0?_("Disable"):_("Enable"))+'</td>';
		strtmp +='<td><input type="button" class="button" value="' + _("Edit") +'" onclick="onEdit('+i+')">'+
			'<input type="button" class="button" value="' + _("Delete") + '" onclick="onDel('+i+')"></td></tr>';
	}
	strtmp += "</tbody></table>"
	t.innerHTML = strtmp;
}

function onDel(index) {
	if (window.confirm( _("Are you sure you want to delete this rule?") )) {
		var itms = reqStr.split("~");
		itms.splice(index,1);
		reqStr = itms.join("~");
		preSubmit(f);
	}
}

function onEdit(index) {
	window.location = "system_logadd.asp?opt=edit&index="+index;
}

function preSubmit() {
	if (parent.userType == "user") {
		alert(_("You must log in as an administrator to make any change."));
		return false;
	}
	if (document.body.id == "logset") {
		if (isNaN(f.logsNum.value) || f.logsNum.value > 300 || f.logsNum.value < 100) {
			alert(_("The number of logs must be between 100~300!"));
			return false;
		}
		f.isoncheck.value = f.check.checked?"1":"0";
		f.entrys.value = reqStr;
	}
	if (document.body.id == "logadd") {
		var loc = "";
		if (f.innerIP.value == "") {
			alert(_("Please enter an IP address."));
			return false;
		}
		if (f.port.value == "") {
			alert(_("Please enter a port number."));
			return false;
		}
		if (!checkIp(f.innerIP,_("Log Server IP"))) {
			return false;
		}
		/*if (!ipCheck(f.innerIP.value,lanip,lanmask)) {
			alert(_("IP必须和LAN口IP:"+lanip+" 在同一网段!"));
			return false;
		}*/
		f.innerIP.value = clearInvalidIpstr(f.innerIP.value);
		var t = /^\d{1,5}$/;
		//f.port.value = parseInt(f.port.value,10);
		if (!t.test(+f.port.value) || +f.port.value < 1 || +f.port.value > 65535) {
			alert(_("Port number must be between 1 and 65535!"));
			return false;
		}
		if (f.innerIP.value == lanip) {
			alert(_("The log server IP entered is used by gateway. Please retry!"));
			return false;
		}
		var items = reqStr.split("~");
		loc = f.innerIP.value + ";" + f.port.value + ";" + (f.isenable.checked?"1":"0");
		for (var i = 0; i < items.length; i++) {
			if (editIndex == i) {
				continue;
			} else if (items[i].split(";")[0] == f.innerIP.value) {
				alert(_("No repeated log server!"));
				return false;
			}
		}
		if (reqStr != "" && editIndex == null)
			loc = "~" + loc;
		if (editIndex == null) {
			reqStr += loc;
		} else {
			var lt = reqStr.split("~");
			var sstr = "";
			lt[editIndex] = loc;
			for(var k = 0; k < (lt.length-1); k++)
				sstr += lt[k] + "~";
			sstr += lt[k];
			reqStr = sstr;
		}
		f.entrys.value = reqStr;
	}
	f.submit();
}