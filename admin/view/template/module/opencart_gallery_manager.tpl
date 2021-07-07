<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        

        <a href="<?php echo $setting; ?>" data-toggle="tooltip" title="<?php echo $button_setting; ?>" class="btn btn-default" class="button"><i class="fa fa-cogs"></i> <?php echo $button_setting; ?></a>
        <a href="<?php echo $album_manager; ?>" data-toggle="tooltip" title="<?php echo $button_album_manager; ?>" class="btn btn-default"><i class="fa fa-image"></i> <?php echo $button_album_manager; ?></a>
        <a href="<?php echo $album_review; ?>" data-toggle="tooltip" title="<?php echo $button_album_review; ?>" class="btn btn-default"><i class="fa fa-comments"></i> <?php echo $button_album_review; ?></a>
        <a href="<?php echo $video_manager; ?>" data-toggle="tooltip" title="<?php echo $button_video_manager; ?>" class="btn btn-default"><i class="fa fa-video-camera"></i> <?php echo $button_video_manager; ?></a>
        <a href="<?php echo $video_review; ?>" data-toggle="tooltip" title="<?php echo $button_video_manager; ?>" class="btn btn-default"><i class="fa fa-comments"></i> <?php echo $button_video_review; ?></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $text_back; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $text_back; ?></a>

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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">

      
        <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-dashboard"></i> Overview</h3>
          </div>
          <div class="table-responsive">
            <table class="table">
              <tbody>
                <tr>
                  <td>Image:</td>
                  <td><a href="<?php echo $image_manager; ?>"><?php echo $total_image; ?></a></td>
                </tr>
                <tr>
                  <td>Album:</td>
                  <td><a href="<?php echo $album_manager; ?>"><?php echo $total_album; ?></a></td>
                </tr>
                <tr>
                  <td>Video:</td>
                  <td><a href="<?php echo $video_manager; ?>"><?php echo $total_video; ?></a></td>
                </tr>
                <tr>
                  <td>Album Reviews:</td>
                  <td><a href="<?php echo $album_review; ?>"><?php echo $total_album_review; ?></a></td>
                </tr>
                <tr>
                  <td>Album Reviews Awaiting Approval:</td>
                  <td><a href="<?php echo $album_review; ?>"><?php echo $album_review_awating; ?></a></td>
                </tr> 
                <tr>
                  <td>Video Reviews:</td>
                  <td><a href="<?php echo $video_review; ?>"><?php echo $total_video_review; ?></a></td>
                </tr>
                <tr>
                  <td>Video Reviews Awaiting Approval:</td>
                  <td><a href="<?php echo $video_review; ?>"><?php echo $video_review_awating; ?></a></td>
                </tr> 
              </tbody>
            </table>
          </div>
        </div>

        <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-image"></i> Top Albums</h3>
          </div>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <td>Album Name</td>
                  <td>Viewed</td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($albums as $album) { ?>
                <tr>
                <td style="height:23px;"><a href="<?php echo $album['href']; ?>"><?php echo $album['name'] ?></a></td>
                <td><?php echo $album['viewed']; ?></td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </div>

        <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-video-camera"></i> Top Videos</h3>
          </div>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <td>Video Name</td>
                  <td>Viewed</td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($videos as $video) { ?>
                <tr>
                <td style="height:23px;"><a href="<?php echo $album['href']; ?>"><?php echo $video['name'] ?></a></td>
                <td><?php echo $video['viewed']; ?></td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>