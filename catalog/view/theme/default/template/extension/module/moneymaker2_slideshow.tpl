<div id="moneymaker2_slideshow<?php echo $module; ?>" class="<?php if ($hidden_xs) { ?>hidden-xs <?php } ?>owl-carousel owl-moneymaker2 <?php echo $navigation_style; ?>-buttons <?php echo $navigation_style; ?>-pagination">
    <?php foreach ($banners_settings as $key => $banners_setting) { ?>
    <div class="item">
      <div class="item-text <?php echo $banners_setting['position']; ?> <?php echo $banners_setting['text_style']; ?> /*col-sm-12*/ col-md-<?php echo $banners_setting['text_width']; ?> text-center">
        <div><?php echo $banners_setting['title']; ?></div>
        <p class="hidden-xs"><?php echo $banners_setting['text']; ?></p>
        <?php if ($banners_setting['link']) { ?><p><a href="<?php echo $banners_setting['link']; ?>" title="<?php echo $banners_setting['title']; ?>" class="btn btn-lg btn-<?php echo $banners_setting['btn_style']; ?>"><?php echo $banners_setting['btn_title']; ?></a></p><?php } ?>
      </div>
      <img src="<?php echo $banners_setting['image']; ?>" alt="<?php echo $banners_setting['title']; ?>" class="img-responsive" />
    </div>
    <?php } ?>
</div>

<script type="text/javascript"><!--
  <?php if ($parallax) { ?>
    $('head').append('<style type="text/css"> #moneymaker2_slideshow<?php echo $module; ?> { overflow: hidden; } @media (min-width: 320px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["xxxsm"]; ?>px; } } @media (min-width: 450px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["xxsm"]; ?>px; } } @media (min-width: 560px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["xsm"]; ?>px; } } @media (min-width: 768px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["sm"]; ?>px; } } @media (min-width: 992px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["md"]; ?>px; } } @media (min-width: 1200px) { #moneymaker2_slideshow<?php echo $module; ?>, #moneymaker2_slideshow<?php echo $module; ?> .owl-item .item { height: <?php echo $parallax_heights["lg"]; ?>px; } } </style>');
  <?php } ?>

  <?php if ($fullwidth) { ?>
    $('#moneymaker2_slideshow<?php echo $module; ?>').detach().insertAfter( $('body header') );
    $('#moneymaker2_slideshow<?php echo $module; ?>').addClass('owl-moneymaker2-top');

    positionSlideshow();
    var waitForFinalEvent = (function () {
      var timers = {};
      return function (callback, ms, uniqueId) {
        if (!uniqueId) {
          uniqueId = "uniqueId";
        }
        if (timers[uniqueId]) {
          clearTimeout (timers[uniqueId]);
        }
        timers[uniqueId] = setTimeout(callback, ms);
      };
    })();
    $(window).on("resize", function() {
      waitForFinalEvent(function(){
          positionSlideshow();
      }, 100, "positionSlideshow");
    });
    function positionSlideshow() {
      if ($('.hidden-xs').is(":visible")) {
      <?php if (isset($moneymaker2_header_strip_bg_transparency)&&$moneymaker2_header_strip_bg_transparency<100) { ?>
      $('head style[class^="moneymaker2_slideshow_style"]').remove();
      $('head').append('<style class="moneymaker2_slideshow_style<?php echo $module; ?>" type="text/css">@media (min-width: 768px) { body.owl-moneymaker2-fullscreen #moneymaker2_slideshow<?php echo $module; ?> { top: -' + ($('#top').height()+$('#menu').height()) + 'px; margin-bottom: -' + ($('#top').height()+$('#menu').height()) + 'px;} } </style>');
      <?php } ?>
      }
    }

    $('body').addClass('owl-moneymaker2-fullscreen owl-moneymaker2-fullscreen-<?php echo $navigation_style; ?>');
  <?php } ?>
  <?php if ($fullwidth_bottom) { ?>
    $('#moneymaker2_slideshow<?php echo $module; ?>').detach().insertAfter( $('body > .container') );
    $('#moneymaker2_slideshow<?php echo $module; ?>').addClass('owl-moneymaker2-bottom');
    $('body').addClass('owl-moneymaker2-fullscreen-bottom');
  <?php } ?>

  $('#moneymaker2_slideshow<?php echo $module; ?>').owlCarousel({
  itemsCustom : [[0, 1], [768, <?php echo $items['sm']; ?>], [992, <?php echo $items['md']; ?>], [1200, <?php echo $items['lg']; ?>]],
  <?php if ($animation) { ?>
  transitionStyle : '<?php echo $animation_in; ?>',
  <?php } ?>
  <?php if ($navigation) { ?>
  navigation: true,
  navigationText: ['<i class="fa fa-angle-left fa-2x"></i>', '<i class="fa fa-angle-right fa-2x"></i>'],
  <?php } else { ?>
  navigation: false,
  <?php } ?>
  <?php if ($pagination) { ?>
  pagination: true,
  <?php } else { ?>
  pagination: false,
  <?php } ?>
  <?php if ($autoplay) { ?>
  autoPlay: true,
  stopOnHover: true,
    <?php if ($autoplay_timeout&&$autoplay_timeout>0) { ?>
    autoPlay: <?php echo $autoplay_timeout*1000; ?>,
    <?php } ?>
  <?php } ?>
});
<?php if (($parallax&&$fullwidth)||($parallax&&$fullwidth_bottom)) { ?>
  $(window).scroll(function () {
    if ($('.hidden-xs').is(":visible")) {
      <?php if ($fullwidth) { ?>
        var wScroll = $(this).scrollTop();
      <?php } else if ($fullwidth_bottom) { ?>
        var wScroll = $(this).scrollTop() + $(window).height() - ($('#moneymaker2_slideshow<?php echo $module; ?>').offset().top - $('header').offset().top);
      <?php } ?>
      wScroll = (wScroll * 0.1 * <?php echo $parallax_speed; ?>) - 1;
      if (wScroll<($("#moneymaker2_slideshow<?php echo $module; ?> .item img").height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height())) {
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-webkit-transform', 'translate(0px, -' + wScroll + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-moz-transform', 'translate(0px, -' + wScroll + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-ms-transform', 'translate(0px, -' + wScroll + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-o-transform', 'translate(0px, -' + wScroll + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('transform', 'translate(0px, -' + wScroll + 'px)');
      } else {
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-webkit-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-moz-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-ms-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('-o-transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
        $('#moneymaker2_slideshow<?php echo $module; ?> .owl-wrapper-outer img').css('transform', 'translate(0px, -' + ($( "#moneymaker2_slideshow<?php echo $module; ?> .item img" ).height()-$( "#moneymaker2_slideshow<?php echo $module; ?>" ).height()-1) + 'px)');
      }

    }
  });
<?php } ?>

//--></script>
