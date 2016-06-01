// JavaScript Document
var GLOBAL = {};
GLOBAL.pc = 0;
//当DOM元素加载完后运行
	
$(document).ready(function () {
	if (navigator.userAgent.indexOf("MSIE 6.0") != -1) {
		alert(_("The web utility requires IE 6.0 or a higher browser!"));
	}
	if (userType == "admin") {
		$('#userType').html(_("Administrator Name"));
		$('#userName').text(adminName);
	} else {
		$('#userType').html(_("User"));
		$('#userName').text(userName);
	}
	//document.getElementById("devTitle").innerHTML = (productName);
	document.title = productName;
	$('#FirwareVerion').text('Version:' + FirwareVerion);
	$("#middle_left li > a").on("click", function(){
		var hrefs = this.href;
		if (this.parentNode.className == "Bborder") {
			$(".Bborder span.red").removeClass("red");
			$(this).prev().addClass("red").closest("ul").find("ul").addClass("none");		
			if (hrefs.indexOf("status_system") != -1 || hrefs.indexOf("wireless_basic") != -1 || hrefs.indexOf("system_upgrade") != -1 || hrefs.indexOf("lan") != -1) {
				$(this).siblings("ul").removeClass("none").find("li span").removeClass("yellow").first().addClass("yellow");
			}
		} else {
			$(this).prev().addClass("yellow").parent().siblings("li").children("span.yellow").removeClass("yellow");
		}
	});
	$("#middle_left a:eq(0)").click();
});

function reboot(url,time,upgrade,restore) {//time指重启设备时间time*100/1000=time/10
	GLOBAL.my_url = url ? url : '';
	GLOBAL.my_time = time ? time : 300;
	//GLOBAL.ssl = ssl == 1 ? ssl : 0;
	GLOBAL.pageSize = getPageSize();
	$('body').append('<div id="loading_div" >' +
		'<div id="upgrade"><span class="upgrading"><span class="upgrade_pc"></span></span>' +
		'<br />' +_("Upgrading... Please do NOT disconnect power connection!") + '<span id="upgrade_text"></span></div>' +
		'<div class="rebooting mt10"><span class="reboot_pc"></span></div><br />' +
		(restore == "restore" ? _('Restoring to factory default settings... Please wait!') : _('Rebooting...Please wait!')) +
		'<span id="reboot_text"></span></div>');
	$('body').append('<div id="gbx_overlay"></div>');
	var this_obj = $('#loading_div');
	var left = (GLOBAL.pageSize.pageWidth - this_obj.width())/2;

	this_obj.css({'left':left,'top':"200px"});
	if (upgrade) {
		this_obj.css("height",180);
		upgrading();
	} else {
		$('#upgrade').hide();
		this_obj.css("height",110);
		loadding();
	}
}
function upgrading () {
	GLOBAL.pc += 1; 
	if (GLOBAL.pc > 100) {
		GLOBAL.pc = 0;
		clearTimeout(GLOBAL.time); 
		loadding();
		return;
	}
	$(".upgrade_pc").css('width',GLOBAL.pc + "%");
	$("#upgrade_text").html(GLOBAL.pc + "%");
	GLOBAL.time = setTimeout("upgrading()",450);//上传文件时间450*100/1000=45s
}
function loadding(){
	GLOBAL.pc += 1;
	if (GLOBAL.pc > 100) {
		GLOBAL.pc = 0;
		if(GLOBAL.my_url == ""){
			location.pathname = '';
		} else {
			window.location = GLOBAL.my_url;
		}
		$("#gbx_overlay,#loading_div").remove();
		clearTimeout(GLOBAL.time);
		return;
	} 
	$(".reboot_pc").css('width',GLOBAL.pc + "%");
	$("#reboot_text").html(GLOBAL.pc + "%");
	GLOBAL.time = setTimeout("loadding()",GLOBAL.my_time);
}