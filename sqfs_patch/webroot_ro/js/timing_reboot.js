function inits() {
	var i = 0, weekSelect = weeks.split(",");
	f = document.forms[0];
	document.getElementById("head").innerHTML = tbl_head(26);
	document.getElementById("tail").innerHTML = tbl_tail("timeReboot");
	if (enableReboot == '1') {
		f.enableReboot.checked = true;
	}
	f.rebootType.value = rebootType;
	f.hour.value = hour;
	f.minute.value = minute;
	//changeTimeType(f.rebootType);
	for (; i < 7; i++) {
		if (weekSelect[i] == "1") {
			f["week" + i].checked = true;
		}
	}
	f.enableClient.value = enableClient;
	f.statics.value = statics;
}

function changeTimeType(t) {
	if (t.value == 0) {
		document.getElementById("time").style.display = "";
		document.getElementById("timeSpan").style.display = "none";
		document.getElementById("table2").style.display = "none";
	} else {
		document.getElementById("time").style.display = "none";
		document.getElementById("timeSpan").style.display = "";
		document.getElementById("table2").style.display = "";
	}
}

function preSubmit()
{
	var tmpWeeks = "", i = 0;
	for (; i < 7; i++) {
		if (f["week" + i].checked) {
			tmpWeeks += "1,"
		} else {
			tmpWeeks += "0,"
		}
	}
	f.weeksMap.value = tmpWeeks.substring(0,tmpWeeks.length - 1);
	if((!f["week0"].checked) && (!f["week1"].checked) && (!f["week2"].checked) && (!f["week3"].checked) && 
			(!f["week4"].checked) && (!f["week5"].checked) && (!f["week6"].checked))
	{
		alert(_("Please select the day(s) when you want your device to restart."));
		//f.weekMap.value = "";
		return false;
	}
	f.hour.value = +f.hour.value;
	f.minute.value = +f.minute.value;
	if (f.rebootType.value == 0) {
		if (isNaN(f.hour.value) || +f.hour.value < 0 || +f.hour.value > 23 || !/^\d+$/.test(f.hour.value)) {
			alert( _("Please enter correct time settings.") );
			f.hour.value = "";
			return false;
		}
		if (isNaN(f.minute.value) || +f.minute.value < 0 || +f.minute.value > 59 || !/^\d+$/.test(f.minute.value)) {
			alert( _("Please enter correct time settings.") );
			f.minute.value = "";
			return false;
		}
	} else {
		if (isNaN(f.enableClient.value) || f.enableClient.value < 0) {
			alert( _("Please specify a correct limit for maximum clients.") );
			f.enableClient.value = "";
			return false;
		}
		if (isNaN(f.statics.value) || f.statics.value < 0) {
			alert( _("Please specify a correct limit for maximum download traffic.") );
			f.statics.value = "";
			return false;
		}
	}
	f.submit();	
}