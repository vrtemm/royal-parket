<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title"><a href="#collapse-shipping" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $heading_title; ?> <i class="fa fa-caret-down"></i></a></h4>
  </div>
  <div id="collapse-shipping" class="panel-collapse collapse">
    <div class="panel-body">
      <p><?php echo $text_shipping; ?></p>
      <form class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
          <div class="col-sm-10">
            <select name="country_id" id="input-country" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
          <div class="col-sm-10">
            <select name="zone_id" id="input-zone" class="form-control">
            </select>
          </div>
        </div>
        <div class="form-group required">
          
          <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
          <div class="col-sm-10">
            
            <select name="city" id="input-city" class="form-control">
            </select>
          </div>
        </div>
        <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
      </form>
      <script type="text/javascript"><!--
$('#button-quote').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping/quote',
		type: 'post',
				data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&city=' + $('select[name=\'city\']').val(),
		dataType: 'json',
		beforeSend: function() {
			$('#button-quote').button('loading');
		},
		complete: function() {
			$('#button-quote').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['error']) {
				if (json['error']['warning']) {
					$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}

				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<div class="text-danger">' + json['error']['country'] + '</div>');
				}

				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<div class="text-danger">' + json['error']['zone'] + '</div>');
				}

				if (json['error']['city']) {
					$('select[name=\'city\']').after('<div class="text-danger">' + json['error']['city'] + '</div>');
				}
			}

			if (json['shipping_method']) {
				$('#modal-shipping').remove();

				html  = '<div id="modal-shipping" class="modal">';
				html += '  <div class="modal-dialog">';
				html += '    <div class="modal-content">';
				html += '      <div class="modal-header">';
				html += '        <h4 class="modal-title"><?php echo $text_shipping_method; ?></h4>';
				html += '      </div>';
				html += '      <div class="modal-body">';

				for (i in json['shipping_method']) {
					html += '<p><strong>' + json['shipping_method'][i]['title'] + '</strong></p>';

					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<div class="radio">';
							html += '  <label>';

							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" />';
							} else {
								html += '<input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" />';
							}

							html += json['shipping_method'][i]['quote'][j]['title'] + ' - ' + json['shipping_method'][i]['quote'][j]['text'] + '</label></div>';
						}
					} else {
						html += '<div class="alert alert-danger">' + json['shipping_method'][i]['error'] + '</div>';
					}
				}

				html += '      </div>';
				html += '      <div class="modal-footer">';
				html += '        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>';

				<?php if ($shipping_method) { ?>
				html += '        <input type="button" value="<?php echo $button_shipping; ?>" id="button-shipping" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />';
				<?php } else { ?>
				html += '        <input type="button" value="<?php echo $button_shipping; ?>" id="button-shipping" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" disabled="disabled" />';
				<?php } ?>

				html += '      </div>';
				html += '    </div>';
				html += '  </div>';
				html += '</div> ';

				$('body').append(html);

				$('#modal-shipping').modal('show');

				$('input[name=\'shipping_method\']').iCheck({ checkboxClass: 'icheckbox_flat', radioClass: 'iradio_flat', cursor: true });
                $('div.radio label').click(function() {
					$('#button-shipping').prop('disabled', false);
				});
			}
		}
	});
});

$(document).delegate('#button-shipping', 'click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping/shipping',
		type: 'post',
		data: 'shipping_method=' + encodeURIComponent($('input[name=\'shipping_method\']:checked').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping').button('loading');
		},
		complete: function() {
			$('#button-shipping').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
      $('.fa-spin').remove();

			
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);

            $('select[name=\'city\']').html('<option value=""><?php echo $text_select; ?></option>');
            $('select[name=\'zone_id\']').trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>

<script type="text/javascript"><!--
$('select[name=\'zone_id\']').on('change', function() {
    if (this.value == '') return;
    $.ajax({
        url: 'index.php?route=checkout/shipping/zone&zone_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
            $('select[name=\'zone_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
        },
        complete: function() {
            $('.fa-spin').remove();
        },
        success: function(json) {
            $('.fa-spin').remove();

            html = '<option value=""><?php echo $text_select; ?></option>';

            if (json['city'] != '') {
                for (i = 0; i < json['city'].length; i++) {
                    html += '<option value="' + json['city'][i]['name'] + '"';

                    if (json['city'][i]['name'] == '<?php echo $city; ?>') {
                        html += ' selected="selected"';
                    }

                    html += '>' + json['city'][i]['name'] + '</option>';
                }
            }

            $('select[name=\'city\']').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'zone_id\']').trigger('change');
//--></script>
			
    </div>
  </div>
</div>