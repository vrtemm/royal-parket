<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-puzzle-piece"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form class="form-horizontal">
<?php /* //karapuz (no_ftp.ocmod.xml)  */?>
					<div class="form-group">
            <label class="col-sm-2 control-label" for="input-upload_without_ftp"><span data-toggle="tooltip" title="<?php echo $help_upload_without_ftp; ?>"><?php echo $text_upload_without_ftp; ?></span></label>
            <div class="col-sm-10">
              <div class="checkbox">
                <label>
                  <?php if ($upload_without_ftp) { ?>
                  <input type="checkbox" name="upload_without_ftp" value="1" checked="checked" id="input-upload_without_ftp" />
                  <?php } else { ?>
                  <input type="checkbox" name="upload_without_ftp" value="1" id="input-upload_without_ftp" />
                  <?php } ?>
                  &nbsp; </label>
              </div>
            </div>
          </div>
<?php /* ///karapuz (no_ftp.ocmod.xml)  */?>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="button-upload"><span data-toggle="tooltip" title="<?php echo $help_upload; ?>"><?php echo $entry_upload; ?></span></label>
            <div class="col-sm-10">
              <button type="button" id="button-upload" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <?php if ($error_warning) { ?>
              <button type="button" id="button-clear" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></button>
              <?php } else { ?>
              <button type="button" id="button-clear" data-loading-text="<?php echo $text_loading; ?>" disabled="disabled" class="btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></button>

      <a href="<?php echo $refresh; ?>" data-toggle="tooltip" title="<?php echo $button_refresh; ?>" class="btn btn-info"><i class="fa fa-refresh"></i></a>
            
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_progress; ?></label>
            <div class="col-sm-10">
              <div class="progress">
                <div id="progress-bar" class="progress-bar" style="width: 0%;"></div>
              </div>
              <div id="progress-text"></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_overwrite; ?></label>
            <div class="col-sm-10">
              <textarea rows="10" readonly="readonly" id="overwrite" class="form-control"></textarea>
              <br />
              <button type="button" id="button-continue" class="btn btn-primary" disabled="disabled"><i class="fa fa-check"></i> <?php echo $button_continue; ?></button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
var step = new Array();
var total = 0;

$('#button-upload').on('click', function() {
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

<?php /* //karapuz (no_ftp.ocmod.xml)  */?>
	if (typeof(timer) != 'undefined' && timer) {
		clearInterval(timer);	
	}
<?php /* ///karapuz (no_ftp.ocmod.xml)  */?>
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);	
			
			// Reset everything
			$('.alert').remove();
			$('#progress-bar').css('width', '0%');
			$('#progress-bar').removeClass('progress-bar-danger progress-bar-success');		
			$('#progress-text').html('');
		
			$.ajax({
				url: 'index.php?route=extension/installer/upload&token=<?php echo $token; ?>',
				type: 'post',		
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,		
				beforeSend: function() {
					$('#button-upload').button('loading');
				},
				complete: function() {
					$('#button-upload').button('reset');
				},
				success: function(json) {
					if (json['error']) {
						$('#progress-bar').addClass('progress-bar-danger');				
						$('#progress-text').html('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['step']) {
						step = json['step'];
						total = step.length;
						
						if (json['overwrite'].length) {
							html = '';
							
							for (i = 0; i < json['overwrite'].length; i++) {
								html += json['overwrite'][i] + "\n";
							}
							
							$('#overwrite').html(html);
							
							$('#button-continue').prop('disabled', false);
						} else {
							next();
						}	
					}
				},			
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});	
		}
	}, 500);
});

$('#button-continue').on('click', function() {
	next();
	
	$('#button-continue').prop('disabled', true);
});

function next() {
<?php /* //karapuz (no_ftp.ocmod.xml)  */?>
		var custom_params = '';
		if ($('#input-upload_without_ftp').prop('checked')) {
			custom_params = '&upload_without_ftp=1';
		}
<?php /* ///karapuz (no_ftp.ocmod.xml)  */?>
	data = step.shift();
	
	if (data) {
		$('#progress-bar').css('width', (100 - (step.length / total) * 100) + '%');
		$('#progress-text').html('<span class="text-info">' + data['text'] + '</span>');
		
		$.ajax({
			url: data.url,
			type: 'post',		
			dataType: 'json',
			data: 'path=' + data.path + custom_params,
			success: function(json) {
				if (json['error']) {
					$('#progress-bar').addClass('progress-bar-danger');
					$('#progress-text').html('<div class="text-danger">' + json['error'] + '</div>');
					$('#button-clear').prop('disabled', false);
				} 
				
				if (json['success']) {
					$('#progress-bar').addClass('progress-bar-success');
					$('#progress-text').html('<span class="text-success">' + json['success'] + '</span>');
				}
									
				if (!json['error'] && !json['success']) {
					next();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

$('#button-clear').bind('click', function() {
	$.ajax({
		url: 'index.php?route=extension/installer/clear&token=<?php echo $token; ?>',	
		dataType: 'json',
		beforeSend: function() {
			$('#button-clear').button('loading');
		},	
		complete: function() {
			$('#button-clear').button('reset');
		},		
		success: function(json) {
			$('.alert').remove();
				
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			} 
		
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#button-clear').prop('disabled', true);
			}
		},			
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
//--></script></div>
<?php echo $footer; ?>