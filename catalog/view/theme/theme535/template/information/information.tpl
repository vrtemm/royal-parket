<?php echo $header; ?>
<div class="breadcrumb-block">
<div id="breadcrumb" style="padding-left: 15px;"><ol class="breadcrumb container" itemscope itemtype="http://schema.org/BreadcrumbList">
<?php $i=0; ?>
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php $i++; ?>
	<li itemprop="itemListElement" itemscope
      itemtype="http://schema.org/ListItem"><a href="<?php echo $breadcrumb['href']; ?>"><span itemprop="name"><?php echo $breadcrumb['text']; ?></span></a><meta itemprop="position" content="<?php echo $i; ?>" /></li>
	<?php } ?>
</ol></div>

</div>
<?php echo $header_top; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 