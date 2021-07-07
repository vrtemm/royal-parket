<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-T3XGWHZ');</script>
<!-- End Google Tag Manager -->

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>

<?php if ($noindex) { ?>
<!-- OCFilter Start -->
<meta name="robots" content="noindex,nofollow" />
<!-- OCFilter End -->
<?php } ?>
      
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($alter_lang as $lang=>$href) { ?>
<link href="<?php echo $href; ?>" hreflang="<?php echo $lang; ?>" rel="alternate" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-96335562-1', 'auto');
  ga('send', 'pageview');

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

<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>

			<?
			if($use_megamenu)
			{?>
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
		
		<a href="<?php echo $item['href']; ?>" <?php if($item['use_target_blank'] == 1) { echo ' target="_blank" ';} ?> <?php if($item['type'] == "link") {echo 'data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>><?if($item['thumb']){?>
		<img class="megamenu-thumb" src="<?=$item['thumb']?>"/>
		<?}?><?php echo $item['name']; ?></a>
		
		<?if($item['type']=="category"){?>
		<?if($item['subtype']=="simple"){?>
          <div class="dropdown-menu megamenu-type-category-simple">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
					  
			    <ul class="list-unstyled megamenu-haschild">
                <?php foreach ($children as $child) { ?>
                <li class="<?if(count($child['children'])){?> megamenu-issubchild<?}?>"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				
				<?if(count($child['children'])){?>
				<ul class="list-unstyled megamenu-ischild megamenu-ischild-simple">
				 <?php foreach ($child['children'] as $subchild) { ?>
				<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
				<?}?>
				</ul>
				<?}?>				
				</li>
                <?php } ?>
				</ul>
				
				
				
              <?php } ?>
            </div>            
			</div>
			<?}?>	
			<?}?>
			
		<?if($item['type']=="category"){?>
		<?if($item['subtype']=="full"){?>
          <div class="dropdown-menu megamenu-type-category-full megamenu-bigblock">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
			  	<?if($item['add_html']){?>
			  <div style="" class="menu-add-html">
				<?=$item['add_html'];?>
				</div>
				<?}?>
			  
			    <ul class="list-unstyled megamenu-haschild">
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>"><a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				
				<?if(count($child['children'])){?>
				<ul class="list-unstyled megamenu-ischild">
				 <?php foreach ($child['children'] as $subchild) { ?>
				<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
				<?}?>
				</ul>
				<?}?>				
				</li>
                <?php } ?>
				</ul>
              <?php } ?>
            </div>            
			</div>
			<?}?>	
			<?}?>
			
			<?if($item['type']=="category"){?>
		<?if($item['subtype']=="full_image"){?>
          <div class="dropdown-menu megamenu-type-category-full-image megamenu-bigblock">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
			  	<?if($item['add_html']){?>
			  <div style="" class="menu-add-html">
				<?=$item['add_html'];?>
				</div>
				<?}?>
			  
			    <ul class="list-unstyled megamenu-haschild">
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>">
				<a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title=""/></a>
				<a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				
				<?if(count($child['children'])){?>
				<ul class="list-unstyled megamenu-ischild">
				 <?php foreach ($child['children'] as $subchild) { ?>
				<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
				<?}?>
				</ul>
				<?}?>				
				</li>
                <?php } ?>
				</ul>
              <?php } ?>
            </div>            
			</div>
			<?}?>	
			<?}?>
			
			
			<?if($item['type']=="html"){?>
		
          <div class="dropdown-menu megamenu-type-html">
            <div class="dropdown-inner">
              
            
			  
			  
			    <ul class="list-unstyled megamenu-haschild">
                
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>">
				<div class="megamenu-html-block">				
				<?=$item['html']?>
				</div>
				</li>
              				</ul>
            
            </div>            
			</div>
				
			<?}?>
			
			
		
			
		<?if($item['type']=="manufacturer"){?>

          <div class="dropdown-menu megamenu-type-manufacturer <?if($item['add_html']){?>megamenu-bigblock<?}?>">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
			   <?if($item['add_html']){?>
			  <div style="" class="menu-add-html">
				<?=$item['add_html'];?>
				</div>
				<?}?>
			  
			    <ul class="list-unstyled megamenu-haschild <?if($item['add_html']){?>megamenu-blockwithimage<?}?>">
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
		
			<?}?>
			
				<?if($item['type']=="information"){?>
	
          <div class="dropdown-menu megamenu-type-information <?if($item['add_html']){?>megamenu-bigblock<?}?>">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
			  <?if($item['add_html']){?>
			  <div style="" class="menu-add-html">
				<?=$item['add_html'];?>
				</div>
				<?}?>
			  
			    <ul class="list-unstyled megamenu-haschild <?if($item['add_html']){?>megamenu-blockwithimage<?}?>">
                <?php foreach ($children as $child) { ?>
                <li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				
					
				</li>
                <?php } ?>
				</ul>
              <?php } ?>
            </div>            
			</div>
		
			<?}?>
			
			
			
				<?if($item['type']=="product"){?>

          <div class="dropdown-menu megamenu-type-product <?if($item['add_html']){?>megamenu-bigblock<?}?>">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
            
			   <?if($item['add_html']){?>
			  <div style="" class="menu-add-html">
				<?=$item['add_html'];?>
				</div>
				<?}?>
			  
			    <ul class="list-unstyled megamenu-haschild <?if($item['add_html']){?>megamenu-blockwithimage<?}?>">
                <?php foreach ($children as $child) { ?>
                <li class="megamenu-parent-block">
				<a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title="" /></a>
				<a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				<div class="dropprice">
				<?if($child['special']){?><span><?}?><?php echo $child['price']; ?><?if($child['special']){?></span><?}?><?php echo $child['special']; ?>
				</div>				
				</li>
                <?php } ?>
				</ul>
              <?php } ?>
            </div>            
			</div>
		
			<?}?>
			
			
					<?if($item['type']=="auth"){?>
		
          <div class="dropdown-menu megamenu-type-auth">
            <div class="dropdown-inner">
              
            
			  
			  
			    <ul class="list-unstyled megamenu-haschild">
                
                <li class="megamenu-parent-block<?if(count($child['children'])){?> megamenu-issubchild<?}?>">
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
				<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></div>
				
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
             
            </form>
			
			
				</div>
				</li>
              				</ul>
            
            </div>            
			</div>
				
			<?}?>
			
        </li>
		
		
		
        <?php } else { ?>
        <li><a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a></li>
        <?php } ?>
        <?php } ?>		
      </ul>
    </div>
  </nav>

<?}?>
<?php if ($categories && !$use_megamenu) { ?>

			
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
