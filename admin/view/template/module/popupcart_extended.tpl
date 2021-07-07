<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a onclick="$('#form input[name=apply]').val(1); $('#form').submit();" data-toggle="tooltip" class="btn btn-primary"><?php echo $button_apply; ?></a>
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
<div class="container-fluid">
<?php if ($success) { ?><div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div><?php } ?>
<div class="panel panel-default"> 
<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i> Настройки модуля</h3></div>
  <div class="tab-pane">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<table id="module" class="list">
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_addtocart_logic; ?></td>
	<td style="padding:10px;">
	<input type="checkbox" name="popupcart_extended_module_addtocart_logic" value="1" <?php if ($popupcart_extended_module_addtocart_logic) { echo 'checked="checked"'; } ?> />
	&nbsp; Если не отмечено, то просто будет меняться надпись на кнопке
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_click_on_cart; ?></td>
	<td style="padding:10px;">
	<input type="checkbox" name="popupcart_extended_module_click_on_cart" value="1" <?php if ($popupcart_extended_module_click_on_cart) { echo 'checked="checked"'; } ?> />
	&nbsp; Если не отмечено, то просто будет стандартный блок корзины
	</td>
	</tr>
	<tr>
		<td style="width:250px; padding:10px;"><?php echo $text_related_show; ?></td>
		<td style="padding:10px;"><input type="checkbox" name="popupcart_extended_module_related_show" value="1" <?php if ($popupcart_extended_module_related_show) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_related_heading; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_related_heading[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_related_heading[$language['language_id']])) { echo $popupcart_extended_module_related_heading[$language['language_id']]; } else { echo $entry_related_heading; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>
	</td>
	</tr>
	<tr>
		<td style="width:250px; padding:10px;"><?php echo $text_related_product; ?></td>
		<td style="padding:10px;">
			<input type="radio" id="rel_product0" name="popupcart_extended_module_related_product" value="0" <?php if (!$popupcart_extended_module_related_product) { echo 'checked="checked"'; } ?> /><label for="logic0"><?php echo $text_popupcart_extended_module_related_product0; ?></label><br />
			<input type="radio" id="rel_product1" name="popupcart_extended_module_related_product" value="1" <?php if ($popupcart_extended_module_related_product) { echo 'checked="checked"'; } ?> /><label for="logic1"><?php echo $text_popupcart_extended_module_related_product1; ?></label><br />
			<input type="radio" id="rel_product2" name="popupcart_extended_module_related_product" value="2" <?php if ($popupcart_extended_module_related_product == 2) { echo 'checked="checked"'; } ?> /><label for="logic2"><?php echo $text_popupcart_extended_module_related_product2; ?></label>
		</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_head; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_head[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_head[$language['language_id']])) { echo $popupcart_extended_module_head[$language['language_id']]; } else { echo $entry_head; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>		
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_shopping_show; ?></td>
	<td style="padding:10px;">
	<input type="checkbox"  name="popupcart_extended_module_button_shopping_show" value="1" <?php if ($popupcart_extended_module_button_shopping_show) { echo 'checked="checked"'; } ?> />
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_shopping; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_button_shopping[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_button_shopping[$language['language_id']])) { echo $popupcart_extended_module_button_shopping[$language['language_id']]; } else { echo $entry_button_name_shopping; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>		
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_cart_show; ?></td>
	<td style="padding:10px;">
	<input type="checkbox"  name="popupcart_extended_module_button_cart_show" value="1" <?php if ($popupcart_extended_module_button_cart_show) { echo 'checked="checked"'; } ?> />
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_cart; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_button_cart[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_button_cart[$language['language_id']])) { echo $popupcart_extended_module_button_cart[$language['language_id']]; } else { echo $entry_button_name_cart; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>		
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_checkout; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_button_checkout[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_button_checkout[$language['language_id']])) { echo $popupcart_extended_module_button_checkout[$language['language_id']]; } else { echo $entry_button_name_checkout; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>		
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_manufacturer_show; ?></td>
	<td style="padding:10px;">
	<input type="checkbox"  name="popupcart_extended_module_manufacturer_show" value="1" <?php if ($popupcart_extended_module_manufacturer_show) { echo 'checked="checked"'; } ?> />
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_incart_logic; ?></td>
	<td style="padding:10px;">
	<input type="radio" id="logic0" name="popupcart_extended_module_button_incart_logic" value="0" <?php if (!$popupcart_extended_module_button_incart_logic) { echo 'checked="checked"'; } ?> /><label for="logic0"><?php echo $text_button_name_incart_logic_label0; ?></label><br />
	<input type="radio" id="logic1" name="popupcart_extended_module_button_incart_logic" value="1" <?php if ($popupcart_extended_module_button_incart_logic) { echo 'checked="checked"'; } ?> /><label for="logic1"><?php echo $text_button_name_incart_logic_label1; ?></label>
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_incart; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_button_incart[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_button_incart[$language['language_id']])) { echo $popupcart_extended_module_button_incart[$language['language_id']]; } else { echo $entry_button_name_incart; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>	
	</td>
	</tr>
	<tr>
	<td style="width:250px; padding:10px;"><?php echo $text_button_name_incart_with_options; ?></td>
	<td style="padding:10px;">
	<?php foreach ($languages as $language) { ?>
	<input type="text" size="40" name="popupcart_extended_module_button_incart_with_options[<?php echo $language['language_id']; ?>]" value="<?php if (isset($popupcart_extended_module_button_incart_with_options[$language['language_id']])) { echo $popupcart_extended_module_button_incart_with_options[$language['language_id']]; } else { echo $entry_button_name_incart_with_options; } ?>">
	<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />	
	<br />
	<?php } ?>		
	</td>
	</tr>
	<tr>
	<td colspan="2"><div id="copyright"><?php echo $text_copyright; ?></div></td>
	</tr>
	</table>
	<input type="hidden" name="popupcart_extended_module[0][layout_id]" value="<?php if($modules[0]['layout_id']) { echo $modules[0]['layout_id']; } else { echo '0'; } ?>" >
	<input type="hidden" name="popupcart_extended_module[0][position]" value="<?php if($modules[0]['position']) { echo $modules[0]['position']; } else { echo 'content_bottom'; } ?>" >
	<input type="hidden" name="popupcart_extended_module[0][status]" value="<?php if($modules[0]['status']) { echo $modules[0]['status']; } else { echo '1'; } ?>" >
	<input type="hidden" name="popupcart_extended_module[0][sort_order]" value="<?php if($modules[0]['sort_order']) { echo $modules[0]['sort_order']; } else { echo '99'; } ?>" >	
	<input type="hidden" name="apply" value="0" />
    </form>
	</div>
  </div>
  </div>
<style> 
	h1 {display:block !important;}
	#module {width:100%;}
	#module tr:nth-child(even) {background:#eee;border-top:solid 1px #ddd;border-bottom:solid 1px #ddd;}
	#module tr td:first-child{padding:10px; width:250px; border-right:solid 1px #ddd;}
	#module a{cursor:pointer;}
	#copyright {padding:15px;}
	.odd {background:#f4f4f4 !important;}
	.scrollbox {border:1px solid #CCCCCC; width: 350px; height: 150px; padding:4px 6px; margin-bottom:10px; background: #FFFFFF; overflow-y: scroll;}
  </style>
<?php echo $footer; ?>