<!doctype html>
<html>
	<head>
		<title>Print</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<?php
		foreach ($controller->getCss() as $css)
		{
			echo '<link type="text/css" rel="stylesheet" href="'.(isset($css['remote']) && $css['remote'] ? NULL : PJ_INSTALL_URL).$css['path'].$css['file'].'" />';
		}
		?>
		<style type="text/css">
		html, body{
			background-image: none;
			background-color: #fff;
		}
		</style>
	</head>
	<body>
		<div style="width: 912px; margin: 0 auto;">
		<?php require $content_tpl; ?>
		</div>
	</body>
</html>
<?php
if(!$controller->_get->check('err'))
{ 
	?>
	<script type="text/javascript">
	if (window.print) {
		window.print();
	}
	</script>
	<?php
} 
?>