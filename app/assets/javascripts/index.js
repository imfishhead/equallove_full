$(window).load(function() {
	if($(".article-show h2").text().length > 24) {
		$(".article-show h2").addClass("shrink");
	}

	$(".nav-menu").click(function() {
		$(this).toggleClass('active');
		$('.nav-list').toggleClass('active');
	});

	$(".goback-btn").click(function() {
		window.history.back();
	})


	/// 婚姻平權進度條
	$(".pop-btn").click(function() {
		$("body").css("overflow", "hidden");
		var index = $(this).attr("data-pop");
		$(".pop-up").fadeIn(300);
		$(".pop-up-box").fadeOut(0);
		$(".pop-up-box[data-show=" + index + "]").fadeIn(0);
		$(".close-circle").click(function() {
			$(".pop-up").fadeOut(0);
			$("body").css("overflow", "auto");
		});
	});


	/// 數字

	window.sr = ScrollReveal();
  sr.reveal('.sec3 .reveal',{
  	 delay        : 200,
     duration     : 700,
     afterReveal  : function(domE1) {
        $('.n1').animateNumbers( 59.3 , true, 1500 );
				$('.n2').animateNumbers( 100 , true, 1500 );
     }
  });
  sr.reveal('.sec7 .reveal',{
  	 delay        : 200,
     duration     : 700,
     afterReveal  : function(domE1) {
     		$('.n3').animateNumbers( 227 , 3000 );
     }
  });
  sr.reveal('.s2-icons .reveal',500);
  sr.reveal('.s2-compare-card-box .reveal',500);
  sr.reveal('.s4-faq.reveal', { duration: 800 }, 100);
});
