<?php echo $header; ?>
<div id="specz-main">
<div class="container">
<div class="headingc">
<h2 style="
    text-align: center;
    color: #ffd055;
    font-family: monospace;
    font-size: 42px;
    font-weight: bolder;
    padding: 35px;
"><?php echo $heading_title; ?></h2>

  </div>
</div>
</div>
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
      
      <?php if ($albums) { ?>
      <div class="row" style="
    display: none;
">
        <div class="col-md-4">
          
        </div>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row ">
        <div class="og-container">
          <?php foreach ($albums as $album) { ?>
          <div class="og-album <?php echo $apr; ?> col-xs-12" style="height:<?php echo $og_album_height; ?>px;">
            <div class="og-album-<?php echo $og_album_image_type; ?>-<?php echo $og_album_size; ?>">
                <a href="<?php echo $album['href']; ?>"><img src="<?php echo $album['thumb'] ?>" title="<?php echo $album['name'] ?>" alt="<?php echo $album['name'] ?>"/></a>
            </div>
            <p><a href="<?php echo $album['href']; ?>" style="font-family: <?php echo $title_font; ?> ; font-size: <?php echo $title_size; ?>px; <?php if($og_title_font_weight) { echo 'font-weight: bold;'; } ?>"><?php echo $album['name'] ?></a><br /><?php if($album['rating']) { ?><img src="catalog/view/theme/default/image/opencart_gallery/rating/stars-<?php echo $album['rating']; ?>.png" alt="<?php echo $album['reviews']; ?>" /><?php } ?></p>
            
          </div>
          <?php } ?>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$albums) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>