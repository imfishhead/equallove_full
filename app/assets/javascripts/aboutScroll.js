$(function(){
	
	$(window).bind('resize', function() {
		$nav = $('#nav').offset().top
	}).resize();

	$(window).bind('scroll resize', function() {
		$this_Top = $(this).scrollTop();
		if ( $this_Top > $nav ) {
			$('body').addClass('nav-fixed')
		} else {
			$('body').removeClass('nav-fixed')
		}
　}).scroll();
	

	$("#introduce-laws").click(function() {
		$('html,body').animate({
      scrollTop: $(".sec2-3").offset().top
	    }, 'slow');
	})
})

