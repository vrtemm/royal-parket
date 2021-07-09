<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>">
	<?php } ?>
		<?php if($banner['video']) { ?>
			<video width="<?php echo $banner['width']; ?>" height="<?php echo $banner['height']; ?>" class="img-responsive">
				<source src="image/<?php echo $banner['image']; ?>">
			</video>
			
			<button class="volume-off" onclick="changeVolume($(this).prev());"><i class="fa fa-volume-up"></i></button>
		<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
		<?php } ?>
		<?php if($banner['description']) { ?>
			 <div class="slider-text">
           <?php echo $banner['description']; ?>
        </div>
		<?php } ?>
	<?php if ($banner['link']) { ?>
		</a>
	<?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
function changeVolume(block) {
	var muted = block.get(0).muted;
	if(muted == true) {
		block.get(0).muted = false;
		block.next().find('.fa').removeClass('fa-volume-off').addClass('fa-volume-up');
	} else {
		block.get(0).muted = true;
		block.next().find('.fa').removeClass('fa-volume-up').addClass('fa-volume-off');
	}
}
$('#slideshow<?php echo $module; ?> video').click(function(){
	if($(this).get(0).paused == true) {
		$(this).get(0).play();
	} else {
		$(this).get(0).pause();
	}
});

$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	singleItem: true,
	slideSpeed: 400,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
	pagination: true,
	beforeInit: function() {
		if($(window).width() < 767) {
			$('#slideshow<?php echo $module; ?>').find('video').parent().remove();
		}
	},
	afterInit: function(elem) {
		var index = this.owl.currentItem;
		var item = $('#slideshow<?php echo $module; ?>').find('.item').eq(index);
		if(item.find('video').length > 0) {
			changeVolume(item.find('video'));
			item.find('video').get(0).play();
			
			item.find('video').get(0).onended = function(e) {
				$('#slideshow<?php echo $module; ?>').data('owlCarousel').next();
			};
		}
	},
	afterMove: function(elem) {
		var index = this.owl.currentItem;
		if($('#slideshow<?php echo $module; ?>').find('video').length > 0) {
		$('#slideshow<?php echo $module; ?>').find('video').get(0).pause();
		}
		var item = $('#slideshow<?php echo $module; ?>').find('.item').eq(index);
		if(item.find('video').length > 0) {
			
			item.find('video').get(0).play();
			item.find('video').get(0).onended = function(e) {
				$('#slideshow<?php echo $module; ?>').data('owlCarousel').next();
			};
		} else {
			setTimeout(function () {
				$('#slideshow<?php echo $module; ?>').data('owlCarousel').next();
			}, 4000);
		}
	}
});


--></script>