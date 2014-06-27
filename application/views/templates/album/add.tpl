<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>自定义上传主题</title>
<link href="<{$css_url}>dpl-min.css" rel="stylesheet">
<link href="<{$css_url}>bui-min.css" rel="stylesheet">

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
    <script src="<{$js_url}>jquery-1.8.1.min.js"></script>
    <script src="<{$js_url}>bui-min.js?t=201404241421"></script>
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

