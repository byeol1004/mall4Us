jQuery(function($) {
	$('.slideShow').each(function() {
		let $container = $(this);
		let $slideGroup = $container.find('.slideShow-slides');
		let $slides = $slideGroup.find('.slide');
		let $nav = $container.find('.slideShow-nav');
		let $indicator = $container.find('.slideShow-indicator');

		let slideCount = $slides.length,
			innerHTMLTag = '',
			currentIndex = 0,
			duration = 500,
			easing = 'easeInOutSine',
			interval = 3000,
			timerId;

		$slides.each(function(ind) {
			$(this).css({ left: 100 * ind + '%' });
			innerHTMLTag = innerHTMLTag + `<a href ="#">${ind + 1}</a>`;
			$indicator.html(innerHTMLTag);
		});
		//======================================
		function goToSlide(index) {
			$slideGroup.stop().animate({ left: -100 * index + '%' }, duration, easing);
			currentIndex = index;
			updateNav();
		}

		function updateNav() {
			let $navPrev = $nav.find('.prev');
			let $navNext = $nav.find('.next');

			if (currentIndex === 0) {	//첫번째 이미지가 나온다면
				$navPrev.addClass('disable');
			} else {
				$navPrev.removeClass('disable');
			}

			if (currentIndex === slideCount - 1) {	//첫번째 이미지가 나온다면
				$navNext.addClass('disable');
			} else {
				$navNext.removeClass('disable');
			}
			$indicator.find('a').removeClass('active')
				.eq(currentIndex).addClass('active');
		}
		function startTimer() {
			timerId = setInterval(function() {
				let nextIndex = (currentIndex + 1) % slideCount
				goToSlide(nextIndex);
			}, interval);
		}
		function endTimer() {
			clearInterval(timerId);
		}
		//========필요한 함수들을 정의해둠==========

		$nav.on('click', 'a', function(event) {
			event.preventDefault();
			if ($(this).hasClass('prev')) {
				goToSlide(currentIndex - 1);
			} else {
				goToSlide(currentIndex + 1);
			}
		});

		$indicator.on('click', 'a', function(event) {
			event.preventDefault();
			if (!$(this).hasClass('active')) {
				goToSlide($(this).index());
			}
		});
		$container.on({
			mouseenter: endTimer,
			mouseleave: startTimer
		});
		goToSlide(currentIndex);
		startTimer();
	});
});