	<div class="product-thumb" data-equal-group="2">
		<div class="stikers">
		<?php if ($product['special']) { ?>
			<div class="stiker-sale">
				<small>Скидка</small>
				- <?php echo $product['sale']; ?>%
			</div>
		<?php } elseif($product['upc']=='new') { ?>
			<div class="stiker new_pr"><span><?php echo $text_new; ?></span></div>
		<?php } elseif ($product['upc']=='bestseller') { ?>
			<div class="stiker best_pr"><span>Топ продаж</span></div>
		<?php } ?>
		</div>
		<div class="image">
			<?php if(isset($_GET['ajax']) || isset($imgajax) || true) { ?>
				<a class="lazy lazy-loaded" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%"
			href="<?php echo $product['href']; ?>">
				
				<img alt="<?php echo $product['name']; ?>"
				title="<?php echo $product['name']; ?>"
				class="img-responsive"
				src="<?php echo $product['thumb']; ?>"
				/>
			</a>
				<?php } else { ?>
				<a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%"
			href="<?php echo $product['href']; ?>">
				<img alt="<?php echo $product['name']; ?>"
				title="<?php echo $product['name']; ?>"
				class="img-responsive"
				data-src="<?php echo $product['thumb']; ?>"
				src="#"/>
			</a>
				<?php } ?>
				
			
		</div>
		<div class="caption">
			<div class="name">
				<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			</div>
			
			<?php if($product['rating']) { ?>
				<div class="rating">	
					<div>
						<?php for($i = 0; $i < 5; $i++) { ?>
							<?php if ($product['rating'] < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star none-star fa-stack-2x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack">
									<i class="fa fa-star fa-stack-2x"></i>
									<i class="fa fa-star-o fa-stack-2x"></i>
								</span>
							<?php } ?>
						<?php } ?>
					</div>
					<div>
						<span class="count-review" onclick="window.location='<?php echo $product['href']; ?>#tab-review'"><i class="fa fa-comment-o"></i> <span>Отзывы (<?php echo $product['reviews']; ?>)</span></span>
					</div>
				</div>
			<?php } ?>
			
			<?php if ($product['price']) { $product['special'] = round($product['special'] / $product['jan'], 2);  ?>
				<div class="price">
					
					<?php if (!$product['special']) { ?>
						<span class="price-def"><?php echo round($product['price'] / $product['jan'], 2); ?> <small>грн./<?php echo $product['length_class_id']; ?></small></span>
						<?php } else { ?>
						<span class="price-old"><?php echo round($product['price'] / $product['jan'], 2); ?> <small>грн./<?php echo $product['length_class_id']; ?></small></span>
					<?php } ?>
					<span class="price-new"><?php if ($product['special'] == 0) echo ''; else echo($product['special']."<small>грн./".$product['length_class_id']."</small>"); ?></span>
				</div>
			<?php } ?>
			
			
			<div class="flex-stock-btn">
				
				<?php if(!isset($product['stock_status'])) { $product['stock_status'] = 'Нет в наличии'; } ?>
				<?php if(isset($product['quantity']) && ($product['quantity'] > 0)) { ?>
					<div class="stock in-stock"><i class="fa fa-check"></i> В наличии</div>
					<button onclick="window.location='<?php echo $product['href']; ?>'" class="home-btn product-btn-add" type="button" title="Купить">
						<i class="ic-cart"></i>
						<span>Купить</span>
					</button>
					<?php } else { ?>
					
					<button disabled onclick="window.location='<?php echo $product['href']; ?>'" class="home-btn product-btn-add product-not-btn-add" type="button">
						Нет в наличии
					</button>
				<?php } ?>
				
				
			</div>
		</div>
		<div class="hover-block">
			<?php if(isset($product['attributes']) && count($product['attributes'])) { ?>
				<ul class="attributes list-unstyled">
					<?php foreach($product['attributes'] as $attr) { ?>
						<li class="clearfix"><span><?php echo $attr['name']; ?></span><span><?php echo $attr['text']; ?></span></li>
					<?php } ?>
				</ul>
			<?php } ?>
		</div>
	</div>	