<?php function transliterate($textcyr = null, $textlat = null) {
    $cyr = array(
    'ж',  'ч',  'щ',   'ш',  'ю',  'а', 'б', 'в', 'г', 'д', 'е', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ъ', 'ь', 'я',
    'Ж',  'Ч',  'Щ',   'Ш',  'Ю',  'А', 'Б', 'В', 'Г', 'Д', 'Е', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ъ', 'Ь', 'Я');
    $lat = array(
    'zh', 'ch', 'sht', 'sh', 'yu', 'a', 'b', 'v', 'g', 'd', 'e', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'y', 'x', 'q',
    'zh', 'ch', 'sht', 'sh', 'yu', 'a', 'b', 'v', 'g', 'd', 'e', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'y', 'x', 'q');
    if($textcyr) return str_replace($cyr, $lat, $textcyr);
    else if($textlat) return str_replace($lat, $cyr, $textlat);
    else return null;
} ?>
<div class="container">
    <div class="<?php echo transliterate($name);?>">
        <h3><?php echo $name;?></h3>
        <div id="carousel<?php echo $module; ?>" class="owl-carousel">
            <?php foreach ($banners as $banner) { ?>

            <div class="item text-center">
                <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"
                                                              alt="<?php echo $banner['title']; ?>"
                                                              class="img-responsive"/>
                </a>
                <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"
                     class="img-responsive"/>
                <?php } ?>
            </div>
            <?php } ?>

        </div>
    </div>
</div>


<script type="text/javascript">
$('#carousel<?php echo $module; ?>').owlCarousel({
    items: 6,
    autoPlay: 5000,
    navigation: true,
    navigationText: false,
    pagination: true,
    slideSpeed: 500,
    itemsDesktopSmall: [1199, 5],
    itemsTablet: [991,4],
    itemsTabletSmall: [767,3],
    itemsMobile: [479,2]
});
</script>