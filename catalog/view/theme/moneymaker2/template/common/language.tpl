<?php if (count($languages) > 1) { ?>
<li>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
    <ul class="dropdown-menu">
      <li class="dropdown-header"><?php echo $text_language; ?></li>
      <li class="hidden">
        <input type="hidden" name="code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </li>
      <?php foreach ($languages as $language) { ?>
      <li <?php if ($language['code'] == $code) { ?>class="active"<?php } ?>><a href="javascript:void(0);" class="language-select" onclick="$('input[name=\'code\']').val('<?php echo $language['code']; ?>'); $('#form-language').submit();"><span><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"></span>&nbsp; <?php echo $language['name']; ?></a></li>
      <?php } ?>
    </ul>
  </form>
</li>
<li role="separator" class="divider clearfix"></li>
<?php } ?>
