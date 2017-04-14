<?php if ($heading_title) { ?>
<h3>
	<?php if ($url) { ?>
		<a href="<?php echo $url; ?>"><?php echo $heading_title; ?></a>
	<?php } else { ?>
		<?php echo $heading_title; ?>
	<?php } ?>
</h3>
<?php } ?>

<div class="row">
<div id="carousel_featuredCategory" class="owl-carousel" style="display:block;">
 <?php foreach ($categories as $category) { ?>
 <?php if($category['display_carousel_status']=="1"){?>
  <div class="item category-layout col-lg-12 col-md-12 col-sm-12 col-xs-12">
   <?php } else { ?>
   <div class="item category-layout col-lg-2 col-md-3 col-sm-4 col-xs-6">
   <?php } ?>
    <div class="category-thumb transition">
      <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
      
	  <div class="caption">
        <h4 style="text-align:center"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
		<?php if($category['display_description_status']=="1"){?>
        <p><?php echo $category['description']; if($category['description']!=''){echo '..';}?></p>
		<?php } ?>
      </div>

    </div>
  </div>
  <?php } ?>
</div>  
</div>

<?php if($category['display_carousel_status']=="1"){?> 
<script type="text/javascript"><!--
$('#carousel_featuredCategory').owlCarousel({
	items: <?php echo $items; ?>, 
	autoPlay: 9000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
--></script>
<?php } ?>