<?php
	$path = "common/home";
	$url = $_SERVER['REQUEST_URI'];
	if ($url == "/" or strripos($url, $path)) {
		$is_home = TRUE;
		}else{
		$is_home = false;
	}           
?>
<div class="box latest">
    <div class="container">
        <div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
        <div class="box-content">
		    <?php if ($is_home) { $clsowl = 'mylastowl'; } ?>
            <div class="row <?php if(isset($clsowl)){echo $clsowl;} ?>">
                <?php $f=0; foreach ($products as $product) { $f++ ?>
					<?php if (!$is_home) { ?>
						<div class="product-layout col-sm-3 col-lg-3 col-md-3 ">
							<?php } else { ?>
							<div class="product-layout col-sm-12 col-lg-12 col-md-12 ">
							<?php } ?>
							<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
						</div>
					<?php } ?>
				</div>
			</div>
			<!--	<?php if ($is_home) {?> <div class="oc_after">Все новинки <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
			</div> <?php } ?> -->
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('.mylastowl').owlCarousel({
		items: 4,
		autoPlay: 5000,
		navigation: true,
		navigationText: false,
		pagination: true,
		slideSpeed: 500,
		
	});
--></script>