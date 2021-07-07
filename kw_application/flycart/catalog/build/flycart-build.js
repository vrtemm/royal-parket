
// JournalQuickView iframe init
function JournalQuickView() {
	this.init();
}

(function() {
	'use strict';
	
	$.ajaxPrefilter(function(options, originalOptions, jqXHR){
		if (options.url === "index.php?route=checkout/cart/add")
		{
			jqXHR.abort();
		}
	});

	var kwFlycart = angular.module('kwFlycart', ['ngResource', 'ngSanitize', 'ngAnimate', 'ngRetina', 'ui.bootstrap', 'ui.bootstrap.datetimepicker', 'flow']);

	kwFlycart.config(['$httpProvider', '$locationProvider', 'flowFactoryProvider', function($httpProvider, $locationProvider, flowFactoryProvider) {

		flowFactoryProvider.defaults = {
			singleFile: true,
			target: 'index.php?route=tool/upload',
			testChunks: false,
			fileParameterName: 'file',
			successStatuses: [200, 201, 202]
		};

		$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
		
		$httpProvider.defaults.transformRequest = [function(data) {
			return angular.isObject(data) && String(data) !== '[object File]' ? jQuery.param(data) : data;
		}];
		
		$locationProvider.html5Mode(true);
	}]);
	
	kwFlycart.factory('FlycartTools', function() {
		var tools = angular.element('#flycartTools').text();
		
		return JSON.parse(tools);
	});

	kwFlycart.controller('kwFlycartController', [
	'$scope',
	'$http',
	'$timeout',
	'$attrs',
	'$document',
	'$templateCache',
	'$compile',
	'$interpolate',
	'FlycartTools',
	function ($scope, $http, $timeout, $attrs, $document, $templateCache, $compile, $interpolate, FlycartTools) {

		$scope.retina               = FlycartTools.retina;
		$scope.continue_btn         = FlycartTools.continue_btn;
		$scope.viewcart_btn         = FlycartTools.viewcart_btn;
		$scope.checkout_btn         = FlycartTools.checkout_btn;
		$scope.popup_footer_items   = FlycartTools.popup_footer_items;
		$scope.popup_footer_weight  = FlycartTools.popup_footer_weight;
		$scope.popup_footer_total   = FlycartTools.popup_footer_total;
		$scope.show_totals          = FlycartTools.show_totals;
		$scope.noti_type            = FlycartTools.noti_type;
		$scope.optionsLoading       = false;
		$scope.widget_null          = FlycartTools.widget_null;
		$scope.event                = null;

		$scope.dateOptions = {
			readonlyInput: true,
			showWeeks: false,
			startingDay: 1
		};

		$scope.timeOptions = {
			showMeridian: false
		};

		$scope.flycartWidgetAppend = function() {
			var widget = angular.element('[flycart="widget"]'),
				module = angular.element('[flycart="module"]'),
				products = angular.element('[flycart="products"]');

			if (widget.length) {
				var tmplWidget = $templateCache.get('flycartWidget.html').trim();

				if (widget.length > 1) {
					widget.each(function() {
						if (this.id !== 'kw-base-widget') {
							angular.element(this).html($compile(tmplWidget)($scope));
						}
					});
				}
				else {
					angular.element('body').append($compile(tmplWidget)($scope));
				}
			}

			if (module.length) {
				var tmplModule = $templateCache.get('flycartModule.html').trim();
				module.html($compile(tmplModule)($scope));
			}

			if (products.length) {
				var tmplProducts = $templateCache.get('flycartProducts.html').trim();
				products.html($compile(tmplProducts)($scope));
			}
		};

		$scope.widgetContent = function(content) {
			content = content.replace('[items]', '{{ cart.count }}');
			content = content.replace('[name]', '{{ cart.products.length }}');
			content = content.replace('[total]', '{{ cart.total }}');

			return $interpolate(content)($scope);
		};

		$scope.flycartUpdate = function() {
			var width, height;

			if (FlycartTools.module_type === 'module') {
				width = FlycartTools.module_imgage_width;
				height = FlycartTools.module_imgage_height;
			}
			else {
				width = FlycartTools.popup_imgage_width;
				height = FlycartTools.popup_imgage_height;
			}

			$http.post(FlycartTools.url + 'module/kw_flycart/loader', { 'width': width, 'height': height }).then(function(response) {
				$scope.cart = response.data || {};
				$scope.widget_empty = ($scope.cart.count > 0) ? 'true' : FlycartTools.widget_empty;
				$scope.relatedHover();
			});
		};

		$scope.flycartWidgetAppend();
		$scope.flycartUpdate();

		$scope.flycartOpen = function(name) {
			var tmpl = $templateCache.get('flycartProducts.html').trim(), width, height;

			if (FlycartTools.module_type === 'module') {
				width = FlycartTools.module_imgage_width;
				height = FlycartTools.module_imgage_height;
			}
			else {
				width = FlycartTools.popup_imgage_width;
				height = FlycartTools.popup_imgage_height;
			}

			if (FlycartTools.click_action === 'flycart' || FlycartTools.click_action_mod === 'flycart' && name === 'standart') {
				$http.post(FlycartTools.url + 'module/kw_flycart/loader', { 'width': width, 'height': height }).then(function(response) {
					$scope.cart = response.data || {};
					$scope.popupOpen(tmpl, 'default');
				});
			}
			else if (FlycartTools.click_action === 'page' && name === 'widget') {
				location.href = FlycartTools.click_action_link;
			}
		};

		$scope.$on('quantity-update', function(event, key, quantity) {
			var object = {};

			object[key] = quantity;

			$http.post(FlycartTools.url + 'module/kw_flycart/quantityUpdate', { 'quantity': object }).then(function(response) {
				$scope.cart = response.data || {};
				$scope.standartCartUpdate();
				$scope.relatedHover();
			});
		});

		$scope.removeProduct = function(key) {
			$http.post(FlycartTools.url + 'module/kw_flycart/removeProduct', { 'remove': key }).then(function(response) {
				$scope.cart = response.data || {};
				$scope.standartCartUpdate();
				$scope.relatedHover();
				$scope.widget_empty = ($scope.cart.count > 0) ? 'true' : FlycartTools.widget_empty;
			});
		};

		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			var param = $.unserialize(options.url);

			if (param.remove) {
				$scope.flycartUpdate();
			}
		});

		$scope.target = null;
		$scope.targetOffset = null;

		$scope.calledButtons = function() {
			$timeout(function() {
				$document.on('click', FlycartTools.button_others, function() {
					$scope.target = this;
					$scope.targetOffset = angular.element(this).offset();
					$scope.showNotice = false;
					$scope.finishOffset = angular.element('#flycart-widget').offset();

					if (FlycartTools.module_type === 'standart') {
						$scope.finishOffset = angular.element(FlycartTools.standart_cart).offset();
					}
					else if (FlycartTools.module_type === 'module') {
						$scope.finishOffset = angular.element('.flycart-module-container').offset();
					}

					var product_id = 0;

					if (angular.isDefined(FlycartTools.product_id_all) && FlycartTools.product_id_all !== 'angular.element(this).attr(\'onclick\')') {
						product_id = eval(FlycartTools.product_id_all);
					}
					else {
						if (angular.element(this).is('[onclick]')) {
							product_id = angular.element(this).attr('onclick').split(',')[0].replace(/[^\d+,]/g, '');
						}
						else if (angular.element(this).is('[data-id]')) {
							product_id = angular.element(this).data('id');
						}
					}

					$http.post(FlycartTools.url + 'module/kw_flycart/productMinimal', { 'product_id': product_id }).then(function(quantity) {
						$http.post(FlycartTools.url + 'module/kw_flycart/addProduct',
							{ 'product_id': product_id, 'quantity': quantity.data }).then(function(response) {
								if (!response.data.redirect) {
									var data = response.data || {};

									$scope.widget_empty = 'true';
									$scope.productEffects(product_id, data);
								}
								else if (response.data.redirect && FlycartTools.options === 'true') {
									$scope.productOptions(product_id);
								}
								else {
									location.href = response.data.redirect;
								}
							});
					});
				});
			});
		};

		$scope.calledProduct = function() {
			$timeout(function() {
				$document.on('click', FlycartTools.button_product, function() {
					$scope.target = this;
					$scope.targetOffset = angular.element(this).offset();
					$scope.showNotice = false;
					$scope.finishOffset = angular.element('#flycart-widget').offset();

					if (FlycartTools.module_type === 'standart') {
						$scope.finishOffset = angular.element(FlycartTools.standart_cart).offset();
					}
					else if (FlycartTools.module_type === 'module') {
						$scope.finishOffset = angular.element('.flycart-module-container').offset();
					}

					var product_id = angular.element('[name*="product_id"]').val(),
						quantity = angular.isDefined(angular.element('[name*="quantity"]').val()) ? angular.element('[name*="quantity"]').val() : 1,
						options = angular.element('[name*="option"]'),
						optionObject = {}, checkboxesArray = [], nameObject = {}, checkboxes = {};

					for (var key in options) {
						if (options.hasOwnProperty(key) && options[key].name) {
							if (options[key].type !== "checkbox" && options[key].type !== "radio") {
								nameObject[options[key].name] = options[key].value;
								angular.extend(optionObject, nameObject);
							}
							else if (options[key].type === "radio" && angular.element(options[key]).is(':checked')) {
								nameObject[options[key].name] = options[key].value;
								angular.extend(optionObject, nameObject);
							}
							else if (options[key].type === "checkbox" && angular.element(options[key]).is(':checked')) {
								checkboxesArray.push(options[key].value);
								nameObject[options[key].name] = checkboxesArray;
								angular.extend(optionObject, nameObject);
							}
						}
					}

					angular.extend(optionObject, { 'quantity': quantity }, { 'product_id': product_id });

					$scope.addToCartOptions(false, optionObject, product_id)
				});
			});
		};

		$scope.calledButtons();
		$scope.calledProduct();

		// JournalQuickView iframe init
		JournalQuickView.prototype.init = function() {
			$scope.flycartUpdate();
		};

		$scope.productEffects = function(product_id, data) {
			angular.element('#flycart-flyer').remove();

			var flyer = '<div id="flycart-flyer" />';

			if (FlycartTools.effect_type === 'product' || FlycartTools.effect_type === 'custom' && FlycartTools.effect_product_img === 'true') {
				$http.post(FlycartTools.url + 'module/kw_flycart/productImage', { 'product_id': product_id }).then(function(response) {
					flyer = '<div id="flycart-flyer"><img src="' + response.data + '" alt /></div>';

					angular.element('body').append(flyer);
					$scope.flyAnimation(data, product_id);
				});
			}
			else {
				angular.element('body').append(flyer);
				$scope.flyAnimation(data, product_id);
			}
		};

		$scope.flyAnimation = function(data, product_id) {
			if (FlycartTools.effect_type === 'off') {
				$scope.cart = data;
				$scope.standartCartUpdate();
				$scope.flycartNotification(product_id);

				return;
			}

			$timeout(function() {

				var flyer = angular.element('#flycart-flyer'),
					target = angular.element($scope.target),
					finish = angular.element('#flycart-widget');

				if (FlycartTools.effect_rotate === 'true') {
					flyer.addClass('fly-rotate');
				}

				if (FlycartTools.module_type === 'standart') {
					finish = angular.element(FlycartTools.standart_cart);
				}
				else if (FlycartTools.module_type === 'module') {
					finish = angular.element('.flycart-module-container');
				}

				flyer.css({'top': ($scope.targetOffset.top - target.height()), 'left': $scope.targetOffset.left});

				if (FlycartTools.effect_type !== 'custom') {
					var top = ( $scope.finishOffset.top + (finish[0].clientHeight / 2) - (flyer[0].clientHeight / 2) + parseInt(FlycartTools.effect_frame_offset_top) ),
						left = ( $scope.finishOffset.left - finish[0].clientWidth + parseInt(FlycartTools.effect_frame_offset_left) );

					if (FlycartTools.module_type === 'module') {
						top = ( $scope.finishOffset.top + (finish[0].clientHeight / 2) );
						left = $scope.finishOffset.left;
					}

					flyer.animate({
						'top': top,
						'left': left
					}, Number(FlycartTools.effect_frame_speed), function () {
						angular.element(flyer[0]).remove();

						$timeout(function() {
							$scope.countChange = true;
						}, 100);

						$timeout(function () {
							$scope.cart = data;
							$scope.standartCartUpdate();
							$scope.flycartNotification(product_id);
						}, 200);

						$timeout(function() {
							$scope.countChange = false;
						}, 600);
					});
				}

				if (FlycartTools.effect_type === 'custom') {
					FlycartCustomEffects.prototype.params = function() {
						this.flyer = flyer;
						this.target = target;
						this.targetOffset = targetOffset;
						this.finish = finish;
					};

					FlycartCustomEffects.prototype.callback = function() {
						$timeout(function() {
							$scope.cart = data;
							$scope.standartCartUpdate();
							$scope.flycartNotification(product_id);
						}, 200);
					};

					new FlycartCustomEffects();
				}
			});
		};

		$scope.productOptions = function(product_id) {
			$http.post(FlycartTools.url + 'module/kw_flycart/productOptions', { 'product_id': product_id }).then(function(response) {
				$scope.options = response.data;
				$scope.optionsTotal = parseFloat(response.data.total.replace(/[^\d+\\.]+/g, '')) / parseInt(response.data.minimum);

				if (response.data.special) {
					$scope.optionsSpecial = parseFloat(response.data.special.replace(/[^\d+\\.]+/g, '')) / parseInt(response.data.minimum);
				}

				$scope.optionsQuantity = response.data.minimum;
				$scope.flyoptions = {};

				var tmpl = $templateCache.get('flycartOptions.html').trim(), file = [];

				for (var key in $scope.options) {
					if($scope.options.hasOwnProperty(key) && angular.isObject($scope.options[key])) {
						if ($scope.options[key].type === 'file') {
							file.push($scope.options[key]);
						}
					}
				}

				$scope.popupOpen(tmpl, 'default options');

				$scope.$watch('flyoptions.quantity', function (newVal, oldVal) {
					$scope.optionsQuantity = newVal;
					$scope.priceRecalc();
				}, true);
			});
		};

		$scope.uploadErrorMessage = [];
		$scope.uploadSuccessMessage = [];

		$scope.uploadSuccess = function($file, $message, id) {
			var message = JSON.parse($message);

			if (message.success) {
				$scope.uploadSuccessMessage[id] = message.success;
				$scope.flyoptions[id] = message.file;
			}
			else {
				$scope.uploadErrorMessage[id] = message.error;
			}

			$file.flowObj.files = [];
		};

		$scope.priceFormat = function(element, total, pattern) {
			var format = total.toFixed(2).toString().split('');

			element.replace(/[-+]?([^0-9]\.?[^0-9]+|[^0-9\\.]+)/g, function(symbol0, symbol1, index, data) {
				if (symbol0 !== '' && symbol0 !== ' ') {
					if (index > 0) {
						format.push(symbol0);
					} else {
						format.unshift(symbol0);
					}

					format = format.join('');
				}
			});

			return format;
		};

		$scope.priceRecalc = function() {
			$timeout(function() {
				var total = $scope.optionsTotal,
					special = $scope.optionsSpecial;

				for (var key in $scope.options) {
					if ($scope.options.hasOwnProperty(key) &&
						angular.isObject($scope.options[key]) &&
						Object.keys($scope.flyoptions).indexOf($scope.options[key].product_option_id) > -1) {

						var option = $scope.options[key].option_value;

						if (angular.isArray(option)) {
							for (var i = 0; i < option.length; i++) {
								if (option[i].price && $scope.flyoptions[$scope.options[key].product_option_id] && $scope.flyoptions[$scope.options[key].product_option_id].indexOf(option[i].product_option_value_id) > -1) {

									var price = parseFloat(option[i].price.replace(/[^\d+\\.]+/g, ''));

									if (option[i].price_prefix === '+') {
										total += price;
										special += price;
									}
									if (option[i].price_prefix === '-') {
										total -= price;
										special -= price;
									}
								}
							}
						}
					}
				}

				total = total * parseInt($scope.optionsQuantity);
				special = special * parseInt($scope.optionsQuantity);

				$scope.options.total = $scope.priceFormat($scope.options.total, total);

				if ($scope.options.special) {
					$scope.options.special = $scope.priceFormat($scope.options.special, special);
				}
			});
		};

		$scope.addToCartOptions = function(form, options, product_id) {
			if (form && form.$valid) {
				$.magnificPopup.close();
				$scope.optionsLoading = true;

				var quantity = options.quantity,
					width = 100, height = 100;

				switch (FlycartTools.noti_type) {
					case 'notice':
						width = FlycartTools.noti_image_width;
						height = FlycartTools.noti_image_height;
						break;

					case 'light':
						width = FlycartTools.light_image_width;
						height = FlycartTools.light_image_height;
						break;

					case 'advanced':
						width = FlycartTools.advanced_image_width;
						height = FlycartTools.advanced_image_height;
						break;
				}

				$http.post(FlycartTools.url + 'module/kw_flycart/addProduct',
					{ 'product_id': product_id, 'quantity': quantity, 'option': options }).then(function(response) {

						if (!response.data.redirect) {
							var data = response.data || {};

							$scope.widget_empty = 'true';
							$scope.productEffects(product_id, data);
							$scope.optionsLoading = false;
						}
					});
			}
			else if (form && form.$invalid) {
				$scope.optionsLoading = false;

				angular.forEach(form.$error.required, function(field) {
					form[field.$name].$dirty = true;
				});
			}
			else if (form === false) {
				$http.post(FlycartTools.url + 'module/kw_flycart/addProduct', options).then(function(response) {
					if (response.data.error) {
						$('.alert, .text-danger').remove();
						$('.form-group').removeClass('has-error');

						for (var i in response.data.error.option) {
							var element = $('#input-option' + i.replace('_', '-'));

							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + response.data.error.option[i] + '</div>');
							}
							else {
								element.after('<div class="text-danger">' + response.data.error.option[i] + '</div>');
							}
						}

						if (response.data.error.recurring) {
							$('select[name=\'recurring_id\']').after('<div class="text-danger">' + response.data.error.option.recurring + '</div>');
						}

						$('.text-danger').parent().addClass('has-error');
					}
					else {
						$scope.widget_empty = 'true';
						$scope.productEffects(product_id, response.data);
					}

					$scope.optionsLoading = false;
				});
			}
		};

		$scope.popupOpen = function(template, mainClass) {
			$scope.showNotice = false;

			var scrollTop = $(window).scrollTop();

			$timeout(function() {
				$.magnificPopup.open({
					items: {
						src: $compile(template)($scope),
						type: 'inline'
					},
					removalDelay: 300,
					mainClass: mainClass,
					fixedContentPos: false,
					fixedBgPos: true,
					midClick: true,
					showCloseBtn: false,
					callbacks: {
						open: function () {
							angular.element('body').addClass('no-scroll').css('top', -scrollTop);
							$scope.relatedHover();
							angular.element('.scroll-detector').remove();
						},
						close: function () {
							angular.element('body').removeClass('no-scroll').css('top', '');
							$(window).scrollTop(scrollTop);
						}
					}
				});
			});

			function getScrollBarWidth() {
				var div = document.createElement("div");

				div.className = "scroll-detector";
				div.style.overflow = "scroll";
				div.style.visibility = "hidden";
				div.style.position = 'absolute';
				div.style.width = '100px';

				document.body.appendChild(div);

				return div.offsetWidth - div.clientWidth;
			}
		};

		$scope.popupClose = function() {
			$timeout(function () {
				$.magnificPopup.close();
			});
		};

		$scope.standartOpen = function() {
			$scope.showNotice = false;

			if (FlycartTools.click_action_mod !== 'none') {
				$document.on('mouseover mouseenter click', FlycartTools.standart_cart, function(event) {
					return false;
				});

				angular.element(FlycartTools.standart_cart).on('click', function() {
					if (FlycartTools.click_action_mod === 'flycart') {
						$scope.flycartOpen('standart');
					}
					else if (FlycartTools.click_action_mod === 'page') {
						location.href = FlycartTools.click_action_mod_link;
					}

					return false;
				});
			}
		};

		$scope.standartOpen();

		$scope.standartCartUpdate = function() {
			$('#cart').load('index.php?route=checkout/cart #cart > *', function() {
				$scope.standartOpen();
			});
		};

		$scope.noticeEnter = false;

		$scope.flycartNotice = function(data) {
			var tmpl = $templateCache.get('flycartNotice.html').trim();

			$scope.notice = data;

			angular.element('body').append(
				$compile(tmpl)($scope)
			);

			$timeout(function() {
				$scope.showNotice = true;
				$scope.relatedHover();
			}, 100);

			$timeout(function() {
				$scope.noticeClose();
			}, FlycartTools.noti_timeout * 1000);
		};

		$scope.noticeClose = function() {
			$scope.showNotice = false;
			$timeout(function() {
				angular.element('#flycart-notice').remove();
			}, 100);
		};

		$scope.flycartNotification = function(product_id) {
			var notyImage = {
				width: function() {
					switch (FlycartTools.noti_type) {
						case 'notice':    return FlycartTools.noti_image_width; break;
						case 'light':     return FlycartTools.light_image_width; break;
						case 'advanced':  return FlycartTools.advanced_image_width; break;
						default: return 100;
					}
				},
				height: function() {
					switch (FlycartTools.noti_type) {
						case 'notice':    return FlycartTools.noti_image_height; break;
						case 'light':     return FlycartTools.light_image_height; break;
						case 'advanced':  return FlycartTools.advanced_image_height; break;
						default: return 100;
					}
				}
			};

			$http.post(FlycartTools.url + 'module/kw_flycart/loader', { 'product_id': product_id, width: notyImage.width, height: notyImage.height }).then(function(response) {

				var notification = angular.element('[flycart="notification"]'),
					tmpl = $templateCache.get('flycartNotification.html').trim(),
					data = response.data,
					length = data.products.length, i = 0;

				$scope.notifyProduct = {};
				$scope.notifyProduct.count = data.count;
				$scope.notifyProduct.names = length;
				$scope.notifyProduct.totals = data.totals;

				for (;i < length;i++) {
					if (Number(data.products[i].id) === Number(product_id)) {
						angular.extend($scope.notifyProduct, data.products[i]);
					}
				}

				switch (FlycartTools.noti_type) {
					case 'notice': $scope.flycartNotice($scope.notifyProduct);break;
					case 'light' : $scope.popupOpen(tmpl, 'light-overlay');break;
					case 'advanced': $scope.popupOpen(tmpl, 'noti-overlay');break;
					case 'cart': $scope.flycartOpen();break;
				}

				$scope.relatedHover();

			});
		};

		$scope.relatedHover = function() {
			$timeout(function () {
				$('.related-links').relatedHover({'class': 'hover', 'parent': '.related-parent'});
			});
		};

		$scope.relatedHover();
	}]);

	kwFlycart.directive('kwNumber', function($timeout) {
		return {
			restrict: 'E',
			transclude: true,
			replace: true,
			scope: {
				model: '=', key: '@', min: '@', max: '@', options: '='
			},
			template:
			'<div class="field number">' +
			'<input type="text" ng:model="model" ng:keydown="keycode($event)" ng:blur="limits()" />' +
			'<span class="number_actions">' +
			'<span class="number_plus" ng:click="plus()"></span>' +
			'<span class="number_minus" ng:click="minus()"></span>' +
			'</span>' +
			'<div class="clearfix"></div>' +
			'</div>',
			link: function (scope, element, attrs) {
				var keys = [8, 9, 37, 38, 39, 40, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 110];

				var min = angular.isDefined(scope.min) ? parseInt(scope.min) : 1,
					max = angular.isDefined(scope.max) ? parseInt(scope.max) : 99999;

				scope.model = angular.isDefined(scope.model) ? parseInt(scope.model) : 1;

				scope.plus = function() {
					if(scope.model < max)
					{
						scope.model++;
						if (!scope.options)
						{
							scope.$emit('quantity-update', scope.key, scope.model);
						}
					}
				};

				scope.minus = function() {
					if(scope.model > min)
					{
						scope.model--;
						if (!scope.options)
						{
							scope.$emit('quantity-update', scope.key, scope.model);
						}
					}
				};

				scope.keycode = function(event) {
					if($.inArray(event.which, keys) === -1)
					{
						event.preventDefault();
					}

					switch (event.keyCode || event.which)
					{
						case 38: scope.plus();
							break;

						case 40: scope.minus();
							break;
					}
				};

				$timeout(function() {
					$(document).keyup(function(event){
						var keycode = (event.keyCode ? event.keyCode : event.which);
						if(keycode === '13' && scope.model >= min || keycode === 13 && scope.model >= min)
						{
							$(this).blur();
							scope.$emit('quantity-update', scope.key, scope.model);
						}
					});
				});

				scope.limits = function() {
					scope.model = parseInt(scope.model);

					if(scope.model < min)
					{
						scope.model = min;
					}

					if(scope.model >= max && scope.model >= min)
					{
						scope.model = max;
					}

					if (!scope.options && scope.model >= min)
					{
						scope.$emit('quantity-update', scope.key, scope.model);
					}
				};
			}
		}
	});
	
	/**
	 * Checklist-model
	 * AngularJS directive for list of checkboxes
	 */

	kwFlycart.directive('checklistModel', ['$parse', '$compile', function($parse, $compile) {
		// contains
		function contains(arr, item) {
			if (angular.isArray(arr)) {
				for (var i = 0; i < arr.length; i++) {
					if (angular.equals(arr[i], item)) {
						return true;
					}
				}
			}
			return false;
		}

		// add
		function add(arr, item) {
			arr = angular.isArray(arr) ? arr : [];
			for (var i = 0; i < arr.length; i++) {
				if (angular.equals(arr[i], item)) {
					return arr;
				}
			}    
			arr.push(item);
			return arr;
		}  

		// remove
		function remove(arr, item) {
			if (angular.isArray(arr)) {
				for (var i = 0; i < arr.length; i++) {
					if (angular.equals(arr[i], item)) {
						arr.splice(i, 1);
						break;
					}
				}
			}
			return arr;
		}

		// http://stackoverflow.com/a/19228302/1458162
		function postLinkFn(scope, elem, attrs) {
			// compile with `ng-model` pointing to `checked`
			$compile(elem)(scope);

			// getter / setter for original model
			var getter = $parse(attrs.checklistModel);
			var setter = getter.assign;

			// value added to list
			var value = $parse(attrs.checklistValue)(scope.$parent);
			
			// required added to list
			var required = $parse(attrs.checklistRequired)(scope.$parent);
			
			scope.required = (required === "1") ? true : false;

			// watch UI checked change
			scope.$watch('checked', function(newValue, oldValue) {
				if (newValue === oldValue) { 
					return;
				} 
				var current = getter(scope.$parent);
				if (newValue === true) {
					setter(scope.$parent, add(current, value));
				} else {
					setter(scope.$parent, remove(current, value));
				}
			});

			// watch original model change
			scope.$parent.$watch(attrs.checklistModel, function(newArr, oldArr) {
				scope.checked = contains(newArr, value);

				if (!newArr) { return; }
				
				if (required === "1" && newArr.length > 0)
				{
					scope.required = false;
				}
				else if (required === "1" && newArr.length === 0) {
					scope.required = true;
				}
			}, true);
			
			
		}

		return {
			restrict: 'A',
			priority: 1000,
			terminal: true,
			scope: true,
			compile: function(tElement, tAttrs) {
				if (tElement[0].tagName !== 'INPUT' || tAttrs.type !== 'checkbox') {
					throw 'checklist-model should be applied to `input[type="checkbox"]`.';
				}

				if (!tAttrs.checklistValue) {
					throw 'You should provide `checklist-value`.';
				}

				// exclude recursion
				tElement.removeAttr('checklist-model');
				
				// local scope var storing individual checkbox model
				tElement.attr('ng-model', 'checked');
				
				tElement.attr('ng-required', 'required');

				return postLinkFn;
			}
		};
	}]);	
	
	/**
	 * parseInt Filter
	 */
	 
	kwFlycart.filter('num', function() {
    return function(input) {
      return parseFloat(input);
    }
	});


	/**
	 * declension Filter
	 */

	kwFlycart.filter('declension', function () {
		return function (count, title1, title2, title3) {
			if (!count) { return title1; };

			/**
			 * Declension Filter
			 * @params { count (int), title1 (str), title2 (str), title3 (str)  }
			 * @return num
			 */

			var cases = {0: title3, 1: title1, 2: title2, 3: title2, 4: title2, 5: title3},
				str = (count % 100 > 4 && count % 100 < 20) ? title3 : cases[Math.min(count % 10, 5)];
			return count + ' ' + str;
		};
	});
	
	/**
	* $.unserialize
	*
	* Takes a string in format "param1=value1&param2=value2" and returns an object { param1: 'value1', param2: 'value2' }. If the "param1" ends with "[]" the param is treated as an array.
	*
	* Example:
	*
	* Input: param1=value1&param2=value2
	* Return: { param1 : value1, param2: value2 }
	*
	* Input: param1[]=value1&param1[]=value2
	* Return: { param1: [ value1, value2 ] }
	*
	* @todo Support params like "param1[name]=value1" (should return { param1: { name: value1 } })
	* Usage example: console.log($.unserialize("one="+escape("& = ?")+"&two="+escape("value1")+"&two="+escape("value2")+"&three[]="+escape("value1")+"&three[]="+escape("value2")));
	*/ 
	(function(a){a.unserialize=function(d){var h=decodeURI(d);var e=h.split("&");var g={},f,b;for(var c=0,j=e.length;c<j;c++){f=e[c].split("=");b=f[0];if(g[b]===undefined){g[b]=unescape(f[1])}else{if(typeof g[b]=="string"){g[b]=[g[b]]}g[b].push(unescape(f[1]))}}return g}})(jQuery);


	/**
	 * Related Hover
	 */
	(function($){
		$.fn.relatedHover = function(options){
			var defaults = {
				'class': '',
				'parent': ''
			},
			options = $.extend(defaults, options),
			className = $(this).attr('class');

			return this.each(function() {
				$(this).on('mouseover', function () {
					$(this).parents(options.parent).find('.' + className).addClass(options.class);
				});

				$(this).on('mouseout', function () {
					$(this).parents(options.parent).find('.' + className).removeClass(options.class);
				});

			});
		};
	})(jQuery);
}());