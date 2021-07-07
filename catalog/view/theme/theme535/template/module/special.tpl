<?php
	$path = "common/home";
	$url = $_SERVER['REQUEST_URI'];
	if ($url == "/" or strripos($url, $path)) {
		$is_home = TRUE;
		}else{
		$is_home = false;
	}           
?>
<div class="box specials">
    <div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
    <div class="box-content">
		<?php if ($is_home) { $clsowl = 'myspecowl'; } ?>
		<div class="row <?php if(isset($clsowl)){echo $clsowl;} ?>">
			<?php $t=0; foreach ($products as $product) { $t++ ?>
				<?php if (!$is_home) { ?>
                    <div class="product-layout col-sm-3 col-lg-3 col-md-3 ">
						<?php } else { ?>
						<div class="product-layout col-sm-12 col-lg-12 col-md-12 ">
						<?php } ?>
						<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
					</div>
				<?php } ?>
			</div>
			<?php if ($is_home) {?> <div class="oc_after"><a href="/index.php?route=product/special">Все акции</a> <img src="/catalog/view/theme/theme535/image/arrow_r.png" alt="arrow" />
			</div> <?php } ?>
		</div>
		
	</div>
	<script type="text/javascript"><!--
		$('.myspecowl').owlCarousel({
			items: 4,
			autoPlay: 5000,
			navigation: true,
			navigationText: false,
			pagination: false,
			slideSpeed: 500
		});
	--></script>	