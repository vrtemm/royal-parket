var gl_path = '';


function include(scriptUrl) {

    if (gl_path.length == 0) {

        gl_path = jQuery('#gl_path').html()

    }

    document.write('<script src="' + gl_path + scriptUrl + '"></script>');

}



/* Easing library

 ========================================================*/

include('js/jquery.easing.1.3.js');



/* ToTop

 ========================================================*/

;


(function ($) {

    var o = $('html');

    if (o.hasClass('desktop')) {

        include('js/jquery.ui.totop.js');



        $(document).ready(function () {

            $().UItoTop({easingType: 'easeOutQuart'});

        });

    }

})(jQuery);





/* SMOOTH SCROLLING

 ========================================================*/

;

/*(function ($) {

    var o = $('html');

    if (o.hasClass('desktop')) {

        include('js/jquery.mousewheel.min.js');

        include('js/jquery.simplr.smoothscroll.min.js');

        $(document).ready(function () {

            $.srSmoothscroll({

                step: 120,

                speed: 800

            });

        });

    }

})(jQuery);
*/


/* Stick up menus

 ========================================================*/

;

(function ($) {

    var o = $('html');

    if (o.hasClass('desktop')) {

        include('js/tmstickup.js');



        $(window).load(function () {

            $('.menu-wrap').TMStickUp({})

        });

    }

})(jQuery);



/* Unveil

 ========================================================*/

;

(function ($) {

    var o = $('.lazy img');



    if (o.length > 0) {

        include('js/jquery.unveil.js');



        $(document).ready(function () {

            $(o).unveil(0, function () {

                $(this).load(function () {

                    $(this).parent().addClass("lazy-loaded");

                })

            });

        });



        $(window).load(function () {

            $(window).trigger('lookup.unveil');

        });



    }

})(jQuery);









/* FancyBox

 ========================================================*/

;

(function ($) {

    var o = $('.quickview');

    var o2 = $('#default_gallery');

    if (o.length > 0 || o2.length > 0) {

        include('js/fancybox/jquery.fancybox.pack.js');

    }



    if (o.length) {

        $(document).ready(function () {

            o.fancybox({

                maxWidth: 800,

                maxHeight: 600,

                fitToView: false,

                width: '70%',

                height: '70%',

                autoSize: false,

                closeClick: false,

                openEffect: 'elastic',

                closeEffect: 'elastic'

            });

        });

    }



})(jQuery);



/* Google Map

 ========================================================*/

;

(function ($) {

    var o = document.getElementById("google-map");

    if (o) {

        document.write('<script src="//maps.google.com/maps/api/js?sensor=false"></script>');

        include('js/jquery.rd-google-map.js');



        $(document).ready(function () {

            var o = $('#google-map');

            if (o.length > 0) {

                o.googleMap({

                    marker: {

                        basic: gl_path + 'image/gmap_marker.png',

                        active: gl_path + 'image/gmap_marker_active.png'

                    },

                    styles: []

                });

            }

        });

    }

})

(jQuery);



/* Owl Carousel

 ========================================================*/

;

(function ($) {

    var o = $('.related-slider');

    var o2 = $('.product-carousel');

    if (o.length > 0 || o2.length) {

        include('js/owl.carousel.min.js');

    }

    if (o.length > 0) {

        $(document).ready(function () {

            o.owlCarousel({

                smartSpeed: 450,

                dots: true,

                nav: true,

                loop: true,

                margin: 30,

                autoPlay: 5000,

                navClass: ['owl-prev fa fa-angle-left', 'owl-next fa fa-angle-right'],

                responsive: {

                    0: {items: 1},

                    479: {items: 2},

                    992: {items: 3},

                    1199: {items: 4}

                }

            });

        });

    }



    if (o2.length) {

        $(document).ready(function () {

            o2.owlCarousel({

                smartSpeed: 450,

                dots: true,

                nav: true,

                loop: false,

                margin: 30,

                autoPlay: 5000,

                navClass: ['owl-prev fa fa-angle-left', 'owl-next fa fa-angle-right'],

                responsive: {

                    0: {items: 1},

                    480: {items: 2},

                    768: {items: 3},

                    992: {items: 3},

                    1199: {items: 4}

                }

            });

        });

    }

})

(jQuery);



/* Swipe Menu

 ========================================================*/

;

(function ($) {

    $(document).ready(function () {

        $('#page').click(function () {

            if ($(this).parents('body').hasClass('ind')) {

                $(this).parents('body').removeClass('ind');

                return false

            }

        })



        $('.swipe-control').click(function () {

            if ($(this).parents('body').hasClass('ind')) {

                $(this).parents('body').removeClass('ind');

                $(this).removeClass('active');

                return false

            }

            else {

                $(this).parents('body').addClass('ind');

                $(this).addClass('active');

                return false

            }

        })

    });



})(jQuery);



/* EqualHeights

 ========================================================*/

;

(function ($) {

    var o = $('[data-equal-group]');

    if (o.length > 0) {

        include('js/jquery.equalheights.js');

    }

})(jQuery);



$(document).ready(function () {

    /***********CATEGORY DROP DOWN****************/

    $("#menu-icon").on("click", function () {

        $("#menu-gadget .menu").slideToggle();

        $(this).toggleClass("active");
    });
	



    $('#menu-gadget .menu').find('li>ul').before('<i class="fa fa-angle-down"></i>');

    $('#menu-gadget .menu li i').on("click", function () {

        if ($(this).hasClass('fa-angle-up')) {

            $(this).removeClass('fa-angle-up').parent('li').find('> ul').slideToggle().removeClass('opened');

        }

        else {

            $(this).addClass('fa-angle-up').parent('li').find('> ul').slideToggle().addClass('opened');

        }

    });

    if ($('.breadcrumb').length) {

        var o = $('.breadcrumb li:last-child');

        var str = o.find('a').html();

        o.find('a').css('display', 'none');

        o.append('<span>' + str + '</span>');

    }



    $('#cart').find('a.dropdown-toggle').click(function (e) {

        e.preventDefault();

    })

});



var flag = true;



function respResize() {

    var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;



    if ($('aside').length) {

        var leftColumn = $('aside');

    } else {

        return false;

    }





    if (width > 767) {

        if (!flag) {

            flag = true;

            leftColumn.insertBefore('#content');

            $('.col-sm-3 .box-heading').unbind("click");



            $('.col-sm-3 .box-content').each(function () {

                if ($(this).is(":hidden")) {

                    $(this).slideToggle();

                }

            })

        }

    } else {

        if (flag) {

            flag = false;

            leftColumn.insertAfter('#content');



            $('.col-sm-3 .box-content').each(function () {

                if (!$(this).is(":hidden")) {

                    $(this).parent().find('.box-heading').addClass('active');

                }

            });



            $('.col-sm-3 .box-heading').bind("click", function () {

                if ($(this).hasClass('active')) {

                    $(this).removeClass('active').parent().find('.box-content').slideToggle();

                }

                else {

                    $(this).addClass('active');

                    $(this).parent().find('.box-content').slideToggle();

                }

            })

        }

    }

}
$(window).resize(function () {

    clearTimeout(this.id);

    this.id = setTimeout(respResize, 500);

});

// city-select handler
(function() {
    $(document).ready(function() {
        $('.city-item').on('click', function() {
            var clickedEl = $(this);
            var value = clickedEl.attr('data-city-option');
            var targetCityEl = $('.phones-block-item[data-city-value="' + value + '"]');
            if (value && targetCityEl.length) {
                targetCityEl.siblings().each(function(i, el) {
                    $(el).hide();
                });
                targetCityEl.show();
                var selectedCityDisplays = $('.city-select-body .selected-city-display');
                if (selectedCityDisplays.length) {
                    selectedCityDisplays.each(function(i, el) {
                        $(el).attr('data-select-option', value);
                        $(el).html(clickedEl.text());
                    });
                }
            }
        });
    });
})();