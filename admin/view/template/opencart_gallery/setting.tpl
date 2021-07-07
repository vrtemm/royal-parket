<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $opencart_gallery_manager; ?>" data-toggle="tooltip" title="Opencart Gallery Manager" class="btn btn-default"><i class="fa fa-cogs"></i> Opencart Gallery Manager</a>
        <button type="submit" form="form-gallery" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        </div>

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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-cogs"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-gallery" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#tab-album" data-toggle="tab">Album Setting</a></li>
            <li><a href="#tab-video" data-toggle="tab">Video Settings</a></li>
          </ul>
          <div class="tab-content">

            <div class="tab-pane active" id="tab-general">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-heading-title-font">Heading Title Font:</label>
                <div class="col-sm-10">
                  <select name="og_heading_title_font" id="input-heading-title-font" class="form-control">
                    <option value="27"<?php if($og_heading_title_font == 27) { echo ' selected="selected"'; } ?>>Arial</option>
                    <option value="28"<?php if($og_heading_title_font == 28) { echo ' selected="selected"'; } ?>>Times New Roman</option>
                    <option value="29"<?php if($og_heading_title_font == 29) { echo ' selected="selected"'; } ?>>Tahoma</option>
                    <option value="20"<?php if($og_heading_title_font == 30) { echo ' selected="selected"'; } ?>>Verdana</option>
                    <option value="1"<?php if($og_heading_title_font == 1) { echo ' selected="selected"'; } ?>>Open Sans</option>
                    <option value="2"<?php if($og_heading_title_font == 2) { echo ' selected="selected"'; } ?>>Josefin Slab</option>
                    <option value="3"<?php if($og_heading_title_font == 3) { echo ' selected="selected"'; } ?>>Arvo</option>
                    <option value="6"<?php if($og_heading_title_font == 6) { echo ' selected="selected"'; } ?>>Ubuntu</option>
                    <option value="7"<?php if($og_heading_title_font == 7) { echo ' selected="selected"'; } ?>>PT Sans</option>
                    <option value="8"<?php if($og_heading_title_font == 8) { echo ' selected="selected"'; } ?>>Old Standard TT</option>
                    <option value="9"<?php if($og_heading_title_font == 9) { echo ' selected="selected"'; } ?>>Droid Sans</option>
                    <option value="10"<?php if($og_heading_title_font == 10) { echo ' selected="selected"'; } ?>>Oswald</option>
                    <option value="11"<?php if($og_heading_title_font == 11) { echo ' selected="selected"'; } ?>>Lato</option>
                    <option value="12"<?php if($og_heading_title_font == 12) { echo ' selected="selected"'; } ?>>Lobster Two</option>
                    <option value="13"<?php if($og_heading_title_font == 13) { echo ' selected="selected"'; } ?>>Pacifico</option>
                    <option value="14"<?php if($og_heading_title_font == 14) { echo ' selected="selected"'; } ?>>Oleo Script</option>
                    <option value="21"<?php if($og_heading_title_font == 21) { echo ' selected="selected"'; } ?>>Montserrat</option>
                    <option value="24"<?php if($og_heading_title_font == 24) { echo ' selected="selected"'; } ?>>Inconsolata</option>
                    <option value="25"<?php if($og_heading_title_font == 25) { echo ' selected="selected"'; } ?>>Roboto</option>                
                    <option value="26"<?php if($og_heading_title_font == 26) { echo ' selected="selected"'; } ?>>Proxima Nova</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-heading-title-size">Heading Title Size:</label>
                <div class="col-sm-10">
                  <select name="og_heading_title_size" id="input-heading-title-size" class="form-control">
                    <option value="15"<?php if($og_heading_title_size == 15) { echo ' selected="selected"'; } ?>>15</option>
                    <option value="16"<?php if($og_heading_title_size == 16) { echo ' selected="selected"'; } ?>>16</option>
                    <option value="17"<?php if($og_heading_title_size == 17) { echo ' selected="selected"'; } ?>>17</option>
                    <option value="18"<?php if($og_heading_title_size == 18) { echo ' selected="selected"'; } ?>>18</option>
                    <option value="19"<?php if($og_heading_title_size == 19) { echo ' selected="selected"'; } ?>>19</option>
                    <option value="20"<?php if($og_heading_title_size == 20) { echo ' selected="selected"'; } ?>>20</option>
                    <option value="21"<?php if($og_heading_title_size == 21) { echo ' selected="selected"'; } ?>>21</option>
                    <option value="22"<?php if($og_heading_title_size == 22) { echo ' selected="selected"'; } ?>>22</option>
                    <option value="23"<?php if($og_heading_title_size == 23) { echo ' selected="selected"'; } ?>>23</option>
                    <option value="24"<?php if($og_heading_title_size == 24) { echo ' selected="selected"'; } ?>>24</option>
                    <option value="25"<?php if($og_heading_title_size == 25) { echo ' selected="selected"'; } ?>>25</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-heading-title-line">Heading Title Line:</label>
                <div class="col-sm-10">
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="1" <?php if($og_heading_title_line == 1) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/1.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="2" <?php if($og_heading_title_line == 2) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/2.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="3" <?php if($og_heading_title_line == 3) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/3.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="4" <?php if($og_heading_title_line == 4) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/4.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="5" <?php if($og_heading_title_line == 5) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/5.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="6" <?php if($og_heading_title_line == 6) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/6.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="7" <?php if($og_heading_title_line == 7) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/7.png') repeat-x; width:50px; height:20px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="8" <?php if($og_heading_title_line == 8) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/8.png') repeat-x; width:50px; height:20px; float:right; "></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="9" <?php if($og_heading_title_line == 9) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/9.png') repeat-x; width:50px; height:20px; float:right; "></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="10" <?php if($og_heading_title_line == 10) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/10.png') repeat-x; width:50px; height:20px; float:right; "></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_heading_title_line" value="11" <?php if($og_heading_title_line == 11) { echo 'checked="checked"'; } ?>/><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/line/11.png') repeat-x; width:50px; height:20px; float:right; "></div></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-video-title-font">Album/Video Title Font:</label>
                <div class="col-sm-10">
                  <select name="og_title_font" id="input-album-video-title-font" class="form-control">
                    <option value="27"<?php if($og_title_font == 27) { echo ' selected="selected"'; } ?>>Arial</option>
                    <option value="28"<?php if($og_title_font == 28) { echo ' selected="selected"'; } ?>>Times New Roman</option>
                    <option value="29"<?php if($og_title_font == 29) { echo ' selected="selected"'; } ?>>Tahoma</option>
                    <option value="20"<?php if($og_title_font == 30) { echo ' selected="selected"'; } ?>>Verdana</option>
                    <option value="1"<?php if($og_title_font == 1) { echo ' selected="selected"'; } ?>>Open Sans</option>
                    <option value="2"<?php if($og_title_font == 2) { echo ' selected="selected"'; } ?>>Josefin Slab</option>
                    <option value="3"<?php if($og_title_font == 3) { echo ' selected="selected"'; } ?>>Arvo</option>
                    <option value="6"<?php if($og_title_font == 6) { echo ' selected="selected"'; } ?>>Ubuntu</option>
                    <option value="7"<?php if($og_title_font == 7) { echo ' selected="selected"'; } ?>>PT Sans</option>
                    <option value="8"<?php if($og_title_font == 8) { echo ' selected="selected"'; } ?>>Old Standard TT</option>
                    <option value="9"<?php if($og_title_font == 9) { echo ' selected="selected"'; } ?>>Droid Sans</option>
                    <option value="10"<?php if($og_title_font == 10) { echo ' selected="selected"'; } ?>>Oswald</option>
                    <option value="11"<?php if($og_title_font == 11) { echo ' selected="selected"'; } ?>>Lato</option>
                    <option value="12"<?php if($og_title_font == 12) { echo ' selected="selected"'; } ?>>Lobster Two</option>
                    <option value="13"<?php if($og_title_font == 13) { echo ' selected="selected"'; } ?>>Pacifico</option>
                    <option value="14"<?php if($og_title_font == 14) { echo ' selected="selected"'; } ?>>Oleo Script</option>
                    <option value="21"<?php if($og_title_font == 21) { echo ' selected="selected"'; } ?>>Montserrat</option>
                    <option value="24"<?php if($og_title_font == 24) { echo ' selected="selected"'; } ?>>Inconsolata</option>
                    <option value="25"<?php if($og_title_font == 25) { echo ' selected="selected"'; } ?>>Roboto</option>                
                    <option value="26"<?php if($og_title_font == 26) { echo ' selected="selected"'; } ?>>Proxima Nova</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-video-title-size">Album/Video Title Size:</label>
                <div class="col-sm-10">
                  <select name="og_title_size" id="input-album-video-title-size" class="form-control">
                    <option value="10"<?php if($og_title_size == 10) { echo ' selected="selected"'; } ?>>10</option>
                    <option value="11"<?php if($og_title_size == 11) { echo ' selected="selected"'; } ?>>11</option>
                    <option value="12"<?php if($og_title_size == 12) { echo ' selected="selected"'; } ?>>12</option>
                    <option value="13"<?php if($og_title_size == 13) { echo ' selected="selected"'; } ?>>13</option>
                    <option value="14"<?php if($og_title_size == 14) { echo ' selected="selected"'; } ?>>14</option>
                    <option value="15"<?php if($og_title_size == 15) { echo ' selected="selected"'; } ?>>15</option>
                    <option value="16"<?php if($og_title_size == 16) { echo ' selected="selected"'; } ?>>16</option>
                    <option value="17"<?php if($og_title_size == 17) { echo ' selected="selected"'; } ?>>17</option>
                    <option value="18"<?php if($og_title_size == 18) { echo ' selected="selected"'; } ?>>18</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-video-title-font-weight">Album/Video Title Font Weight</label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if($og_title_font_weight) { ?>
                    <input type="radio" name="og_title_font_weight" value="1" checked="checked" /> Bold
                    <?php } else { ?>
                    <input type="radio" name="og_title_font_weight" value="1"/> Bold
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$og_title_font_weight) { ?>
                    <input type="radio" name="og_title_font_weight" value="0" checked="checked"/> Normal
                    <?php } else { ?>
                    <input type="radio" name="og_title_font_weight" value="0" /> Normal
                    <?php } ?>
                  </label>

                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-allow-review"><span data-toggle="tooltip" title="Enable/Disable new review entry and display of existing reviews">Allow Reviews:</span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if($og_allow_review) { ?>
                    <input type="radio" name="og_allow_review" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_allow_review" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$og_allow_review) { ?>
                    <input type="radio" name="og_allow_review" value="0" checked="checked"/>
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_allow_review" value="0"/>
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
            </div>

            <div class="tab-pane" id="tab-album">
              <fieldset>
              <legend>Album Listing Page:</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-per-row">Albums Per Row:</label>
                <div class="col-sm-10">
                  <select name="og_album_per_row" id="input-album-per-row" class="form-control">
                    <option value="1"<?php if($og_album_per_row == 1) { echo ' selected="selected"'; } ?>>1</option>
                    <option value="2"<?php if($og_album_per_row == 2) { echo ' selected="selected"'; } ?>>2</option>
                    <option value="3"<?php if($og_album_per_row == 3) { echo ' selected="selected"'; } ?>>3</option>
                    <option value="4"<?php if($og_album_per_row == 4) { echo ' selected="selected"'; } ?>>4</option>
                    <option value="6"<?php if($og_album_per_row == 6) { echo ' selected="selected"'; } ?>>6</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-size">Albums Size:</label>
                <div class="col-sm-10">
                  <select name="og_album_size" id="input-album-size" class="form-control">
                    <option value="1"<?php if($og_album_size == 1) { echo ' selected="selected"'; } ?>>Small</option>
                    <option value="2"<?php if($og_album_size == 2) { echo ' selected="selected"'; } ?>>Medium</option>
                    <option value="3"<?php if($og_album_size == 3) { echo ' selected="selected"'; } ?>>Large</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-height">Albums Height: (px)</label>
                <div class="col-sm-10">
                  <input type="text" name="og_album_height" id="input-album-height" class="form-control" value="<?php echo $og_album_height; ?>" size="4" /> 
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-default-album-per-page"><span data-toggle="tooltip" title="Determines how many albums are shown per page">Default Albums Per Page:</span></label>
                <div class="col-sm-10">
                  <input type="text" name="og_album_per_page" id="input-default-album-per-page" class="form-control" value="<?php echo $og_album_per_page; ?>" size="4" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-album-image-type">Album Image Type</label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if($og_album_image_type) { ?>
                    <input type="radio" name="og_album_image_type" value="1" checked="checked" /> <?php echo $text_square; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_album_image_type" value="1" /> <?php echo $text_square; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$og_album_image_type) { ?>
                    <input type="radio" name="og_album_image_type" value="0" checked="checked" /> <?php echo $text_rectangular; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_album_image_type" value="0" /> <?php echo $text_rectangular; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-display-rating">Display Rating:</label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if($og_album_display_rating) { ?>
                    <input type="radio" name="og_album_display_rating" value="1" checked="checked" /> <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_album_display_rating" value="1"/> <?php echo $text_yes; ?>

                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$og_album_display_rating) { ?>
                    <input type="radio" name="og_album_display_rating" value="0" checked="checked"/> <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_album_display_rating" value="0" /> <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              </fieldset>
              <fieldset>
              <legend>Album Page:</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image-popup-size">Image Popup Size: (px)</label>
                <div class="col-sm-10">
                  <div class="col-sm-6">
                      <input type="text" name="og_image_pu_width" id="input-image-popup-size" value="<?php echo $og_image_pu_width; ?>" size="3" class="form-control"/>
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="og_image_pu_height" value="<?php echo $og_image_pu_height; ?>" size="3" class="form-control"/> 
                  </div>
                </div>
              </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-video">
              <fieldset>
              <legend>Video Listing Page:</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-video-play-button">Video Play Button:</label>
                <div class="col-sm-10">
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="1" <?php if($og_video_btn == 1) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/1.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="2" <?php if($og_video_btn == 2) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/2.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="3" <?php if($og_video_btn == 3) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/3.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="4" <?php if($og_video_btn == 4) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/4.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="5" <?php if($og_video_btn == 5) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/5.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="6" <?php if($og_video_btn == 6) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/6.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="7" <?php if($og_video_btn == 7) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/7.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                  <div style="width:80px; float:left; margin-right:10px;"><input type="radio" name="og_video_btn" value="8" <?php if($og_video_btn == 8) { echo 'checked="checked"'; } ?> /><div style="background: url('../catalog/view/theme/default/image/opencart_gallery/play_button/8.png') repeat-x; width:50px; height:50px; float:right;"></div></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-video-per-row">Videos Per Row:</label>
                <div class="col-sm-10">
                  <select name="og_video_per_row" id="input-video-per-row" class="form-control">
                    <option value="2"<?php if($og_video_per_row == 2) { echo ' selected="selected"'; } ?>>2</option>
                    <option value="3"<?php if($og_video_per_row == 3) { echo ' selected="selected"'; } ?>>3</option>
                    <option value="4"<?php if($og_video_per_row == 4) { echo ' selected="selected"'; } ?>>4</option>
                    <option value="6"<?php if($og_video_per_row == 6) { echo ' selected="selected"'; } ?>>6</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-video-size">Videos Size:</label>
                <div class="col-sm-10">
                  <select name="og_video_list_size" id="input-video-size" class="form-control">
                    <option value="1"<?php if($og_video_list_size == 1) { echo ' selected="selected"'; } ?>>128 x 72</option>
                    <option value="2"<?php if($og_video_list_size == 2) { echo ' selected="selected"'; } ?>>160 x 90</option>
                    <option value="3"<?php if($og_video_list_size == 3) { echo ' selected="selected"'; } ?>>192 x 108</option>
                    <option value="4"<?php if($og_video_list_size == 4) { echo ' selected="selected"'; } ?>>224 x 126</option>
                    <option value="5"<?php if($og_video_list_size == 5) { echo ' selected="selected"'; } ?>>256 x 144</option>
                    <option value="6"<?php if($og_video_list_size == 6) { echo ' selected="selected"'; } ?>>288 x 162</option>
                    <option value="7"<?php if($og_video_list_size == 7) { echo ' selected="selected"'; } ?>>320 x 180</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-video-height">Videos Height: (px)</label>
                <div class="col-sm-10">
                  <input type="text" name="og_video_height" id="input-video-height" class="form-control" value="<?php echo $og_video_height; ?>" size="4" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-default-videos-per-page"><span data-toggle="tooltip" title="Determines how many videos are shown per page">Default Videos Per Page:</span></label>
                <div class="col-sm-10">
                  <input type="text" name="og_video_per_page" id="input-default-videos-per-page" value="<?php echo $og_video_per_page; ?>" size="4" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-display-rating">Display Rating:</label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if($og_video_display_rating) { ?>
                    <input type="radio" name="og_video_display_rating" value="1" checked="checked" /> <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_video_display_rating" value="1"/> <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$og_video_display_rating) { ?>
                    <input type="radio" name="og_video_display_rating" value="0" checked="checked"/> <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="og_video_display_rating" value="0" /> <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              </fieldset>
              <fieldset>
              <legend>Video Page:</legend>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-video-size">Videos Size:</label>
                <div class="col-sm-10">
                  <select name="og_video_size" id="input-video-size" class="form-control">
                    <option value="1"<?php if($og_video_size == 1) { echo ' selected="selected"'; } ?>>320 x 180</option>
                    <option value="2"<?php if($og_video_size == 2) { echo ' selected="selected"'; } ?>>432 x 243</option>
                    <option value="3"<?php if($og_video_size == 3) { echo ' selected="selected"'; } ?>>560 x 315</option>
                    <option value="4"<?php if($og_video_size == 4) { echo ' selected="selected"'; } ?>>640 x 360</option>
                    <option value="5"<?php if($og_video_size == 5) { echo ' selected="selected"'; } ?>>672 x 378</option>
                    <option value="6"<?php if($og_video_size == 6) { echo ' selected="selected"'; } ?>>752 x 423</option>
                    <option value="7"<?php if($og_video_size == 7) { echo ' selected="selected"'; } ?>>784 x 441</option>
                    <option value="8"<?php if($og_video_size == 8) { echo ' selected="selected"'; } ?>>896 x 504</option>
                  </select>
                </div>
              </div>
              </fieldset>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<?php echo $footer; ?>