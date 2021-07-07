<?php echo $header; ?>
<script type="text/javascript" src="/admin/view/javascript/megamenu/megamenu.js?v1"></script>
<link rel="stylesheet" href="/admin/view/stylesheet/megamenu.css?v1">
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-megamenu" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" id="form-megamenu" class="form-horizontal">
		
		 <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
			<li  class="show_elements show_elements_category"><a href="#tab-category_options" data-toggle="tab"><?php echo $tab_options; ?></a></li> 
			<li  class="show_elements show_elements_html"><a href="#tab-html_options" data-toggle="tab"><?php echo $tab_options; ?></a></li> 
			<li  class="show_elements show_elements_manufacturer"><a href="#tab-manufacturer_options" data-toggle="tab"><?php echo $tab_options; ?></a></li> 
			<li  class="show_elements show_elements_information"><a href="#tab-information_options" data-toggle="tab"><?php echo $tab_options; ?></a></li> 
			<li  class="show_elements show_elements_product"><a href="#tab-product_options" data-toggle="tab"><?php echo $tab_options; ?></a></li> 
			<li  class="show_elements show_elements_add_html"><a href="#tab-add_html" data-toggle="tab"><?php echo $tab_add_html; ?></a></li> 
            <li  class="show_elements show_elements_link"><a href="#tab-link_options" data-toggle="tab"><?php echo $tab_options; ?></a></li> 
			
            
			
          
          </ul>
		<div class="tab-content">
          <div class="tab-pane active in" id="tab-general">
          <ul class="nav nav-tabs" id="language">
			<?php foreach ($languages as $language) { ?>
			<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
			<?php } ?>
		  </ul>
		  <div class="tab-content">
			<?php foreach ($languages as $language) { ?>
			<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $text_title; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="megamenu[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($megamenu[$language['language_id']]) ? $megamenu[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $text_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
				</div>
			  </div>
		
			
			</div>
			<?php } ?>
		  </div>
		 
		   <div class="form-group">
			<label class="col-sm-2 control-label" for="input-link"><?php echo $text_link; ?></label>
			<div class="col-sm-10">
			  <input type="text" name="link" value="<?php echo isset($link) ? $link : ''; ?>" placeholder="<?php echo $text_link; ?>" id="input-link" class="form-control" />
			</div>
		  </div>
		 
		   <div class="form-group required">
			<label class="col-sm-2 control-label" for="input-menu_type"><?php echo $text_type; ?></label>
			<div class="col-sm-10">
			  <select name="menu_type" id="input-menu_type" class="form-control">
				<option value="0">-</option>
				<option value="category" <?if($menu_type=="category"){?> selected=selected <?}?>><?php echo $text_type_category; ?></option>
				<option value="html" <?if($menu_type=="html"){?> selected=selected <?}?>><?php echo $text_type_html; ?></option>
				<option value="manufacturer" <?if($menu_type=="manufacturer"){?> selected=selected <?}?>><?php echo $text_type_manufacturer; ?></option>
				<option value="information" <?if($menu_type=="information"){?> selected=selected <?}?>><?php echo $text_type_information; ?></option>
				<option value="product" <?if($menu_type=="product"){?> selected=selected <?}?>><?php echo $text_type_product; ?></option>
				<option value="auth" <?if($menu_type=="auth"){?> selected=selected <?}?>><?php echo $text_type_auth; ?></option>
                <option value="link" <?if($menu_type=="link"){?> selected=selected <?}?>><?php echo $text_type_link; ?></option>
				
		
			  </select>
			</div>
		  </div>
		  
		  
		  
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-status"><?php echo $text_status; ?></label>
			<div class="col-sm-10">
			  <select name="status" id="input-status" class="form-control">
				<?php if ($status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		  </div>
		  
		  
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-sort_order"><?php echo $text_sort_order; ?></label>
			<div class="col-sm-10">
		 <input type="text" name="sort_order" value="<?php echo isset($sort_order) ? $sort_order : '0'; ?>" placeholder="<?php echo $sort_order; ?>" id="input-sort_order" class="form-control" />
                    
			</div>
		  </div>
		  
		   <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $text_thumb; ?></label>
                <div class="col-sm-10">
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder_thumb; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo isset($thumb) ? $thumb : ''; ?>" id="input-image" />
                </div>
              </div> 
		  
		  
      </div>
	  
	    	  
	   <div class="tab-pane fade" id="tab-category_options">
		
			<div class="form-group required">
			<label class="col-sm-2 control-label" for="input-variant_category"><?php echo $text_variant_category; ?></label>
			<div class="col-sm-10">
			  <select name="variant_category" id="input-variant_category" class="form-control">
			  
				<option value="0">-</option>
				<option value="simple" <?if($variant_category=="simple"){?> selected=selected <?}?>><?php echo $variant_category_simple; ?></option>
				<option value="full" <?if($variant_category=="full"){?> selected=selected <?}?>><?php echo $variant_category_full; ?></option>
				<option value="full_image" <?if($variant_category=="full_image"){?> selected=selected <?}?>><?php echo $variant_category_full_image; ?></option>
				
		
			  </select>
			</div>
		  </div>
			<div class="form-group">
			<label class="col-sm-2 control-label" for="input-category_show_subcategory"><?php echo $text_category_show_subcategory; ?></label>
			<div class="col-sm-10">
			    <div class="checkbox">
                      <label>
                      <input type="checkbox" id="input-category_show_subcategory" name="category_show_subcategory" <?if($category_show_subcategory){?> checked=checked <?}?> value="1"/>
                        </label>
                    </div>
			</div>
		  </div>
		  
		
	<div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_category; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm">
				   <?
				   foreach($data['categories_list'] as $category){
				   ?>
				      <div class="checkbox">
                      <label>
                      <input type="checkbox" name="categories_list[]" <?if(isset($categories_list_selected[$category['category_id']])){?> checked=checked <?}?> value="<?=$category['category_id']?>"/> <?=$category['name']?> 
                        </label>
                    </div>
				    
				   <?
				   }
				   ?>
                 
                     </div>
                </div>
              </div>
	
		</div>
	  
	  
	  <div class="tab-pane fade" id="tab-html_options">
		
		    <ul class="nav nav-tabs" id="language_html">
			<?php foreach ($languages as $language) { ?>
			<li><a href="#language_html<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
			<?php } ?>
		  </ul>
		  <div class="tab-content">
			<?php foreach ($languages as $language) { ?>
			<div class="tab-pane" id="language_html<?php echo $language['language_id']; ?>">
			     <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-html_description<?php echo $language['language_id']; ?>"><?php echo $text_html_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="megamenu[<?php echo $language['language_id']; ?>][html]" placeholder="<?php echo $text_html_description; ?>" id="input-html_description<?php echo $language['language_id']; ?>"><?php echo isset($megamenu[$language['language_id']]['html']) ? $megamenu[$language['language_id']]['html'] : ''; ?></textarea>
                    </div>
                  </div>
		
			
			</div>
			<?php } ?>
		  </div>
		
			   
	
		</div>
        
        
        <div class="tab-pane fade" id="tab-link_options">
		
		  
		  <div class="tab-content">
          <div class="col-sm-2">
          <?php echo $text_link_options; ?>
		  </div>
		      	<div class="col-sm-10">
			    <div class="checkbox">
                      <label>
                      <input type="checkbox" id="input-use_target_blank" name="use_target_blank" <?if($use_target_blank){?> checked=checked <?}?> value="1"/>
                       </label>
                    </div>
			</div>
		  </div>
		
			   
	
		</div>
        
        
	  
		  <div class="tab-pane fade" id="tab-add_html">
		
			<div class="form-group">
			<label class="col-sm-2 control-label" for="input-use_add_html"><?php echo $text_add_html; ?></label>
			<div class="col-sm-10">
			    <div class="checkbox">
                      <label>
                      <input type="checkbox" id="input-use_add_html" name="use_add_html" <?if($use_add_html){?> checked=checked <?}?> value="1"/>
                       </label>
                    </div>
			</div>
		  </div>
		
		    <ul class="nav nav-tabs" id="language_add_html">
			<?php foreach ($languages as $language) { ?>
			<li><a href="#language_add_html<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
			<?php } ?>
		  </ul>
		  <div class="tab-content">
		  
			<?php foreach ($languages as $language) { ?>
			<div class="tab-pane" id="language_add_html<?php echo $language['language_id']; ?>">
			     <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-add_html_description<?php echo $language['language_id']; ?>"><?php echo $text_html_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="megamenu[<?php echo $language['language_id']; ?>][add_html]" placeholder="<?php echo $text_html_description; ?>" id="input-add_html_description<?php echo $language['language_id']; ?>"><?php echo isset($megamenu[$language['language_id']]['add_html']) ? $megamenu[$language['language_id']]['add_html'] : ''; ?></textarea>
                    </div>
                  </div>
		
			
			</div>
			<?php } ?>
		  </div>
		
			   
	
		</div>
	
	<div class="tab-pane fade" id="tab-manufacturer_options">
		
		
		
	<div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_manufacturer; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm">
				   <?
				   foreach($data['manufacturers_list'] as $manufacturer){
				   ?>
				      <div class="checkbox">
                      <label>
                      <input type="checkbox" name="manufacturers_list[]" <?if(isset($manufacturers_list_selected[$manufacturer['manufacturer_id']])){?> checked=checked <?}?> value="<?=$manufacturer['manufacturer_id']?>"/> <?=$manufacturer['name']?> 
                        </label>
                    </div>
				    
				   <?
				   }
				   ?>
                 
                     </div>
                </div>
              </div>
	
		</div>
		
			<div class="tab-pane fade" id="tab-information_options">
		
		
		
			<div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_information; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm">
				   <?
				   foreach($data['informations_list'] as $information){
				   ?>
				      <div class="checkbox">
                      <label>
                      <input type="checkbox" name="informations_list[]" <?if(isset($informations_list_selected[$information['information_id']])){?> checked=checked <?}?> value="<?=$information['information_id']?>"/> <?=$information['title']?> 
                        </label>
                    </div>
				    
				   <?
				   }
				   ?>
                 
                     </div>
                </div>
              </div>
	
		</div>
		
	
		<div class="tab-pane fade" id="tab-product_options">
		
		<div class="form-group">
                   <label class="col-sm-2 control-label" for="input-product_width"><?php echo $text_product_width; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="product_width" value="<?=isset($product_width)?$product_width:50?>" placeholder="<?php echo $text_product_width; ?>" id="input-product_width" class="form-control" />
                 
                </div>
        </div>
		
		<div class="form-group">
                   <label class="col-sm-2 control-label" for="input-product_height"><?php echo $text_product_height; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="product_height" value="<?=isset($product_height)?$product_height:50?>" placeholder="<?php echo $text_product_height; ?>" id="input-product_height" class="form-control" />
                 
                </div>
        </div>
		
	       <div class="form-group">
                <label class="col-sm-2 control-label" for="input-product"><?php echo $text_product; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="product" value="" placeholder="<?php echo $text_product; ?>" id="input-product" class="form-control" />
                  <div id="product-product" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($products_list_sel as $products_list) { ?>
                    <div id="product-item<?php echo $products_list['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $products_list['name']; ?>
                      <input type="hidden" name="products_list[]" value="<?php echo $products_list['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
             </div>
	
		</div>
		
		
	  
	    </div>
		
		  </form>
		  </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('#language a:first').tab('show');
$('#language_html a:first').tab('show');
$('#language_add_html a:first').tab('show');

<?php foreach ($languages as $language) { ?>
$('#input-html_description<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#input-add_html_description<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>

$('#input-product').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#input-product').val('');		
		$('#product-item' + item['value']).remove();		
		$('#product-product').append('<div id="product-item' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="products_list[]" value="' + item['value'] + '" /></div>');	
	}
});
$('#product-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});




</script>
<?php echo $footer; ?>