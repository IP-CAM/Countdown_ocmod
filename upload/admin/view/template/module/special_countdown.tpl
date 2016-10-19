<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-special-countdown" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-special-countdown" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-cols"><?php echo $entry_cols; ?></label>
          <div class="col-sm-10">
            <select name="cols" id="input-status" class="form-control">
              <?php if ($cols == 6) { ?>
              <option value="6" selected="selected">6</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
              <?php } elseif ($cols == 4) { ?> { ?>
              <option value="6">6</option>
              <option value="4" selected="selected">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
              <?php } elseif ($cols == 3) { ?> { ?>
              <option value="6">6</option>
              <option value="4">4</option>
              <option value="3" selected="selected">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
              <?php } elseif ($cols == 2) { ?> { ?>
              <option value="6">6</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2" selected="selected">2</option>
              <option value="1">1</option>
              <?php } elseif ($cols == 1) { ?> { ?>
              <option value="6">6</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1" selected="selected">1</option>
              <?php } else { ?>
              <option value="6">6</option>
              <option value="4" selected="selected">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
              <?php } ?>
            </select>
          </div>
          </div>
          <div class="form-group">
          <label class="col-sm-2 control-label" for="input-cols-sm"><?php echo $entry_cols_sm; ?></label>
          <div class="col-sm-10">
            <select name="cols_sm" id="input-status" class="form-control">
              <?php if ($cols_sm == 3) { ?>
              <option value="3" selected="selected">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
              <?php } elseif ($cols == 2) { ?> { ?>
              <option value="3">3</option>
              <option value="2" selected="selected">2</option>
              <option value="1">1</option>
              <?php } else { ?>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1" selected="selected">1</option>
              <?php } ?>
            </select>
          </div>
          </div>
          <div class="form-group">
          <label class="col-sm-2 control-label" for="input-cols-xs"><?php echo $entry_cols_xs; ?></label>
          <div class="col-sm-10">
            <select name="cols_xs" id="input-status" class="form-control">
              <?php if ($cols_sm == 3) { ?>
              <option value="2" selected="selected">2</option>
              <option value="1">1</option>
              <?php } else { ?>
              <option value="2">2</option>
              <option value="1" selected="selected">1</option>
              <?php } ?>
            </select>
          </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status-description"><?php echo $entry_status_description; ?></label>
          <div class="col-sm-10">
            <select name="description" id="input-status-description" class="form-control">
              <?php if ($description) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
          </div>
          <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <select name="status" id="input-status" class="form-control">
              <?php if ($status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
          </div>
        </form>        
      </div>
      <div class="col-sm-12" style="text-align: center;">
      <div style="font-size: 16px; font-weight: bold;">For support or questions: <br/>
      Skype: <a href="skype:serge_mikh?chat">serge_mikh</a><br/>
      E-mail: <a href="mailto:sergeomikh@gmail.com">sergeomikh@gmail.com</a><br/>
      <p><?php echo $text_donation; ?></p>
      </div>
        <iframe frameborder="0" allowtransparency="true" scrolling="no" src="https://money.yandex.ru/embed/donate.xml?account=410012962301409&quickpay=donate&payment-type-choice=on&mobile-payment-type-choice=on&default-sum=30&targets=donate&project-name=&project-site=&button-text=01&successURL=" width="522" height="64"></iframe>
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/ru_RU/i/scr/pixel.gif" width="1" height="1">
</form>

      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>