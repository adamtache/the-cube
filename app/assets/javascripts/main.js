$(function(){
	var pathname = window.location.pathname;
	// Cache selectors
	if($(".submenu").is(":visible") && pathname == "/about"){
		var lastId;
		menu = $(".submenu");
		headerHeight = 1;
    // All list items
    menuItems = menu.find("a");
    // Anchors corresponding to menu items
    scrollItems = menuItems.map(function(){
    	var item = $($(this).attr("href"));
    	if (item.length) { return item; }
    });

    menuItems.click(function(e){
    	e.preventDefault();
    	var href = $(this).attr("href"),
    	offsetTop = href === "#" ? 0 : $(href).offset().top;
    	$('html, body').stop().animate({ 
    		scrollTop: offsetTop
    	}, 300, function() {
          window.location.hash = href;
        });
    });
    $(window).scroll(function(){
	   // Get container scroll position
	   var fromTop = $(this).scrollTop()+headerHeight;
	   
	   // Get id of current scroll item
	   var cur = scrollItems.map(function(){
	   	if ($(this).offset().top < fromTop)
	   		return this;
	   });
	   // Get the id of the current element
	   cur = cur[cur.length-1];
	   var id = cur && cur.length ? cur[0].id : "";
	   
	   if (lastId !== id) {
	   	lastId = id;
	       // Set/remove active class
	       menuItems
	       .parent().removeClass("active")
	       .end().filter("[href=#"+id+"]").parent().addClass("active");
	   }                   
	});
}
$(".sidebar-toggle").click(function(){
	if($(".sidebar").is(':hidden')){
		$(".sidebar").show();
		$(".content").css({"margin-left" : "240px"});
	}
	else {
		$(".sidebar").hide();
		$(".content").css({"margin-left" : "0px"});
	}
});
});