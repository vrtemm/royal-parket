function getURLVar(key) {
    var value = [];
    var query = String(document.location).split('?');
    if (query[1]) {
        var part = query[1].split('&');
        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');
            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }
        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}
$(document).ready(function() {
    $('.see_next').on('click', function(){
        $('html, body').animate({
            scrollTop: $('.utp_bl').offset().top - 100
        }, 'slow');
    });
    if($(window).width() > 767) {
		$('body:not(.checkout-simplecheckout) select').niceSelect();
	}
	cols1 = $('#column-right, #column-left').length;
    if (cols1 == 2) {
        $('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
    } else if (cols1 == 1) {
        $('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
    } else {
        $('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
    }
    $('.text-danger').each(function() {
        var element = $(this).parent().parent();
        if (element.hasClass('form-group')) {
            element.addClass('has-error');
        }
    });
    $('#currency .currency-select').on('click', function(e) {
        e.preventDefault();
        $('#currency input[name=\'code\']').attr('value', $(this).attr('name'));
        $('#currency').submit();
    });
    $('#language a').on('click', function(e) {
        e.preventDefault();
        $('#language input[name=\'code\']').attr('value', $(this).attr('href'));
        $('#language').submit();
    });
    $('#search input[name=\'search\']').parent().find('button').on('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';
        var value = $('header input[name=\'search\']').val();
        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }
        location = url;
    });
    $('#search input[name=\'search\']').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('header input[name=\'search\']').parent().find('button').trigger('click');
        }
    });
    if ($('#menu,#megamenu-menu').length && $(window).width() > 768) {
        $('#menu .dropdown-menu,#megamenu-menu .dropdown-menu').each(function() {
            var menu = $('#menu,#megamenu-menu').offset();
            var dropdown = $(this).parent().offset();
            var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu,#megamenu-menu').outerWidth());
            if (i > 0) {
                $(this).css('margin-left', '-' + (i + 5) + 'px');
            }
        });
        $('#menu .nav__primary li,#megamenu-menu .nav__primary li').each(function() {
            if ($(this).children('a').attr('href') == window.location) {
                $(this).addClass('active');
            }
        });
        var hoverTimeout;
        var thisCache;
        $('#menu .dropdown,#megamenu-menu .dropdown').mouseenter(function() {
            thisCache = $(this);
            $('#menu .dropdown, #megamenu-menu .dropdown').each(function() {
                $(this).removeClass('hovered');
                $(this).find('.dropdown-menu').fadeOut(300);
                $(this).find('.dropdown-toggle').removeClass('hovered');
            })
            thisCache.addClass('hovered');
            thisCache.find('.dropdown-menu').stop(true, true).fadeIn(300);
            thisCache.find('.dropdown-toggle').addClass('hovered');
            clearTimeout(hoverTimeout);
        });
        $('#menu .dropdown,#megamenu-menu .dropdown').mouseleave(function() {
            hoverTimeout = setTimeout(function() {
                thisCache.removeClass('hovered');
                thisCache.find('.dropdown-menu').fadeOut(300);
                thisCache.find('.dropdown-toggle').removeClass('hovered');
            }, 300);
        });
    }

    $('[data-toggle=\'tooltip\']').tooltip({
        container: 'body'
    });
    $(document).ajaxStop(function() {
        $('[data-toggle=\'tooltip\']').tooltip({
            container: 'body'
        });
    });
});

var cart = {
    'add': function(product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('#cart > button').button('reset');
                if (json['redirect']) {
                    location = json['redirect'];
                }
                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('#cart-total').html(json['total']);
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    },
    'update': function(key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                $('#cart > button').button('reset');
                $('#cart-total').html(json['total']);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    },
    'remove': function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                $('#cart > button').button('reset');
                $('#cart-total').html(json['total']);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }
}
var voucher = {
    'add': function() {},
    'remove': function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                $('#cart-total').html(json['total']);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }
}
var wishlist = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();
                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                if (json['info']) {
                    $('#content').parent().before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                $('#wishlist-total').html(json['total']);
                $('html, body').animate({
                    scrollTop: 0
                }, 'slow');
            }
        });
    },
    'remove': function() {}
}
var compare = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();
                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('#compare-total').html(json['total']);
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
                }
            }
        });
    },
    'remove': function() {}
}
$(document).delegate('.agree', 'click', function(e) {
    e.preventDefault();
    $('#modal-agree').remove();
    var element = this;
    $.ajax({
        url: $(element).attr('href'),
        type: 'get',
        dataType: 'html',
        success: function(data) {
            html = '<div id="modal-agree" class="modal">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div';
            html += '  </div>';
            html += '</div>';
            $('body').append(html);
            $('#modal-agree').modal('show');
        }
    });
});
(function($) {
    $.fn.autocomplete = function(option) {
        return this.each(function() {
            this.timer = null;
            this.items = new Array();
            $.extend(this, option);
            $(this).attr('autocomplete', 'off');
            $(this).on('focus', function() {
                this.request();
            });
            $(this).on('blur', function() {
                setTimeout(function(object) {
                    object.hide();
                }, 200, this);
            });
            $(this).on('keydown', function(event) {
                switch (event.keyCode) {
                    case 27:
                        this.hide();
                        break;
                    default:
                        this.request();
                        break;
                }
            });
            this.click = function(event) {
                event.preventDefault();
                value = $(event.target).parent().attr('data-value');
                if (value && this.items[value]) {
                    this.select(this.items[value]);
                }
            }
            this.show = function() {
                var pos = $(this).position();
                $(this).siblings('ul.dropdown-menu').css({
                    top: pos.top + $(this).outerHeight(),
                    left: pos.left
                });
                $(this).siblings('ul.dropdown-menu').show();
            }
            this.hide = function() {
                $(this).siblings('ul.dropdown-menu').hide();
            }
            this.request = function() {
                clearTimeout(this.timer);
                this.timer = setTimeout(function(object) {
                    object.source($(object).val(), $.proxy(object.response, object));
                }, 200, this);
            }
            this.response = function(json) {
                html = '';
                if (json.length) {
                    for (i = 0; i < json.length; i++) {
                        this.items[json[i]['value']] = json[i];
                    }
                    for (i = 0; i < json.length; i++) {
                        if (!json[i]['category']) {
                            html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
                        }
                    }
                    var category = new Array();
                    for (i = 0; i < json.length; i++) {
                        if (json[i]['category']) {
                            if (!category[json[i]['category']]) {
                                category[json[i]['category']] = new Array();
                                category[json[i]['category']]['name'] = json[i]['category'];
                                category[json[i]['category']]['item'] = new Array();
                            }
                            category[json[i]['category']]['item'].push(json[i]);
                        }
                    }
                    for (i in category) {
                        html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
                        for (j = 0; j < category[i]['item'].length; j++) {
                            html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
                        }
                    }
                }
                if (html) {
                    this.show();
                } else {
                    this.hide();
                }
                $(this).siblings('ul.dropdown-menu').html(html);
            }
            $(this).after('<ul class="dropdown-menu"></ul>');
            $(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
        });
    }
})(window.jQuery);