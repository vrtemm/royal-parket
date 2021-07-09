<?php echo $header; ?>
	<div class="breadcrumb-block">
		<div id="breadcrumb"><ol class="breadcrumb container" itemscope itemtype="http://schema.org/BreadcrumbList">
			<?php $i=0; ?>
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php $i++; ?>
				<li itemprop="itemListElement" itemscope
				itemtype="http://schema.org/ListItem"><a href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a><meta itemprop="position" content="<?php echo $i; ?>" /></li>
			<?php } ?>
		</ol></div>
	</div>
	<div class="top-product-main col-sm-12">
		<div class="top-product container">
			<div class="two-top col-sm-3">
			<div class="clearfix procontent">
				<div class="proimg"> <img src="/image/catalog/money-bag.svg"/></div>
                <div class="protext"> <p>Низкая<br/> цена</p></div>
			</div>
			</div>
			<div class="one-top col-sm-3">
			<div class="clearfix procontent">
				<div class="proimg"><img src="/image/catalog/delivery-truck.svg"/></div>
				<div class="protext"> <p>Надежная <br/> доставка</p></div>
			</div>
			</div>
			<div class="three-top col-sm-3">
			<div class="clearfix procontent">
				<div class="proimg"><img src="/image/catalog/credit-cards.svg"/></div>
				<div class="protext"> <p>Удобная <br/> оплата</p></div>
			</div>
			</div>
			<div class="four-top col-sm-3">
			<div class="clearfix procontent">
				<div class="proimg"> <img src="/image/catalog/like.svg"/></div>
				<div class="protext"> <p>Высокое <br/> качество</p></div>
			</div>
			</div>
		</div>
	</div>
<div class="container">
    <div class="row">
        <?php echo $column_left; ?>
		
        <?php
			if ($column_left && $column_right) {
				$content_width = 'col-sm-6';
				$content_left  = 'col-sm-6';
				$content_right = 'col-sm-6';
				} elseif ($column_left || $column_right) {
				$content_width = 'col-sm-9';
				$content_left  = 'col-sm-5';
				$content_right = 'col-sm-7';
				} else {
				$content_width = 'col-sm-12';
				$content_left  = 'col-sm-5 col-lg-7';
				$content_right = 'col-sm-7 col-lg-5';
			} ?>
			
			<div id="content" class="<?php echo $content_width; ?> product_page">
				<div class="topfirst"><?php echo $content_first; ?></div>
				<?php echo $content_top; ?>
				<div class="row product-content-columns" itemscope itemtype="http://schema.org/Product">
						<!-- Content left -->
						<div class="col-sm-5">
							<!-- product image -->
							<div class="product-gallery">
								<?php if ($thumb || $images) { ?>
									<div class="stikers">
									<?php if ($special) { ?>
										<div class="stiker-sale">
											<small>Скидка</small>
											- <?php echo $sale; ?>%
										</div>
									<?php } elseif ($upc=='new') { ?>
										<div class="stiker new_pr"><span><?php echo $text_new; ?></span></div>
									<?php }elseif ($upc=='bestseller') { ?>
										<div class="stiker best_pr"><span>Топ продаж</span></div>
									<?php } ?>
									</div>
									<?php if ($thumb) { ?>
										<div id="gallery" class="image owl-carousel">
											<div class="item">
												<a href="<?php echo $popup; ?>" data-something="something" data-another-thing="anotherthing">
													<img src="<?php echo $thumb; ?>"	alt="popup" itemprop="image"/>
												</a>
											</div>
											<?php foreach ($images as $image) { ?>
												<div class="item">
													<a href="<?php echo $image['popup']; ?>" data-something="something" data-another-thing="anotherthing">
														<img src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>"/>
													</a>
												</div>
											<?php } ?>
										</div>
									<?php } ?>
									<script type="text/javascript">
										$('#gallery').owlCarousel({
											singleItem: true,
											navigation: false,
											pagination: true
										});
									</script>
									
								<?php } ?>
							</div>
							
							<div id="obrazec">					
								<img src="/image/catalog/colors-palette.svg" />				
								<h4>БЕСПЛАТНЫЙ ОБРАЗЕЦ</h4>				
								Хотите увидеть бесплатный образец и нет времени подъехать в шоу-рум? 
								Воспользуйтесь бесплатной услугой <span>"Доставка на Дом"</span>					
							</div> 		
							<div class="obrazec-notice">Услуга действует только в Киеве и Одессе</div>
						</div>
						<!-- Content right -->
						<div class="col-sm-5">
							<div class="general_info product-info">
								
								<h1 class="product-title" itemprop="name"><?php echo $heading_title; ?></h1>
								
								<!-- Prodyuct rating status -->
								<div class="rating-section product-rating-status rating-main">
									<?php if ($review_status) { ?>
										<div class="rating">
											<div class="rating-main-stars">
												<?php for ($i = 1; $i <= 5; $i++) { ?>
													<?php if ($rating < $i) { ?>
														<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
														<?php } else { ?>
														<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
														class="fa fa-star-o fa-stack-1x"></i></span>
													<?php } ?>
												<?php } ?>
												&nbsp;
												&nbsp;
												<span class="block-otzyv"><a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $reviews; ?></a>
													/
												<a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $text_write; ?></a></span>
											</div>
										</div>
									<?php } ?>
								</div>
								
								<?php if($price) { $special = round($special / $jan, 2); ?>
									<div id="price-main" class="price-section" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
										
										<span class="text-price-main"><?php echo $text_price; ?></span>
										<span class="price-new"><?php if ($special == 0) echo ''; else echo("<span itemprop='price'>".$special."</span><span class=text-pm>грн./" . $length_class_id . "</span>"); ?></span>
										<?php if (!$special) { ?>
											<span class="price" itemprop="price"><?php echo round($price / $jan, 2); ?><span class="text-pm">грн./<?php echo $length_class_id; ?></span></span>
										<?php } else { ?>
											<span class="price-old"><?php echo round($price / $jan, 2); ?><span class="text-pm">грн./<?php echo $length_class_id; ?></span></span>
										<?php } ?>
										<meta itemprop="priceCurrency" content="UAH">
									</div>
								<?php } ?>
								
								<div class="article-block clearfix">
									<div class="article">
										<?php echo $text_sku; ?> <b><?php echo $sku; ?></b>
									</div>
									<div class="newstock <?php if (!$countstock <= 0) { ?>instock<?php } else { ?>outstock<?php } ?>">
										<?php echo $stock; ?>
									</div>
								</div>
								<div class="product-section clearfix">
									<?php foreach ($attribute_groups as $attribute_group) {
										foreach ($attribute_group['attribute'] as $attribute) { 
											if($attribute['attribute_id'] == 7) {
												$size = $attribute['text'];
											}		
											if($attribute['attribute_id'] == 5) {
												$country = $attribute['text'];
											}	
										} 
									 } ?>
									<ul class="list-unstyled ">
										<?php if(isset($size)) { ?>
										<li>Размер: <span><?php echo $size; ?></span></li>
										<?php } ?>
										<?php if ($manufacturer) { ?>
											<li><?php echo $text_manufacturer; ?>
												<a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
											</li>
										<?php } ?>
										<?php if(isset($country)) { ?>
										<li>Страна: <span><?php echo $country; ?></span></li>
										<?php } ?>
									</ul>
									<button class="buy-one-toggle" <?php if($quantity <= 0) { ?>disabled<?php } else { ?> onclick="$('#oneclick').slideToggle();"<?php } ?>>Купить в 1 клик</button>
								</div>
								<!-- End add to cart form -->
							</div>
							
							<div id="product">
								
								<!-- Product options -->
								<div class="product-options form-horizontal">
									<?php if ($options) { ?>
										<h3><?php echo $text_option; ?></h3>
										<?php foreach ($options as $option) { ?>
											<?php if ($option['type'] == 'select') { ?>
												<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
													<label class="control-label col-sm-4"
													for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
													
													<div class="col-sm-8">
														<select name="option[<?php echo $option['product_option_id']; ?>]"
														id="input-option<?php echo $option['product_option_id']; ?>"
														class="form-control ">
															<option value=""><?php echo $text_select; ?></option>
															<?php foreach ($option['product_option_value'] as $option_value) { ?>
																<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
																	<?php if ($option_value['price']) { ?>
																		(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
																		)
																	<?php } ?>
																</option>
															<?php } ?>
														</select>
													</div>
												</div>
											<?php } ?>
											<?php if ($option['type'] == 'radio') { ?>
												<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
													<label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
													
													<div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-8">
														<?php foreach ($option['product_option_value'] as $option_value) { ?>
															<div class="radio">
																<label>
																	<input type="radio"
																	name="option[<?php echo $option['product_option_id']; ?>]"
																	value="<?php echo $option_value['product_option_value_id']; ?>"/>
																	<?php echo $option_value['name']; ?>
																	<?php if ($option_value['price']) { ?>
																		(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
																		)
																	<?php } ?>
																</label>
															</div>
														<?php } ?>
													</div>
												</div>
											<?php } ?>
											<?php if ($option['type'] == 'checkbox') { ?>
												<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
													<label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
													
													<div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-8">
														<?php foreach ($option['product_option_value'] as $option_value) { ?>
															<div class="checkbox">
																<label>
																	<input type="checkbox"
																	name="option[<?php echo $option['product_option_id']; ?>][]"
																	value="<?php echo $option_value['product_option_value_id']; ?>"/>
																	<?php echo $option_value['name']; ?>
																	<?php if ($option_value['price']) { ?>
																		(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
																		)
																	<?php } ?>
																</label>
															</div>
														<?php } ?>
													</div>
												</div>
											<?php } ?>
											<?php if ($option['type'] == 'image') { ?>
												<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
													<label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
													
													<div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-8">
														<?php foreach ($option['product_option_value'] as $option_value) { ?>
															<div class="radio">
																<label>
																	<input type="radio"
																	name="option[<?php echo $option['product_option_id']; ?>]"
																	value="<?php echo $option_value['product_option_value_id']; ?>"/>
																	<img src="<?php echo $option_value['image']; ?>"
																	alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
																	class="img-thumbnail"/> <?php echo $option_value['name']; ?>
																	<?php if ($option_value['price']) { ?>
																		(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
																		)
																	<?php } ?>
																</label>
															</div>
														<?php } ?>
													</div>
												</div>
											<?php } ?>
										<?php } ?>
									<?php } ?>
								</div>
								<?php if($quantity > 0) { ?>
								<!-- Add to cart form -->
								<div class="form-group form-horizontal">
									<?php
										if (!$special) {
											$c = round($price, 2);
											} else { 
											$c = $special * $jan;
										}
									?>      
									
									<?php if($length_class_id == 'шт.') { ?>
									<div class="ploscha ploscha-sht">
										<div class="row-top">
											<h3>Введите Количество</h3>
											<table class="options">
												<tr>
													<td>
														<input type="text" id="price_box" value="<?php echo $c; ?>" style="display:none;">
														<input type="text" id="count_m2" value="<?php echo $jan; ?>" style="display:none;">
														<input type="text" id="qtySQM" onkeyup="calcOfQMeter2($(this).val());" value=""> 
														<span class="m2">штук</span>
														<span class="m2-sup"><?php echo $length_class_id; ?></span>
														<input type="hidden" name="quantity" value="1" class="qty-re">
													</td>
												</tr>
											</table>
											<div id="button-cart-main">
												<input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
												<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-add">В корзину</button>
											</div>
										</div>
										<div class="row-hide" style="display:none;">
											<div class="options total">
													<div class="attr-price">
														<span class="totall" id="totalPrice"></span>
													</div>
											</div>
										</div>
									</div>
									
									<script>
										$(document).ready(function(){
											$("#qtySQM").keypress(function(){
												$(".row-hide").fadeIn(2000);
											});
										});
										
									</script>
									
									
									<script>
										function calcOfQMeter2(mult) {
											mult = parseInt(mult);
											var total = (parseInt(parseFloat(<?php echo ($special) ? str_replace('грн.', '', strip_tags($special)) : str_replace('грн.', '', strip_tags($price)); ?>) * mult * 100)/100);
											$('.qty-re').val(mult);
											$('.totall').html('Цена <span>' + total + '</span> грн.');
										}
										
									</script>
									<?php } else { ?>
									<div class="ploscha">
										<div class="row-top">
											<h3>Введите Количество</h3>
											<table class="options">
												<tr>
													<td>
														<input type="text" id="price_box" value="<?php echo $c; ?>" style="display:none;">
														<input type="text" id="count_m2" value="<?php echo $jan; ?>" style="display:none;">
														<span class="m2">Площадь:</span>
														<input type="text" id="qtySQM" onkeyup="calcOfQMeter();" value=""> 
														<span class="m2-sup"><?php echo $length_class_id; ?></span>
													</td>
												</tr>
											</table>
											<div id="button-cart-main">
												<input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
												<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-add">В корзину</button>
											</div>
										</div>
										<div class="row-hide" style="display:none;">
											<div class="options total">
													<div class="attr-price">
														<span class="m21">Необходимо Упаковок: </span>
														<span  id="qty-re" onkeyup="calcOfBoxes();"></span>  (<span id="qtySQM2" class="m21"></span><span class="m22-sup">м<sup>2</sup></span>)
														<input id="quantity" type="hidden" name="quantity" value="1" >
													</div>
													<span class="totall" id="totalPrice"></span>
											</div>
										</div>
									</div>
									
									<script>
										$(document).ready(function(){
											$("#qtySQM").keypress(function(){
												$(".row-hide").fadeIn(2000);
											});
										});
										
									</script>
									
									
									<script>
										function recalc(mult) {
											var total = parseFloat($('.price').text()) * mult + '.00 грн.'
											$('.totall').text(total);
										}
										
										$('.less').on('click',function(){
											if($('#quantity').val() > 1) {
												var mult = Number($('#quantity').val()) - 1;
												$('#quantity').val(mult);
												recalc(mult);
											}
										});
										
										$('.more').on('click',function(){
											var mult = Number($('#quantity').val()) + 1;
											$('#quantity').val(mult);
											recalc(mult);
										});
									</script>
									<?php } ?>
									
								</div>
								
								<?php } ?>
								
								
								<?php if ($tags) { ?>
									<!-- Product tags -->
									<div class="product-tags">
										<?php echo $text_tags; ?>
										<?php for ($i = 0; $i < count($tags); $i++) { ?>
											<?php if ($i < (count($tags) - 1)) { ?>
												<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
												,
												<?php } else { ?>
												<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
											<?php } ?>
										<?php } ?>
									</div>
								<?php } ?>
								
								<?php if ($minimum > 1) { ?>
									<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
									</div>
								<?php } ?>
							</div>
							
						</div>
						<div class="col-sm-2">
                        	<div class="info-block">
                                <div class="info-block-txt">
                                	<h3>Оплата</h3>
                                    <p>
										Наличными курьеру; <br/>
										Безналичная для юр. лиц; <br/>
										Privat24; <br/>
										Терминалы ПриватБанка.
									</p>
								</div>
							</div>
                            <div class="info-block">
                                <div class="info-block-txt">
                                	<h3>Доставка</h3>
                                    <p>
										<strong>Одесса и Киев</strong> 
										Самовывоз или доставка курьером
										<strong>Доставка по Украине</strong> 
										На склад Новая Почта / Мист Экспрес
									</p>
									<div class="calculate-block">
										<img src="catalog/view/theme/theme535/image/novapochta.svg" alt="novapochta">
										<button data-target="#modal-np" data-toggle="modal"  class="btn btn-utp">Просчитать</button>
									</div>
								</div>
							</div>
                            <div class="info-block">
                                <div class="info-block-txt">
                                	<h3>Монтаж</h3>
                                    <p>Мы предоставляем качественные услуги по монтажу любого вида напольного покрытия.</p>
								</div>
							</div>
						</div>
						<div class="col-sm-12 mb">
							<div class="row">
								<div class="col-sm-6">
									<ul class="nav nav-tabs nav-in-cart">
										<?php if ($attribute_groups) { ?>
											<li class="active"><a href="#tab-specification" data-toggle="tab">Характеристики</a></li>
										<?php } ?>
										<li <?php if (!$attribute_groups) { ?>class="active"<?php } ?>><a href="#tab-description" data-toggle="tab">рекомендации по уходу</a></li>
									</ul>
									<div class="tab-content">
										<?php if ($attribute_groups) { ?>
											<div class="tab-pane active product-spec product-section" id="tab-specification">
												<!-- Product specifications -->
												<div id="spec-main2">
													<table class="table">
														<?php foreach ($attribute_groups as $attribute_group) { ?>
															<tbody>
																<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
																	<tr>
																		<td><?php echo $attribute['name']; ?></td>
																		<td><?php echo $attribute['text']; ?></td>
																	</tr>
																<?php } ?>
															</tbody>
														<?php } ?>
													</table>  
												</div>
											</div>
										<?php } ?>
										<div class="product-desc product-section tab-pane<?php if (!$attribute_groups) { ?> active<?php } ?>" id="tab-description">
											<div itemprop="description"><?php echo $description; ?></div>
											</div>
									</div>
								</div>
								<div class="col-sm-6">
									<!-- Product reviews -->
									<?php if ($review_status) { ?>
										<div class="tab-pane" id="tab-review">
											<div class="flex-review-top">
												<div class="attr-title">Отзывы о товаре <span>(<?php echo $count_r; ?>)</span></div>
												<div><button class="btn-review-add" id="reviews_form_title" data-target="#review-add" data-toggle="modal">Написать отзыв</button></div>
											</div>
											<div id="review"></div>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
						
				</div>
			</div>
	</div>
</div>

<div class="container">
    <div class="row">
		<!-- Related products -->
		<?php if ($products) { ?>
            <div class="related-products product-section">
                <h3 class="product-section_title">Рекомендуем к этому товару</h3>
				
                <div class="related-slider">
                    <?php foreach ($products as $product) { ?>
						<div>
							<?php $imgajax = 1; include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
						</div>
						
					<?php } ?>
				</div>
			</div>
		<?php } ?>
		
		<!-- Product comments -->
		<!-- <div class="product-comments product-section">
			<h3 class="product-section_title">Comments</h3>
			<div id="disqus_thread"></div>
			<script type="text/javascript">
			/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
			var disqus_shortname = 'thtest123'; // required: replace example with your forum shortname
			
			/* * * DON'T EDIT BELOW THIS LINE * * */
			(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			})();
			</script>
			<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		</div> -->
		
	<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?>
	<div class="popup tabs_info">
		<a class="close" href="#"><img src="/image/catalog/close_icon.png"></a>
		
		
		
		<div class="modal-content">
			<div class="modal-body"><div class="row content-inside">
				<form method="post" action="#" name="cart_products" class="cartProductsForm">
					<div class="col-xs-12 col-md-6 left-inside thumbBlock">
						<div class="row chars-one">
							<div class="col-xs-12 ">
								<div class="image">
									<img id="gallery_zoom" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"
									alt=""/>
								</div>
							</div>
						</div>
					</div>
					<div id="product-popup" class="col-xs-12 col-md-6 right-inside">
						<div class="title-popup"><span class="title"><?php echo $heading_title; ?></span><br/><span class="border-popup"></span></div>
						<div class="options-block">
							<div class="rating-section product-rating-status rating-main">
								<?php if ($review_status) { ?>
									<div class="rating">
										<div class="rating-main-stars">
											<?php for ($i = 1; $i <= 5; $i++) { ?>
												<?php if ($rating < $i) { ?>
													<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
													<?php } else { ?>
													<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
													class="fa fa-star-o fa-stack-1x"></i></span>
												<?php } ?>
											<?php } ?>
											&nbsp;
											&nbsp;
											<span class="block-otzyv"><a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $reviews; ?></a>
												/
											<a onclick="document.getElementById('tab-review').scrollIntoView();"><?php echo $text_write; ?></a></span>
										</div>
									</div>
								<?php } ?>
							</div>
						</div>
						<div class="checkout-block">
							<div class="item-layout qc-quantity">
								<div class="input-group">
								</div>
							</div>
							
							<div class="price-layout">
								<div class="left-price-popup">Цена за м<sup>2</sup>:</div>
								
								
								
								<div class="right-price-popup">
									<?php if($price) { ?>
										<div id="price-main" class="price-section">
											<span class="price-new"><?php if ($special == 0) echo ''; else echo($special."<span class=text-pm>грн./м<sup>2</sup></span>"); ?></span>
											<?php if (!$special) { ?>
												<span class="price-new"><?php echo round($price / $jan, 2); ?><span class="text-pm">грн./м<sup>2</sup></span></span>
												<?php } else { ?>
												<span class="price-old"><?php echo round($price / $jan, 2); ?><span class="text-pm">грн./м<sup>2</sup></span></span>
											<?php } ?>
											<?php if ($tax) { ?>
												<span class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
											<?php } ?>
											<div class="reward-block">
												<?php if ($points) { ?>
													<span class="reward"><?php echo $text_points; ?> <?php echo $points; ?></span>
												<?php } ?>
												<?php if ($discounts) { ?>
													<?php foreach ($discounts as $discount) { ?>
														<span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span>
													<?php } ?>
												<?php } ?>
											</div>
										</div>
									<?php } ?>
								</div>
								
								
								
								
								
							</div>
							
							<div class="price-total row">
								<div class="left-price-popup total">Общая цена:</div>
								<div class="right-price-popup total"><span><span class="totall" id="totalPrice2"></span></span></div>
							</div>
						</div>
					</div>
				</div>
				
			</form>
			</div>
			<div class="popup-footer">
				<div class="cartFooter row">
					<div class="button-popup-right">
						<a href="/checkout" class="success-button">Оформить покупку</a>
					</div>
				</div>
			</div>
		</div>
		<a id="close-main" class="close" href="#">Продолжить</a>
	</div>
	
</div>














<script>
	$(function () {
		//script for popups
		$('.show_popup').click(function () {
			$('div.'+$(this).attr("rel")).fadeIn(500);
			$("body").append("<div id='overlay'></div>");
			$('#overlay').show().css({'filter' : 'alpha(opacity=80)'});
			return false;				
		});	
		$('a.close').click(function () {
			$(this).parent().fadeOut(100);
			$('#overlay').remove('#overlay');
			return false;
		});
		
		//script for tabs
		$("div.selectTabs").each(function () {
			var tmp = $(this);
			$(tmp).find(".lineTabs li").each(function (i) {
				$(tmp).find(".lineTabs li:eq("+i+") a").click(function(){
					var tab_id=i+1;
					$(tmp).find(".lineTabs li").removeClass("active");
					$(this).parent().addClass("active");
					$(tmp).find(".tab_content div").stop(false,false).hide();
					$(tmp).find(".tab"+tab_id).stop(false,false).fadeIn(300);
					return false;
				});
			});
		});
	});
</script>





<script>
    function getChar(event) {
        if (event.which == null) {
            if (event.keyCode < 32) return null;
            return String.fromCharCode(event.keyCode) // IE
		}
		
        if (event.which != 0 && event.charCode != 0) {
            if (event.which < 32) return null;
            return String.fromCharCode(event.which)
		}
		
        return null;
	}
    jQuery('#reviews_form_title').addClass('close-tab');
    jQuery('#reviews_form_title').on("click", function () {
        if (jQuery(this).hasClass('close-tab')) {
            jQuery(this).removeClass('close').parents('#tab-review').find('#reviews_form').slideToggle();
		}
        else {
            jQuery(this).addClass('close-tab').parents('#tab-review').find('#reviews_form').slideToggle();
		}
	})
</script>

<script type="text/javascript"><!--
	$('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
			dataType: 'json',
			beforeSend: function () {
				$('#recurring-description').html('');
			},
			success: function (json) {
				$('.alert, .text-danger').remove();
				
				if (json['success']) {
					$('#recurring-description').html(json['success']);
				}
			}
		});
	});
	//-->
</script>

<script type="text/javascript"><!--
	$('#button-cart').on('click', function () {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
			dataType: 'json',
			beforeSend: function () {
				$('#button-cart').button('loading');
			},
			complete: function () {
				$('#button-cart').button('reset');
			},
			success: function (json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				
				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
							
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
								} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}
					
					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}
					
					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
				}
				
				if (json['success']) {
					$('.breadcrumb').after('');
					
					
					<!--$('html, body').animate({ scrollTop: 0 }, 'slow');-->
					
					$('#cart').load('index.php?route=common/cart/info #cart');
					setTimeout(function () {
						$('.alert').fadeOut(1000)
					}, 3000)
				}
			}
		});
	});
	//-->
</script>

<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});
	
	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});
	
	$('.time').datetimepicker({
		pickDate: false
	});
	
	$('button[id^=\'button-upload\']').on('click', function () {
		var node = this;
		
		$('#form-upload').remove();
		
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
		
		$('#form-upload input[name=\'file\']').trigger('click');
		
		$('#form-upload input[name=\'file\']').on('change', function () {
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($(this).parent()[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function () {
					$(node).button('loading');
				},
				complete: function () {
					$(node).button('reset');
				},
				success: function (json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		});
	});
	//-->
</script>

<script type="text/javascript"><!--
	$('#review').delegate('.pagination a', 'click', function (e) {
		e.preventDefault();
		
		$('#review').fadeOut('slow');
		
		$('#review').load(this.href);
		
		$('#review').fadeIn('slow');
	});
	
	$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
	
	$('#button-review').on('click', function () {
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
			beforeSend: function () {
				$('#button-review').button('loading');
			},
			complete: function () {
				$('#button-review').button('reset');
				$('#captcha').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
				$('input[name=\'captcha\']').val('');
			},
			success: function (json) {
				$('.alert-success, .alert-danger').remove();
				
				if (json['error']) {
					$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
					$('input[name=\'captcha\']').val('');
				}
			}
		});
	});
	
	$(document).ready(function () {
		$('#gallery').magnificPopup({
			type: 'image',
			delegate: 'a',
			gallery: {
				enabled: true
			}
		});
		
		if(window.location.hash == '#tab-review') {
			$('a[href=\'#tab-review\']').trigger('click'); 
			$('html, body').stop().animate({'scrollTop': $('#tab-review').offset().top}, 1500, 'swing'); 
		}
	});
	//-->
</script>

<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'thtest123'; // required: replace example with your forum shortname
	
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function () {
        var s = document.createElement('script');
        s.async = true;
        s.type = 'text/javascript';
        s.src = '//' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
	}());
</script>


<?php /*<script type="text/javascript"><!--
	$('#button-oneclick').on('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/one_click/add',
			type: 'post',
			data: $('#oneclick input[type=\'text\'], #oneclick input[type=\'hidden\']'),
			dataType: 'json',
			beforeSend: function() {
				$('#button-oneclick').button('loading');
			},
			complete: function() {
				$('#button-oneclick').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');
				
				if (json['error']) {
					if (json['error']['telephone']) {
						$('.breadcrumb').after('<div class="alert alert-danger text-danger">' + json['error']['telephone'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}
					if (json['error']['product']) {
						$('.breadcrumb').after('<div class="alert alert-danger text-danger">' + json['error']['product'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}
					if (json['error']['order']) {
						$('.breadcrumb').after('<div class="alert alert-danger text-danger">' + json['error']['order'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						$('html, body').animate({ scrollTop: 0 }, 'slow');
					}
				}
				
				if (json['success']) {
					$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
//--></script>*/ ?>
<script type="text/javascript" src="/catalog/view/javascript/product_calc.js"></script>
<div class="modal fade" id="modal-np" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close with-icon" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
			<div class="modal-body">
				<div class="h4 box-title"><span>Стоимость доставки товара</span></div>
				<form class="np-form form-horizontal">       
					<input type="hidden" name="product_id" value="<?php echo $product_id; ?>">
					<div class="form-group">
						<div class="col-sm-12">
							<div  class="np-qty">
								<div class="flex-qty-btn">
									<div>
										<label class="control-label" for="input-quantity">Кол-во товаров</label>
										<div class="qty-group clearfix">
											<button class="qty-minus" onclick="if($(this).next().val() > 1){$(this).next().val(parseInt($(this).next().val())-1);}"><i class="fa fa-chevron-down"></i></button>
											<input type="text" onchange="$(this).val(parseInt(parseInt($(this).val())/1 + 0.99)*1)" name="quantity" value="1" class="form-control input-qty">
											<button class="qty-plus" onclick="$(this).prev().val(parseInt($(this).prev().val())+1)"><i class="fa fa-chevron-up"></i></button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> 
					<div class="form-group">
						<label class="control-label col-sm-12">Укажите свой населенный пункт</label>
						<div class="col-sm-12">
							<input class="form-control" type="text" name="city">
						</div>
					</div>    
					<div class="np-result"></div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>

	$('.np-form').submit(function(e){
		e.preventDefault();
	});
	$('.np-form [name="city"]').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=common/np/city&search=' + encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.href
                        }
                    }));
                }
            });
        },
        'select': function(item) {
           $('.np-form [name="city"]').val(item['name']);
		   $('.np-form .np-result').load('index.php?route=common/np&ref=' + item['value'] + '&product=<?php echo $product_id; ?>&quantity=' + $('.np-form [name="quantity"]').val(), function(){$('.np-form .np-result').slideDown();});
        }
    });
	


	$('#review').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();
		
		$('#review').fadeOut('slow');
		
		$('#review').load(this.href);
		
		$('#review').fadeIn('slow');
	});
	
	$('#review').load('index.php?route=product/product/review&test=1&product_id=<?php echo $product_id; ?>', function(){
		
		if(typeof($('.pagination .active').next().find('a')) != 'undefined' || parseInt($('.pagination .active').next().find('a').html())) {
			$('.pagination').before('<div class="text-center"><button class="show-more"><i class="fa fa-repeat"></i> Показать еще</button></div>');
			$('.pagination').hide();
		}
		$('body').on('click', '.show-more', function() {
			if(typeof($('.pagination .active').next().find('a')) != 'undefined' || parseInt($('.pagination .active').next().find('a').html())) {
				$('.show-more i').addClass('loader');
				$.ajax({
					url:$('.pagination .active').next().find('a').attr('href')+'&ajax=1', 
					success:function (data) {
						$data = $(data);
						$('.r-items > div:last-child').after($(data).find('.r-items').html());
						$('.pagination').html($(data).find('.pagination'));
						$('.show-more i').removeClass('loader');
					}
				});
				if(typeof($('.pagination .active').next().find('a')) == 'undefined' || !parseInt($('.pagination .active').next().next().find('a').html())) {
					$('.show-more').hide();
				}
				} else {
					$('.show-more').hide();
				}
		});
	});
	$('body').on('click', '.review-answer', function(e) {
		e.preventDefault();
		$('.review-answer-form').find('[name="parent_id"]').val($(this).data('id'));
		$('.faf-review-text').html($(this).prev().find('p').eq(0).html());
		$('#modal-review-answer-form').modal('show');
	});
	$('body').on('submit', '#form-review', function(e) {
		e.preventDefault();
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-review").serialize(),
			beforeSend: function() {
				$('#button-review').button('loading');
			},
			complete: function() {
				$('#button-review').button('reset');
			},
			success: function(json) {
				$('.alert-success, .alert-danger').remove();
				
				if (json['error']) {
					$('#button-review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#button-review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('input[name=\'name\']').val('');
					$('input[name=\'bads\']').val('');
					$('input[name=\'good\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
				}
			}
		});
	});
	
	$('body').on('submit', '.review-answer-form',  function(e) {
		e.preventDefault();
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $(".review-answer-form").serialize(),
			beforeSend: function() {
				$('#button-review-answer').button('loading');
			},
			complete: function() {
				$('#button-review-answer').button('reset');
			},
			success: function(json) {
				$('.alert-success, .alert-danger').remove();
				
				if (json['error']) {
					$('#button-review-answer').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					$('#button-review-answer').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
				}
			}
		});
	});
</script>
<div class="modal fade" id="review-add" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close with-icon" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
			<div class="modal-body">
				<div class="faf-title"><span><?php echo $text_write; ?></span></div>
				<form class="form-horizontal" id="form-review">
					<?php if ($review_guest) { ?>
						<div class="form-group required">
							<div class="col-sm-12">
								<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="name" value="" id="input-name" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<div class="col-sm-12">
								<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
								<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
								<div class="help-block"><?php echo $text_note; ?></div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-6">
								<label class="control-label r-plus" for="input-good">Плюсы</label>
								<textarea name="good" rows="5" id="input-good" class="form-control"></textarea>
							</div>
							<div class="col-sm-6">
								<label class="control-label r-minus" for="input-bads">Минусы</label>
								<textarea name="bads" rows="5" id="input-bads" class="form-control"></textarea>
							</div>
						</div>
						<div class="form-group required">
							<div class="col-sm-12">
								<label class="control-label"><?php echo $entry_rating; ?></label>
								&nbsp;&nbsp;&nbsp; 
								<div class="rating rch">
									<input type="radio" name="rating" id="rating-s1" value="1" />
									<label class="ic ic-star" for="rating-s1"></label>
									<input type="radio" name="rating" id="rating-s2" value="2" />
									<label class="ic ic-star" for="rating-s2"></label>
									<input type="radio" name="rating" id="rating-s3" value="3" />
									<label class="ic ic-star" for="rating-s3"></label>
									<input type="radio" name="rating" id="rating-s4" value="4" />
									<label class="ic ic-star" for="rating-s4"></label>
									<input type="radio" name="rating" checked id="rating-s5" value="5" />
									<label class="ic ic-star" for="rating-s5"></label>
								</div>
							</div>
						</div>
						<?php echo $captcha; ?>
						<div class="buttons clearfix text-center">
							<button type="submit" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
						</div>
						<?php } else { ?>
						<?php echo $text_login; ?>
					<?php } ?>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-review-answer-form" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close with-icon" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
			<div class="modal-body">
				<div class="faf-title"><span>Вы отвечаете на комментарий:</span></div>
				<div class="faf-review-text"></div>
				<form class="review-answer-form form-horizontal">       
					<input type="hidden" name="parent_id">
					<input type="hidden" name="good" value="">
					<input type="hidden" name="bads" value="">
					<input type="hidden" name="rating" value="0">
					
					<div class="form-group required">
						<div class="col-sm-12">
							<input class="form-control" type="text" placeholder="Ваше имя:" name="name">
						</div>
					</div>          
					<div class="form-group required">
						<div class="col-sm-12">
							<textarea name="text" rows="5" id="input-review" placeholder="Ответ:" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group text-center">
						<button type="submit" id="button-review-answer" data-loading-text="Загрузка..." class="btn btn-primary btn-form-review">Ответить</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>

