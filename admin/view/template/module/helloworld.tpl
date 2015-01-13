<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-helloworld" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-helloworld" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textarea-helloworld_text_field"><?php echo $entry_code; ?></label>
            <div class="col-sm-10">
              <textarea name="helloworld_text_field" cols="40" rows="5" placeholder="<?php echo $entry_code; ?>"><?php echo $helloworld_text_field; ?></textarea>
              <?php if ($error_code) { ?>
              <div class="text-danger"><?php echo $error_code; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="table-responsive">
            <table id="module" class="table table-striped table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $entry_layout; ?></td>
                  <td class="text-left"><?php echo $entry_position; ?></td>
                  <td class="text-left"><?php echo $entry_status; ?></td>
                  <td class="text-right"><?php echo $entry_sort_order; ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
	          <?php $module_row = 0; ?>
    	      <?php foreach ($modules as $module) { ?>
                <tr id="module-row<?php echo $module_row; ?>">
	              <td class="text-left"><select name="helloworld_module[<?php echo $module_row; ?>][layout_id]" class="form-control">
	                <?php foreach ($layouts as $layout) { ?>
	                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
	                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
	                <?php } else { ?>
	                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
	                <?php } ?>
	                <?php } ?>
	              </select></td>
	              <td class="text-left"><select name="helloworld_module[<?php echo $module_row; ?>][position]" class="form-control">
	                  <?php if ($module['position'] == 'content_top') { ?>
	                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
	                  <?php } else { ?>
	                  <option value="content_top"><?php echo $text_content_top; ?></option>
	                  <?php } ?>
	                  <?php if ($module['position'] == 'content_bottom') { ?>
	                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
	                  <?php } else { ?>
	                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
	                  <?php } ?>
	                  <?php if ($module['position'] == 'column_left') { ?>
	                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
	                  <?php } else { ?>
	                  <option value="column_left"><?php echo $text_column_left; ?></option>
	                  <?php } ?>
	                  <?php if ($module['position'] == 'column_right') { ?>
	                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
	                  <?php } else { ?>
	                  <option value="column_right"><?php echo $text_column_right; ?></option>
	                  <?php } ?>
	                </select></td>
	              <td class="text-left"><select name="helloworld_module[<?php echo $module_row; ?>][status]" class="form-control">
	                  <?php if ($module['status']) { ?>
	                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	                  <option value="0"><?php echo $text_disabled; ?></option>
	                  <?php } else { ?>
	                  <option value="1"><?php echo $text_enabled; ?></option>
	                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	                  <?php } ?>
	                </select></td>
	              <td class="text-right"><input type="text" name="helloworld_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" class="form-control" /></td>
                  <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#module-row<?php echo $module_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
	            </tr>  
	          <?php $module_row++; ?>
			  <?php } ?>
			  </tbody>
              <tfoot>
                <tr>
                  <td colspan="4"></td>
                  <td class="text-left"><button type="button" onclick="addModule();" data-toggle="tooltip" title="<?php echo $button_add_module; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
              </tfoot>
			</table>
		  </div>
        </form>
      </div>
	</div>
  </div>
</div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
 
function addModule() {    
    html  = '  <tr id="module-row' + module_row + '">';
    html += '    <td class="text-left"><select name="helloworld_module[' + module_row + '][layout_id]" class="form-control">';
    <?php foreach ($layouts as $layout) { ?>
    html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
    <?php } ?>
    html += '    </select></td>';
    html += '    <td class="text-left"><select name="helloworld_module[' + module_row + '][position]" class="form-control">';
    html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
    html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
    html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
    html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
    html += '    </select></td>';
    html += '    <td class="text-left"><select name="helloworld_module[' + module_row + '][status]" class="form-control">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
    html += '    <td class="text-right"><input type="text" name="helloworld_module[' + module_row + '][sort_order]" value="" size="3" class="form-control" /></td>';
    html += '    <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#module-row' + module_row +'\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '  </tr>';
     
	$('#module tbody').append(html);
        $('[rel=tooltip]').tooltip();
     
    module_row++;
}
//--></script>

<?php echo $footer; ?>