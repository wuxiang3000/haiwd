
var G = {},
	langStrs = {"en": "0", "cn": "1", "zh": "2"},
	language = langStrs[B.getLang()];

$(function () {
	$("#sys_backup, #sys_restore, #sys_config, #sys_pwd, #sys_reboot, #sys_restore, #sys_upgrade, #download_soft").on("click", system.preSubmit);

	$("[name='upgradeType']").on("click", changeUpgradeType);
	G.time = 0;
	checkData();
	top.loginOut();

	top.$(".main-dailog").removeClass("none");
	top.$(".save-msg").addClass("none");
	top.initIframeHeight();
});
var system = {};
var G = {};

function checkData() {
	G.validate = $.validate({
		custom: function () {},

		success: function () {

		},

		error: function (msg) {

		}
	});
}

system = {
	preSubmit: function () {
		G.index = 0;
		var id = $(this).attr("id");
		switch (id) {
		case "sys_backup":
			system.backUp();
			top.$(".main-dailog").addClass("none");
			top.$("#gbx_overlay").remove();
			return;
			break;
		case "sys_config":
			system.config();
			break;
		case "sys_pwd":
			system.password();
			break;
		case "sys_reboot":
			system.reboot();
			break;
		case "sys_restore":
			system.restore();
			break;
		case "sys_upgrade":
			system.upgrade();
			break;
		case "download_soft":
			system.download_soft();
			return;
			break;
		}
		if (G.index == 1) {
			return;
		}
		top.$(".main-dailog").addClass("none");

	},
	backUp: function () {
		if (confirm(_("Are you sure to backup your configuration to local host?"))) {
			window.location = "cgi-bin/DownloadCfg/RouterCfm.cfg";
		}
		top.$("#gbx_overlay").remove();
		//document.forms[0].submit();
	},
	config: function () {
		document.forms[0].submit();
	},
	password: function () {
		var oldPw = $('#SYSOPS').val(),
			newPw = $('#SYSPS').val(),
			confirmPw = $('#SYSPS2').val();
		if (newPw == "" || confirmPw == "") {
			showErrMsg("msg-err", _("Please enter a new/confirm password."));
			G.index = 1;
			return false;
		}

		if (/([^\x00-\x80])/.test(confirmPw) || /([^\x00-\x80])/.test(newPw)) {
			showErrMsg("msg-err", _("New/confirm password can not contains Illegal characters."));
			G.index = 1;
			return false;
		}
		
		if (newPw.charAt(0) == " " || newPw.charAt(newPw.length - 1) == " " || confirmPw.charAt(0) == " " || confirmPw.charAt(confirmPw.length - 1) == " ") {
			showErrMsg("msg-err",_("The first and last character of the New/confirm password cannot be blank space."));
			G.index = 1;
			return false;
		}

		if (newPw.length < 5 || confirmPw.length < 5) {
			showErrMsg("msg-err", _("The new/confirm password cannot be less than 5 characters."));
			G.index = 1;
			return false;
		}

		if (newPw != confirmPw) {
			showErrMsg("msg-err", _("Password mismatch!"));
			G.index = 1;
			return false;
		}

		document.forms[0].SYSOPS.value = str_encode(oldPw);
		document.forms[0].SYSPS.value = str_encode(newPw);
		document.forms[0].SYSPS2.value = str_encode(confirmPw);
		document.forms[0].submit();
	},
	reboot: function () {
		//window.location.href = "redirect.html?3";
		document.forms[0].submit();
	},
	restore: function () {
		if ($("#filename").val() == "") {
			showErrMsg("msg-err", _("Please select a file to restore."));
			G.index = 1;
			return false;
		}
		if ($("#filename").val().substr($("#filename").val().length-4) != ".cfg") {
			showErrMsg("msg-err", _("The backup file's suffix must be .cfg"));
			G.index = 1;
			return false;			
		}
		document.forms[0].submit();
		//$.post("")
	},
	upgrade: function () {
		if ($("#upgradeFile").val() == "") {
			//if($("#cur_fw_ver").html() == $("#new_fw_ver").html()) {
			showErrMsg("msg-err", _("Please select a firmware to upgrade."));
			G.index = 1;
			return false;
			//}
			//$.post("goform/SysToolSetUpgrade", "action=0",callbackUpgrade)
		} else {
			document.forms[0].submit();
		}
	},
	download_soft: function () {


			if (window.confirm(_("After the firmware is downloaded, the Router will start upgrade automatically. Keep the power supply on during the upgrade in case of damage to the Router."))) {
				$("#download_soft").attr("disabled", true);
				$.post("goform/onlineupgrade?module=setOnlineUpgradeInfo ", "op=0", callbackDownload);
			}
		}
		/*,
			begin_upgrade: function() {
				top.$(".main-dailog").addClass("none");
				//隐藏页面，显示保存进度条
				top.$(".save-msg").removeClass("none");
				top.$("#page-message").html("升级准备中，请稍候...");
				
				$("#begin_upgrade").attr("disabled", true);
				$.post("goform/onlineupgrade?module=setOnlineUpgradeInfo ", "op=1", callbackOnlineUp);
			}*/
}

function callbackDownload(str) {
	$("#download_soft").attr("disabled", false);
	var num = 0;

	if (str.indexOf("!DOCTYPE html") >= 0) {
		//被重置了页面，说明升级有问题
		num = -1;
	} else {
		num = $.parseJSON(str).errCode;
	}

	if (num == 0) {
		//继续检测数据,这里可能数据还没有来得及改变，说不定状态还是1，即检查到镜像，这个时候就不会再继续检测了
		//继续获取数据，如果没有错误码并且发现状态小于2，则继续获取

		//直接显示正在准备下载。。。，即状态2的布局
		//$('input[name="upgradeType"]').attr("disabled", true);	

		$("#download_soft, #status_progress, #download_note, #status_checked").addClass("none");


		$("#status_checking").removeClass("none").html(_("Preparing downloading..."));

		clearTimeout(G.time);
		G.time = setTimeout(function () {
			$.getJSON("goform/onlineupgrade?module=getOnlineUpgradeInfo&lang=" + language + "&rand=" + Math.random(), onlineUpgradeCheck);
		}, 100);

	} else {

		top.$("#page-message").html(_("Upgrade Error! Please check the Internet Status."));
		setTimeout(function () {
			top.$(".main-dailog").removeClass("none");
			//显示页面，隐藏保存进度条
			top.$(".save-msg").addClass("none");
		}, 1000);
	}
}

/*function callbackOnlineUp(str) {
	$("#begin_upgrade").attr("disabled", false);
	var num = $.parseJSON(str).errCode;
	
	//获取状态为6时，开始转圈圈
	
	if(num == 0) {
		checkingStatus(100);
		//window.location.href = "redirect.html?1";
	} else {
		alert(num);		
	}
}
*/
function onlineUpgradeCheck(obj) {
	if (obj.resp_code != 0 || obj.status >= 2) {
		//表示数据已经回来，或者说有错误
		showOnlineUp(obj);
	} else {

		clearTimeout(G.time);
		G.time = setTimeout(function () {
			$.getJSON("goform/onlineupgrade?module=getOnlineUpgradeInfo&lang=" + language + "&rand=" + Math.random(), onlineUpgradeCheck);
		}, 1000);
	}
}


function callbackUpgrade(str) {
	var num = $.parseJSON(str).errCode;
	if (num == 0) {
		window.location.href = "redirect.html?1";
	}
}

var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

function utf16to8(str) {
	var out, i, len, c;

	out = "";
	len = str.length;
	for (i = 0; i < len; i++) {
		c = str.charCodeAt(i);
		if ((c >= 0x0001) && (c <= 0x007F)) {
			out += str.charAt(i);
		} else if (c > 0x07FF) {
			out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
			out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
			out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
		} else {
			out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
			out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
		}
	}
	return out;
}

function base64encode(str) {
	var out, i, len;
	var c1, c2, c3;


	len = str.length;
	i = 0;
	out = "";
	while (i < len) {
		c1 = str.charCodeAt(i++) & 0xff;
		if (i == len) {
			out += base64EncodeChars.charAt(c1 >> 2);
			out += base64EncodeChars.charAt((c1 & 0x3) << 4);
			out += "==";
			break;
		}
		c2 = str.charCodeAt(i++);
		if (i == len) {
			out += base64EncodeChars.charAt(c1 >> 2);
			out += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
			out += base64EncodeChars.charAt((c2 & 0xF) << 2);
			out += "=";
			break;
		}
		c3 = str.charCodeAt(i++);
		out += base64EncodeChars.charAt(c1 >> 2);
		out += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
		out += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >> 6));
		out += base64EncodeChars.charAt(c3 & 0x3F);
	}
	return out;
}

function str_encode(str) {
	return base64encode(utf16to8(str));
}

function init() {
	var msg = location.search.substring(1) || "-1";
	if (msg == "1") {
		$("#msg-err").html(_("Wrong password!"));
		top.$(".main-dailog").removeClass("none");
	} else {
		$("#msg-err").html("&nbsp;");
	}
	$('#SYSOPS').initPassword('', true, false);
	$('#SYSPS').initPassword('', true, false);
	$('#SYSPS2').initPassword('', true, false);
	$.getJSON("goform/SysToolpassword?" + Math.random(), function (obj) {
		G.ispwd = obj.ispwd || "0";
		if (G.ispwd == "1") {
			$("#old_pwd").removeClass("none");
		} else {
			$("#old_pwd").addClass("none");
		}
		top.initIframeHeight();
	});
}

function initUpgrade() {
	var msg = location.search.substring(1) || "0";
	//1001 格式错误
	//1002 CRC校验失败
	//1003 文件大小错误
	//1004 升级失败
	//1005 内存不足，请重启路由器
	if (msg == "1001") {
		$("#msg-err").html(_("Format error!"));
	} else if (msg == "1002") {
		$("#msg-err").html(_("CRC check Failure"));
	} else if (msg == "1003") {
		$("#msg-err").html(_("File size error"));
	} else if (msg == "1004") {
		$("#msg-err").html(_("Fail to upgrade it!"));
	} else if (msg == "1005") {
		$("#msg-err").html(_("Internal memory is not enough. Please reboot the router before upgrading."));
	}
	top.$(".main-dailog").removeClass("none");
	$.getJSON("goform/SysToolGetUpgrade?" + Math.random(), callback);

	////如果云服务功能未开启，则先获取云服务功能，然后开启后，间隔5秒再次去请求


	//TODO:进行在线升级状态查询
	$.getJSON("goform/onlineupgrade?module=getOnlineUpgradeInfo&lang=" + language + "&rand=" + Math.random(), initUpgradeStatus);

}



function callback(obj) {
	$("#cur_fw_ver").html(obj.cur_fw_ver);
	//$("#new_fw_ver").html(obj.new_fw_ver);
	//$("#releaseNote").html(obj.releaseNote);
}

function checkCloudServer() {
	$.getJSON("goform/cloud?module=getInfo&rand=" + new Date().toTimeString(), function (obj) {
		if (obj.enable == 0) {
			if (!obj.password) {
				//无密码需要自动生成密码
				obj.password = str_encode(randomString());
			}
			var subObj = {
				"enable": 1,
				"password": obj.password,
				"list": obj.list
			}
			subStr = objTostring(subObj);
			$.post("goform/cloud?module=setInfo", subStr, delayCheckStatus);
		} else {
			delayCheckStatus();
		}
	});


}

function initUpgradeStatus(obj) {
	//如果状态码为2以后，即点击下载镜像后，就不允许进行本地升级了
	if (obj.status < 2) {
		$("#local_upgrade").prop("checked", true);
		$('input[name="upgradeType"]').attr("disabled", false);
		$("#local_upgrade_wrap").removeClass("none");
		$("#online_upgrade_wrap").addClass("none");
	} else {
		//即进行在线升级，不允许本地的点击
		$("#online_upgrade").prop("checked", true);
		$('input[name="upgradeType"]').attr("disabled", true);

		$("#online_upgrade_wrap").removeClass("none");
		$("#local_upgrade_wrap").addClass("none");
		//显示相应的状态
		showOnlineUp(obj);
	}
}

function showUpgradeErr(str) {

	$("#upgrade_err").removeClass("none").html(str);
	setTimeout(function () {
		$("#upgrade_err").html("");
		$("#upgrade_err").addClass("none");
	}, 1000);
}

function showOnlineUp(obj) {
	var update_info = {},
		wait_info = {},
		width_bg = parseInt($("#progress_bg").css("width"), 10),
		width_tip = parseInt($("#progress_num").css("width"), 10);
	width_bar = parseInt($("#progress_bar").css("width"), 10);
	update_info = obj.update_info;

	$("#upgrade_err").addClass("none").html("");
	if (obj.resp_code != 0) {
		$('input[name="upgradeType"]').prop("disabled", false);
		switch (obj.resp_code) {
		case 670:
			$("#status_checking, #status_progress, #download_note, #download_soft").addClass("none");
			$("#status_checked").removeClass("none");
			$("#upgrade_err").html(_("Internal memory is not enough. Please reboot the router before downloading.")).removeClass("none");

			//下载按钮不显示了
			//有版本信息显示
			break;
		case 671:
			if (G.ucloud_enable == 1 && G.count > 0) {
				//表示悄悄开启了云管理，提示不一样
				$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
				$("#status_checking").removeClass("none").html(_("Detecting new version...please wait for about %s seconds.",[G.count]));
				G.count = G.count - 5;
				checkingStatus(5000);
			} else {
				//$("#status_checking, #status_progress, #download_note").addClass("none");
				//$("#status_checked, #download_soft").removeClass("none");
				//$("#upgrade_err").html("云服务器繁忙，请稍候重试").removeClass("none");
				$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
				$("#status_checking").removeClass("none").html(_("Cloud server is busy now. Please try again later."));
				//不显示升级按钮以及版本信息
			}

			break;
		case 672:
			//显示版本信息和下载按钮
			$("#status_checking, #status_progress, #download_note").addClass("none");
			$("#status_checked, #download_soft").removeClass("none");
			//$("#upgrade_err").html("升级服务器不可用，请稍候重试").removeClass("none");
			$("#upgrade_err").html(_("Cloud server is busy now. Please try again later.")).removeClass("none");
			break;
		case 673:
			$("#status_checking, #status_progress, #download_note").addClass("none");
			$("#status_checked, #download_soft").removeClass("none");
			$("#upgrade_err").html(_("Image format error! Please try a different one.")).removeClass("none");

			//要显示版本信息和下载按钮
			break;
		case 674:
			//$("#status_checking, #download_soft, #status_progress, #download_note").addClass("none");
			//$("#upgrade_err").html("云管理功能未开启").removeClass("none");
			G.ucloud_enable = 1;
			G.count = 25;
			$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
			$("#status_checking").removeClass("none").html(_("Detecting new version...please wait for about %s seconds.",[G.count]));
			G.count = G.count - 5;
			checkCloudServer();
			break;
		case 675:
			$("#status_checking, #status_progress, #download_note").addClass("none");
			$("#status_checked, #download_soft").removeClass("none");
			$("#upgrade_err").html(_("Download error! Please try again later.")).removeClass("none");

			//显示版本信息和下载按钮
			break;
		case 676:
			//$("#status_checking, #status_progress, #download_soft, #download_note").addClass("none");
			//$("#status_checked").removeClass("none");
			//$("#upgrade_err").html("升级服务器不可用，请稍候重试").removeClass("none");
			//$("#upgrade_err").html("无法连接到互联网，请检查网络").removeClass("none");
			$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
			$("#status_checking").removeClass("none").html(_("Fail to access the Internet. Please check the Internet."));
			//不显示版本信息以及下载按钮等，

			break;
		}

	} else {
		switch (obj.status) {
		case 0:
			//正在更新
			$('input[name="upgradeType"]').prop("disabled", false);
			if (G.ucloud_enable == 1 && G.count > 0) {
				$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
				$("#status_checking").removeClass("none").html(_("Detecting new version...please wait for about %s seconds.",[G.count]));
				G.count = G.count - 5;
			} else {

				$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
				$("#status_checking").removeClass("none").html(_("Detecting new version...please wait..."));
			}
			//继续检测
			checkingStatus(5000);
			break;
		case 1:
			//表示已经完成更新检查，如果有更新字段，显示下载按钮，否则为最新版本
			$('input[name="upgradeType"]').prop("disabled", false);
			if (typeof update_info == "undefined") {
				$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
				$("#status_checking").removeClass("none").html(_("The current version is the latest. Do not need upgrade."));
			} else {
				$("#status_checking, #status_progress, #download_note").addClass("none");
				$("#status_checked, #download_soft").removeClass("none");
				//显示信息
				$("#new_fw_ver").html(update_info.new_version);
				$("#releaseNote").val(update_info.description);
			}
			break;
		case 2:
			//此时不能够再点击本地升级
			$('input[name="upgradeType"]').attr("disabled", true);

			$("#download_soft, #status_progress, #download_note, #status_checked").addClass("none");
			//$("#status_checked").removeClass("none");

			//$("#new_fw_ver").html(update_info.new_version);
			//$("#releaseNote").val(update_info.description);

			$("#status_checking").removeClass("none").html(_("Preparing downloading..."));

			//继续检测
			checkingStatus(5000);
			break;
		case 3:
			$('input[name="upgradeType"]').attr("disabled", true);

			$("#download_soft, #status_progress , #download_note, #status_checked").addClass("none");
			//$("#status_checked").removeClass("none");
			//$("#new_fw_ver").html(update_info.new_version);
			//$("#releaseNote").val(update_info.description);

			wait_info = obj.waite_info;
			$("#status_checking").removeClass("none").html(_("There are(is) %s user(s) are queuing, you may need wait for %s seconds.", [wait_info.waite_pos, wait_info.waite_time]));


			//等待next_ask_time后继续检测
			checkingStatus(wait_info.next_ask_time * 1000);
			break;
		case 4:
			$('input[name="upgradeType"]').attr("disabled", true);
			//表示正在下载，包含progress字段，更新下载进度
			$("#status_checking,#download_soft, #status_checked").addClass("none");

			$("#status_progress, #download_note").removeClass("none");

			//$("#new_fw_ver").html(update_info.new_version);
			//$("#releaseNote").val(update_info.description);

			width_bar = (width_bg - width_tip) * obj.progress / 100 + width_tip;

			$("#progress_bar").css("width", width_bar + "px");
			$("#progress_num span").html(obj.progress + "%");

			//继续检测
			checkingStatus(2000);
			break;
		case 5:
			$('input[name="upgradeType"]').attr("disabled", true);
			//下载完成后，隐藏更新内容，显示正在准备升级
			$("#status_checked, #download_soft, #status_progress, #download_note").addClass("none");
			$("#status_checking").removeClass("none").html(_("Preparing upgrade...please wait..."));

			$("#new_fw_ver").html(update_info.new_version);
			//$("#releaseNote").val(update_info.description);


			checkingStatus(2000);

			break;
		case 6:

			//top.$(".save-msg").addClass("none");	
			//window.location = "../redirect.html?1";
			top.$(".main-dailog").addClass("none");
			top.$.progress.showPro("upgrade", _("Upgrading...please wait..."));
			break;
		default:
			$('input[name="upgradeType"]').attr("disabled", false);
			top.$("#page-message").html(_("Fail to upgrade it!"));
			setTimeout(function () {
				top.$(".main-dailog").removeClass("none");
				//显示页面，隐藏保存进度条

			}, 1000);
			break;
		}
	}
	top.initIframeHeight();
}

function delayCheckStatus(data) {
	checkingStatus(5000);
}

function checkingStatus(time) {
	clearTimeout(G.time);
	G.time = setTimeout(function () {
		$.getJSON("goform/onlineupgrade?module=getOnlineUpgradeInfo&lang=" + language + "&rand=" + Math.random(), showOnlineUp);
	}, time);
}

function changeUpgradeType() {
	if ($("#local_upgrade").prop("checked")) {
		clearTimeout(G.time);
		$("#local_upgrade_wrap").removeClass("none");
		$("#online_upgrade_wrap").addClass("none");
	} else {
		$("#online_upgrade_wrap").removeClass("none");
		$("#local_upgrade_wrap").addClass("none");
		clearTimeout(G.time);
		$.getJSON("goform/onlineupgrade?module=getOnlineUpgradeInfo&lang=" + language + "&rand=" + Math.random, showOnlineUp);
	}

	top.initIframeHeight();
}

function initBackup() {
	var msg = location.search.substring(1) || "0";
	if (msg == "1") {
		$("#msg-err").html(_("Fail to restore it!"));
	}
	top.initIframeHeight();
}