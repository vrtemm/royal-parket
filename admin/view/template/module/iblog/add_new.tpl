<form method="post" enctype="multipart/form-data" id="PostForm">
<input type="hidden" name="store_id" value="<?php echo $store_id; ?>" />
<?php if (isset($post_id)) { ?>
<input type="hidden" name="post_id" id="post_id" value="<?php echo $post_id; ?>" />
<?php } ?>
<div class="container-fluid tabbable">
	<div class="tab-navigation form-inline">
        <ul id="langs" class="nav nav-tabs" role="tablist">
            <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
        </ul>	
	</div>
	<div class="tab-content">
      <?php foreach ($languages as $language) { ?>
      <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
            <div class="row">
              <div class="col-md-2">
                <h5><strong><span class="required">* </span><?php echo $entry_title; ?></strong></h5>

              </div>
              <div class="col-md-5">
                <input type="text" name="post_description[<?php echo $language['language_id']; ?>][title]" size="100" value="<?php echo isset($post_description[$language['language_id']]) ? $post_description[$language['language_id']]['title'] : ''; ?>" class="form-control" />
              </div>
            </div>
            <hr />
            <div class="row">
              <div class="col-md-2">
                <h5><strong><span class="required">* </span><?php echo $entry_excerpt; ?></strong></h5>

              </div>
              <div class="col-md-5">
                <textarea class="form-control" name="post_description[<?php echo $language['language_id']; ?>][excerpt]" id="excerpt<?php echo $language['language_id']; ?>"  cols="40" rows="5"><?php echo isset($post_description[$language['language_id']]) ? $post_description[$language['language_id']]['excerpt'] : ''; ?></textarea>
              </div>
            </div>
            <hr /> 
            <div class="row">
              <div class="col-md-2">
                <h5><strong><span class="required">* </span><?php echo $entry_body; ?></strong></h5>

              </div>
              <div class="col-md-10">
                <textarea name="post_description[<?php echo $language['language_id']; ?>][body]" id="body<?php echo $language['language_id']; ?>"><?php echo isset($post_description[$language['language_id']]) ? $post_description[$language['language_id']]['body'] : ''; ?></textarea>
              </div>
            </div>
            <hr /> 
            <div class="row">
              <div class="col-md-2">
                <h5><strong><?php echo $entry_meta_description; ?></strong></h5>

              </div>
              <div class="col-md-5">
                <textarea  class="form-control" name="post_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="4"><?php echo isset($post_description[$language['language_id']]) ? $post_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
              </div>
            </div>
            <hr /> 
            <div class="row">
              <div class="col-md-2">
                <h5><strong><?php echo $entry_meta_keyword; ?></strong></h5>
      
              </div>
              <div class="col-md-5">
                <textarea  class="form-control" name="post_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="4"><?php echo isset($post_description[$language['language_id']]) ? $post_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
              </div>
            </div>
      </div>
      <?php } ?>
  </div>
</div>
<hr />
<div class="container-fluid tabbable">
    <div class="row">
      <div class="col-md-2">
        <h5><strong><?php echo $entry_slug; ?></strong></h5>

      </div>
      <div class="col-md-5">
        <input type="text" class="form-control" name="slug" id="form-slug" value="<?php echo $slug; ?>" size="100" />
      </div>
    </div>
    <hr />
	<div class="row">
      <div class="col-md-2">
        <h5><strong><?php echo $entry_image; ?></strong></h5>

      </div>
      <div class="col-md-5">
      	<div>
            <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
            <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
        </div>
      </div>
    </div>
    <hr />
	<div class="row">
      <div class="col-md-2">
        <h5><strong><?php echo $entry_author; ?></strong></h5>

      </div>
      <div class="col-md-5">
        <select class="form-control" name="author_id">
          <?php foreach ($authors as $author) { ?>
          <?php if ($author['author_id'] == $author_id) { ?>
          <option value="<?php echo $author['author_id']; ?>" selected="selected"><?php echo $author['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $author['author_id']; ?>"><?php echo $author['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
   	  </div>
    </div>
    <hr />
	<div class="row">
      <div class="col-md-2">
        <h5><strong><?php echo $entry_date_published; ?></strong></h5>

      </div>
      <div class="col-md-5">
        <input type="text" name="date_published" iblog="form-datepublished" value="<?php echo $date_published; ?>" size="12" data-format="YYYY-MM-DD HH:mm" class="datetime form-control" />
	  </div>
	</div>
    <hr />
	<div class="row">
      <div class="col-md-2">
        <h5><strong><?php echo $entry_status; ?></strong></h5>

      </div>
      <div class="col-md-5">
        <select name="status" class="form-control">
          <?php if ($status) { ?>
          <option value="1" selected="selected"><?php echo $text_published; ?></option>
          <option value="0"><?php echo $text_draft; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo $text_published; ?></option>
          <option value="0" selected="selected"><?php echo $text_draft; ?></option>
          <?php } ?>
        </select>
	  </div>
	</div>
    <hr />
	<div class="row">
      <div class="col-md-2">
        <h5><strong><?php echo $entry_featured; ?></strong></h5>

      </div>
      <div class="col-md-5">
        <input type="checkbox" name="featured" value="1" <?php echo !empty($featured) ? 'checked="checked" ' : ''; ?>/>
	  </div>
	</div>
</div>
</form>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
	$('#body<?php echo $language['language_id']; ?>').summernote({
			height: 320
	});
<?php } ?>

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
$('#langs a:first').tab('show'); // Select first tab
$('#langs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
//--></script> 
