<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>System | upgrading</title>
<link rel=stylesheet href=public/style.css>
<script src="lang/b28n.js"></script>
<script>
B.setTextDomain("all");	

var lanip = "<%aspTendaGetStatus("lan","lan_ip");%>",
	upgrade_sslenable = "<%aspTendaGetStatus("lan","lan_webiplansslen");%>";
	str = _("Device is upgrading,this may take about 90 seconds. Please wait..."),
	num = 5;
	
function init() {
	var url = "http://" + lanip;
	if (upgrade_sslenable == 1) {
		url = "https://" + lanip;
	}
	window.parent.reboot(url,500,1,upgrade_sslenable);
}

</script>
</head>
<body onLoad="init()">

</body>
</html>