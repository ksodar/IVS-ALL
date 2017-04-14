<?php if (count($currencies) > 1) { ?>
<li>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
    <ul class="dropdown-menu">
      <li class="dropdown-header"><?php echo $text_currency; ?></li>
      <li class="hidden">
        <input type="hidden" name="code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </li>
      <?php foreach ($currencies as $currency) { ?>
      <li <?php if ($currency['code'] == $code) { ?>class="active"<?php } ?>><a href="javascript:void(0);" onclick="$('input[name=\'code\']').val('<?php echo $currency['code']; ?>'); $('#form-currency').submit();">&nbsp;<span><?php if ($currency['symbol_left']) { echo $currency['symbol_left']; } else { echo $currency['symbol_right']; } ?></span>&nbsp;&nbsp; <?php echo $currency['title']; ?></a></li>
      <?php } ?>
    </ul>
  </form>
</li>
<li role="separator" class="divider clearfix"></li>
<?php } ?>
