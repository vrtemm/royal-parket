<?php echo $header; ?>
<div class="breadcrumb-block">
<div id="breadcrumb" style="padding-left: 15px;"><ol class="breadcrumb container" itemscope itemtype="http://schema.org/BreadcrumbList">
<?php $i=0; ?>
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php $i++; ?>
	<li itemprop="itemListElement" itemscope
      itemtype="http://schema.org/ListItem"><a href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a><meta itemprop="position" content="<?php echo $i; ?>" /></li>
	<?php } ?>
</ol></div>

</div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	<div id="content" class="<?php echo $class; ?>">
		<h1><?php echo $heading_title; ?></h1>
		<?php echo $content_top; ?>
	  
	  <?php if ($products) { ?>
				<div class="sort-panel">
					<div class="sort-box">
						<label class="control-label"><?php echo $text_sort; ?></label>
						<div id="input-sort">
							<?php foreach ($sorts as $sorts) { ?>
								<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<a href="<?php echo $sorts['href']; ?>" class="<?php if($sorts['ts']){ ?>ts<?php } ?> selected"><?php echo $sorts['text']; ?></a>
									<?php } else { ?>
									<a href="<?php echo $sorts['href']; ?>" <?php if($sorts['ts']){ ?>class="ts"<?php } ?>><?php echo $sorts['text']; ?></a>
								<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="limit-box">
						<label class="control-label" for="input-limit">Показывать по:</label>
						<select id="input-limit" class="form-control" onchange="location = this.value;">
							<?php foreach ($limits as $limits) { ?>
								<?php if ($limits['value'] == $limit) { ?>
									<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</div>
					
				</div>
				<div class="row prod full-list">
					<?php foreach ($products as $product) { ?>
						<div class="product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
						</div>
						
					<?php } ?>
				</div>
				<div class="text-center"><?php echo $pagination; ?></div>
	  <?php } else { ?>
	  <p><?php echo $text_empty; ?></p>
	  <div class="buttons">
		<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
	  </div>
	  <?php } ?>
	  <?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<script>
	$(document).ready(function () {
		if(typeof($('.pagination .active').next().find('a')) != 'undefined' || parseInt($('.pagination .active').next().find('a').html())) {
			$('.pagination').before('<div class="text-center"><button class="show-more"><i class="fa fa-repeat"></i> Показать еще</button></div>');
		}
		$('body').on('click', '.show-more', function() {
			if(typeof($('.pagination .active').next().find('a')) != 'undefined' || parseInt($('.pagination .active').next().find('a').html())) {
				$('.show-more i').addClass('loader');
				$.ajax({
					url:$('.pagination .active').next().find('a').attr('href')+'&ajax=1', 
					success:function (data) {
						
						$data = $(data);
						$('.full-list > div:last-child').after($(data).find('.full-list').html());
						cols1 = $('#column-right, #column-left').length;
						$('.full-list > .clearfix').remove();
						if (cols1 == 2) {
							$('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
							} else if (cols1 == 1) {
							$('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
							} else {
							$('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
						}
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
</script>
<?php echo $footer; ?>