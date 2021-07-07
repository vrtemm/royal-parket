<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php 
 /* NOC Ecommerce Tracking Code in success.tpl file */
 if(isset($order_tracker)){ 

        $tracking_info = '<script type="text/javascript">'.PHP_EOL;
        $tracking_info .= "ga('require', 'ecommerce', 'ecommerce.js');".PHP_EOL;

//ADD TOP LEVEL TRACKING INFO
        $tracking_info .= "ga('ecommerce:addTransaction', {
        id: '" . $order_tracker['order_id'] . "', 
        affiliation: '" . $order_tracker['store_name'] . "',
        revenue: " . $order_tracker['total'] . ", 
        shipping: " . $order_tracker['shipping'] . " , 
        tax: " . $order_tracker['tax'] . " 
        }); ".PHP_EOL;


//ADD INFO FOR EACH PRODUCT
        foreach($order_tracker['products'] as $product){
            $tracking_info .= "ga('ecommerce:addItem', {
            id: '" . $order_tracker['order_id'] . "',
            sku: '" . $product['model'] . "',
            name: '" . $product['name'] . "', 
            category: '', 
            price: " . $product['price'] . ", 
            quantity: " . $product['quantity'] ."
            });".PHP_EOL;
        }

    $tracking_info .= "ga('ecommerce:send');".PHP_EOL;


        $tracking_info .= '</script>'.PHP_EOL;

        echo $tracking_info;

    } 
?>


<?php echo $footer; ?>