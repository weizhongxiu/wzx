<?php /* Smarty version Smarty-3.1.18, created on 2014-06-27 07:46:20
         compiled from "F:\web\wzx\application\views\templates\album\add.tpl" */ ?>
<?php /*%%SmartyHeaderCode:321953acdcb02f5bb6-85471460%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ac02a3b03a27159c6e02607c9eef2a80641ebac3' => 
    array (
      0 => 'F:\\web\\wzx\\application\\views\\templates\\album\\add.tpl',
      1 => 1403847520,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '321953acdcb02f5bb6-85471460',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_53acdcb0391fd0_58559460',
  'variables' => 
  array (
    'css_url' => 0,
    'js_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53acdcb0391fd0_58559460')) {function content_53acdcb0391fd0_58559460($_smarty_tpl) {?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>自定义上传主题</title>
<link href="<?php echo $_smarty_tpl->tpl_vars['css_url']->value;?>
dpl-min.css" rel="stylesheet">
<link href="<?php echo $_smarty_tpl->tpl_vars['css_url']->value;?>
bui-min.css" rel="stylesheet">

    </head>
    <body>
     
    <div class="demo-content">
    <div class="row">
    <div class="span8">
    <div id="J_Uploader">
    </div>
    </div>
    </div>
    <!--t为时间戳-->
    <script src="<?php echo $_smarty_tpl->tpl_vars['js_url']->value;?>
jquery-1.8.1.min.js"></script>
    <script src="<?php echo $_smarty_tpl->tpl_vars['js_url']->value;?>
bui-min.js?t=201404241421"></script>
    <!-- script start-->
    <script type="text/javascript">
    BUI.use('bui/uploader',function (Uploader) {
	    var uploader = new Uploader.Uploader({
		    //指定使用主题
		    theme: 'imageView',
		    render: '#J_Uploader',
		    url: '/upload/save',
		    queue: {
		    resultTpl:{
		    'success': '<div class="success"><img src="{url}" title="{name}"/></div>',
		    'error': '<div class="error"><span class="uploader-error">{msg}</span></div>'
		    }
		    },
		    rules: {
		    //文的类型
		    ext: ['.png,.jpg','文件类型只能为{0}'],
		    //上传的最大个数
		    max: [5, '文件的最大个数不能超过{0}个'],
		    //文件大小的最小值,这个单位是kb
		    minSize: [10, '文件的大小不能小于{0}KB'],
		    //文件大小的最大值,单位也是kb
		    maxSize: [1024, '文件大小不能大于1M']
		    }
	    }).render();
	    uploader.on('success', function(ev){
    	   //获取上传返回的结果
    	   var result = ev.result;
    	   alert(result);
	    });
	    uploader.on('complete', function(ev){
	    	   //获取上传返回的结果
	    	   var result = ev.result;
	    	   alert(1);
		    });
	    
    });
    </script>
    <!-- script end -->
    </div>
    </body>
    </html>

<?php }} ?>
