<?php echo $header; ?>


	<link href="catalog/view/theme/theme535/stylesheet/home/StyleSheet.css?v=12" type="text/css" rel="stylesheet" />
    <link href="catalog/view/theme/theme535/stylesheet/home/responsive.css" type="text/css" rel="stylesheet" />

	<div class="slider">
        <?php echo $banners; ?>
            <div class="see_next">
                <span>смотри далее</span>
                <span></span>
            </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="utp_bl">
                    <div class="utp_elem">
                        <span></span>
                    </div>
                    <div class="utp_title">
                        <h2>Удобная покупка</h2>
                        <p>в Одессе и Киеве</p>
                    </div>
                    <div class="utp_text">
                        <p>
                            Быстрая доставка курьером на объект, а также
                            возможность ознакомится с ассортиментом в
                            наших шоу-румах
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="utp_bl">
                    <div class="utp_elem">
                        <span></span>
                    </div>
                    <div class="utp_title">
                        <h2>Гарантия </h2>
                        <p>100% качества</p>
                    </div>
                    <div class="utp_text">
                        <p>
                            Вся наша продукция поставляется от
                            ведущих европейских и отечественных производителей
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="utp_bl">
                    <div class="utp_elem">
                        <span></span>
                    </div>
                    <div class="utp_title">
                        <h2>Особые скидки</h2>
                        <p>постоянным клиентам</p>
                    </div>
                    <div class="utp_text">
                        <p>
                            Мы сотрудничаем с дизайнерами,
                            архитек&shy;торами, строительными компаниями,
                            прорабами, мастерами-экспертами и т.д.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <span class="line"></span>
    </div>
    <div class="container">
        <div class="row">
            <div class="product_block">
                <div class="box">
				<div class="box-content box-tabs">
					<ul class="nav nav-tabs">
						<?php if ($specials) { ?>
						<li class="active"><a href="#tab-special" data-toggle="tab">Скидки</a></li>
						<?php } ?>
						<li <?php if (!$specials) { ?> class="active"<?php } ?>><a href="#tab-popular" data-toggle="tab">Хиты продаж</a></li>
						<li><a href="#tab-new" data-toggle="tab">Новинки</a></li>
						<li><a href="#tab-review" data-toggle="tab">Последнии отзывы</a></li>
					</ul>
					<div class="tab-content">
						<?php if ($specials) { ?>
						<div class="tab-pane active" id="tab-special">
							
								<div class="owl-carousel">
									<?php foreach ($specials as $product) { ?>
										<div class="item">
											<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
										</div>
									<?php } ?>
								</div>
								<script type="text/javascript"><!--
								$('#tab-special .owl-carousel').owlCarousel({
									items: 3,
									//autoPlay: 3000,
									autoplayHoverPause: true,
									navigation: true,
									navigationText: ['<i class="ic ic-left"></i>', '<i class="ic ic-right"></i>'],
									pagination: false
								});
								--></script>
							
						</div>
						<?php } ?>
						<div class="tab-pane<?php if (!$specials) { ?> active<?php } ?>" id="tab-popular">
							<?php if ($populars) { ?>
								<div class="owl-carousel">
									<?php foreach ($populars as $product) { ?>
										<div class="item">
											<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
										</div>
									<?php } ?>
								</div>
								<script type="text/javascript"><!--
								$('#tab-popular .owl-carousel').owlCarousel({
									items: 3,
									//autoPlay: 3000,
									autoplayHoverPause: true,
									navigation: true,
									navigationText: ['<i class="ic ic-left"></i>', '<i class="ic ic-right"></i>'],
									pagination: false
								});
								--></script>
							<?php } ?>
						</div>
						<div class="tab-pane" id="tab-new">
							<?php if ($new) { ?>
								<div class="owl-carousel">
									<?php foreach ($new as $product) { ?>
										<div class="item">
											<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
										</div>
									<?php } ?>
								</div>
								<script type="text/javascript"><!--
								$('#tab-new .owl-carousel').owlCarousel({
									items: 3,
									//autoPlay: 3000,
									autoplayHoverPause: true,
									navigation: true,
									navigationText: ['<i class="ic ic-left"></i>', '<i class="ic ic-right"></i>'],
									pagination: false
								});
								--></script>
							<?php } ?>
						</div>
						<div class="tab-pane" id="tab-review">
							<?php if ($reviews) { ?>
								<div class="owl-carousel">
									<?php foreach ($reviews as $product) { ?>
										<div class="item">
											<?php include(DIR_TEMPLATE.'theme535/template/common/item.tpl'); ?>
										</div>
									<?php } ?>
								</div>
								<script type="text/javascript"><!--
								$('#tab-review .owl-carousel').owlCarousel({
									items: 3,
									//autoPlay: 3000,
									autoplayHoverPause: true,
									navigation: true,
									navigationText: ['<i class="ic ic-left"></i>', '<i class="ic ic-right"></i>'],
									pagination: false
								});
								--></script>
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
            <div class="clo-sm-12">
                <div class="upt_title">
                    <div class="utp_elem">
                        <span></span>
                    </div>
                    <h2 class="h1-size">Каталог продукции </h2>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 catal">
                            <div class="catalog parquetry">
                                <div class="image">
                                </div>
                                <div class="catalog_link">
                                    <a href="<?php echo $cat1; ?>">
                                        <h2>Паркет</h2>
                                        <span>
                                            Подробнее
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 catal">
                            <div class="catalog board">
                                <div class="image">
                                </div>
                                <div class="catalog_link">
                                    <a href="<?php echo $cat2; ?>">
                                        <h2>Террасна доска</h2>
                                        <span>
                                            Подробнее
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 catal">
                            <div class="catalog laminate">
                                <div class="image">
                                </div>
                                <div class="catalog_link">
                                    <a href="<?php echo $cat3; ?>">
                                        <h2>Ламинат</h2>
                                        <span>
                                            Подробнее
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 catal">

                            <div class="catalog accessories">
                                <div class="image">
                                </div>
                                <div class="catalog_link">
                                    <a href="<?php echo $cat4; ?>">
                                        <h2>Комплектующие</h2>
                                        <span>
                                            Подробнее
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="baner">
        <div class="container">
            <div class="row">
                <div class="upt_title">
                    <div class="utp_elem">
                        <span></span>
                    </div>
                    <h2 >Наши услуги</h2>
                </div>
                <div class="col-sm-4">
                    <h2 class="baner_title h1-size">
                        УКЛАДКА ПОКРЫТИЙ
                    </h2>
                    <div class="baner_text">
                        Укладка <span>"ПОД КЛЮЧ"</span> всех видов
                        паркетных и ламинированных напольных
                        покрытий, террасной доски.
                    </div>
                </div>
                <div class="col-sm-4">
                    <h2 class="baner_title h1-size">
                        Реставрация полов и террас
                    </h2>
                    <div class="baner_text">
                        Реставрация, реконструкция паркетных
                        полов и террас любой сложности.
                    </div>
                </div>
                <div class="col-sm-4">
                    <h2 class="baner_title h1-size">
                        Дизайн Разработка
                    </h2>
                    <div class="baner_text">
                        Разработка дизайн проектов
                        с учетом пожеланий Клиента.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="manufacturers">
                     <div id="carousel-mm" class="owl-carousel">
                            <?php foreach ($mms as $banner) { ?>
                                <div class="item text-center">
                                    <?php if ($banner['link']) { ?>
                                        <a href="<?php echo $banner['link']; ?>">
                                            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive"/>
                                        </a>
                                    <?php } else { ?>
                                      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"  class="img-responsive"/>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                    </div>

                    <script type="text/javascript">
                    $('#carousel-mm').owlCarousel({
                        items: 6,
                        autoPlay: 5000,
                        navigation: false,
                        navigationText: false,
                        pagination: false,
                        slideSpeed: 500,
                        itemsDesktopSmall: [1199, 5],
                        itemsTablet: [991,4],
                        itemsTabletSmall: [767,3],
                        itemsMobile: [479,2]
                    });
                    </script>

                </div>

                <?php echo $text; ?>
            </div>

        </div>
    </div>

<?php echo $footer; ?>

