<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
	<!--<![endif]-->
	<head prefix=
    "og: http://ogp.me/ns#
	fb: http://ogp.me/ns/fb#  
	product: http://ogp.me/ns/product#">
	
	<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-T3XGWHZ');</script>
<!-- End Google Tag Manager -->

		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><?php echo $title; ?></title>

		<?php if ($noindex) { ?>
			<!-- OCFilter Start -->
			<meta name="robots" content="noindex,nofollow" />
			<!-- OCFilter End -->
		<?php } ?>
      
		<base href="<?php echo $base; ?>"/>
		<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>"/>
		<?php } ?>
		<?php if ($keywords) { ?>
			<meta name="keywords" content="<?php echo $keywords; ?>"/>
		<?php } ?>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<?php if ($icon) { ?>
			<link href="<?php echo $icon; ?>" rel="icon"/>
		<?php } ?>
		<?php foreach ($links as $link) { ?>
			<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
		<?php } ?>
		<?php if (isset($_GET['page']) and $_GET['page']>1) {  echo "<meta name='robots' content='noindex, follow'/>";}?>    <?php foreach ($styles as $style) { ?>
			<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
			media="<?php echo $style['media']; ?>"/>
		<?php } ?>
		<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
		<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
		<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="/callme/js/callme.min.js" type="text/javascript" charset="utf-8"></script>
		
		<link rel="stylesheet" href="<?php echo $global_path ?>js/fancybox/jquery.fancybox.css" media="screen"/>
		<link href="<?php echo $global_path ?>stylesheet/owl-carousel.css" rel="stylesheet">
		<link href="<?php echo $global_path ?>stylesheet/photoswipe.css" rel="stylesheet">
		<link href="<?php echo $global_path ?>js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
		<link href="catalog/view/javascript/jquery/jquery-nice-select/css/nice-select.css?v=<?php echo time(); ?>" rel="stylesheet" media="screen" />
		<script src="catalog/view/javascript/jquery/jquery-nice-select/js/jquery.nice-select.min.js?v=<?php echo time(); ?>" type="text/javascript"></script>
			<link href="<?php echo $global_path ?>stylesheet/stylesheet_new.css?v=12" rel="stylesheet">

		<link rel="stylesheet" href="<?php echo $global_path ?>font-awesome4.2.0/css/font-awesome.min.css">
		<script src="<?php echo $global_path ?>js/common.js?v=1q" type="text/javascript"></script>
		
		<!--custom script-->
		<?php foreach ($scripts as $script) { ?>
			<script src="<?php echo $script; ?>" type="text/javascript"></script>
		<?php } ?>
		
		
		<!--[if lt IE 9]>
		<div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'>
			<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img
			src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
			height="42" width="820"
			alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
			</a>
		</div><![endif]-->
		<script src="<?php echo $global_path ?>js/device.min.js" type="text/javascript"></script>
		
		<?php echo $google_analytics; ?>
		<?php include_once("analyticstracking.php") ?>

		<script>
			(function(i,s,o,g,r,a,m){
			i["esSdk"] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, a=s.createElement(o), m=s.getElementsByTagName(o)[0]; a.async=1; a.src=g;
			m.parentNode.insertBefore(a,m)}
			) (window, document, "script", "https://esputnik.com/scripts/v1/public/scripts?apiKey=eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiI0NTI0ZWZhYTJkYzI2MGRmYTM4YTE1NDBlMWFjYmI0NGM5YTMzNTNlMmY0MWMzOTIwMmU3NTA3ZWMwOTI1OTA4MzJlZmU2MzkwZWZiZWYyNDJhMTE3N2UzZDgyN2RhMmQwM2E0YmIwMDUzMzY3MmIwYWYyMjA1ZDIzNTFmYzYxNGIzYzBhYzM2MzM3ZDY1NGNiNzI1ZTk3YmU3OTM0OTExMDI4YWVjOTE5YTFiNjY1ZmYyMDZhYjkzZGMifQ.A2kXecZrQyVz3HEGTChqraidsyoffdGpQr4vyASTrznLI7UPb_v0aRs1V19YVhKp1iKZ-hY-sw72GUse0sc5Mw&domain=B6DCDA3E-E394-417F-9020-A45F250B7983", "es");
			es("pushOn");
		</script>

		<meta property="og:title" content="<?php echo $title;if ( isset($_GET['page']) && ($_GET['page'] != 1) ) { echo " - ". ((int) $_GET['page']);} ?>" >
		<meta property="og:description" content="<?php echo $description;if ( isset($_GET['page']) && ($_GET['page'] != 1) ) { echo " - ". ((int) $_GET['page']);} ?>" >
		<?php if ($class == 'common-home') { ?>
			<meta property="og:url" content="<?php echo $base; ?>" >
		<?php } ?>
		<?php if ( (strpos($class, 'product-product') === false) && (strpos($class, 'product-category') === false) && (strpos($class, 'product-manufacturer-info') === false) )  { ?>
			<meta property="og:image" content="<?php echo $logo_meta; ?>" >
			<meta property="og:image:width" content="300" >
			<meta property="og:image:height" content="300" >
		<?php } ?>
		<meta property="og:site_name" content="<?php echo $name; ?>" >
		<?php foreach ($ogmeta as $meta_tag) { ?>
			<meta <?php echo $meta_tag['meta_name']; ?> content="<?php echo $meta_tag['content']; ?>" >
		<?php } ?>
	</head>
	<body class="<?php echo $class; ?>">
	
	<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T3XGWHZ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

		<p id="gl_path" class="hidden"><?php echo $global_path ?></p>
		<!-- swipe menu -->
		<div class="swipe">
			<div class="swipe-menu">
				<ul>
					<!--<li>
						<a href="<?php echo $wishlist; ?>" id="wishlist-total2" title="<?php echo $text_wishlist; ?>"><i
                        class="fa fa-heart"></i> <span><?php echo $text_wishlist;?>(<?php echo $text_wishlist2?>)</span>
						</a>
					</li>-->
					<li>
						<a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i>
						<span><?php echo $text_checkout; ?></span></a>
					</li>
				</ul>
				<?php if ($maintenance == 0){ ?>
					<ul class="foot">
						<?php if ($informations) { ?>
							<?php foreach ($informations as $information) { ?>
								<li>
									<a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
								</li>
							<?php } ?>
						<?php } ?>
					</ul>
				<?php } ?>
				<ul class="foot foot-1">
					<li>
						<a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
					</li>
					<!--<li>
						<a href="<?php echo $return; ?>"><?php echo $text_return; ?></a>
					</li>-->
					<li>
						<a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
					</li>
				</ul>
				
				<ul class="foot foot-2">
					<li>
						<a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a>
					</li>
				
					<li>
						<a href="<?php echo $special; ?>"><?php echo $text_special; ?></a>
					</li>
				</ul>
				
			</div>
		</div>
		<div id="page">
			<div class="shadow"></div>
			<div class="toprow-1">
				<a class="swipe-control" href="#">
					<i class="fa fa-align-justify"></i>
				</a>
			</div>
			
			<header class="header new-h">
				<div class="myheader">
						<div class="container">
							<div class="menu_panel">
								<div class="row">
									<div class="col-sm-1">
										<div id="logo" class="logo">
											<a href="<?php echo $home; ?>">
												<img src="image/catalog/logo-rp.svg" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
											</a>
										</div>
									</div>
									<div class="col-sm-11 city-phone-block clearfix">
										<?php require("system/modification/catalog/view/theme/theme535/template/common/header-components/header-city.tpl"); ?>

										<div class="pull-left time-menu-block">
											<div class="mh_search"><?php echo $search; ?></div>
											
											<?php if($use_megamenu) { ?>
												<script type="text/javascript" src="/catalog/view/javascript/megamenu/megamenu.js?v3"></script>
												<link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/megamenu.css?v3">
												<nav id="megamenu-menu" class="navbar">
													<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $menu_title; ?></span>
													  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
													</div>
													<div class="collapse navbar-collapse navbar-ex1-collapse">
													  <ul class="nav__primary navbar-nav">
														<?php foreach ($items as $item) { ?>
															<?php if ($item['children']) { ?>
														  		<li class="dropdown">
																	<a href="<?php echo $item['href']; ?>" <?php if ($item['use_target_blank'] == 1) { echo ' target="_blank" ';} ?> <?php if($item['type'] == "link") { echo 'data-target="link"'; } else { echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
																		<?php if ($item['thumb']) { ?>
																			<img class="megamenu-thumb" src="<?= $item['thumb'] ?>" />
																		<?php } ?>
																		<?php echo $item['name']; ?>
																	</a>

																	<?php if($item['type']=="category"){ ?>
																		<?php if($item['subtype']=="simple"){ ?>
																			<div class="dropdown-menu megamenu-type-category-simple">
																				<div class="dropdown-inner">
																					<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
																						<ul class="list-unstyled megamenu-haschild">
																							<?php foreach ($children as $child) { ?>
																								<li class="<?if(count($child['children'])){ ?> megamenu-issubchild<?}?>"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																									<?php if (count($child['children'])){ ?>
																										<ul class="list-unstyled megamenu-ischild megamenu-ischild-simple">
																											<?php foreach ($child['children'] as $subchild) { ?>
																												<li>
																													<a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
																												</li>
																											<?php } ?>
																										</ul>
																									<?php } ?>
																								</li>
																							<?php } ?>
																						</ul>
																					<?php } ?>
																				</div>
																			</div>
																		<?php } ?>
																	<?php } ?>

																	<?php if ($item['type']=="category") { ?>
																		<?php if($item['subtype']=="full"){ ?>
																			<div class="dropdown-menu megamenu-type-category-full megamenu-bigblock">
																				<div class="dropdown-inner">
																					<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
																						<?php if($item['add_html']){ ?>
																							<div style="" class="menu-add-html">
																								<?=$item['add_html'];?>
																							</div>
																						<?php } ?>

																						<ul class="list-unstyled megamenu-haschild">
																							<?php foreach ($children as $child) { ?>
																								<li class="megamenu-parent-block<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
																									<a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>

																									<?php if(count($child['children'])){ ?>
																										<ul class="list-unstyled megamenu-ischild">
																											<?php foreach ($child['children'] as $subchild) { ?>
																												<li>
																													<a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
																												</li>
																											<?php } ?>
																										</ul>
																									<?php } ?>
																								</li>
																							<?php } ?>
																						</ul>
																					<?php } ?>
																				</div>
																			</div>
																		<?php } ?>
																	<?php } ?>

																	<?php if ($item['type']=="category") { ?>
																		<?php if ($item['subtype']=="full_image") { ?>
																			<div class="dropdown-menu megamenu-type-category-full-image megamenu-bigblock">
																				<div class="dropdown-inner">
																					<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
																						<?php if($item['add_html']){ ?>
																							<div style="" class="menu-add-html">
																								<?=$item['add_html'];?>
																							</div>
																						<?php } ?>

																						<ul class="list-unstyled megamenu-haschild">
																							<?php foreach ($children as $child) { ?>
																								<li class="megamenu-parent-block<?if(count($child['children'])){ ?> megamenu-issubchild<?}?>">
																									<a class="megamenu-parent-img" href="<?php echo $child['href']; ?>">
																										<img src="<?php echo $child['thumb']; ?>" alt="" title=""/>
																									</a>
																									<a class="megamenu-parent-title" href="<?php echo $child['href']; ?>">
																										<?php echo $child['name']; ?>
																									</a>

																									<?php if(count($child['children'])){ ?>
																										<ul class="list-unstyled megamenu-ischild">
																											<?php foreach ($child['children'] as $subchild) { ?>
																												<li>
																													<a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a>
																												</li>
																											<?php } ?>
																										</ul>
																									<?php } ?>
																								</li>
																							<?php } ?>
																						</ul>
																					<?php } ?>
																				</div>
																			</div>
																		<?php } ?>
																	<?php } ?>

																	<?php if ($item['type']=="html"){ ?>
																		<div class="dropdown-menu megamenu-type-html">
																			<div class="dropdown-inner">
																				<ul class="list-unstyled megamenu-haschild">
																					<li class="megamenu-parent-block<?if(count($child['children'])){ ?> megamenu-issubchild<?}?>">
																						<div class="megamenu-html-block">
																							<?= $item['html'] ?>
																						</div>
																					</li>
																				</ul>
																			</div>
																		</div>
																	<?php } ?>

																	<?php if($item['type']=="manufacturer"){ ?>
																		<div class="dropdown-menu megamenu-type-manufacturer <?if($item['add_html']){ ?>megamenu-bigblock<?}?>">
																			<div class="dropdown-inner">
																				<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
																					<?php if($item['add_html']){ ?>
																						<div style="" class="menu-add-html">
																							<?= $item['add_html']; ?>
																						</div>
																					<?php } ?>

																					<ul class="list-unstyled megamenu-haschild <?if($item['add_html']){ ?>megamenu-blockwithimage<?}?>">
																						<?php foreach ($children as $child) { ?>
																							<li class="megamenu-parent-block">
																								<a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title="" /></a>
																								<a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																							</li>
																						<?php } ?>
																					</ul>
																				<?php } ?>
																			</div>
																		</div>
																	<?php } ?>

																	<?php if($item['type']=="information"){ ?>
																		<div class="dropdown-menu megamenu-type-information <?if($item['add_html']){ ?>megamenu-bigblock<?}?>">
																			<div class="dropdown-inner">
																				<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
																					<?php if($item['add_html']){ ?>
																						<div style="" class="menu-add-html">
																							<?=$item['add_html'];?>
																						</div>
																					<?php }?>

																					<ul class="list-unstyled megamenu-haschild <?if($item['add_html']){ ?>megamenu-blockwithimage<?}?>">
																						<?php foreach ($children as $child) { ?>
																							<li class="">
																								<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																							</li>
																						<?php } ?>
																					</ul>
																				<?php } ?>
																			</div>
																		</div>
																	<?php } ?>

																	<?php if ($item['type']=="product") { ?>
																		<div class="dropdown-menu megamenu-type-product <?if($item['add_html']){ ?>megamenu-bigblock<?}?>">
																			<div class="dropdown-inner">
																				<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
																					<?php if ($item['add_html']) { ?>
																						<div style="" class="menu-add-html">
																							<?= $item['add_html']; ?>
																						</div>
																					<?php } ?>

																					<ul class="list-unstyled megamenu-haschild <?if($item['add_html']){ ?>megamenu-blockwithimage<?}?>">
																						<?php foreach ($children as $child) { ?>
																							<li class="megamenu-parent-block">
																								<a class="megamenu-parent-img" href="<?php echo $child['href']; ?>">
																									<img src="<?php echo $child['thumb']; ?>" alt="" title="" />
																								</a>
																								<a class="megamenu-parent-title" href="<?php echo $child['href']; ?>">
																									<?php echo $child['name']; ?>
																								</a>
																								<div class="dropprice">
																									<?php if ($child['special']) { ?><span><?php } ?><?php echo $child['price']; ?><?php if($child['special']){ ?></span><?php } ?><?php echo $child['special']; ?>
																								</div>
																							</li>
																						<?php } ?>
																					</ul>
																				<?php } ?>
																			</div>
																		</div>
																	<?php } ?>

																	<?php if($item['type']=="auth"){ ?>
																		<div class="dropdown-menu megamenu-type-auth">
																			<div class="dropdown-inner">
																				<ul class="list-unstyled megamenu-haschild">
																					<li class="megamenu-parent-block<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
																						<div class="megamenu-html-block">
																							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
																								<div class="form-group">
																									<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
																									<input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
																								</div>
																								<div class="form-group">
																									<label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
																									<input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
																									<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
																									<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
																								</div>
																								<input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
																							</form>
																						</div>
																					</li>
																				</ul>
																			</div>
																		</div>
																	<?php } ?>
																</li>
														  	<?php } else { ?>
															  <li>
															  	<a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a>
															  </li>
														  	<?php } ?>
													  	<?php } ?>
													  </ul>
													</div>
											  	</nav>
											<?php } ?>
											<?php if ($categories && !$use_megamenu) { ?>
												<nav id="menu" class="navbar">
													<div class="collapse navbar-collapse navbar-ex1-collapse">
														<ul class="nav__primary navbar-nav">
															<?php foreach ($categories as $category) { ?>
																<?php if ($category['children']) { ?>
																	<li class="dropdown">
																		<a href="<?php echo $category['href']; ?>"
																		class="dropdown-toggle"><?php echo $category['name']; ?></a>
																		<div class="dropdown-menu">
																			<div class="dropdown-inner">
																				<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
																					<ul class="list-unstyled">
																						<?php foreach ($children as $child) { ?>
																							<li>
																								<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																							</li>
																						<?php } ?>
																					</ul>
																				<?php } ?>
																			</div>
																		</div>
																	</li>
																	<?php } else { ?>
																	<li>
																		<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
																	</li>
																<?php } ?>
															<?php } ?>
														</ul>
													</div>
												</nav>
											<?php } ?>
										</div>
										<div class="pull-right mini_top clearfix">
											
											<a class="hmy_account" href="/my-account/">Личный кабинет</a>
											<?php echo $cart; ?>
										</div>
									</div>
								</div>
							</div>
						</div>
					<?php if ($categories) { ?>
						<div class="container">
							<div class="row">
								<div class="col-sm-12">
									<div id="menu-gadget" class="menu-gadget">
										<div id="menu-icon" class="menu-icon"><?php echo $text_category; ?></div>
										<ul class="menu">
											<?php foreach ($categories as $category) { ?>
												
												<?php if ($category['children']) { ?>
												<li>
												<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
												<ul>
													<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
														
														<?php foreach ($children as $child) { ?>
														<li>
															<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
														</li>
													<?php } ?>
													
												<?php } ?>
												</ul>
												</li>
												<?php } else { ?>
												<li>
													<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
												</li>
												<?php } ?>
												
												<?php }?>
												
												
												
												<li>
													<a href="#" >Услуги</a>
													<ul>
														<li><a href="/design">Дизайн</a></li>
														<li> <a href="/restavraciya">Реставрация</a></li>
														<li> <a href="/ukladka">Укладка</a></li>
													</ul>
												</li>
												
												
												
												</ul>
												</div>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
				<div class="pseudoStickyBlock"></div>
			</header>
