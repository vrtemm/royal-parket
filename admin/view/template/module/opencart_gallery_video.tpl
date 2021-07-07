<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-opencart-gallery-video" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-opencart-gallery-video" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-video"><span data-toggle="tooltip" title="<?php echo $help_video; ?>"><?php echo $entry_video; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="video" value="" placeholder="<?php echo $entry_video; ?>" id="input-video" class="form-control" />
              <div id="featured-video" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($videos as $video) { ?>
                <div id="featured-video<?php echo $video['video']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $video['name']; ?>
                  <input type="hidden" value="<?php echo $video['video_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <input type="hidden" name="opencart_gallery_video_featured" value="<?php echo $featured_video; ?>" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="opencart_gallery_video_status" id="input-status" class="form-control">
                <?php if ($opencart_gallery_video_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>          
          <table id="module" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right">#</td>
                <td class="text-left"><?php echo $entry_limit; ?></td>
                <td class="text-left"><?php echo $entry_apr; ?></td>
                <td class="text-left"><?php echo $entry_vs; ?></td>
                <td class="left"><?php echo $entry_sort_by; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $module_row = 1; ?>
              <?php foreach ($opencart_gallery_video_modules as $opencart_gallery_video_module) { ?>
              <tr id="module-row<?php echo $opencart_gallery_video_module['key']; ?>">
                <td class="text-right"><?php echo $module_row; ?></td>
                <td class="text-left"><input type="text" name="opencart_gallery_video_module[<?php echo $opencart_gallery_video_module['key']; ?>][limit]" value="<?php echo $opencart_gallery_video_module['limit']; ?>" placeholder="<?php echo $entry_limit; ?>" class="form-control" /></td>
                <td class="text-left">
                  <select name="opencart_gallery_video_module[<?php echo $opencart_gallery_video_module['key']; ?>][apr]" class="form-control">
                    <option value="1" <?php if ($opencart_gallery_video_module['apr'] == 1) { ?>selected="selected"<?php } ?>>1</option>
                    <option value="2" <?php if ($opencart_gallery_video_module['apr'] == 2) { ?>selected="selected"<?php } ?>>2</option>
                    <option value="3" <?php if ($opencart_gallery_video_module['apr'] == 3) { ?>selected="selected"<?php } ?>>3</option>
                    <option value="4" <?php if ($opencart_gallery_video_module['apr'] == 4) { ?>selected="selected"<?php } ?>>4</option>
                    <option value="6" <?php if ($opencart_gallery_video_module['apr'] == 6) { ?>selected="selected"<?php } ?>>6</option>
                  </select>
                </td>
                <td>
                  <select name="opencart_gallery_video_module[<?php echo $opencart_gallery_video_module['key']; ?>][vs]" class="form-control">
                    <option value="1" <?php if ($opencart_gallery_video_module['as'] == 1) { ?>selected="selected"<?php } ?>>Small</option>
                    <option value="2" <?php if ($opencart_gallery_video_module['as'] == 2) { ?>selected="selected"<?php } ?>>Medium</option>
                    <option value="3" <?php if ($opencart_gallery_video_module['as'] == 3) { ?>selected="selected"<?php } ?>>Large</option>
                  </select>
                </td>
                <td class="left"><select name="opencart_gallery_video_module[<?php echo $opencart_gallery_video_module['key']; ?>][sb]" class="form-control">
                  <option value="1" <?php if ($opencart_gallery_video_module['sb'] == 1) { ?>selected="selected"<?php } ?>>Latest</option>
                  <option value="2" <?php if ($opencart_gallery_video_module['sb'] == 2) { ?>selected="selected"<?php } ?>>Viewed</option>
                  <option value="3" <?php if ($opencart_gallery_video_module['sb'] == 3) { ?>selected="selected"<?php } ?>>Rating</option>
                  <option value="4" <?php if ($opencart_gallery_video_module['sb'] == 4) { ?>selected="selected"<?php } ?>>Sort Order</option>
                  <option value="5" <?php if ($opencart_gallery_video_module['sb'] == 5) { ?>selected="selected"<?php } ?>>Name</option>
                  <option value="6" <?php if ($opencart_gallery_video_module['sb'] == 6) { ?>selected="selected"<?php } ?>>Featured</option>
                </select></td> 
                <td class="text-left"><button type="button" onclick="$('#module-row<?php echo $opencart_gallery_video_module['key']; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
              </tr>
              <?php $module_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="5"></td>
                <td class="text-left"><button type="button" onclick="addModule();" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('input[name=\'video\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=opencart_gallery/video/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',     
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['video_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('#featured-video' + item['value']).remove();
    
    $('#featured-video').append('<div id="featured-video' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" value="' + item['value'] + '" /></div>'); 
  
    data = $.map($('#featured-video input'), function(element) {
      return $(element).attr('value');
    });
            
    $('input[name=\'opencart_gallery_video_featured\']').attr('value', data.join()); 
  } 
});

$('#featured-video').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();

  data = $.map($('#featured-video input'), function(element) {
    return $(element).attr('value');
  });
          
  $('input[name=\'opencart_gallery_video_featured\']').attr('value', data.join()); 
});
//--></script> 
  <script type="text/javascript"><!--
function addModule() {  
  var token = Math.random().toString(36).substr(2);
  
  html  = '<tr id="module-row' + token + '">';
  html += '  <td class="text-right">' + ($('tbody tr').length + 1) + '</td>';
  html += '  <td class="text-left"><input type="text" name="opencart_gallery_video_module[' + token + '][limit]" value="5" placeholder="<?php echo $entry_limit; ?>" class="form-control" /></td>';
  html += '  <td class="text-left">';
  html += '  <select name="opencart_gallery_video_module[' + token + '][apr]" class="form-control">';
  html += '  <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="6">6</option>';
  html += '  </select></td>';
  html += '  <td class="text-left">';
  html += '  <select name="opencart_gallery_video_module[' + token + '][vs]" class="form-control">';
  html += '  <option value="1" >Small</option><option value="2" >Medium</option><option value="3" >Large</option>';
  html += '  </select></td>';
  html += '  <td class="text-left">';
  html += '  <select name="opencart_gallery_video_module[' + token + '][sb]" class="form-control">';
  html += '  <option value="1" >Latest</option><option value="2" >Viewed</option><option value="3" >Rating</option><option value="4" >Sort Order</option><option value="5" >Name</option><option value="6" >Featured</option>';
  html += '  </select></td>';
  html += '  <td class="text-left"><button type="button" onclick="$(\'#module-row' + token + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';
  
  $('#module tbody').append(html);
}
//--></script></div>
<?php echo $footer; ?>