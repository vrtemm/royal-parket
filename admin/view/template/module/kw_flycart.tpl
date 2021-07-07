<?php echo $header; ?><?php echo $column_left; ?>

<div class="page-loader"><div class="sk-spinner sk-spinner-fading-circle"><div class="sk-circle1 sk-circle"></div><div class="sk-circle2 sk-circle"></div><div class="sk-circle3 sk-circle"></div><div class="sk-circle4 sk-circle"></div><div class="sk-circle5 sk-circle"></div><div class="sk-circle6 sk-circle"></div><div class="sk-circle7 sk-circle"></div><div class="sk-circle8 sk-circle"></div><div class="sk-circle9 sk-circle"></div><div class="sk-circle10 sk-circle"></div><div class="sk-circle11 sk-circle"></div><div class="sk-circle12 sk-circle"></div></div></div>

<div id="kwModule" ng:controller="kwFlycartController" ng:cloak>
	<form name="form" novalidate>
		<div id="view" ui-view></div>
	</form>
</div>

<script type="text/json" id="vars"><?php echo $vars; ?></script>
<script src="<?php echo $base; ?>kw_application/flycart/admin/bundles/vendor.js"></script>
<script src="<?php echo $base; ?>kw_application/flycart/admin/bundles/app.js"></script>

</div>

<div class="menu-overlay"></div>
</body>
</html>