$(function(){
	$(window).on("hashchange", function(){
		var anchor_value;
		var stripped_url = document.location.toString().split("#");
		if (stripped_url.length > 1 ){
			anchor_value = stripped_url[1];
		}
		$("ul.submenu > li.active").removeClass("active");
		$("a[href$='#" + anchor_value + "']").parent().addClass("active");
		$("#" + anchor_value).ScrollTo();
	});
});