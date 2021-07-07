<?php
if (SC_VERSION < 20) {
$ascp_settings_settings = Array(
'box_begin' => '<div class="box">
<div class="box-heading">{TITLE}</div>
<div class="box-content">',
'box_end' => '</div>
</div>'
);
} else {$ascp_settings_settings = Array(
'box_begin' => '<div class="box-main news-style">
<div class="news-set center">
<h4 class="inner">
<span>{TITLE}</span>
</h4>
</div>
<div>',
'box_end' => '</div>
</div>'
);
}