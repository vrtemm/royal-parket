<?php if (isset($tools['status_module']) && $tools['status_module'] === 'true') : ?>
<!-- kw_flycart
---------------------------------------------------------------->

<div id="kwFlycart" ng:app="kwFlycart" ng:controller="kwFlycartController">

	<?php if (isset($tools['module_type']) && $tools['module_type'] === 'widget') : ?>
	<div flycart="widget" id="kw-base-widget"></div>
	<?php endif; ?>
	
	<?php if (isset($tools['module_type']) && $tools['module_type'] === 'module') : ?>
	<div flycart="module"></div>
	<?php endif; ?>

	<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'notice' || isset($tools['noti_type']) && $tools['noti_type'] === 'light' || isset($tools['noti_type']) && $tools['noti_type'] === 'advanced') : ?>
	<div flycart="notification"></div>
	<?php endif; ?>

	<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'advanced' || isset($tools['noti_type']) && $tools['noti_type'] === 'light') : ?>
	<script type="text/ng-template" id="flycartNotification.html">
		<div id="flycart-notification" class="zoom-anim-dialog popup<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'advanced') { ?> advanced<?php } ?>">
		
		<div class="flycart-noti-header">
		<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'advanced') { ?>
			<h3 class="notification-product-success noti-min"><?php echo $noti_title_1; ?></h3>
		<?php } ?>
			<span class="flycart-options-close" ng:click="popupClose();">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="15" height="15"><path d="M13.783968,2.3037212c0.288043-0.2881861,0.288043-0.7556047,0-1.0437908l-1.0437918-1.0437908 c-0.288043-0.2881861-0.755332-0.2881861-1.0437918,0L7.5220523,4.3908868c-0.2884603,0.2881861-0.7557487,0.2881861-1.0437918,0 L2.3035111,0.2161396c-0.288043-0.2881861-0.7553315-0.2881861-1.0433747,0L0.216345,1.2599304 c-0.28846,0.2881861-0.28846,0.7556047,0,1.0437908l4.1743326,4.1743317c0.2884598,0.2886019,0.2884598,0.7556047,0,1.0437908 l-4.1743326,4.174747C0.0779509,11.8350697,0,12.0226192,0,12.2184858c0,0.1954508,0.0779509,0.3834171,0.216345,0.5218954 l1.0437915,1.0437908c0.2880431,0.2877703,0.7553316,0.2877703,1.0433747,0l4.1747494-4.1751633 c0.288043-0.2877703,0.7553315-0.2877703,1.0437918,0l4.1743321,4.1751633c0.2884598,0.2877703,0.7557487,0.2877703,1.0437918,0 l1.0437918-1.0437908c0.1383934-0.1384783,0.2159281-0.3264446,0.2159281-0.5218954 c0-0.1958666-0.0775347-0.3834162-0.2159281-0.5218954l-4.1747494-4.174747c-0.288043-0.2881861-0.288043-0.7551889,0-1.0437908 L13.783968,2.3037212z"/></svg>
			</span>
		</div>
		
			<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'advanced') { ?>
			<div class="flycart-container">
				<div class="left-notification<?php if (isset($tools['advanced_right']) && $tools['advanced_right'] === 'false') { ?> full-width<?php } ?>">
					<h3 class="notification-product-success noti-max"><?php echo $noti_title_1; ?></h3>
					<div class="notification-product-block related-parent">
						<?php if ($tools['advanced_image'] === 'true') { ?>
						<a ng:href="{{ ::notifyProduct.href }}" class="related-links">
							<img ng:src="{{ ::notifyProduct.thumb }}" width="<?php echo isset($tools['advanced_image_width']) ? $tools['advanced_image_width'] : '115'; ?>" height="<?php echo isset($tools['advanced_image_height']) ? $tools['advanced_image_height'] : '115'; ?>" alt class="notification-product-image" ng:if="retina === 'true'" />
							<img ng:src="{{ ::notifyProduct.thumb }}" ng:if="retina === 'false'" alt class="notification-product-image" />
						</a>
						<?php } ?>

							<div class="notification-product-info">
								<div class="notification-product-name">
								<?php if (isset($tools['advanced_name']) && $tools['advanced_name'] === 'true') { ?>
									<a ng:href="{{ ::notifyProduct.href }}" class="related-links"><span ng:bind-html="::notifyProduct.name"></span></a>
								<?php } ?>
								</div>

								<?php if (isset($tools['advanced_price']) && $tools['advanced_price'] === 'true') { ?>
								<span class="notification-product-price" ng:bind-html="::notifyProduct.total_alone" ng:if="!notifyProduct.special_alone"></span>
								<span class="notification-product-price-old" ng:bind-html="::notifyProduct.special_alone" ng:if="notifyProduct.special_alone"></span>
								<span class="notification-product-price-special" ng:bind-html="::notifyProduct.total_alone" ng:if="notifyProduct.special_alone"></span>
								<?php } ?>

								<?php if (isset($tools['advanced_sku']) && $tools['advanced_sku'] === 'true') { ?>
									<div class="notification-product-infos notification-product-params sku" ng:if="notifyProduct.sku">
										<span class="param-name"><?php echo $sku; ?> </span>{{ ::notifyProduct.sku }}
									</div>
								<?php } ?>

								<?php if (isset($tools['advanced_brand']) && $tools['advanced_brand'] === 'true') { ?>
								<div class="notification-product-infos notification-product-params" ng:if="notifyProduct.brand_name">
									<span class="param-name"><?php echo $manuf; ?> </span><a ng:href="{{ ::notifyProduct.brand_url }}"><span ng:bind-html="::notifyProduct.brand_name"></span></a>
								</div>
								<?php } ?>

								<?php if (isset($tools['advanced_model']) && $tools['advanced_model'] === 'true') { ?>
								<div class="notification-product-infos notification-product-params" ng:if="notifyProduct.model">
									<span class="param-name"><?php echo $model; ?> </span>{{ ::notifyProduct.model }}
								</div>
								<?php } ?>

								<?php if (isset($tools['advanced_options']) && $tools['advanced_options'] === 'true' && isset($tools['advanced_right']) && $tools['advanced_right'] === 'false') { ?>
									<div class="notification-product-options">
									<span class="notification-product-option" ng:repeat="option in notifyProduct.option" ng:cloak>-
										<span ng:bind-html="::option.name"></span>:
										<span ng:bind-html="::option.value"></span>
									</span>
									<?php if (isset($text_payment_profile)) { ?>
									<span class="notification-product-option" ng:if="notifyProduct.recurring">
											- <?php echo $text_payment_profile ?>: {{ ::notifyProduct.profile }}
									</span>
									<?php } ?>
									</div>
								<?php } ?>
						</div>
					</div>

					<?php if (isset($tools['advanced_options']) && $tools['advanced_options'] === 'true' && isset($tools['advanced_right']) && $tools['advanced_right'] === 'true') { ?>
						<div class="notification-product-options">
							<span class="notification-product-option" ng:repeat="option in notifyProduct.option" ng:cloak>-
								<span ng:bind-html="::option.name"></span>:
								<span ng:bind-html="::option.value"></span>
							</span>
							<?php if (isset($text_payment_profile)) { ?>
							<span class="notification-product-option" ng:if="notifyProduct.recurring">
									- <?php echo $text_payment_profile ?>: {{ ::notifyProduct.profile }}
							</span>
							<?php } ?>
						</div>
					<?php } ?>
				</div>

				<?php if (isset($tools['advanced_right']) && $tools['advanced_right'] === 'false') { ?>
					<div class="buttonset">
					<?php if (isset($tools['continue_advanced_btn']) && $tools['continue_advanced_btn'] === 'true') { ?>
						<a href="javascript:void(0);" ng:click="popupClose();" class="flycart-button close-button"><?php echo (isset($tools['advanced_continue_btn'][$lang_id]) && $tools['advanced_continue_btn'][$lang_id]) ? $tools['advanced_continue_btn'][$lang_id] : $cont_btn; ?></a>
					<?php } ?>
					<?php if (isset($tools['viewcart_advanced_btn']) && $tools['viewcart_advanced_btn'] === 'true') { ?>
						<a href="<?php echo $checkout; ?>" class="flycart-button tocart-button"><?php echo (isset($tools['advanced_viewcart_btn'][$lang_id]) && $tools['advanced_viewcart_btn'][$lang_id]) ? $tools['advanced_viewcart_btn'][$lang_id] : $check_btn; ?></a>
					<?php } ?>
					</div>
				<?php } ?>

				<?php if (isset($tools['advanced_right']) && $tools['advanced_right'] === 'true') { ?>
				<div class="right-notification">

					<?php if (isset($tools['advanced_right_items']) && $tools['advanced_right_items'] === 'true') { ?>
					<h3 class="notification-product-title"><?php echo $noti_title_2; ?> {{ notifyProduct.count | declension:'<?php echo $items_1; ?>':'<?php echo $items_2; ?>':'<?php echo $items_3; ?>' }}</h3>
					<?php } ?>
					<?php if (isset($tools['advanced_right_names']) && $tools['advanced_right_names'] === 'true') { ?>
					<h3 class="notification-product-title"><?php echo $noti_title_2; ?> {{ notifyProduct.names | declension:'<?php echo $items_t1; ?>':'<?php echo $items_t2; ?>':'<?php echo $items_t3; ?>' }}</h3>
					<?php } ?>

					<div class="notification-totals">
						<div class="notification-total" ng:repeat="total in ::notifyProduct.totals">
							<span class="notification-total-label" ng:bind-html="::total.title + ':'"></span>
							<span class="notification-total-result" ng:bind-html="::total.text"></span>
						</div>
					</div>

				<?php if (isset($tools['viewcart_advanced_btn']) && $tools['viewcart_advanced_btn'] === 'true') { ?>
					<a href="<?php echo $checkout; ?>" class="flycart-button tocart-button"><?php echo (isset($tools['advanced_viewcart_btn'][$lang_id]) && $tools['advanced_viewcart_btn'][$lang_id]) ? $tools['advanced_viewcart_btn'][$lang_id] : $check_btn; ?></a>
				<?php } ?>
				<?php if (isset($tools['continue_advanced_btn']) && $tools['continue_advanced_btn'] === 'true') { ?>
					<a href="javascript:void(0);" ng:click="popupClose();" class="flycart-button close-button"><?php echo (isset($tools['advanced_continue_btn'][$lang_id]) && $tools['advanced_continue_btn'][$lang_id]) ? $tools['advanced_continue_btn'][$lang_id] : $cont_btn; ?></a>
				<?php } ?>

				</div>
				<?php } ?>
			</div>
			<?php } elseif (isset($tools['noti_type']) && $tools['noti_type'] === 'light') { ?>
			<div class="flycart-container">

			<?php if (isset($tools['light_image']) && $tools['light_image'] === 'true') { ?>
				<a ng:href="{{ ::notifyProduct.href }}">
					<img ng:src="{{ ::notifyProduct.thumb }}" width="<?php echo isset($tools['light_image_width']) ? $tools['light_image_width'] : '115'; ?>" height="<?php echo isset($tools['light_image_height']) ? $tools['light_image_height'] : '115'; ?>" alt class="notification-product-image" ng:if="retina === 'true'" />
					<img ng:src="{{ ::notifyProduct.thumb }}" ng:if="retina === 'false'" alt class="notification-product-image" />
				</a>
			<?php } ?>

				<div class="notification-product-right">
					<div class="notification-product-name">
						<?php echo $text_added; ?>
					</div>
					<div class="light-max">
						<?php if (isset($tools['continue_light_btn']) && $tools['continue_light_btn'] === 'true') { ?>
						<a href="javascript:void(0);" ng:click="popupClose();" class="flycart-button close-button light"><?php echo (isset($tools['light_continue_btn'][$lang_id]) && $tools['light_continue_btn'][$lang_id]) ? $tools['light_continue_btn'][$lang_id] : $cont_btn; ?></a>
						<?php } ?>
						<?php if (isset($tools['viewcart_light_btn']) && $tools['viewcart_light_btn'] === 'true') { ?>
						<a href="<?php echo $checkout; ?>" class="flycart-button tocart-button light"><?php echo (isset($tools['light_viewcart_btn'][$lang_id]) && $tools['light_viewcart_btn'][$lang_id]) ? $tools['light_viewcart_btn'][$lang_id] : $check_btn; ?></a>
						<?php } ?>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="buttonset light-min">
						<?php if (isset($tools['continue_light_btn']) && $tools['continue_light_btn'] === 'true') { ?>
						<a href="javascript:void(0);" ng:click="popupClose();" class="flycart-button close-button light"><?php echo (isset($tools['light_continue_btn'][$lang_id]) && $tools['light_continue_btn'][$lang_id]) ? $tools['light_continue_btn'][$lang_id] : $cont_btn; ?></a>
						<?php } ?>
						<?php if (isset($tools['viewcart_light_btn']) && $tools['viewcart_light_btn'] === 'true') { ?>
						<a href="<?php echo $checkout; ?>" class="flycart-button tocart-button light"><?php echo (isset($tools['light_viewcart_btn'][$lang_id]) && $tools['light_viewcart_btn'][$lang_id]) ? $tools['light_viewcart_btn'][$lang_id] : $check_btn; ?></a>
						<?php } ?>
				</div>
			</div>
			<?php } ?>
		</div>
	</script>
	<?php endif; ?>

	<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'notice') : ?>
	<script type="text/ng-template" id="flycartNotice.html">
		<div id="flycart-notice" ng:class="{'enter': showNotice, 'leave': !showNotice}">
			<span class="flycart-options-close" ng:click="noticeClose();">
				<svg version="1.1"xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2.3976998 2.40025" enable-background="new 0 0 2.3976998 2.40025" xml:space="preserve"  width="11px" height="11px"><path d="M2.3457999,0.5529c0.0692-0.0691,0.0692-0.1813,0-0.2505L2.0957,0.0519c-0.0692-0.0692-0.1812-0.0692-0.2503,0L1.324,0.5739c-0.0691,0.0691-0.1812,0.0691-0.2503,0l-0.5214-0.522c-0.069-0.0692-0.1811-0.0692-0.2502,0L0.0519,0.3024c-0.0692,0.0692-0.0692,0.1814,0,0.2505L0.5732,1.0748C0.6424,1.1441,0.6424,1.2562,0.5732,1.3254l-0.5213,0.522C0.0187,1.8806,0,1.9256999,0,1.9727c0,0.0468999,0.0187,0.0919999,0.0519,0.1251999L0.3021,2.3485c0.0691,0.069,0.1812,0.069,0.2502,0l0.5214-0.5221001c0.0691-0.0691,0.1812-0.0691,0.2503,0L1.8454,2.3485c0.0691,0.069,0.1811,0.069,0.2503,0l0.2500999-0.2506001c0.0332999-0.0332,0.0518999-0.0783,0.0518999-0.1251999c0-0.0470001-0.0186-0.0921-0.0518999-0.1253l-0.5213-0.522c-0.0692-0.0692-0.0692-0.1813,0-0.2506L2.3457999,0.5529z"/>
				</svg>
			</span>
		<?php if (isset($tools['noti_image']) && $tools['noti_image'] === 'true') { ?>
			<a ng:href="{{ ::notifyProduct.href }}">
				<img ng:src="{{ ::notifyProduct.thumb }}" alt width="<?php echo isset($tools['noti_image_width']) ? $tools['noti_image_width'] : '70'; ?>" height="<?php echo isset($tools['noti_image_height']) ? $tools['noti_image_height'] : '70'; ?>" class="notice-product-image" ng:if="retina === 'true'" />
				<img ng:src="{{ ::notifyProduct.thumb }}" alt ng:if="retina === 'false'" class="notice-product-image" />
			</a>
		<?php } ?>

		<div class="notice-product-name">
			<?php echo $text_added; ?>
		</div>
		<div class="clearfix"></div>
		<?php if (isset($tools['continue_noti_btn']) && $tools['continue_noti_btn'] === 'true') { ?>
			<a href="<?php echo $cart; ?>" class="flycart-button close-button"><?php echo (isset($tools['noti_continue_btn'][$lang_id]) && $tools['noti_continue_btn'][$lang_id]) ? $tools['noti_continue_btn'][$lang_id] : $tocart_btn; ?></a>
		<?php } ?>
		<?php if (isset($tools['viewcart_noti_btn']) && $tools['viewcart_noti_btn'] === 'true') { ?>
			<a href="<?php echo $checkout; ?>" class="flycart-button tocart-button"><?php echo (isset($tools['noti_viewcart_btn'][$lang_id]) && $tools['noti_viewcart_btn'][$lang_id]) ? $tools['noti_viewcart_btn'][$lang_id] : $check_btn; ?></a>
		<?php } ?>

		</div>
	</script>
	<?php endif; ?>

	<?php if (isset($tools['module_type']) && $tools['module_type'] === 'widget') : ?>
	<script type="text/ng-template" id="flycartWidget.html">
		<div id="flycart-widget" ng:click="flycartOpen('widget');" ng:if="widget_empty === 'true'" ng:class="{ 'empty': cart.products.length === 0 }"
		     class="length-{{ cart.count.toString().length }}">
			<?php if (isset($tools['widget_title']) && $tools['widget_title'] === 'true') {
				echo (isset($tools['widget_title_text'][$lang_id]) && $tools['widget_title_text'][$lang_id]) ? $tools['widget_title_text'][$lang_id] : $heading_title;
			} ?>

			<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'off') { ?>
			<span class="flycart-widget-count" ng:if="widget_null === 'true' || cart.count > 0" ng:class="{'change': countChange}">
				<span data-text="{{ widgetContent('<?php echo $tools['widget_text'][$lang_id] ? $tools['widget_text'][$lang_id] : '[items]'; ?>'); }}">
					{{ widgetContent("<?php echo $tools['widget_text'][$lang_id] ? $tools['widget_text'][$lang_id] : '[items]'; ?>"); }}
				</span>
			</span>
			<?php } else { ?>
				<span class="flycart-widget-count" ng:if="widget_null === 'true' || cart.count > 0">
					{{ widgetContent("<?php echo $tools['widget_text'][$lang_id] ? $tools['widget_text'][$lang_id] : '[items]'; ?>"); }}
				</span>
			<?php } ?>

		</div>
	</script>
	<?php endif; ?>

	<?php if (isset($tools['module_type']) && $tools['module_type'] === 'module') : ?>
	<script type="text/ng-template" id="flycartModule.html">
		<?php if (isset($tools['show_module_header']) && $tools['show_module_header'] === 'true') { ?>
		<h3 class="box-heading">
			<?php echo (isset($tools['header'][$lang_id]) && $tools['header'][$lang_id]) ? $tools['header'][$lang_id] : $heading_title; ?>
		</h3>
		<?php } ?>

		<div class="flicart-module-box">
			<?php if (isset($tools['show_module_items']) && $tools['show_module_items'] === 'true' || isset($tools['show_module_weight']) && $tools['show_module_weight'] === 'true') { ?>
				<div class="flycart-top-info" ng:if="cart.products.length > 0 || cart.vouchers.length > 0">
					<?php if (isset($tools['show_module_items']) && $tools['show_module_items'] === 'true') { ?>
						<span class="flycart-module-footer-info-items">
							{{cart.count | declension:'<?php echo $items_b1; ?>':'<?php echo $items_b2; ?>':'<?php echo $items_b3; ?>'}}&nbsp;
						</span>
					<?php } else { ?>
						<span class="flycart-footer-info-items">
							{{cart.products.length | declension:'<?php echo $items_n1; ?>':'<?php echo $items_n2; ?>':'<?php echo $items_n3; ?>'}}&nbsp;
						</span>
					<?php } ?>
					<?php if (isset($tools['show_module_weight']) && $tools['show_module_weight'] === 'true') { ?>
						<span class="flycart-module-footer-info-weight" ng:bind-html="'(' + cart.weight + ')'" ng:if="cart.weight.length > 0"></span>
					<?php } ?>
				</div>
			<?php } ?>

			<div class="flycart-module-container">
				<div class="flycart-module">
					<div class="flycart-module-product box-product related-parent" ng:repeat="product in cart.products">
						<?php if (isset($tools['show_module_image']) && $tools['show_module_image'] === 'true') { ?>
							<div class="flycart-module-image">
								<a ng:href="{{ ::product.href }}" class="related-links">
									<img ng:src="{{ ::product.thumb }}" width="<?php echo isset($tools['module_imgage_width']) ? $tools['module_imgage_width'] : '156'; ?>" height="<?php echo isset($tools['module_imgage_height']) ? $tools['module_imgage_height'] : '156'; ?>" alt ng:if="retina === 'true'" />
									<img ng:src="{{ ::product.thumb }}" alt ng:if="retina === 'false'" />
								</a>
							</div>
						<?php } ?>

						<?php if (isset($tools['show_module_name']) && $tools['show_module_name'] === 'true' || isset($tools['show_module_remove']) && $tools['show_module_remove'] === 'true') { ?>
						<div class="flycart-module-product-title">
							<?php if (isset($tools['show_module_name']) && $tools['show_module_name'] === 'true') { ?>
								<div class="flycart-module-name name">
									<h4><a ng:href="{{ ::product.href }}" class="related-links"><span ng:bind-html="::product.name"></span></a></h4>
								</div>
							<?php } ?>

							<?php if (isset($tools['show_module_remove']) && $tools['show_module_remove'] === 'true') { ?>
								<div class="flycart-module-remove" ng:init="remove[$index] = false;">
									<span ng:click="removeProduct(product.key);" class="flycart-product-remove-button">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="12px" height="12px"><path d="M6.9997916,3.8641534L3.1369467,0L0,3.1116669L3.8753459,6.988327L3.8632617,7l0.0120842,0.0120897 L0,10.8883333L3.1369467,14l3.8628449-3.8637362L10.8630533,14L14,10.8883333l-3.8757629-3.8762436L10.136322,7l-0.012085-0.011673 L14,3.1116669L10.8630533,0L6.9997916,3.8641534z"/>
										</svg>
									</span>
								</div>
							<?php } ?>
						</div>
						<?php } ?>
						<div class="clearfix"></div>

						<?php if (isset($tools['popup_alert_on']) && $tools['popup_alert_on'] === 'true') { ?>
						<span class="maximum-alert" ng:if="product.quantity >= product.maximum"><?php echo $min_error; ?></span>
						<?php } ?>

						<?php if (isset($tools['popup_info_on']) && $tools['popup_info_on'] === 'true') { ?>
						<span class="minimum-alert" ng:if="product.quantity <= product.minimum && product.minimum > 1"><?php echo $max_error; ?></span>
						<?php } ?>

						<?php if (isset($tools['show_module_price']) && $tools['show_module_price'] === 'true') { ?>
							<div class="flycart-module-total">
								<span class="price" ng:bind-html="::product.total" ng:if="!product.special"></span>
								<span class="price-new" ng:bind-html="::product.total" ng:if="product.special"></span>
								<span class="price-old" ng:bind-html="::product.special" ng:if="product.special"></span>
							</div>
						<?php } ?>

						<?php if (isset($tools['show_module_quantity']) && $tools['show_module_quantity'] === 'true') { ?>
							<div class="flycart-module-quantity">
								<?php if (isset($tools['module_max_on']) && $tools['module_max_on'] === 'true') { ?>
									<kw:number model="product.quantity" key="{{ ::product.key }}" min="{{ ::product.minimum }}""></kw:number>
								<?php } else { ?>
									<kw:number model="product.quantity" key="{{ ::product.key }}" min="{{ ::product.minimum }}" max="{{ ::product.maximum }}"></kw:number>
								<?php } ?>
							</div>
						<?php } ?>

						<div class="clearfix"></div>

						<div class="flycart-module-options" ng:if="product.option.length > 0">
							<span class="flycart-module-option" ng:repeat="option in product.option" ng:cloak>-
								<span ng:bind-html="::option.name"></span>:
								<span ng:bind-html="::option.value"></span>
							</span>
							<?php if (isset($text_payment_profile)) { ?>
							<span class="flycart-module-option" ng:if="product.recurring">
								- <?php echo $text_payment_profile ?> {{ ::product.profile }}
							</span>
							<?php } ?>
						</div>
					</div>

					<div class="flycart-module-product" ng:repeat="voucher in cart.vouchers">
						<?php if (isset($tools['show_module_name']) && $tools['show_module_name'] === 'true') { ?>
						<div class="flycart-module-name"><a ng:href="{{ ::voucher.href }}"><span ng:bind-html="::voucher.description"></span></a></div>
						<?php } ?>
						<?php if (isset($tools['show_module_remove']) && $tools['show_module_remove'] === 'true') { ?>
						<div class="flycart-module-remove">
							<span ng:click="removeProduct(voucher.key);" class="flycart-module-remove-button">
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="14px" height="14px"><path d="M6.9997916,3.8641534L3.1369467,0L0,3.1116669L3.8753459,6.988327L3.8632617,7l0.0120842,0.0120897 L0,10.8883333L3.1369467,14l3.8628449-3.8637362L10.8630533,14L14,10.8883333l-3.8757629-3.8762436L10.136322,7l-0.012085-0.011673 L14,3.1116669L10.8630533,0L6.9997916,3.8641534z"/>
								</svg>
							</span>
						</div>
						<?php } ?>
						<?php if (isset($tools['show_module_image']) && $tools['show_module_image'] === 'true') { ?>
						<div class="flycart-module-image"></div>
						<?php } ?>
						<?php if (isset($tools['show_module_quantity']) && $tools['show_module_quantity'] === 'true') { ?>
						<div class="flycart-module-quantity">x&nbsp;1</div>
						<?php } ?>
						<?php if (isset($tools['show_module_price']) && $tools['show_module_price'] === 'true') { ?>
						<div class="flycart-module-total" ng:bind-html="::voucher.amount"></div>
						<?php } ?>
						<div class="clearfix"></div>
					</div>
				</div>

				<?php if (isset($tools['show_module_totals']) && $tools['show_module_totals'] === 'true') { ?>
				<div class="flycart-module-totals" ng:if="show_totals === 'true' && cart.products.length > 0 || show_totals === 'true' && cart.vouchers.length > 0">
					<div class="flycart-total" ng:repeat="total in cart.totals">
						<span class="flycart-module-total-label" ng:bind-html="total.title + ':'"></span>
						<span class="flycart-module-total-result" ng:bind-html="total.text"></span>
						<div class="clearfix"></div>
					</div>
				</div>
				<?php } ?>

				<div class="flycart-container empty-cart" ng:if="cart.products.length === 0 && cart.vouchers.length === 0">
				<?php if (isset($tools['module_empty_type']) && $tools['module_empty_type'] === 'text') { ?>
					<span><?php echo (isset($tools['module_empty_text_lang'][$lang_id]) && $tools['module_empty_text_lang'][$lang_id]) ? $tools['module_empty_text_lang'][$lang_id] : $text_empty; ?></span>
				<?php } elseif (isset($tools['module_empty_type']) && $tools['module_empty_type'] === 'image') { ?>
					<img src="./kw_application/flycart/images/empty/<?php echo isset($tools['module_empty_image']['src']) ? $tools['module_empty_image']['src'] : 'emptycart-1.png'; ?>" alt="" width="<?php echo isset($tools['module_empty_image']['width']) ? $tools['module_empty_image']['width'] : '140'; ?>" height="<?php echo isset($tools['module_empty_image']['height']) ? $tools['module_empty_image']['height'] : '120'; ?>" ng:if="retina === 'true'" />
					<img src="./kw_application/flycart/images/empty/<?php echo isset($tools['module_empty_image']['src']) ? $tools['module_empty_image']['src'] : 'emptycart-1.png'; ?>" alt="" ng:if="retina === 'false'" />
				<?php } ?>
				</div>

				<div class="flycart-module-footer" ng:if="cart.products.length > 0 || cart.vouchers.length > 0">
					<?php if (isset($tools['tocart_module_btn']) && $tools['tocart_module_btn'] === 'true') { ?>
					<a href="<?php echo $cart; ?>" class="flycart-button module-tocart-button"><?php echo (isset($tools['module_tocart_btn_text'][$lang_id]) && $tools['module_tocart_btn_text'][$lang_id]) ? $tools['module_tocart_btn_text'][$lang_id] : $tocart_btn; ?></a>
					<?php } ?>
					<?php if (isset($tools['checkout_module_btn']) && $tools['checkout_module_btn'] === 'true') { ?>
					<a href="<?php echo $checkout; ?>" class="flycart-button module-checkout-button"><?php echo (isset($tools['module_checkout_btn_text'][$lang_id]) && $tools['module_checkout_btn_text'][$lang_id]) ? $tools['module_checkout_btn_text'][$lang_id] : $check_btn; ?></a>
					<?php } ?>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
	</script>
	<?php endif; ?>

	<script type="text/ng-template" id="flycartProducts.html">
		<div id="flycart-dialog" class="zoom-anim-dialog">
			<?php if (isset($tools['popup_header_items']) && $tools['popup_header_items'] === 'false' && isset($tools['popup_header_weight']) && $tools['popup_header_weight'] === 'false' && isset($tools['popup_header_total']) && $tools['popup_header_total'] === 'false') { ?>
			<div class="flycart-options-header small-header">
			<?php } else { ?>
			<div class="flycart-options-header">
			<?php } ?>
				<?php echo (isset($tools['header'][$lang_id]) && $tools['header'][$lang_id]) ? $tools['header'][$lang_id] : $heading_title; ?>
				<span class="flycart-options-close" ng:click="popupClose();">
					<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="14px" height="14px"><path d="M13.783968,2.3037212c0.288043-0.2881861,0.288043-0.7556047,0-1.0437908l-1.0437918-1.0437908 c-0.288043-0.2881861-0.755332-0.2881861-1.0437918,0L7.5220523,4.3908868c-0.2884603,0.2881861-0.7557487,0.2881861-1.0437918,0 L2.3035111,0.2161396c-0.288043-0.2881861-0.7553315-0.2881861-1.0433747,0L0.216345,1.2599304 c-0.28846,0.2881861-0.28846,0.7556047,0,1.0437908l4.1743326,4.1743317c0.2884598,0.2886019,0.2884598,0.7556047,0,1.0437908 l-4.1743326,4.174747C0.0779509,11.8350697,0,12.0226192,0,12.2184858c0,0.1954508,0.0779509,0.3834171,0.216345,0.5218954 l1.0437915,1.0437908c0.2880431,0.2877703,0.7553316,0.2877703,1.0433747,0l4.1747494-4.1751633 c0.288043-0.2877703,0.7553315-0.2877703,1.0437918,0l4.1743321,4.1751633c0.2884598,0.2877703,0.7557487,0.2877703,1.0437918,0 l1.0437918-1.0437908c0.1383934-0.1384783,0.2159281-0.3264446,0.2159281-0.5218954 c0-0.1958666-0.0775347-0.3834162-0.2159281-0.5218954l-4.1747494-4.174747c-0.288043-0.2881861-0.288043-0.7551889,0-1.0437908 L13.783968,2.3037212z"/></svg>
				</span>
				<?php if (isset($tools['popup_header_items']) && $tools['popup_header_items'] === 'true' || isset($tools['popup_header_weight']) && $tools['popup_header_weight'] === 'true' || isset($tools['popup_header_total']) && $tools['popup_header_total'] === 'true' || isset($tools['popup_header_names']) && $tools['popup_header_names'] === 'true') { ?>
				<div ng:if="cart.products.length > 0 || cart.vouchers.length > 0">
					<div class="flycart-header-info">
						<?php if (isset($tools['popup_header_items']) && $tools['popup_header_items'] === 'true') { ?>
						<span class="flycart-header-info-items">
							{{cart.count | declension:'<?php echo $items_b1; ?>':'<?php echo $items_b2; ?>':'<?php echo $items_b3; ?>'}}&nbsp;
						</span>
						<?php } ?>
						<?php if (isset($tools['popup_header_names']) && $tools['popup_header_names'] === 'true') { ?>
						<span class="flycart-header-info-items">
							{{cart.products.length | declension:'<?php echo $items_n1; ?>':'<?php echo $items_n2; ?>':'<?php echo $items_n3; ?>'}}&nbsp;
						</span>
						<?php } ?>
						<span class="flycart-header-info-weight" ng:bind-html="'(' + cart.weight + ')'" ng:if="<?php echo isset($tools['popup_header_weight']) ? $tools['popup_header_weight'] : 'true'; ?> && cart.weight.length > 0"></span>
						<span class="flycart-header-info-total" ng:bind-html="'<?php echo $b_total; ?> ' + cart.total" ng:if="<?php echo isset($tools['popup_header_total']) ? $tools['popup_header_total'] : 'true'; ?>"></span>
					</div>
				</div>
				<?php } ?>
			</div>

			<div class="flycart-container" ng:if="cart.products.length > 0 || cart.vouchers.length > 0">
				<table class="flycart-products">
					<tr class="flycart-product related-parent" ng:repeat="product in cart.products">
						<?php if (isset($tools['popup_imgage']) && $tools['popup_imgage'] === 'true' || isset($tools['popup_name']) && $tools['popup_name'] === 'true') { ?>
						<td class="flycart-product-left">
						<?php if (isset($tools['popup_imgage']) && $tools['popup_imgage'] === 'true') { ?>
								<div class="flycart-product-image">
									<a ng:href="{{ ::product.href }}" class="related-links">
										<img ng:src="{{ ::product.thumb }}" width="<?php echo isset($tools['popup_imgage_width']) ? $tools['popup_imgage_width'] : '47'; ?>" height="<?php echo isset($tools['popup_imgage_height']) ? $tools['popup_imgage_height'] : '47'; ?>" alt ng:if="retina === 'true'" />
										<img ng:src="{{ ::product.thumb }}" alt ng:if="retina === 'false'" />
									</a>
								</div>
							<?php } ?>

							<?php if (isset($tools['popup_name']) && $tools['popup_name'] === 'true') { ?>
								<div class="flycart-product-name">
									<a ng:href="{{ ::product.href }}" class="related-links"><span ng:bind-html="::product.name"></span></a>

								<?php if (isset($tools['popup_alert_on']) && $tools['popup_alert_on'] === 'true') { ?>
								<span class="maximum-alert" ng:if="product.quantity >= product.maximum"><?php echo $min_error; ?></span>
								<?php } ?>

								<?php if (isset($tools['popup_info_on']) && $tools['popup_info_on'] === 'true') { ?>
								<span class="minimum-alert" ng:if="product.quantity <= product.minimum && product.minimum > 1"><?php echo $max_error; ?></span>
								<?php } ?>

								<?php if (isset($tools['popup_premove']) && $tools['popup_premove'] === 'true') { ?>
									<span ng:click="removeProduct(product.key);" class="flycart-product-remove-button min">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="14px" height="14px"><path d="M6.9997916,3.8641534L3.1369467,0L0,3.1116669L3.8753459,6.988327L3.8632617,7l0.0120842,0.0120897 L0,10.8883333L3.1369467,14l3.8628449-3.8637362L10.8630533,14L14,10.8883333l-3.8757629-3.8762436L10.136322,7l-0.012085-0.011673 L14,3.1116669L10.8630533,0L6.9997916,3.8641534z"/>
										</svg>
									</span>
								<?php } ?>
								</div>
								<div class="clearfix"></div>
							<?php } ?>

							<?php if (isset($tools['popup_counter']) && $tools['popup_counter'] === 'true' || isset($tools['popup_price']) && $tools['popup_price'] === 'true') { ?>
								<div class="flycart-product-resp min">
								<?php if (isset($tools['popup_counter']) && $tools['popup_counter'] === 'true') { ?>
									<div class="flycart-product-quantity">
										<?php if (isset($tools['popup_max_on']) && $tools['popup_max_on'] === 'true') { ?>
										<kw:number model="product.quantity" key="{{ ::product.key }}" min="{{ ::product.minimum }}"></kw:number>
										<?php } else { ?>
										<kw:number model="product.quantity" key="{{ ::product.key }}" min="{{ ::product.minimum }}" max="{{ ::product.maximum }}"></kw:number>
										<?php } ?>
									</div>
								<?php } ?>

								<?php if (isset($tools['popup_price']) && $tools['popup_price'] === 'true') { ?>
									<div class="flycart-product-total<?php if ($tools['popup_premove'] === 'false') { ?> right-price<?php } ?>">
										<span class="price" ng:bind-html="::product.total" ng:if="!product.special"></span>
										<span class="price-old" ng:bind-html="::product.special" ng:if="product.special"></span>
										<span class="price-new" ng:bind-html="::product.total" ng:if="product.special"></span>
									</div>
								<?php } ?>
								</div>
								<div class="clearfix"></div>
							<?php } ?>

								<div class="flycart-product-options" ng:if="product.option.length > 0">
									<span class="flycart-product-option" ng:repeat="option in product.option" ng:cloak>-
										<span ng:bind-html="::option.name"></span>:
										<span ng:bind-html="::option.value"></span>
									</span>
									<?php if (isset($text_payment_profile)) { ?>
									<span class="flycart-product-option" ng:if="product.recurring">
											- <?php echo $text_payment_profile ?> {{ ::product.profile }}
									</span>
									<?php } ?>
								</div>
							</td>
							<?php } ?>

						<?php if (isset($tools['popup_counter']) && $tools['popup_counter'] === 'true') { ?>
						<td class="flycart-product-quantity max">
							<?php if (isset($tools['popup_max_on']) && $tools['popup_max_on'] === 'true') { ?>
								<kw:number model="product.quantity" key="{{ ::product.key }}" min="{{ ::product.minimum }}"></kw:number>
							<?php } else { ?>
								<kw:number model="product.quantity" key="{{ ::product.key }}" min="{{ ::product.minimum }}" max="{{ ::product.maximum }}"></kw:number>
							<?php } ?>
						</td>
						<?php } ?>

						<?php if (isset($tools['popup_price']) && $tools['popup_price'] === 'true') { ?>
						<td class="flycart-product-total max<?php if ($tools['popup_premove'] === 'false') { ?> right-price<?php } ?>">
							<span class="price" ng:bind-html="::product.total" ng:if="!product.special"></span>
							<span class="price-old" ng:bind-html="::product.special" ng:if="product.special"></span>
							<span class="price-new" ng:bind-html="::product.total" ng:if="product.special"></span>
						</td>
						<?php } ?>

						<?php if (isset($tools['popup_premove']) && $tools['popup_premove'] === 'true') { ?>
						<td class="flycart-product-remove max" ng:init="remove[$index] = false;">
							<span ng:click="removeProduct(product.key);" class="flycart-product-remove-button">
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="14px" height="14px"><path d="M6.9997916,3.8641534L3.1369467,0L0,3.1116669L3.8753459,6.988327L3.8632617,7l0.0120842,0.0120897 L0,10.8883333L3.1369467,14l3.8628449-3.8637362L10.8630533,14L14,10.8883333l-3.8757629-3.8762436L10.136322,7l-0.012085-0.011673 L14,3.1116669L10.8630533,0L6.9997916,3.8641534z"/>
								</svg>
							</span>
						</td>
						<?php } ?>
					</tr>

					<tr class="flycart-product" ng:repeat="voucher in cart.vouchers">
						<td class="flycart-product-image"></td>
						<td class="flycart-product-name"><a ng:href="{{ ::voucher.href }}"><span ng:bind-html="::voucher.description"></span></a></td>
						<td class="flycart-product-quantity">x&nbsp;1</td>
						<td class="flycart-product-total" ng:bind-html="::voucher.amount"></td>
						<td class="flycart-product-remove">
							<span ng:click="removeProduct(voucher.key);" class="flycart-product-remove-button">
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="14px" height="14px"><path d="M6.9997916,3.8641534L3.1369467,0L0,3.1116669L3.8753459,6.988327L3.8632617,7l0.0120842,0.0120897 L0,10.8883333L3.1369467,14l3.8628449-3.8637362L10.8630533,14L14,10.8883333l-3.8757629-3.8762436L10.136322,7l-0.012085-0.011673 L14,3.1116669L10.8630533,0L6.9997916,3.8641534z"/>
								</svg>
							</span>
						</td>
					</tr>
				</table>

				<div class="flycart-totals" ng:if="show_totals === 'true'">
					<div class="flycart-total" ng:repeat="total in cart.totals">
						<span class="flycart-total-label" ng:bind-html="total.title + ':'"></span>
						<span class="flycart-total-result" ng:bind-html="total.text"></span>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

			<div class="flycart-container empty-cart" ng:if="cart.products.length === 0 && cart.vouchers.length === 0">
			<?php if (isset($tools['popup_empty_type']) && $tools['popup_empty_type'] === 'text') { ?>
				<span><?php echo (isset($tools['popup_empty_text_lang'][$lang_id]) && $tools['popup_empty_text_lang'][$lang_id]) ? $tools['popup_empty_text_lang'][$lang_id] : $text_empty; ?></span>
			<?php } elseif ($tools['popup_empty_type'] === 'image') { ?>
				<img src="./kw_application/flycart/images/empty/<?php echo isset($tools['module_empty_image']['src']) ? $tools['module_empty_image']['src'] : 'emptycart-1.png'; ?>" alt="" width="<?php echo isset($tools['module_empty_image']['width']) ? $tools['module_empty_image']['width'] : '140'; ?>" height="<?php echo isset($tools['module_empty_image']['height']) ? $tools['module_empty_image']['height'] : '120'; ?>" ng:if="retina === 'true'" />
				<img src="./kw_application/flycart/images/empty/<?php echo isset($tools['module_empty_image']['src']) ? $tools['module_empty_image']['src'] : 'emptycart-1.png'; ?>" alt="" ng:if="retina === 'false'" />
			<?php } ?>
			</div>

			<div class="flycart-options-footer"
			ng:class="{
				'button-count-3': (continue_btn === 'true' && viewcart_btn === 'true' && checkout_btn === 'true'),
				'button-count-2': (continue_btn === 'true' && viewcart_btn === 'true' && checkout_btn === 'false') ||
				(continue_btn === 'true' && viewcart_btn === 'false' && checkout_btn === 'true') ||
				(continue_btn === 'false' && viewcart_btn === 'true' && checkout_btn === 'true'),
				'button-empty': (continue_btn === 'true' && cart.products.length < 1 && cart.vouchers.length < 1)
			}"

				ng:if="
					continue_btn === 'true' ||
					viewcart_btn === 'true' && cart.products.length || viewcart_btn === 'true' && cart.vouchers.length ||
					checkout_btn === 'true' && cart.products.length || checkout_btn === 'true' && cart.vouchers.length ||
					popup_footer_items === 'true' && cart.products.length || checkout_btn === 'true' && cart.vouchers.length ||
					popup_footer_weight === 'true' && cart.products.length || checkout_btn === 'true' && cart.vouchers.length ||
					popup_footer_total === 'true' && cart.products.length || checkout_btn === 'true' && cart.vouchers.length
				">

				<div ng:if="cart.products.length > 0 || cart.vouchers.length > 0">
					<div class="flycart-footer-info" ng:if="<?php echo isset($tools['popup_footer_items']) ? $tools['popup_footer_items'] : 'true'; ?> || <?php echo isset($tools['popup_footer_weight']) ? $tools['popup_footer_weight'] : 'true'; ?> || <?php echo isset($tools['popup_footer_total']) ? $tools['popup_footer_total'] : 'true'; ?>">

						<?php if (isset($tools['popup_footer_items']) && $tools['popup_footer_items'] === 'true') { ?>
							<span class="flycart-footer-info-items">
							{{cart.count | declension:'<?php echo $items_b1; ?>':'<?php echo $items_b2; ?>':'<?php echo $items_b3; ?>'}}&nbsp;
						</span>
						<?php } ?>
						<?php if (isset($tools['popup_footer_names']) && $tools['popup_footer_names'] === 'true') { ?>
							<span class="flycart-footer-info-items">
							{{cart.products.length | declension:'<?php echo $items_n1; ?>':'<?php echo $items_n2; ?>':'<?php echo $items_n3; ?>'}}&nbsp;
						</span>
						<?php } ?>

						<span class="flycart-footer-info-weight" ng:bind-html="'(' + cart.weight + ')'" ng:if="<?php echo isset($tools['popup_footer_weight']) ? $tools['popup_footer_weight'] : 'true'; ?> && cart.weight.length > 0"></span>
						<span class="flycart-footer-info-total" ng:bind-html="'<?php echo $b_total; ?> ' + cart.total" ng:if="<?php echo isset($tools['popup_footer_total']) ? $tools['popup_footer_total'] : 'true'; ?>"></span>
					</div>
				</div>
				<div class="buttons-container">
					<div class="button-container close-btn" ng:if="<?php echo isset($tools['continue_btn']) ? $tools['continue_btn'] : 'true'; ?>">
						<a href="javascript:void(0);" ng:click="popupClose();" class="flycart-button close-button">
							<span class="flycart-button-text"><?php echo (isset($tools['continue_btn_txt'][$lang_id]) && $tools['continue_btn_txt'][$lang_id]) ? $tools['continue_btn_txt'][$lang_id] : $cont_btn; ?></span>
							<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="298.0143433 388.4876709 16 15" enable-background="new 298.0143433 388.4876709 16 15" xml:space="preserve" width="16px" height="15px"><path d="M314.0143433,398.3878784c0,1.0409546-0.3750305,2.4468994-1.1340637,4.2278442 c-0.0629883,0.1589661-0.2319946,0.5809631-0.3300171,0.7119446c-0.071991,0.1040039-0.1520081,0.1600037-0.25,0.1600037 c-0.1790161,0-0.2860107-0.1409912-0.2860107-0.3279724c0-0.1130066,0.0450134-0.3939819,0.0450134-0.4689941 c0.0269775-0.4219666,0.0449829-0.8059692,0.0449829-1.1529541c0-1.8939209-0.4550171-3.1778564-1.3040466-3.9378357 c-0.5810242-0.5339661-1.2150574-0.8619385-2.1340942-1.0499573c-0.9030457-0.1959839-1.769104-0.2619629-2.9391479-0.2619629 h-2.0000916v2.3998718c0.0270081,0.5059814-0.6520386,0.815979-0.973053,0.4219971l-4.5722046-4.7998047 c-0.2230225-0.2339783-0.2230225-0.6089783,0-0.8439636l4.5722046-4.7997742 c0.3220215-0.3939819,1.000061-0.0840149,0.973053,0.4219666v2.3999023h2.0000916 c4.2421875,0,6.8493042,1.2559509,7.8143616,3.777832C313.8533325,396.1009827,314.0143433,397.1409302,314.0143433,398.3878784z"/></svg>
						</a>
					</div>
					<div class="button-container tocart-btn" ng:if="<?php echo isset($tools['viewcart_btn']) ? $tools['viewcart_btn'] : 'false'; ?> && cart.products.length > 0 || <?php echo isset($tools['viewcart_btn']) ? $tools['viewcart_btn'] : 'false'; ?> && cart.vouchers.length > 0">
						<a href="<?php echo $cart; ?>" class="flycart-button tocart-button">
							<span class="flycart-button-text"><?php echo (isset($tools['viewcart_btn_txt'][$lang_id]) && $tools['viewcart_btn_txt'][$lang_id]) ? $tools['viewcart_btn_txt'][$lang_id] : $tocart_btn; ?></span>
							<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 16 14" enable-background="new 0 0 16 14" xml:space="preserve" width="16px" height="14px"><path d="M5.7885332,11.8324003c0.2402668,0.2485332,0.3652,0.5467997,0.3652,0.8947992 c0,0.3480005-0.1249332,0.6462669-0.3652,0.8948002C5.5481334,13.8706665,5.2597332,14,4.9229331,14 c-0.3363996,0-0.6345329-0.1293335-0.8749332-0.3780003C3.8076,13.3734665,3.6924,13.0752001,3.6924,12.7271996 c0-0.3479996,0.1152-0.646266,0.3555999-0.8947992c0.2404003-0.2485332,0.5385337-0.3778667,0.8749332-0.3778667 C5.2597332,11.4545336,5.5481334,11.5838671,5.7885332,11.8324003L5.7885332,11.8324003z M14.4038668,11.8324003 c0.2404003,0.2485332,0.3653336,0.5467997,0.3653336,0.8947992c0,0.3480005-0.1249332,0.6462669-0.3653336,0.8948002 C14.1634665,13.8706665,13.8750668,14,13.5383997,14c-0.3365326,0-0.6346664-0.1293335-0.8749332-0.3780003 c-0.2403994-0.2485332-0.3557329-0.5467997-0.3557329-0.8948002c0-0.3479996,0.1153336-0.646266,0.3557329-0.8947992 c0.2402668-0.2485332,0.5384007-0.3778667,0.8749332-0.3778667C13.8750668,11.4545336,14.1634665,11.5838671,14.4038668,11.8324003 L14.4038668,11.8324003z M16,1.9092V7c0,0.3182669-0.2307997,0.5965333-0.5481329,0.6364002L5.4133334,8.8494663 C5.4326668,9.0084,5.5385332,9.3764,5.5385332,9.5454664c0,0.1094666-0.0770664,0.3182669-0.2307997,0.6362667h8.8461332 c0.3365335,0,0.6153336,0.2885332,0.6153336,0.6365337c0,0.3479996-0.2788,0.6362667-0.6153336,0.6362667H4.3077335 c-0.3365335,0-0.6153336-0.2882671-0.6153336-0.6362667c0-0.0897331,0.0383999-0.2189331,0.1056001-0.3880005 c0.0673332-0.1689329,0.1634665-0.367733,0.2789333-0.5965328C4.2018666,9.6051998,4.2691998,9.485733,4.2789335,9.4560003 L2.5768001,1.2726667H0.6153333C0.2788,1.2726667,0,0.9844,0,0.6364C0,0.2885333,0.2788,0,0.6153333,0h2.4616001 c0.3173332,0,0.5,0.1890667,0.5865333,0.4673333C3.7018666,0.5668,3.7307999,0.6562667,3.7404001,0.7258667 c0.0288,0.1492,0.0865333,0.4574666,0.0962665,0.5468h11.5480003C15.7212,1.2726667,16,1.5612,16,1.9092z"/></svg>
						</a>
					</div>
					<div class="button-container checkout-btn" ng:if="<?php echo isset($tools['checkout_btn']) ? $tools['checkout_btn'] : 'true'; ?> && cart.products.length > 0 || <?php echo isset($tools['checkout_btn']) ? $tools['checkout_btn'] : 'true'; ?> && cart.vouchers.length > 0">
						<a href="<?php echo $checkout; ?>" class="flycart-button checkout-button"><?php echo (isset($tools['checkout_btn_txt'][$lang_id]) && $tools['checkout_btn_txt'][$lang_id]) ? $tools['checkout_btn_txt'][$lang_id] : $check_btn; ?></a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</script>

	<?php if (isset($tools['options']) && $tools['options'] === 'true') : ?>
	<script type="text/ng-template" id="flycartOptions.html">
		<form name="flycartOptions" novalidate id="flycart-options-dialog" class="zoom-anim-dialog">
			<div class="flycart-options-header">
				<?php echo $options_text; ?>
				<span class="flycart-options-close" ng:click="popupClose();">
					<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 14 14" enable-background="new 0 0 14 14" xml:space="preserve" width="14px" height="14px"><path d="M13.783968,2.3037212c0.288043-0.2881861,0.288043-0.7556047,0-1.0437908l-1.0437918-1.0437908 c-0.288043-0.2881861-0.755332-0.2881861-1.0437918,0L7.5220523,4.3908868c-0.2884603,0.2881861-0.7557487,0.2881861-1.0437918,0 L2.3035111,0.2161396c-0.288043-0.2881861-0.7553315-0.2881861-1.0433747,0L0.216345,1.2599304 c-0.28846,0.2881861-0.28846,0.7556047,0,1.0437908l4.1743326,4.1743317c0.2884598,0.2886019,0.2884598,0.7556047,0,1.0437908 l-4.1743326,4.174747C0.0779509,11.8350697,0,12.0226192,0,12.2184858c0,0.1954508,0.0779509,0.3834171,0.216345,0.5218954 l1.0437915,1.0437908c0.2880431,0.2877703,0.7553316,0.2877703,1.0433747,0l4.1747494-4.1751633 c0.288043-0.2877703,0.7553315-0.2877703,1.0437918,0l4.1743321,4.1751633c0.2884598,0.2877703,0.7557487,0.2877703,1.0437918,0 l1.0437918-1.0437908c0.1383934-0.1384783,0.2159281-0.3264446,0.2159281-0.5218954 c0-0.1958666-0.0775347-0.3834162-0.2159281-0.5218954l-4.1747494-4.174747c-0.288043-0.2881861-0.288043-0.7551889,0-1.0437908 L13.783968,2.3037212z"/></svg>
				</span>
				<div class="flycart-options-product">
					<img ng:src="{{ ::options.image }}" width="30" height="30" alt ng:if="retina === 'true'" />
					<img ng:src="{{ ::options.image }}" alt ng:if="retina === 'false'" />
					<span ng:bind-html="::options.name"></span>
				</div>
			</div>

			<div class="flycart-options zoom-anim-dialog" ng:if="options">
				<div class="flycart-options-wrapper">
					<div class="flycart-option" ng:repeat="option in options" ng:if="option.name">

						<label ng:bind-html="::option.name" ng:class="{'required': option.required === '1' }" class="flycart-name-label"></label>

						<div ng:if="::option.type === 'select'" class="flycart-option-row">
							<!-- option select -->
							<select ng:if="::option.type === 'select'" ng:model="flyoptions[option.product_option_id]" name="{{ option.product_option_id }}" ng:required="option.required === '1'" ng:change="priceRecalc()">
								<option value=""><?php echo $select_text; ?></option>
								<option ng:repeat="value in option.option_value track by $index" value="{{ ::value.product_option_value_id }}"
								        ng:if="::value.price"
								        ng:bind-html="value.name + ' (' + value.price_prefix + ' ' + value.price + ')'"></option>

								<option ng:repeat="value in option.option_value track by $index" value="{{ ::value.product_option_value_id }}"
								        ng:if="::value.price === false"
								        ng:bind-html="::value.name"></option>
							</select>
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'radio'" class="flycart-option-row">
							<!-- option select -->
							<label ng:repeat="value in option.option_value track by $index">
								<input type="radio" ng:model="flyoptions[option.product_option_id]" ng:value="::value.product_option_value_id" name="{{ option.product_option_id }}" ng:required="option.required === '1'" ng:change="priceRecalc()" />
								<span ng:bind-html="::value.name"></span>
								<span ng:if="::value.price !== false" ng:bind-html="' (' + value.price_prefix + ' ' + value.price + ')'"></span>
							</label>
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'checkbox'" class="flycart-option-row">
							<!-- option checkbox -->
							<label ng:repeat="value in option.option_value track by $index">
								<input type="checkbox" checklist-model="flyoptions[option.product_option_id]" checklist-value="value.product_option_value_id" checklist-required="option.required" name="{{ option.product_option_id }}" ng:change="priceRecalc()" />
								<span ng:bind-html="::value.name"></span>
								<span ng:if="::value.price !== false" ng:bind-html="' (' + value.price_prefix + ' ' + value.price + ')'"></span>
							</label>
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'image'" class="flycart-option-row">
							<!-- option image -->
							<table class="flycart-option-image">
								<tr ng:repeat="value in option.option_value track by $index">
									<td style="width: 1px;"><input type="radio" ng:model="flyoptions[option.product_option_id]" ng:value="::value.product_option_value_id" id="option-value-{{ ::value.product_option_value_id }}" name="{{ option.product_option_id }}" ng:required="option.required === '1'" ng:change="priceRecalc()" /></td>
									<td><label for="option-value-{{ ::value.product_option_value_id }}"><img ng:src="{{ ::value.image }}" alt /></label></td>
									<td><label for="option-value-{{ ::value.product_option_value_id }}">
											<span ng:bind-html="::value.name"></span>
											<span ng:if="::value.price !== false" ng:bind-html="' (' + value.price_prefix + ' ' + value.price + ')'"></span>
									</label></td>
								</tr>
							</table>
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'text'" ng:init="flyoptions[option.product_option_id] = option.value" class="flycart-option-row">
							<!-- option text -->
							<input type="text" ng:model="flyoptions[option.product_option_id]" name="{{ option.product_option_id }}" ng:required="option.required === '1'" />
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'textarea'" ng:init="flyoptions[option.product_option_id] = option.value" class="flycart-option-row">
							<!-- option textarea -->
							<textarea cols="40" rows="5" ng:model="flyoptions[option.product_option_id]" name="{{ option.product_option_id }}" ng:required="option.required === '1'"></textarea>
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'file'" class="flycart-option-row">
							<!-- option file -->
							<div class="flycart-option-file" flow-init
							     flow-file-success="uploadSuccess($file, $message, option.product_option_id)"
							     flow-files-submitted="$flow.upload()">

								<button type="button" class="flycart-file-button" flow-btn>
									<?php echo (isset($tools['options_file_btn_txt'][$lang_id]) && $tools['options_file_btn_txt'][$lang_id]) ? $tools['options_file_btn_txt'][$lang_id] : $file_btn; ?>

									<img src="./kw_application/flycart/catalog/img/loading.gif" class="loading" ng:if="$flow.files[0].isUploading()" />
								</button>

								<span ng:if="uploadErrorMessage[option.product_option_id]"
								      ng:bind-html="uploadErrorMessage[option.product_option_id]" class="error"></span>

								<span ng:if="uploadSuccessMessage[option.product_option_id]"
								      ng:bind-html="uploadSuccessMessage[option.product_option_id]" class="success"></span>

								<input type="hidden" ng:model="flyoptions[option.product_option_id]" name="{{ option.product_option_id }}" ng:required="option.required === '1'" />
							</div>
							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'date'" ng:init="flyoptions[option.product_option_id] = option.value" class="flycart-option-row">
							<!-- option date -->
							<input type="text"
							       ng:model="flyoptions[option.product_option_id]"
							       name="{{ option.product_option_id }}"
							       ng:required="option.required === '1'"
							       datetime-picker="yyyy-MM-dd"
							       is-open="date[$index]"
							       ng:click="date[$index] = true"
							       enable-time="false"
							       datepicker-options="dateOptions"

							       today-text="<?php echo $today_txt; ?>"
							       date-text="<?php echo $date_txt; ?>"
							       clear-text="<?php echo $clear_txt; ?>"
							       close-text="<?php echo $close_txt; ?>"
								/>

							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'datetime'" ng:init="flyoptions[option.product_option_id] = option.value" class="flycart-option-row">
							<!-- option datetime -->
							<input type="text"
							       ng:model="flyoptions[option.product_option_id]"
							       name="{{ option.product_option_id }}"
							       ng:required="option.required === '1'"
							       datetime-picker="yyyy-MM-dd HH:mm"
							       is-open="datetime[$index]"
							       timepicker-options="timeOptions"
							       ng:click="datetime[$index] = true"
							       datepicker-options="dateOptions"

							       today-text="<?php echo $today_txt; ?>"
							       now-text="<?php echo $now_txt; ?>"
							       date-text="<?php echo $date_txt; ?>"
							       time-text="<?php echo $time_txt; ?>"
							       clear-text="<?php echo $clear_txt; ?>"
							       close-text="<?php echo $close_txt; ?>"
								/>

							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>

						<div ng:if="::option.type === 'time'" ng:init="flyoptions[option.product_option_id] = option.value" class="flycart-option-row">
							<!-- option time -->
							<input type="text"
							       ng:model="flyoptions[option.product_option_id]"
							       name="{{ option.product_option_id }}"
							       ng:required="option.required === '1'"
							       datetime-picker="HH:mm"
							       is-open="time[$index]"
							       ng:click="time[$index] = true"
							       timepicker-options="timeOptions"
							       enable-date="false"

							       now-text="<?php echo $now_txt; ?>"
							       time-text="<?php echo $time_txt; ?>"
							       clear-text="<?php echo $clear_txt; ?>"
							       close-text="<?php echo $close_txt; ?>"
								/>

							<span class="flycart-option-error" ng:if="option.required === '1' && flycartOptions[option.product_option_id].$dirty && flycartOptions[option.product_option_id].$error.required"><?php echo $require_text; ?></span>
						</div>
					</div>
				</div>
			</div>

			<div class="flycart-options-footer options-footer">
				<span class="totals">
					<span class="flycart-options-price" ng:bind-html="options.total" ng:if="!options.special"></span>
					<span class="flycart-options-price-old" ng:bind-html="options.total" ng:if="options.special"></span>
					<span class="flycart-options-price-special" ng:bind-html="options.special" ng:if="options.special"></span>
				</span>

				<button type="submit" class="flycart-options-button flycart-button options-button tocart-button" ng:click="addToCartOptions(flycartOptions, flyoptions, options.product_id);" ng:class="{ 'invalid': flycartOptions.$invalid, 'loadind': optionsLoading }">
					<span ng:if="!optionsLoading"><?php echo (isset($tools['options_btn_txt'][$lang_id]) && $tools['options_btn_txt'][$lang_id]) ? $tools['options_btn_txt'][$lang_id] : $add_btn; ?></span>
					<span ng:if="optionsLoading"><?php echo $adding_btn; ?></span>
				</button>

				<?php if (isset($tools['popup_max_on']) && $tools['popup_max_on'] === 'true') { ?>
					<kw:number model="flyoptions.quantity" min="{{ ::options.minimum }}" ng:init="flyoptions.quantity = options.minimum | num" options="true"></kw:number>
				<?php } else { ?>
					<kw:number model="flyoptions.quantity" min="{{ ::options.minimum }}" max="{{ ::options.maximum }}" ng:init="flyoptions.quantity = options.minimum | num" options="true"></kw:number>
				<?php } ?>
			</div>
		</form>
	</script>
	<?php endif; ?>
</div>

<script type="text/json" id="flycartTools">
	{
		"url" 									: "<?php echo $url; ?>",
		"options" 							: "<?php echo isset($tools['options']) ? $tools['options'] : 'true'; ?>",
		"retina" 								: "<?php echo isset($tools['retina']) ? $tools['retina'] : 'true'; ?>",
		"module_type" 					: "<?php echo isset($tools['module_type']) ? $tools['module_type'] : 'widget'; ?>",
		"standart_cart" 				: "<?php echo isset($tools['standart_cart']) ? $tools['standart_cart'] : '#cart button'; ?>",
		"button_others" 				: "<?php echo isset($tools['button_others']) ? $tools['button_others'] : '[onclick*=\'cart.add\']'; ?>",
		"button_product" 				: "<?php echo isset($tools['button_product']) ? $tools['button_product'] : '#button-cart'; ?>",
		"product_id_all" 				: "<?php echo (isset($tools['product_id_all']) && $tools['product_id_all'] !== '') ? $tools['product_id_all'] : 'angular.element(this).attr(\'onclick\')'; ?>",
		"continue_btn"					: "<?php echo isset($tools['continue_btn']) ? $tools['continue_btn'] : 'true'; ?>",
		"viewcart_btn"					: "<?php echo isset($tools['viewcart_btn']) ? $tools['viewcart_btn'] : 'false'; ?>",
		"checkout_btn"					: "<?php echo isset($tools['checkout_btn']) ? $tools['checkout_btn'] : 'true'; ?>",
		"show_totals"						: "<?php echo isset($tools['show_totals']) ? $tools['show_totals'] : 'true'; ?>",
		"widget_empty"					: "<?php echo isset($tools['widget_empty']) ? $tools['widget_empty'] : 'true'; ?>",
		"click_action"					: "<?php echo isset($tools['click_action']) ? $tools['click_action'] : 'flycart'; ?>",
		"click_action_link"			: "<?php echo isset($tools['click_action_link']) ? $tools['click_action_link'] : 'http://flycart.dev/index.php?route=checkout/cart'; ?>",
		"click_action_mod"			: "<?php echo isset($tools['click_action_mod']) ? $tools['click_action_mod'] : 'flycart'; ?>",
		"click_action_mod_link"	: "<?php echo isset($tools['click_action_mod_link']) ? $tools['click_action_mod_link'] : 'http://flycart.dev/index.php?route=checkout/cart'; ?>",
		"noti_type"							: "<?php echo isset($tools['noti_type']) ? $tools['noti_type'] : 'advanced'; ?>",
		"noti_image_width"			: "<?php echo isset($tools['noti_image_width']) ? $tools['noti_image_width'] : '70'; ?>",
		"noti_image_height"			: "<?php echo isset($tools['noti_image_height']) ? $tools['noti_image_height'] : '70'; ?>",
		"light_image_width"			: "<?php echo isset($tools['light_image_width']) ? $tools['light_image_width'] : '115'; ?>",
		"light_image_height"		: "<?php echo isset($tools['light_image_height']) ? $tools['light_image_height'] : '115'; ?>",
		"advanced_image_width"	: "<?php echo isset($tools['advanced_image_width']) ? $tools['advanced_image_width'] : '115'; ?>",
		"advanced_image_height"	: "<?php echo isset($tools['advanced_image_height']) ? $tools['advanced_image_height'] : '115'; ?>",
		"noti_timeout"					: "<?php echo isset($tools['noti_timeout']) ? $tools['noti_timeout'] : '7'; ?>",
		"popup_imgage_width"		: "<?php echo isset($tools['popup_imgage_width']) ? $tools['popup_imgage_width'] : '47'; ?>",
		"popup_imgage_height"		: "<?php echo isset($tools['popup_imgage_height']) ? $tools['popup_imgage_height'] : '47'; ?>",
		"module_imgage_width"		: "<?php echo isset($tools['module_imgage_width']) ? $tools['module_imgage_width'] : '156'; ?>",
		"module_imgage_height"	: "<?php echo isset($tools['module_imgage_height']) ? $tools['module_imgage_height'] : '156'; ?>",
		"effect_type"						: "<?php echo isset($tools['effect_type']) ? $tools['effect_type'] : 'product'; ?>",
		"effect_product_img"		: "<?php echo isset($tools['effect_product_img']) ? $tools['effect_product_img'] : 'true'; ?>",
		"effect_rotate"					: "<?php echo isset($tools['effect_rotate']) ? $tools['effect_rotate'] : 'true'; ?>",
		"effect_frame_speed"		: "<?php echo isset($tools['effect_frame_speed']) ? $tools['effect_frame_speed'] : '1000'; ?>",
		"widget_null"						: "<?php echo isset($tools['widget_null']) ? $tools['widget_null'] : 'true'; ?>",
		"popup_footer_items"		: "<?php echo isset($tools['popup_footer_items']) ? $tools['popup_footer_items'] : 'true'; ?>",
		"popup_footer_weight"		: "<?php echo isset($tools['popup_footer_weight']) ? $tools['popup_footer_weight'] : 'true'; ?>",
		"popup_footer_total"		: "<?php echo isset($tools['popup_footer_total']) ? $tools['popup_footer_total'] : 'true'; ?>",
		"effect_frame_offset_top": "<?php echo isset($tools['effect_frame_offset_top']) ? $tools['effect_frame_offset_top'] : '0'; ?>",
		"effect_frame_offset_left": "<?php echo isset($tools['effect_frame_offset_left']) ? $tools['effect_frame_offset_left'] : '0'; ?>",
		<?php if ($language === 'ru') { ?>
		"locale"                : "ru-ru"
		<?php } else { ?>
		"locale"                : "en"
		<?php } ?>
	}
</script>

<style>
<?php if (isset($tools['click_action']) && $tools['click_action'] === 'flycart' || isset($tools['options']) && $tools['options'] === 'true' || isset($tools['click_action_mod']) && $tools['click_action_mod'] === 'flycart') { ?>
	.mfp-bg.default {
	<?php if (isset($tools['overlay_bg_on']) && $tools['overlay_bg_on'] === 'true') { ?>
		background-color: <?php echo isset($tools['overlay_bg']) ? $tools['overlay_bg'] : 'rgba(0,0,0,0.9)'; ?>;
	<?php } ?>
	<?php if (isset($tools['overlay_image_on']) && $tools['overlay_image_on'] === 'true') { ?>
		background-image: url(./kw_application/flycart/images/bg/<?php echo isset($tools['overlay_image']['src']) ? $tools['overlay_image']['src'] : 'carbon.png'; ?>);
	<?php } ?>
	}
	
	#flycart-dialog,
	#flycart-options-dialog {
		min-width: <?php echo isset($tools['min_width']) ? $tools['min_width'] : '300'; ?>px;
		max-width: <?php echo isset($tools['max_width']) ? $tools['max_width'] : '560'; ?>px;
		min-height: <?php echo isset($tools['min_height']) ? $tools['min_height'] : '200'; ?>px;
		max-height: <?php echo isset($tools['max_height']) ? $tools['max_height'] : '560'; ?>px;
		
		<?php if (isset($tools['popup_shadow_on']) && $tools['popup_shadow_on'] === 'true') { ?>
		-webkit-box-shadow: <?php echo isset($tools['popup_shadowx']) ? $tools['popup_shadowx'] : '0'; ?>px <?php echo isset($tools['popup_shadowy']) ? $tools['popup_shadowy'] : '0'; ?>px <?php echo isset($tools['popup_shadowblur']) ? $tools['popup_shadowblur'] : '0'; ?>px <?php echo isset($tools['popup_shadowcolor']) ? $tools['popup_shadowcolor'] : 'rgba(0, 0, 0, 0)'; ?>;
		box-shadow: <?php echo isset($tools['popup_shadowx']) ? $tools['popup_shadowx'] : '0'; ?>px <?php echo isset($tools['popup_shadowy']) ? $tools['popup_shadowy'] : '0'; ?>px <?php echo isset($tools['popup_shadowblur']) ? $tools['popup_shadowblur'] : '0'; ?>px <?php echo isset($tools['popup_shadowcolor']) ? $tools['popup_shadowcolor'] : 'rgba(0, 0, 0, 0)'; ?>;
		<?php } ?>
		
		<?php if (isset($tools['popup_radius']) && $tools['popup_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['popup_radiust']) ? $tools['popup_radiust'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusr']) ? $tools['popup_radiusr'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusb']) ? $tools['popup_radiusb'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusl']) ? $tools['popup_radiusl'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?>;
		border-radius: <?php echo isset($tools['popup_radiust']) ? $tools['popup_radiust'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusr']) ? $tools['popup_radiusr'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusb']) ? $tools['popup_radiusb'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusl']) ? $tools['popup_radiusl'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?>;
		<?php } ?>

		background-color: <?php echo isset($tools['popup_bg']) ? $tools['popup_bg'] : 'rgba(250,250,250,1)'; ?>;
		color: <?php echo isset($tools['popup_text_color']) ? $tools['popup_text_color'] : 'rgba(76,76,76,1)'; ?>;
	}
	
	.flycart-options-header {
		background-color: <?php echo isset($tools['popup_header_bg']) ? $tools['popup_header_bg'] : 'rgba(245,245,245,1)'; ?>;
		<?php if (isset($tools['popup_header_shadow_on']) && $tools['popup_header_shadow_on'] === 'true') { ?>
		-webkit-box-shadow: 0px 1px 0px <?php echo isset($tools['popup_header_shadow']) ? $tools['popup_header_shadow'] : 'rgba(167,167,167,0.05)'; ?>;
		box-shadow: 0px 1px 0px <?php echo isset($tools['popup_header_shadow']) ? $tools['popup_header_shadow'] : 'rgba(167,167,167,0.05)'; ?>;
		<?php } ?>
		color: <?php echo isset($tools['popup_header_text']) ? $tools['popup_header_text'] : 'rgba(75,75,75,1)'; ?>;
		
		<?php if (isset($tools['popup_radius']) && $tools['popup_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['popup_radiust']) ? $tools['popup_radiust'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusr']) ? $tools['popup_radiusr'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> 0 0;
		border-radius: <?php echo isset($tools['popup_radiust']) ? $tools['popup_radiust'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusr']) ? $tools['popup_radiusr'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> 0 0;
		<?php } ?>
	}
	
	<?php if (isset($tools['popup_header_items']) && $tools['popup_header_items'] === 'true' || isset($tools['popup_header_weight']) && $tools['popup_header_weight'] === 'true' || isset($tools['popup_header_total']) && $tools['popup_header_total'] === 'true') { ?>
	.flycart-header-info {
		color: <?php echo isset($tools['popup_header_info']) ? $tools['popup_header_info'] : 'rgba(75,75,75,1)'; ?>;
	}
	<?php } ?>
	
	.flycart-options-close {
		fill: <?php echo isset($tools['popup_header_close']) ? $tools['popup_header_close'] : 'rgba(123,123,123,1)'; ?>;
	}
	
	.flycart-options-close:hover {
		fill: <?php echo isset($tools['popup_header_close_hover']) ? $tools['popup_header_close_hover'] : 'rgba(153,144,144,1)'; ?>;
	}

	.flycart-product-name {
		margin-left: <?php echo isset($tools['popup_imgage_width']) ? $tools['popup_imgage_width'] + 18 : '65'; ?>px;
	}
	
	.flycart-product-name a {
		color: <?php echo isset($tools['popup_link_color']) ? $tools['popup_link_color'] : 'rgba(56,176,227,1)'; ?>;
	}
	
	.flycart-product-name a:hover {
		color: <?php echo isset($tools['popup_link_hover_color']) ? $tools['popup_link_hover_color'] : 'rgba(119,201,236,1)'; ?>;
	}

	.maximum-alert {
		color: <?php echo isset($tools['popup_alert_color']) ? $tools['popup_alert_color'] : 'rgba(255,0,0,1)'; ?>;
	}

	.minimum-alert {
		color: <?php echo isset($tools['popup_info_color']) ? $tools['popup_info_color'] : 'rgba(255,0,0,1)'; ?>;
	}
		
	.flycart-product-total {
		color: <?php echo isset($tools['popup_price_color']) ? $tools['popup_price_color'] : 'rgba(0,0,0,1)'; ?>;
	}
	
	.flycart-product-remove-button {
		fill: <?php echo isset($tools['popup_remove']) ? $tools['popup_remove'] : 'rgba(163,163,163,1)'; ?>;
	}
	
	.flycart-product-remove-button:hover {
		fill: <?php echo isset($tools['popup_remove_hover']) ? $tools['popup_remove_hover'] : 'rgba(186,185,185,1)'; ?>;
	}
	
	<?php if (isset($tools['popup_empty_type']) && $tools['popup_empty_type'] === 'text') { ?>	
	#flycart-dialog .empty-cart {
		color: <?php echo isset($tools['popup_empty_text']) ? $tools['popup_empty_text'] : 'rgba(125,125,125,1)'; ?>;
	}
	<?php } ?>

	<?php if (isset($tools['module_empty_type']) && $tools['module_empty_type'] === 'text') { ?>
	.flycart-module-container .empty-cart {
		color: <?php echo isset($tools['module_empty_text']) ? $tools['module_empty_text'] : 'rgba(75,75,75,1)'; ?>;
	}
	<?php } else { ?>
	.flycart-module-container .empty-cart {
		min-height: <?php echo isset($tools['module_empty_image']['height']) ? $tools['module_empty_image']['height'] : '156'; ?>px;
	}
	<?php } ?>

	.flycart-options-footer {
		background-color: <?php echo isset($tools['popup_footer_bg']) ? $tools['popup_footer_bg'] : 'rgba(245,245,245,1)'; ?>;
		<?php if (isset($tools['popup_footer_shadow_on']) && $tools['popup_footer_shadow_on'] === 'true') { ?>
		-webkit-box-shadow: 0px -1px 0px <?php echo isset($tools['popup_footer_shadow']) ? $tools['popup_footer_shadow'] : 'rgba(167,167,167,0.05)'; ?>;
		box-shadow: 0px -1px 0px <?php echo isset($tools['popup_footer_shadow']) ? $tools['popup_footer_shadow'] : 'rgba(167,167,167,0.05)'; ?>;
		<?php } ?>
		
		<?php if (isset($tools['popup_radius']) && $tools['popup_radius'] === 'true') { ?>
		-webkit-border-radius: 0 0 <?php echo isset($tools['popup_radiusb']) ? $tools['popup_radiusb'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusl']) ? $tools['popup_radiusl'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?>;
		border-radius: 0 0 <?php echo isset($tools['popup_radiusb']) ? $tools['popup_radiusb'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?> <?php echo isset($tools['popup_radiusl']) ? $tools['popup_radiusl'] : '0'; ?><?php echo isset($tools['popup_radiusval']) ? $tools['popup_radiusval'] : 'px'; ?>;
		<?php } ?>
	}

	<?php if (isset($tools['popup_footer_items']) && $tools['popup_footer_items'] === 'true' || isset($tools['popup_footer_weight']) && $tools['popup_footer_weight'] === 'true' || isset($tools['popup_footer_total']) && $tools['popup_footer_total'] === 'true') { ?>
	.flycart-footer-info {
		color: <?php echo isset($tools['popup_footer_info']) ? $tools['popup_footer_info'] : 'rgba(75,75,75,1)'; ?>;
	}
	<?php } ?>
	
	<?php if (isset($tools['continue_btn']) && $tools['continue_btn'] === 'true') { ?>
	.close-button {
		background-color: <?php echo isset($tools['continue_btn_bg']) ? $tools['continue_btn_bg'] : 'rgba(189,189,189,1.00)'; ?> !important;
		color: <?php echo isset($tools['continue_btn_text']) ? $tools['continue_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
		fill: <?php echo isset($tools['continue_btn_text']) ? $tools['continue_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}

	.close-button:hover {
		background-color: <?php echo isset($tools['continue_btn_bg_hover']) ? $tools['continue_btn_bg_hover'] : 'rgba(177,177,177,1.00)'; ?> !important;
		color: <?php echo isset($tools['continue_btn_text_hover']) ? $tools['continue_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
		fill: <?php echo isset($tools['continue_btn_text_hover']) ? $tools['continue_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	<?php if (isset($tools['viewcart_btn']) && $tools['viewcart_btn'] === 'true') { ?>
	.tocart-button {
		background-color: <?php echo isset($tools['viewcart_btn_bg']) ? $tools['viewcart_btn_bg'] : 'rgba(242,166,19,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_btn_text']) ? $tools['viewcart_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
		fill: <?php echo isset($tools['viewcart_btn_text']) ? $tools['viewcart_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	.tocart-button:hover {
		background-color: <?php echo isset($tools['viewcart_btn_bg_hover']) ? $tools['viewcart_btn_bg_hover'] : 'rgba(241,146,9,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_btn_text_hover']) ? $tools['viewcart_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
		fill: <?php echo isset($tools['viewcart_btn_text_hover']) ? $tools['viewcart_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	<?php if (isset($tools['checkout_btn']) && $tools['checkout_btn'] === 'true') { ?>
	.checkout-button {
		background-color: <?php echo isset($tools['checkout_btn_bg']) ? $tools['checkout_btn_bg'] : 'rgba(34,178,43,1)'; ?> !important;
		color: <?php echo isset($tools['checkout_btn_text']) ? $tools['checkout_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
		fill: <?php echo isset($tools['checkout_btn_text']) ? $tools['checkout_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	.checkout-button:hover {
		background-color: <?php echo isset($tools['checkout_btn_bg_hover']) ? $tools['checkout_btn_bg_hover'] : 'rgba(7,153,22,1.00)'; ?> !important;
		color: <?php echo isset($tools['checkout_btn_text_hover']) ? $tools['checkout_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
		fill: <?php echo isset($tools['checkout_btn_text_hover']) ? $tools['checkout_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	.options-button {
		background-color: <?php echo isset($tools['options_btn_bg']) ? $tools['options_btn_bg'] : 'rgba(34,178,43,1)'; ?> !important;
		color: <?php echo isset($tools['options_btn_text']) ? $tools['options_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	.options-button:hover {
		background-color: <?php echo isset($tools['options_btn_bg_hover']) ? $tools['options_btn_bg_hover'] : 'rgba(7,153,22,1.00)'; ?> !important;
		color: <?php echo isset($tools['options_text_hover']) ? $tools['options_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	.flycart-options-button.flycart-button.options-button.loadind, .flycart-options-button.flycart-button.options-button.loadind:hover, .flycart-options-button.flycart-button.options-button.invalid, .flycart-options-button.flycart-button.options-button.invalid:hover {
		background-color: <?php echo isset($tools['options_btn_bg_disabled']) ? $tools['options_btn_bg_disabled'] : 'rgba(167,167,167,1)'; ?> !important;
		color: <?php echo isset($tools['options_btn_text_disabled']) ? $tools['options_btn_text_disabled'] : 'rgba(255,255,255,1)'; ?> !important;
	}

	.flycart-file-button {
		background-color: <?php echo isset($tools['options_file_btn_bg']) ? $tools['options_file_btn_bg'] : 'rgba(18,163,226,1)'; ?> !important;
		color: <?php echo isset($tools['options_file_btn_text']) ? $tools['options_file_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}

	.flycart-file-button.hover {
		background-color: <?php echo isset($tools['options_file_btn_bg_hover']) ? $tools['options_file_btn_bg_hover'] : 'rgba(30,138,210,1)'; ?> !important;
		color: <?php echo isset($tools['options_file_text_hover']) ? $tools['options_file_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
<?php } ?>

<?php if (isset($tools['module_type']) && $tools['module_type'] === 'widget') { ?>	
	#flycart-widget {
		background: url(./kw_application/flycart/images/widget/<?php echo isset($tools['widget_image']['src']) ? $tools['widget_image']['src'] : 'circle-with-blue-cart.png'; ?>) no-repeat;
		background-size: <?php echo isset($tools['widget_image']['width']) ? $tools['widget_image']['width'] : '76'; ?>px <?php echo isset($tools['widget_image']['height']) ? $tools['widget_image']['height'] : '76'; ?>px;
		width: <?php echo isset($tools['widget_width']) ? $tools['widget_width'] : '76'; ?>px;
		height: <?php echo isset($tools['widget_height']) ? $tools['widget_height'] : '76'; ?>px;
		position: <?php echo isset($tools['widget_count_position']) ? $tools['widget_count_position'] : 'fixed'; ?>;
		top: <?php echo is_numeric($tools['widget_count_t']) ? $tools['widget_count_t'] . 'px' : 'auto' ; ?>;
		right: <?php echo is_numeric($tools['widget_count_r']) ? $tools['widget_count_r'] . 'px' : 'auto' ; ?>;
		bottom: <?php echo is_numeric($tools['widget_count_b']) ? $tools['widget_count_b'] . 'px' : 'auto' ; ?>;
		left: <?php echo is_numeric($tools['widget_count_l']) ? $tools['widget_count_l'] . 'px' : 'auto' ; ?>;
	}	

	#flycart-widget .flycart-widget-count {
		<?php if (isset($tools['widget_count_bg_tools']) && $tools['widget_count_bg_tools'] === 'true') { ?>
		background: <?php echo isset($tools['widget_count_bg']) ? $tools['widget_count_bg'] : 'rgba(24,166,229,1)'; ?>;
		padding: <?php echo isset($tools['widget_count_pt']) ? $tools['widget_count_pt'] : '8'; ?>px <?php echo isset($tools['widget_count_pr']) ? $tools['widget_count_pr'] : '8'; ?>px <?php echo isset($tools['widget_count_pb']) ? $tools['widget_count_pb'] : '8'; ?>px <?php echo isset($tools['widget_count_pl']) ? $tools['widget_count_pl'] : '8'; ?>px;

		-webkit-border-radius: <?php echo isset($tools['widget_count_rt']) ? $tools['widget_count_rt'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?> <?php echo isset($tools['widget_count_rr']) ? $tools['widget_count_rr'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?> <?php echo isset($tools['widget_count_rb']) ? $tools['widget_count_rb'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?> <?php echo isset($tools['widget_count_rl']) ? $tools['widget_count_rl'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?>;
		border-radius: <?php echo isset($tools['widget_count_rt']) ? $tools['widget_count_rt'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?> <?php echo isset($tools['widget_count_rr']) ? $tools['widget_count_rr'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?> <?php echo isset($tools['widget_count_rb']) ? $tools['widget_count_rb'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?> <?php echo isset($tools['widget_count_rl']) ? $tools['widget_count_rl'] : '50'; ?><?php echo isset($tools['widget_count_val']) ? $tools['widget_count_val'] : '%'; ?>;
		<?php } ?>
	
		left: <?php echo isset($tools['widget_count_posleft']) ? $tools['widget_count_posleft'] : '10'; ?><?php echo isset($tools['widget_count_posval']) ? $tools['widget_count_posval'] : 'px'; ?>;
		top: <?php echo isset($tools['widget_count_postop']) ? $tools['widget_count_postop'] : '13'; ?><?php echo isset($tools['widget_count_posval']) ? $tools['widget_count_posval'] : 'px'; ?>;
		font-size: <?php echo isset($tools['widget_count_fontsize']) ? $tools['widget_count_fontsize'] : '12'; ?>px;
		line-height: <?php echo isset($tools['widget_count_fontsize']) ? $tools['widget_count_fontsize'] : '12'; ?>px;
		color: <?php echo isset($tools['widget_count_color']) ? $tools['widget_count_color'] : 'rgba(255,255,255,1)'; ?>;
	}
<?php } ?>
	
<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'notice') { ?>
	#flycart-notice {
		<?php if (isset($tools['noti_radius']) && $tools['noti_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['noti_radiust']) ? $tools['noti_radiust'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?> <?php echo isset($tools['noti_radiusr']) ? $tools['noti_radiusr'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?> <?php echo isset($tools['noti_radiusb']) ? $tools['noti_radiusb'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?> <?php echo isset($tools['noti_radiusl']) ? $tools['noti_radiusl'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?>;
		border-radius: <?php echo isset($tools['noti_radiust']) ? $tools['noti_radiust'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?> <?php echo isset($tools['noti_radiusr']) ? $tools['noti_radiusr'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?> <?php echo isset($tools['noti_radiusb']) ? $tools['noti_radiusb'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?> <?php echo isset($tools['noti_radiusl']) ? $tools['noti_radiusl'] : '3'; ?><?php echo isset($tools['noti_radiusval']) ? $tools['noti_radiusval'] : 'px'; ?>;
		<?php } ?>
		<?php if (isset($tools['noti_shadow_on']) && $tools['noti_shadow_on'] === 'true') { ?>
		-webkit-box-shadow: <?php echo isset($tools['noti_shadowx']) ? $tools['noti_shadowx'] : '0'; ?>px <?php echo isset($tools['noti_shadowy']) ? $tools['noti_shadowy'] : '0'; ?>px <?php echo isset($tools['noti_shadowblur']) ? $tools['noti_shadowblur'] : '10'; ?>px <?php echo isset($tools['noti_shadowcolor']) ? $tools['noti_shadowcolor'] : 'rgba(0,0,0,0.15)'; ?>;
		box-shadow: <?php echo isset($tools['noti_shadowx']) ? $tools['noti_shadowx'] : '0'; ?>px <?php echo isset($tools['noti_shadowy']) ? $tools['noti_shadowy'] : '0'; ?>px <?php echo isset($tools['noti_shadowblur']) ? $tools['noti_shadowblur'] : '10'; ?>px <?php echo isset($tools['noti_shadowcolor']) ? $tools['noti_shadowcolor'] : 'rgba(0,0,0,0.15)'; ?>;
		<?php } ?>

		background: <?php echo isset($tools['noti_bg']) ? $tools['noti_bg'] : 'rgba(255,255,255,1)'; ?>;
		min-width: <?php echo isset($tools['noti_width_min']) ? $tools['noti_width_min'] : '50'; ?>px;
		max-width: <?php echo isset($tools['noti_width_max']) ? $tools['noti_width_max'] : '300'; ?>px;
		min-height: <?php echo isset($tools['noti_height_min']) ? $tools['noti_height_min'] : '50'; ?>px;
		max-height: <?php echo isset($tools['noti_height_max']) ? $tools['noti_height_max'] : '200'; ?>px;
		
		top: <?php echo isset($tools['noti_pos_t']) ? $tools['noti_pos_t'] : '20'; ?>px;
		right: <?php echo isset($tools['noti_pos_r']) ? $tools['noti_pos_r'] : '20'; ?>px;
		bottom: <?php echo isset($tools['noti_pos_b']) ? $tools['noti_pos_b'] : 'auto'; ?>px;
		left: <?php echo isset($tools['noti_pos_l']) ? $tools['noti_pos_l'] : 'auto'; ?>px;
	}

	#flycart-notice .notice-product-image {
		width: <?php echo isset($tools['noti_image_width']) ? $tools['noti_image_width'] : '70'; ?>px;
	}
	#flycart-notice .notice-product-name {

	<?php if (isset($tools['noti_image']) && $tools['noti_image'] === 'true') { ?>
		margin-left: <?php echo isset($tools['noti_image_width']) ? $tools['noti_image_width'] + 10 : '80'; ?>px;
	<?php } ?>
		color: <?php echo isset($tools['noti_text']) ? $tools['noti_text'] : 'rgba(101,101,101,1)'; ?>;
	}
	
	#flycart-notice a {
		color: <?php echo isset($tools['noti_link']) ? $tools['noti_link'] : 'rgba(56,176,227,1)'; ?>;
	}
	
	#flycart-notice a:hover {
		color: <?php echo isset($tools['noti_link_hover']) ? $tools['noti_link_hover'] : 'rgba(56,176,227,1)'; ?>;
	}
	
	<?php if (isset($tools['continue_noti_btn']) && $tools['continue_noti_btn'] === 'true') { ?>
	#flycart-notice .close-button {
		background-color: <?php echo isset($tools['continue_noti_btn_bg']) ? $tools['continue_noti_btn_bg'] : 'rgba(189,189,189,1)'; ?> !important;
		color: <?php echo isset($tools['continue_noti_btn_text']) ? $tools['continue_noti_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	#flycart-notice .close-button:hover {
		background-color: <?php echo isset($tools['continue_noti_btn_bg_hover']) ? $tools['continue_noti_btn_bg_hover'] : 'rgba(177,177,177,1)'; ?> !important;
		color: <?php echo isset($tools['continue_noti_btn_text_hover']) ? $tools['continue_noti_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	<?php if (isset($tools['viewcart_noti_btn']) && $tools['viewcart_noti_btn'] === 'true') { ?>
	#flycart-notice .tocart-button {
		background-color: <?php echo isset($tools['viewcart_noti_btn_bg']) ? $tools['viewcart_noti_btn_bg'] : 'rgba(30,138,210,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_noti_btn_text']) ? $tools['viewcart_noti_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	#flycart-notice .tocart-button:hover {
		background-color: <?php echo isset($tools['viewcart_noti_btn_bg_hover']) ? $tools['viewcart_noti_btn_bg_hover'] : 'rgba(44,156,230,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_noti_btn_text_hover']) ? $tools['viewcart_noti_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	#flycart-notice .flycart-options-close {
		fill: <?php echo isset($tools['noti_cross']) ? $tools['noti_cross'] : 'rgba(123,123,123,1)'; ?>;
	}
	
	#flycart-notice .flycart-options-close:hover {
		fill: <?php echo isset($tools['noti_cross_hover']) ? $tools['noti_cross_hover'] : 'rgba(69,65,65,1)'; ?>;
	}
<?php } ?>

<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'light') { ?>
	.mfp-bg.light-overlay {
		<?php if (isset($tools['light_bg_on']) && $tools['light_bg_on'] === 'true') { ?>
		background-color: <?php echo isset($tools['light_overlay_bg']) ? $tools['light_overlay_bg'] : 'rgba(0,0,0,0.6)'; ?>;
		<?php } ?>
		<?php if (isset($tools['light_image_on']) && $tools['light_image_on'] === 'true') { ?>
		background-image: url(./kw_application/flycart/images/bg/<?php echo isset($tools['light_overlay_image']['src']) ? $tools['light_overlay_image']['src'] : 'carbon.png'; ?>);
		<?php } ?>
	}
	
	#flycart-notification.popup {
		min-width: <?php echo isset($tools['light_min_width']) ? $tools['light_min_width'] : '300'; ?>px;
		max-width: <?php echo isset($tools['light_max_width']) ? $tools['light_max_width'] : '560'; ?>px;
		min-height: <?php echo isset($tools['light_min_height']) ? $tools['light_min_height'] : '100'; ?>px;
		max-height: <?php echo isset($tools['light_max_height']) ? $tools['light_max_height'] : '560'; ?>px;
		
		<?php if (isset($tools['light_shadow_on']) && $tools['light_shadow_on'] === 'true') { ?>
		-webkit-box-shadow: <?php echo isset($tools['light_shadowx']) ? $tools['light_shadowx'] : '0'; ?>px <?php echo isset($tools['light_shadowy']) ? $tools['light_shadowy'] : '0'; ?>px <?php echo isset($tools['light_shadowblur']) ? $tools['light_shadowblur'] : '0'; ?>px <?php echo isset($tools['light_shadowcolor']) ? $tools['light_shadowcolor'] : 'rgba(255,255,255,1)'; ?>;;
		box-shadow: <?php echo isset($tools['light_shadowx']) ? $tools['light_shadowx'] : '0'; ?>px <?php echo isset($tools['light_shadowy']) ? $tools['light_shadowy'] : '0'; ?>px <?php echo isset($tools['light_shadowblur']) ? $tools['light_shadowblur'] : '0'; ?>px <?php echo isset($tools['light_shadowcolor']) ? $tools['light_shadowcolor'] : 'rgba(255,255,255,1)'; ?>;
		<?php } ?>
		<?php if (isset($tools['light_radius']) && $tools['light_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['light_radiust']) ? $tools['light_radiust'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?> <?php echo isset($tools['light_radiusr']) ? $tools['light_radiusr'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?> <?php echo isset($tools['light_radiusb']) ? $tools['light_radiusb'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?> <?php echo isset($tools['light_radiusl']) ? $tools['light_radiusl'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?>;;
		border-radius: <?php echo isset($tools['light_radiust']) ? $tools['light_radiust'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?> <?php echo isset($tools['light_radiusr']) ? $tools['light_radiusr'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?> <?php echo isset($tools['light_radiusb']) ? $tools['light_radiusb'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?> <?php echo isset($tools['light_radiusl']) ? $tools['light_radiusl'] : '3'; ?><?php echo isset($tools['light_radiusval']) ? $tools['light_radiusval'] : 'px'; ?>;
		<?php } ?>
		background: <?php echo isset($tools['light_bg']) ? $tools['light_bg'] : 'rgba(255,255,255,1)'; ?>;
		color: <?php echo isset($tools['light_text_color']) ? $tools['light_text_color'] : 'rgba(76,76,76,1)'; ?>;
	}

	<?php if (isset($tools['light_image']) && $tools['light_image'] === 'true') { ?>
	#flycart-notification.popup .notification-product-right {
		margin-left: <?php echo isset($tools['light_image_width']) ? $tools['light_image_width'] + 20 : '135'; ?>px;
	}
	<?php } ?>
	
	#flycart-notification.popup a {
		color: <?php echo isset($tools['light_link_color']) ? $tools['light_link_color'] : 'rgba(56,176,227,1)'; ?>;
	}
	
	#flycart-notification.popup a:hover {
		color: <?php echo isset($tools['light_link_hover_color']) ? $tools['light_link_hover_color'] : 'rgba(56,176,227,1)'; ?>;
	}
	
	<?php if (isset($tools['continue_light_btn']) && $tools['continue_light_btn'] === 'true') { ?>
	#flycart-notification.popup .close-button {
		background-color: <?php echo isset($tools['continue_light_btn_bg']) ? $tools['continue_light_btn_bg'] : 'rgba(189,189,189,1)'; ?> !important;
		color: <?php echo isset($tools['continue_light_btn_text']) ? $tools['continue_light_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	#flycart-notification.popup .close-button:hover {
		background-color: <?php echo isset($tools['continue_light_btn_bg_hover']) ? $tools['continue_light_btn_bg_hover'] : 'rgba(177,177,177,1)'; ?> !important;
		color: <?php echo isset($tools['continue_light_btn_text_hover']) ? $tools['continue_light_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	<?php if (isset($tools['viewcart_light_btn']) && $tools['viewcart_light_btn'] === 'true') { ?>
	#flycart-notification.popup .tocart-button {
		background-color: <?php echo isset($tools['viewcart_light_btn_bg']) ? $tools['viewcart_light_btn_bg'] : 'rgba(30,138,210,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_light_btn_text']) ? $tools['viewcart_light_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	#flycart-notification.popup .tocart-button:hover {
		background-color: <?php echo isset($tools['viewcart_light_btn_bg_hover']) ? $tools['viewcart_light_btn_bg_hover'] : 'rgba(44,156,230,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_light_btn_text_hover']) ? $tools['viewcart_light_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	#flycart-notification.popup .flycart-options-close {
		fill: <?php echo isset($tools['light_cross']) ? $tools['light_cross'] : 'rgba(163,163,163,1)'; ?>;
	}
	
	#flycart-notification.popup .flycart-options-close:hover {
		fill: <?php echo isset($tools['light_cross_hover']) ? $tools['light_cross_hover'] : 'rgba(186,185,185,1)'; ?>;
	}
<?php } ?>


<?php if (isset($tools['noti_type']) && $tools['noti_type'] === 'advanced') { ?>
	.mfp-bg.noti-overlay {
		<?php if (isset($tools['advanced_bg_on']) && $tools['advanced_bg_on'] === 'true') { ?>
		background-color: <?php echo isset($tools['advanced_overlay_bg']) ? $tools['advanced_overlay_bg'] : 'rgba(0,0,0,0.6)'; ?>;
		<?php } ?>
		<?php if (isset($tools['advanced_image_on']) && $tools['advanced_image_on'] === 'true') { ?>
		background-image: url(./kw_application/flycart/images/bg/<?php echo isset($tools['advanced_overlay_image']['src']) ? $tools['advanced_overlay_image']['src'] : 'carbon.png'; ?>);
		<?php } ?>
	}
	
	#flycart-notification.popup {
		min-width: <?php echo isset($tools['advanced_min_width']) ? $tools['advanced_min_width'] : '300'; ?>px;
		max-width: <?php echo isset($tools['advanced_max_width']) ? $tools['advanced_max_width'] : '700'; ?>px;
		min-height: <?php echo isset($tools['advanced_min_height']) ? $tools['advanced_min_height'] : '50'; ?>px;
		max-height: <?php echo isset($tools['advanced_max_height']) ? $tools['advanced_max_height'] : '700'; ?>px;
		<?php if (isset($tools['advanced_shadow_on']) && $tools['advanced_shadow_on'] === 'true') { ?>
		-webkit-box-shadow: <?php echo isset($tools['advanced_shadowx']) ? $tools['advanced_shadowx'] : '1'; ?>px <?php echo isset($tools['advanced_shadowy']) ? $tools['advanced_shadowy'] : '1'; ?>px <?php echo isset($tools['advanced_shadowblur']) ? $tools['advanced_shadowblur'] : '5'; ?>px <?php echo isset($tools['advanced_shadowcolor']) ? $tools['advanced_shadowcolor'] : 'rgba(46,46,46,0.36)'; ?>;;
		box-shadow: <?php echo isset($tools['advanced_shadowx']) ? $tools['advanced_shadowx'] : '1'; ?>px <?php echo isset($tools['advanced_shadowy']) ? $tools['advanced_shadowy'] : '1'; ?>px <?php echo isset($tools['advanced_shadowblur']) ? $tools['advanced_shadowblur'] : '5'; ?>px <?php echo isset($tools['advanced_shadowcolor']) ? $tools['advanced_shadowcolor'] : 'rgba(46,46,46,0.36)'; ?>;
		<?php } ?>
		<?php if (isset($tools['advanced_radius']) && $tools['advanced_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['advanced_radiust']) ? $tools['advanced_radiust'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusr']) ? $tools['advanced_radiusr'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusb']) ? $tools['advanced_radiusb'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusl']) ? $tools['advanced_radiusl'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?>;
		border-radius: <?php echo isset($tools['advanced_radiust']) ? $tools['advanced_radiust'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusr']) ? $tools['advanced_radiusr'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusb']) ? $tools['advanced_radiusb'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusl']) ? $tools['advanced_radiusl'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?>;
		<?php } ?>
		
		background: <?php echo isset($tools['advanced_bg']) ? $tools['advanced_bg'] : 'rgba(255,255,255,1)'; ?>;
		color: <?php echo isset($tools['advanced_text_color']) ? $tools['advanced_text_color'] : 'rgba(76,76,76,1)'; ?>;
	}
	
	.flycart-noti-header {
		<?php if (isset($tools['advanced_radius']) && $tools['advanced_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['advanced_radiust']) ? $tools['advanced_radiust'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusr']) ? $tools['advanced_radiusr'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> 0 0;
		border-radius: <?php echo isset($tools['advanced_radiust']) ? $tools['advanced_radiust'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> <?php echo isset($tools['advanced_radiusr']) ? $tools['advanced_radiusr'] : '3'; ?><?php echo isset($tools['advanced_radiusval']) ? $tools['advanced_radiusval'] : 'px'; ?> 0 0;
		<?php } ?>
		background: <?php echo isset($tools['advanced_bg']) ? $tools['advanced_bg'] : 'rgba(255,255,255,1)'; ?>;
	}
	
	#flycart-notification.popup h3 {
		color: <?php echo isset($tools['advanced_left_title']) ? $tools['advanced_left_title'] : 'rgba(34,178,43,1)'; ?>;
	}	

	<?php if (isset($tools['advanced_right']) && $tools['advanced_right'] === 'false') { ?>
	#flycart-notification.popup {
		max-width: <?php echo isset($tools['advanced_max_width']) ? $tools['advanced_max_width'] / 2 : '350'; ?>px;
	}
	#flycart-notification.popup:after {
		display: none;
	}
	#flycart-notification.popup .notification-product-block {
		border: 0 none;
	}
	<?php } ?>

	<?php if (isset($tools['advanced_image']) && $tools['advanced_image'] === 'true' && isset($tools['advanced_right']) && $tools['advanced_right'] === 'true') { ?>
	#flycart-notification.popup .notification-product-info {
		margin-left: <?php echo isset($tools['advanced_image_width']) ? $tools['advanced_image_width'] + 20 : '135'; ?>px;
	}
	<?php } ?>

	<?php if (isset($tools['advanced_image']) && $tools['advanced_image'] === 'true' && isset($tools['advanced_right']) && $tools['advanced_right'] === 'false') { ?>
	#flycart-notification.popup .full-width .notification-product-image {
		margin-left: calc(50% - <?php echo isset($tools['advanced_image_width']) ? $tools['advanced_image_width'] + 30 : '230'; ?>px);
	}
	<?php } ?>

	#flycart-notification.popup a {
		color: <?php echo isset($tools['advanced_link_color']) ? $tools['advanced_link_color'] : 'rgba(56,176,227,1)'; ?>;
	}

	#flycart-notification.popup a span {
		border-color: <?php echo isset($tools['advanced_link_color']) ? $tools['advanced_link_color'] : 'rgba(56,176,227,1)'; ?>;
	}
	
	#flycart-notification.popup a:hover {
		color: <?php echo isset($tools['advanced_link_hover_color']) ? $tools['advanced_link_hover_color'] : ''; ?>;
	}
	
	<?php if (isset($tools['advanced_options']) && $tools['advanced_options'] === 'true') { ?>
	#flycart-notification.popup .notification-product-options {
		color: <?php echo isset($tools['advanced_options_color']) ? $tools['advanced_options_color'] : 'rgba(171,171,171,1)'; ?>;
	}	
	<?php } ?>

	<?php if (isset($tools['advanced_price']) && $tools['advanced_price'] === 'false') { ?>
	#flycart-notification.popup .notification-product-price {
		color: <?php echo isset($tools['advanced_price_color']) ? $tools['advanced_price_color'] : 'rgba(76,76,76,1)'; ?>;
	}	

	#flycart-notification.popup .notification-product-price-old {
		color: <?php echo isset($tools['advanced_price_old_color']) ? $tools['advanced_price_old_color'] : 'rgba(129,129,129,1)'; ?>;
	}	
		
	#flycart-notification.popup .notification-product-price-special {
		color: <?php echo isset($tools['advanced_price_special_color']) ? $tools['advanced_price_special_color'] : 'rgba(255,13,13,1)'; ?>;
	}
	<?php } ?>
	
	<?php if (isset($tools['advanced_brand']) && $tools['advanced_brand'] === 'false' || isset($tools['advanced_model']) && $tools['advanced_model'] === 'false' || isset($tools['advanced_sku']) && $tools['advanced_sku'] === 'false') { ?>
	#flycart-notification.popup .notification-product-params {
		color: <?php echo isset($tools['advanced_params']) ? $tools['advanced_params'] : 'rgba(101,101,101,1)'; ?>;
	}
	<?php } ?>
	
	<?php if (isset($tools['continue_advanced_btn']) && $tools['continue_advanced_btn'] === 'true') { ?>
	#flycart-notification.popup .close-button {
		background-color: <?php echo isset($tools['continue_advanced_btn_bg']) ? $tools['continue_advanced_btn_bg'] : 'rgba(189,189,189,1)'; ?> !important;
		color: <?php echo isset($tools['continue_advanced_btn_text']) ? $tools['continue_advanced_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	#flycart-notification.popup .close-button:hover {
		background-color: <?php echo isset($tools['continue_advanced_btn_bg_hover']) ? $tools['continue_advanced_btn_bg_hover'] : 'rgba(177,177,177,1)'; ?> !important;
		color: <?php echo isset($tools['continue_advanced_btn_text_hover']) ? $tools['continue_advanced_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>
	
	<?php if (isset($tools['viewcart_advanced_btn']) && $tools['viewcart_advanced_btn'] === 'true') { ?>
	#flycart-notification.popup .tocart-button {
		background-color: <?php echo isset($tools['viewcart_advanced_btn_bg']) ? $tools['viewcart_advanced_btn_bg'] : 'rgba(30,138,210,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_advanced_btn_text']) ? $tools['viewcart_advanced_btn_text'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	
	#flycart-notification.popup .tocart-button:hover {
		background-color: <?php echo isset($tools['viewcart_advanced_btn_bg_hover']) ? $tools['viewcart_advanced_btn_bg_hover'] : 'rgba(44,156,230,1)'; ?> !important;
		color: <?php echo isset($tools['viewcart_advanced_btn_text_hover']) ? $tools['viewcart_advanced_btn_text_hover'] : 'rgba(255,255,255,1)'; ?> !important;
	}
	<?php } ?>

	#flycart-notification.popup .flycart-options-close {
		fill: <?php echo isset($tools['advanced_cross']) ? $tools['advanced_cross'] : ''; ?>;
	}
	
	#flycart-notification.popup .flycart-options-close:hover {
		fill: <?php echo isset($tools['advanced_cross_hover']) ? $tools['advanced_cross_hover'] : ''; ?>;
	}
	
	<?php if (isset($tools['advanced_right']) && $tools['advanced_right'] === 'true') { ?>
	#flycart-notification.advanced:after {
		background: <?php echo isset($tools['advanced_right_bg']) ? $tools['advanced_right_bg'] : 'rgba(250,250,250,1)'; ?>;
	}
	
	#flycart-notification.popup .right-notification {
		color: <?php echo isset($tools['advanced_right_text_color']) ? $tools['advanced_right_text_color'] : 'rgba(101,101,101,1)'; ?>;
	}
	
	#flycart-notification.popup .right-notification h3 {
		color: <?php echo isset($tools['advanced_right_title']) ? $tools['advanced_right_title'] : 'rgba(75,75,75,1)'; ?>;
	}
	
	#flycart-notification.popup .notification-product-params-total {
		color: <?php echo isset($tools['advanced_right_params']) ? $tools['advanced_right_params'] : 'rgba(171,171,171,1)'; ?>;
	}
	<?php } ?>
<?php } ?>

<?php if (isset($tools['effect_type']) && $tools['effect_type'] !== 'off' && isset($tools['effect_type']) && $tools['effect_type'] !== 'custom') : ?>
	#flycart-flyer {
		width: <?php echo isset($tools['effect_frame_width']) ? $tools['effect_frame_width'] : '70'; ?>px;
		height: <?php echo isset($tools['effect_frame_height']) ? $tools['effect_frame_height'] : '70'; ?>px;
		<?php if (isset($tools['effect_frame']) && $tools['effect_frame'] === 'true') { ?>
		border: <?php echo isset($tools['effect_frame_size']) ? $tools['effect_frame_size'] : '1'; ?>px <?php echo isset($tools['effect_frame_color']) ? $tools['effect_frame_color'] : 'rgba(231,231,231,1)'; ?> solid;
		background-color: <?php echo isset($tools['effect_frame_bg']) ? $tools['effect_frame_bg'] : 'none'; ?>;
		padding: <?php echo isset($tools['effect_frame_pt']) ? $tools['effect_frame_pt'] : '2'; ?>px <?php echo isset($tools['effect_frame_pr']) ? $tools['effect_frame_pr'] : '2'; ?>px <?php echo isset($tools['effect_frame_pb']) ? $tools['effect_frame_pb'] : '2'; ?>px <?php echo isset($tools['effect_frame_pl']) ? $tools['effect_frame_pl'] : '2'; ?>px;
		<?php } ?>
		
		<?php if (isset($tools['effect_rotate']) && $tools['effect_rotate'] === 'true') { ?>
		-webkit-animation-duration: <?php echo isset($tools['effect_frame_speed']) ? $tools['effect_frame_speed'] / 1000 : '1000'; ?>s;
		animation-duration: <?php echo isset($tools['effect_frame_speed']) ? $tools['effect_frame_speed'] / 1000 : '1000'; ?>s;
		<?php } ?>
		
		<?php if (isset($tools['effect_frame_radius']) && $tools['effect_frame_radius'] === 'true') { ?>
		-webkit-border-radius: <?php echo isset($tools['effect_frame_radiust']) ? $tools['effect_frame_radiust'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?> <?php echo isset($tools['effect_frame_radiusr']) ? $tools['effect_frame_radiusr'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?> <?php echo isset($tools['effect_frame_radiusb']) ? $tools['effect_frame_radiusb'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?> <?php echo isset($tools['effect_frame_radiusl']) ? $tools['effect_frame_radiusl'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?>;
		border-radius: <?php echo isset($tools['effect_frame_radiust']) ? $tools['effect_frame_radiust'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?> <?php echo isset($tools['effect_frame_radiusr']) ? $tools['effect_frame_radiusr'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?> <?php echo isset($tools['effect_frame_radiusb']) ? $tools['effect_frame_radiusb'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?> <?php echo isset($tools['effect_frame_radiusl']) ? $tools['effect_frame_radiusl'] : '3'; ?><?php echo isset($tools['effect_radiusval']) ? $tools['effect_radiusval'] : 'px'; ?>;
		<?php } ?>
		
		<?php if (isset($tools['effect_type']) && $tools['effect_type'] === 'image') { ?>
		background-image: url(./kw_application/flycart/images/effects/<?php echo isset($tools['effect_image']['src']) ? $tools['effect_image']['src'] : 'PurpleCoinStar.png'; ?>);
		background-size: <?php echo isset($tools['effect_image']['width']) ? $tools['effect_image']['width'] : '63'; ?>px <?php echo isset($tools['effect_image']['height']) ? $tools['effect_image']['height'] : '64'; ?>px;
		background-position: 50% 50%;
		background-repeat: no-repeat;
		<?php } ?>
	}
<?php endif; ?>

<?php if (isset($tools['module_type']) && $tools['module_type'] === 'module') : ?>

	<?php if (isset($tools['tocart_module_btn']) && $tools['tocart_module_btn'] === 'true') { ?>
	.flycart-module-container .module-tocart-button {
		background-color: <?php echo isset($tools['tocart_module_btn_bg']) ? $tools['tocart_module_btn_bg'] : 'rgba(189,189,189,1)'; ?>;
		color: <?php echo isset($tools['tocart_module_btn_text']) ? $tools['tocart_module_btn_text'] : 'rgba(255,255,255,1)'; ?>;
	}

	.flycart-module-container .module-tocart-button:hover {
		background-color: <?php echo isset($tools['tocart_module_btn_bg_hover']) ? $tools['tocart_module_btn_bg_hover'] : 'rgba(177,177,177,1)'; ?>;
		color: <?php echo isset($tools['tocart_module_btn_text_hover']) ? $tools['tocart_module_btn_text_hover'] : 'rgba(255,255,255,1)'; ?>;
	}
	<?php } ?>

	<?php if (isset($tools['checkout_module_btn']) && $tools['checkout_module_btn'] === 'true') { ?>
	.flycart-module-container .module-checkout-button	{
		background-color: <?php echo isset($tools['checkout_module_btn_bg']) ? $tools['checkout_module_btn_bg'] : 'rgba(30,170,231,1)'; ?>;
		color: <?php echo isset($tools['checkout_module_btn_text']) ? $tools['checkout_module_btn_text'] : 'rgba(255,255,255,1)'; ?>;
	}

	.flycart-module-container .module-checkout-button:hover	{
		background-color: <?php echo isset($tools['checkout_module_btn_bg_hover']) ? $tools['checkout_module_btn_bg_hover'] : 'rgba(15,101,138,1)'; ?>;
		color: <?php echo isset($tools['checkout_module_btn_text_hover']) ? $tools['checkout_module_btn_text_hover'] : 'rgba(255,255,255,1)'; ?>;
	}
	<?php } ?>

	<?php if (isset($tools['show_module_image']) && $tools['show_module_image'] === 'true' && isset($tools['module_imgage_width']) && ($tools['module_imgage_width'] + 6) < 100) { ?>
	.flycart-module .flycart-module-product-title {
		margin-left: <?php echo isset($tools['module_imgage_width']) ? $tools['module_imgage_width'] + 6 : '162'; ?>px;
	}
	<?php } ?>
	<?php if (isset($tools['module_imgage_width']) && ($tools['module_imgage_width'] + 6) > 100) { ?>
	.flycart-module .flycart-module-image {
		float: none;
		margin-bottom: 3px;
	}
	<?php } ?>

<?php endif; ?>

<?php if (isset($tools['effect_type']) && $tools['effect_type'] === 'custom') : ?>
	<?php echo $tools['effect_custom_css']; ?>
<?php endif; ?>

<?php if (isset($tools['custom_css'])) : ?>
	<?php echo $tools['custom_css']; ?>
<?php endif; ?>
</style>

<?php if (isset($tools['effect_type']) && $tools['effect_type'] === 'custom' && isset($tools['effect_custom_js']) && $tools['effect_custom_js'] !== '') : ?>
<script>
function FlycartCustomEffects() {
	var $_ = this;
	$_.params();
	<?php echo base64_decode($tools['effect_custom_js']); ?>
}
</script>
<?php endif; ?>

<?php if (isset($tools['custom_js']) && $tools['custom_js'] !== '') : ?>
<script>
	<?php echo base64_decode($tools['custom_js']); ?>
</script>
<?php endif; ?>

<!-- /kw_flycart
---------------------------------------------------------------->
<?php endif; ?>