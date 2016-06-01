<HTML>
<HEAD>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>System | reboot</TITLE>
<script type="text/javascript" src="public/gozila.js"></script>
<script type="text/javascript" src="public/menu.js"></script>
<script type="text/javascript">
var lanip = "<%getSysStatus("lan","ip");%>";
var sslenable = "<%getSysStatus("lan","webiplansslen");%>";
var webipen = "<%getSysStatus("lan","webipen");%>";
var webport = "<%getSysStatus("lan","webport");%>";

function initDirectrReboot(f)
{
	if(webipen == 1)
	{
		var url = "http://" + lanip + ":" + webport;
		if (sslenable == 1) {
			url = "https://" + lanip + ":" + webport;
		}	
	}
	else
	{
		var url = "http://" + lanip;
		if (sslenable == 1) {
			url = "https://" + lanip;
		}
	}

	window.parent.reboot(url,500);
}
</script>
<link rel=stylesheet type=text/css href=public/style.css>
</HEAD>

<BODY onLoad="initDirectrReboot(document.frmSetup);">

<form name=frmSetup id="direct_reboot" method="POST">
</FORM>

</BODY>
</HTML>



















