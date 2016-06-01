<!DOCTYPE html>
<html style="display:none;">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Timeout Setup</title>
<link href="public/style.css" rel="stylesheet">
<script src="lang/b28n.js"></script>
<script src="public/gozila.js"></script>
<script src="public/j.js"></script>
</head>
<body>
<div class="divbody">
	<div id="head"></div>
	<div class="w750">
		<form method="post" name="frmform" action='/goform/UserOverTime' id="system_overtime">
			<input type="hidden" name="overtime" value="300">
			<table width="640" class="ml20 mt20">
				<tr> 
					<td colspan="2">Login Timeout Setup</td>
				</tr>
				<tr> 
					<td width="190">Login Timeout:</td>  
					<td><input class="text" maxlength="2" name="overtimeTo" size="4" /> (1~60 minutes)</td>
				</tr>
			</table>
		</form>
		<div id="tail"></div>
	</div>
</div>
<script src="public/menu.js"></script>
<script src="js/system.js"></script>
<script>
var overtime = "<%aspTendaGetStatus("sys","overtime");%>";
</script>
</body>
</html>