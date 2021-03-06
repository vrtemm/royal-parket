<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-manufacturer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
  
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_ocmod_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-modification" class="form-horizontal">
        
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_author; ?></label>
            <div class="col-sm-10">
              <input type="text" name="author" value="<?php echo $author; ?>" placeholder="<?php echo $entry_author; ?>" id="input-author" class="form-control" />
              <?php if ($error_author) { ?>
              <div class="text-danger"><?php echo $error_author; ?></div>
              <?php } ?>
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-version"><?php echo $entry_version; ?></label>
            <div class="col-sm-10">
              <input type="text" name="version" value="<?php echo $version; ?>" placeholder="<?php echo $entry_version; ?>" id="input-version" class="form-control" />
              <?php if ($error_version) { ?>
              <div class="text-danger"><?php echo $error_version; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-link"><span data-toggle="tooltip" title="<?php echo $entry_link; ?>"><?php echo $entry_link; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="link" value="<?php echo $link; ?>" placeholder="<?php echo $entry_link; ?>" id="input-link" class="form-control" />
            </div>
          </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_status_enabled; ?></option>
                    <option value="0"><?php echo $text_status_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_status_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_status_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

            <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?></label>
                    <div class="col-sm-10">
                      <textarea name="code" placeholder="<?php echo $entry_code; ?>" id="input-code"><?php echo $code; ?></textarea>
                    </div>
            </div>
          
        </form>
      </div>
    </div>
  </div>
</div>

  <script type="text/javascript"><!--
    var editor = CodeMirror.fromTextArea(document.getElementById("input-code"), {
      lineNumbers: true,
      mode: "htmlmixed",
      matchBrackets: true
    });
//--></script> 

<?php echo $footer; ?>