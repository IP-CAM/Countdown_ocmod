<h3><?php echo $heading_title; ?></h3>
<div class="row special-countdown">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-<?php echo $cols; ?> col-md-<?php echo $cols; ?> col-sm-<?php echo $cols_sm; ?> col-xs-<?php echo $cols_xs; ?>">
    <div class="product-thumb transition">
    <div class="countdown-labele">
      <img class="hot img-responsive" src="/catalog/view/theme/default/image/hot.png" alt="<?php echo $text_hot; ?>">      
    </div>  
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <?php if ($product['desc_stat'] == 1) { ?>
        <p class="description"><?php echo $product['description']; ?></p>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>          
          <?php } ?>
          <span class="percent"> <?php echo $text_save; ?> <?php echo $product['percent']; ?> %</span>
        </p>
        <?php } ?>        
      </div>
      <div id="countdown_<?php echo $product['product_id']; ?>" class="item-countdown"></div>
      <script type="text/javascript">
                      jQuery(document).ready(function($){
                        $("#countdown_<?php echo $product['product_id']; ?>").lofCountDown({
                          TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime( $product['to_date'] )); ?>",
                          DisplayFormat:"<div>%%D%% <span><?php echo $text_days; ?></span></div><div>%%H%% <span><?php echo $text_hours; ?></span></div><div>%%M%% <span><?php echo $text_minutes; ?></span></div><div>%%S%% <span><?php echo $text_seconds; ?></span></div>"
                        });
                      });
      </script> 
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
