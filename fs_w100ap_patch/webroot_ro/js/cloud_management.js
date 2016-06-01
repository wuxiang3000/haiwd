// JavaScript Document
var Account = {},
	Account_arr = [],
	trTag = null,
	initObj = null;

$(function () {
	$("#submit").on("click", preSubmit);
	$("#cloudEnable").on("click", changeCloudEn);
	getValue();
	top.loginOut();
});

function getValue() {
	$.getJSON("goform/cloud?module=getInfo&rand=" + Math.random(), initValue);
}

function initValue(obj) {
	//type: 1
	var en = obj.enable;
	var len = obj.list.length,
		i = 0,
		str = "",
		type = "";

	initObj = obj;
	top.$(".main-dailog").removeClass("none");
	top.$("iframe").removeClass("none");
	top.$(".loadding-page").addClass("none");


	if (typeof obj.enable != "undefined") {

		if (obj.enable == "1") {
			$("#cloudEnable").attr("class", "btn-on");
			$("#cloudEnable").val(1);
			$("#cloud_account_set").removeClass("none");
			$(".cloud_help").css("display", "none");
		} else {
			$("#cloudEnable").attr("class", "btn-off");
			$("#cloudEnable").val(0);
			$("#cloud_account_set").addClass("none");
			$(".cloud_help").css("display", "block");
		}
		if (obj.sn == "" && obj.enable == "1") {
			//重复取数据

			setTimeout("getSNData()", 5000);
			$("#sn").addClass("none");
			$("#sn_img").removeClass("none");

		} else {
			$("#sn").html(obj.sn).removeClass("none");

			$("#sn_img").addClass("none");
		}
		if (!obj.password) {
			//表示没有密码	
			$("#pwd").val("");
		} else {
			$("#pwd").val(str_decode(obj.password));
		}

		var list = obj.list == "" ? [] : obj.list.split(",");

		//list[0]
		Account_arr = list;
		$("#account").val((list[0]? list[0]: "")).addPlaceholder(_("Please enter the registered email address."));;
		//showAccountsList(list);
	}
	top.initIframeHeight();
	top.$(".main-dailog").removeClass("none");
	top.$(".save-msg").addClass("none");
}

function changeCloudEn() {
	var className = $("#cloudEnable").attr("class"),
		data;
	if (className == "btn-off") {
		$("#cloudEnable").attr("class", "btn-on");
		$("#cloudEnable").val(1);
		$("#cloud_account_set").removeClass("none");
		$(".cloud_help").css("display", "none");
	} else {
		$("#cloudEnable").attr("class", "btn-off");
		$("#cloudEnable").val(0);
		$("#cloud_account_set").addClass("none");
		$(".cloud_help").css("display", "block");
	}

	top.initIframeHeight();
}


function getSNData() {

	$.getJSON("goform/cloud?module=getInfo&rand=" + new Date().toTimeString(), function (obj) {
		if (obj.enable == "1" && obj.sn == "") {

			setTimeout("getSNData()", 3000);
		} else {
			$("#sn").html(obj.sn).removeClass("none");
			$("#sn_img").addClass("none");
		}
	});

}

function addToList() {
	var temp = document.getElementById("account").value,
		trTag_id;

	//if(!(/^[a-z0-9]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/ig.test(temp)) && !(/^\d{11}$/g.test(temp))) {
	//if (!verifyEmail(temp) && !(/^((13[0-9])|(15[^4,\D])|(14[57])|(17[0678])|(18[0,0-9]))\d{8}$/g.test(temp))) {
	if (!verifyEmail(temp)) {
		showErrMsg("msg-err", _("This account didn't work. Please try a different one. "));
		return;
	}
	if (document.getElementById("modify").value == _("Add")) {
		if (typeof Account[temp] == "undefined") {
			Account[temp] = 1;
			Account_arr[Account_arr.length] = temp;
			showAccountsList(Account_arr);
		} else {
			showErrMsg("msg-err", _("The account already exists."));
			return;
		}
	} else {
		if (trTag.html() != temp && typeof Account[temp] == "undefined") {
			Account_arr[trTag.attr("id").split("_")[1]] = temp;
			delete Account[trTag.html()];
			Account[temp] = 1;

			trTag.html(temp);

		}
	}
	cancel();
}


function verifyEmail(str) {
	if (str.indexOf("@") < 0) {
		return false;
	}

	var email_frag = str.split("@");
	if (email_frag.length != 2) {
		return false;
	} else if (email_frag[0].length > 64) {
		return false;
	} else {
		var domain_frag = email_frag[1].split(".");
		if (domain_frag < 2) {
			return false;
		} else if (hasEmptyDomain(domain_frag)) {
			return false;
		} else {
			return /^[a-zA-Z0-9.!#$%&*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/ig.test(str);
		}
	}
}

function hasEmptyDomain(arr) {
	var result = false;
	for (var domain in arr) {
		if (domain == "") {
			result = true;
			break;
		}
	}
	return result;
}

function preSubmit() {

	var subObj = {},
		cloudEnable = $("#cloudEnable").val(),
		password = $("#pwd").val(),
		account = $("#account").val(),
		subStr = "";

	//密码随机生成
	if (password == "") {
		password = randomString();
	}

	if (cloudEnable == 1) {

		//除中文之外都不支持手机号码
		if (account != "" && !verifyEmail(account)) {
			if (B.getLang() != "cn" || !(/^((13[0-9])|(15[^4,\D])|(14[57])|(17[0678])|(18[0,0-9]))\d{8}$/g.test(account))) {
				showErrMsg("err-msg", _("This account didn't work. Please try a different one. "));
				return;				
			}
		}
	} else {
		account = initObj.list;
	}




	subObj = {
		"enable": cloudEnable,
		"password": str_encode(password),
		"list": account
	} 
	subStr = objTostring(subObj);
	$.post("goform/cloud?module=setInfo", subStr, callback);
}

function callback(str) {
	if (!top.isTimeout(str)) {
		return;
	}
	var num = $.parseJSON(str).errCode;
	top.showSaveMsg(num);
	if (num == 0) {
		top.advInfo.initValue();
	}
}