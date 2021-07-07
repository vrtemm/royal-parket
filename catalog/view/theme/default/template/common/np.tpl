<?php if($success) { ?>
<div class="flex-np-result">
	<div class="f-np-logo"><img alt="Новая почта" src="catalog/view/theme/theme535/image/novapochta.svg" class="np-logo"></div>
	<div class="f-np-cost">Стоимость доставки: <span><?php echo $cost; ?> грн</span></div>
</div>
<?php } else { ?>
	<div class="np-error">
		Что то пошло не так... Попробуйте позже
	</div>
<?php } ?>