$(window).on('load', function() {
	
	$(window).bind('resize', function() {
		$nav = $('#nav').offset().top
		$sub_nav = $('#sub_nav').offset().top ? $('#sub_nav').offset().top - 50 : 0
	}).resize();

	$(window).bind('scroll', function() {
		$this_Top = $(this).scrollTop();
		if ( $this_Top > $nav ) {
			$('body').addClass('nav-fixed')
		} else {
			$('body').removeClass('nav-fixed')
		}

		if ( $this_Top > $sub_nav ) {
			$('body').addClass('sub_nav-fixed')
		} else {
			$('body').removeClass('sub_nav-fixed')
		}

　}).scroll();

	$("#introduce-laws").click(function() {
		$('html,body').animate({
      scrollTop: $(".sec2-3").offset().top
	    }, 'slow');
	})
})

