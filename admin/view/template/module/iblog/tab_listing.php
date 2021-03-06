<div class="container-fluid" id="panel_positions">
    <div class="row">
      <div class="col-xs-3">
        <h5><strong>Ссылка на блог:</strong></h5>
      </div>
      <div class="col-xs-9" style="margin-top: 8px;">
        <a href="<?php echo HTTP_CATALOG."index.php?route=module/iblog/listing"; ?>" target="_blank"><?php echo HTTP_CATALOG."index.php?route=module/iblog/listing"; ?></a>
      </div>
    </div>
	<hr />
    <div class="row">
      <div class="col-xs-3">
        <h5><strong>Добавить ссылку в меню:</strong></h5>
      </div>
      <div class="col-xs-3">
        <select id="LinkChecker" name="<?php echo $moduleName; ?>[MainLinkEnabled]" class="form-control">
            <option value="yes" <?php echo (!empty($moduleData['MainLinkEnabled']) && $moduleData['MainLinkEnabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
            <option value="no"  <?php echo (empty($moduleData['MainLinkEnabled']) || $moduleData['MainLinkEnabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
        </select>
      </div>
    </div>
	<div id="MainLinkOptions">
	 <hr />
     <div class="row">
      <div class="col-xs-3">
        <h5><strong>Название пункта меню:</strong></h5>
      </div>
      <div class="col-xs-3">
		<?php foreach ($languages as $language) { ?>
       		<div class="input-group">
          		<span class="input-group-addon"><?php echo $language['name']; ?>:</span>
          		<input type="text" class="form-control" name="<?php echo $moduleName; ?>[LinkTitle][<?php echo $language['language_id']; ?>]" value="<?php if(isset($moduleData['LinkTitle'][$language['language_id']])) { echo $moduleData['LinkTitle'][$language['language_id']]; } else { echo "iBlog"; }?>" />
        	</div>
            <br />
		<?php } ?>
	  </div>
     </div>
	 <hr />
     <div class="row">
      <div class="col-xs-3">
        <h5><strong>Позиция в меню:</strong></h5>

      </div>
		<div class="col-xs-3">
			<input type="number" class="form-control" name="<?php echo $moduleName; ?>[LinkSortOrder]" value="<?php if(isset($moduleData['LinkSortOrder'])) { echo $moduleData['LinkSortOrder']; } else { echo "7"; }?>" />
		</div>
     </div>
    </div>
	<hr />
    <div class="row">
      <div class="col-xs-3">
        <h5><strong>SEO настройки:</strong></h5>
      </div>
      <div class="col-xs-3">
        <ul class="nav nav-tabs" id="langtabs" role="tablist">
          <?php foreach ($languages as $language) { ?>
            <li><a href="#lang-<?php echo $language['language_id']; ?>" role="tab" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"/></a></li>
          <?php } ?>
        </ul>
        <br />
        <div class="tab-content">
          <?php foreach ($languages as $language) { ?>
            <div class="tab-pane" id="lang-<?php echo $language['language_id']; ?>">
                Заголовок:<br />
                <input name="<?php echo $moduleName; ?>[PageTitle][<?php echo $language['language_id']; ?>]" class="form-control" type="text" value="<?php echo (isset($moduleData['PageTitle'][$language['language_id']])) ? $moduleData['PageTitle'][$language['language_id']] : 'iBlog'; ?>" />
                <br />
                Описание:<br />
                <textarea name="<?php echo $moduleName; ?>[MetaDescription][<?php echo $language['language_id']; ?>]" class="form-control" rows="4"><?php echo (isset($moduleData['MetaDescription'][$language['language_id']])) ? $moduleData['MetaDescription'][$language['language_id']] : 'This is an example description'; ?></textarea>
                <br />
                Ключевые слова:<br />
                <input name="<?php echo $moduleName; ?>[MetaKeywords][<?php echo $language['language_id']; ?>]" class="form-control" type="text" value="<?php echo (isset($moduleData['MetaKeywords'][$language['language_id']])) ? $moduleData['MetaKeywords'][$language['language_id']] : 'iblog, module, isenselabs, opencart extensions'; ?>" />
                <br/>
                SEO ссылка:<br />
                <input name="<?php echo $moduleName; ?>[SeoURL][<?php echo $language['language_id']; ?>]" class="form-control" type="text" value="<?php echo (isset($moduleData['SeoURL'][$language['language_id']])) ? $moduleData['SeoURL'][$language['language_id']] : 'iblog'; ?>" />
                <span class="help"><i class="fa fa-info-circle"></i>&nbsp;Сайт будет доступен по ссылке <em><?php echo HTTP_CATALOG."<strong>iblog</strong>"; ?></em></span>
            </div>
          <?php } ?>
        </div>
      </div>
    </div>
	<hr />
    <div class="row">
      <div class="col-xs-3">
        <h5><strong>Размер изображения:</strong></h5>
      </div>
      <div class="col-xs-3">
        <div class="input-group">
          <span class="input-group-addon">Ширина:&nbsp;</span>
          <input type="text" class="form-control" name="<?php echo $moduleName; ?>[ListingImageWidth]" value="<?php if(isset($moduleData['ListingImageWidth'])) { echo $moduleData['ListingImageWidth']; } else { echo "85"; }?>" />
          <span class="input-group-addon">px</span>
        </div><br />
        <div class="input-group">
          <span class="input-group-addon">Высота:</span>
          <input type="text" class="form-control" name="<?php echo $moduleName; ?>[ListingImageHeight]" value="<?php if(isset($moduleData['ListingImageHeight'])) { echo $moduleData['ListingImageHeight']; } else { echo "85"; }?>" />
          <span class="input-group-addon">px</span>
        </div>
      </div>
    </div>
	<hr />
    <div class="row">
      <div class="col-xs-3">
        <h5><strong>Стили CSS:</strong></h5>
      </div>
      <div class="col-xs-3">
        <div class="form-group">
			<textarea class="form-control" name="<?php echo $moduleName; ?>[CustomListingCSS]" placeholder="Ваши стили" rows="4"><?php if(isset($moduleData['CustomListingCSS'])) { echo $moduleData['CustomListingCSS']; } else { echo ""; }?></textarea>
		</div>
      </div>
    </div>
</div>