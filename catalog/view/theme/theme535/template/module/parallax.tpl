<div id="parallax_<?php echo $module; ?>" class="parallax">

    <?php foreach ($banners as $banner) { ?>
    <div
    <?php if ($banner['link']) { ?>class="link" onclick="location.href='<?php echo $banner['link']; ?>
                                   '"<?php } ?>  <?php if ($banner['image']) { ?>
                                   data-source-url="<?php echo $banner['image']; ?>"<?php } ?>
                                   class="<?php echo $banner['title']; ?> <?php if ($banner['link']) { ?>link<?php } ?>
                                   ">

    <?php echo $banner['description']; ?>

</div>


<?php } ?>

</div>

<script>
    jQuery(document).ready(function () {
        jQuery("#parallax_<?php echo $module; ?>>div").cherryFixedParallax({
            invert: false,
            bgfixed: false
        });
    });
</script>


