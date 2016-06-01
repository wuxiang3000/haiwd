<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<title id="html_title">Time Reboot</title>
<link rel="stylesheet" href="public/style.css">
<script src="lang/b28n.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form action="/goform/sysAutoReboot" method="post" name="frmSetup">
		<br>
		<br>
		<table>
			<tr>
				<td width="180px">Enable Auto Reboot</td>
				<td><input type="checkbox" id="en"></td>
			</tr>
			<tr>
				<td>AUTO Reboot Type</td>
				<td>
					<select id="sched_type" onChange="changeSchedType()">
						<option value="0"> As Interval</option>
						<option value="1">As Schedured</option>
					</select>
			   </td>
			</tr>
			<tr id="tr-1">
				<td>Reboot Interval</td>
				<td> <input type="text" id="interval_time" onKeyUp="filterV('interval_time');" value=1440>（minute,Range：10-7200）</td>
			</tr>
			<tr id="tr-2">
				<td>Time Reboot on</td>
				<td>
					<label class="radio"><input type="checkbox" id="everyday">Everyday</label>
					<label class="radio"><input type="checkbox" id="week1">Mon</label>
					<label class="radio"><input type="checkbox" id="week2">Tue</label>
					<label class="radio"><input type="checkbox" id="week3">Wed</label>
					<label class="radio"><input type="checkbox" id="week4">Thur</label>
					<label class="radio"><input type="checkbox" id="week5">Fri</label>
					<label class="radio"><input type="checkbox" id="week6">Sat</label>
					<label class="radio"><input type="checkbox" id="week7">Sun</label>
				</td>
			</tr>
			<tr id="tr-3">
				<td>Time Reboot at</td>
				<td>  	<input type="text" id="time" size="5" value="11:59">
						<label  style=" display: inline-block;">eg: 23:59</label>
				</td>
			</tr>
		</table>
		<input type="hidden" name="enable">
		<input type="hidden" name="type">
		<input type="hidden" name="interval">
		<input type="hidden" name="weekday">
		<input type="hidden" name="start_time">
		</form>
		<div id="tail">
		</div>
	</div>
</div>
<script src="public/gozila.js"></script>
<script src="public/menu.js"></script>
<script src="public/j.js"></script>
<script type="text/javascript">


	
var enable = "<%aspAutoReboot("sys","schedulereboot_enable");%>",
	sched_type = "<%aspAutoReboot("sys","schedulereboot_type");%>",
	interval = "<%aspAutoReboot("sys","schedulereboot_interval");%>",
	start_time = "<%aspAutoReboot("sys","schedulereboot_start_time");%>",
	wday = "<%aspAutoReboot("sys","schedulereboot_wday");%>";

$(document).ready(function(){
var row = wday.split(';');
		document.getElementById("head").innerHTML = tbl_head(26);
		document.getElementById("tail").innerHTML = tbl_tail("timeReboot");
		$('#en').attr('checked', !!(+enable));
		$('#time').val(start_time);
		$("#interval_time").val(interval);
		$("#sched_type").val(sched_type);
		
		//everyday init
		if(row[0] == 1) {
			$("#everyday")[0].checked = true;
		} else {
			$("#everyday")[0].checked = false;
		}
		clickEveryday();
		
		for(i = 1;i < row.length;i++) {
			$('#week' + i).attr('checked', !!(+row[i]));	
		}
		changeSchedType();
	$("#submit").on("click",preSubmit);
	$("#everyday").on("click", clickEveryday);
	
});

function clickEveryday() {
	var doc = $("#everyday")[0];
	if(doc.checked == true) {
		$("[id^='week']").attr("disabled", true);
		$("[id^='week']").attr("checked",true);
	} else {
		$("[id^='week']").removeAttr("disabled");
	}

}

function changeSchedType(){
	if(+$("#sched_type").val()){
		$("#tr-1").addClass("none");
		$("#tr-2").removeClass("none");
		$("#tr-3").removeClass("none");	
	}else{
		$("#tr-1").removeClass("none");
		$("#tr-2").addClass("none");
		$("#tr-3").addClass("none");	
	}
}

function filterV(id) {
	var value = $("#"+id).val();
	$("#"+id).val(isNaN(parseInt(value, 10)) ? '' : parseInt(value, 10));
}

function preSubmit(){
	var day = [],
		s_time = $('#time').val(),
		type = $("#sched_type").val();
	if (parent.userType == "user") {
		alert(_("You must log in as an administrator to make any change."));
		return false;
	}
	
	
	if(type == '0' && (!(/^[0-9]+$/g.test(+$("#interval_time").val())) || (+$("#interval_time").val()) < 10 || (+$("#interval_time").val()) > 7200)){
		alert(_("Reboot Interval is range from 10 to 7200 minute"));
		return;	
	}
	
	if(+type && !/^(([0-9])|([01][0-9])|(2[0-3]))\:([0-5][0-9])$/.test(s_time)) {
		alert(_("Pliease enter right Reboot time at"));
		return;
	}
	
	day.push((!!$('#everyday').attr('checked'))?1:0); //everyday
	for(i = 1;i < 8;i++) {	
		day.push((!!$('#week'+i).attr('checked'))?1:0);
	}
	
	document.forms[0].enable.value = (!!$("#en").attr("checked"))?1:0;
	document.forms[0].type.value = $("#sched_type").val();
	document.forms[0].interval.value = $("#interval_time").val();
	document.forms[0].start_time.value = $("#time").val();
	document.forms[0].weekday.value = day.join(";");
	document.forms[0].submit();
	
}
</script>
</body>
</html>