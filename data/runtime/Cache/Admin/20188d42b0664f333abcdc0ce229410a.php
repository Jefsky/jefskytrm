<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/public/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/public/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
		form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
		.table-actions{margin-top: 5px; margin-bottom: 5px;padding:0px;}
		.table-list{margin-bottom: 0px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/public/js/jquery.js"></script>
    <script src="/public/js/wind.js"></script>
    <script src="/public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
</head>
<body>
	<div class="wrap js-check-wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="javascript:;">运单管理</a></li>
			<li><a href="<?php echo U('Order/add');?>" target="_self">增加运单</a></li>
		</ul>
		<form class="well form-search" method="post" action="<?php echo U('Order/index');?>">
			运单号：
			<input type="text" name="o_yid" style="width: 150px;" value="<?php echo ($formget["o_yid"]); ?>" placeholder="请输入运单号..."> &nbsp; &nbsp;
			目的地： 
			<input type="text" name="o_end" style="width: 150px;" value="<?php echo ($formget["o_end"]); ?>" placeholder="请输入目的地..."> &nbsp; &nbsp;
                        时间： 
			<input type="text" name="o_date" style="width: 120px;" value="<?php echo ($formget["o_date"]); ?>" class="js-datetime" placeholder="请输入时间..."> &nbsp; &nbsp;
                        关键字： 
			<input type="text" name="o_content" style="width: 200px;" value="<?php echo ($formget["o_content"]); ?>" placeholder="请输入关键字..."> &nbsp; &nbsp;
			<input type="submit" class="btn btn-primary" value="搜索" />
		</form>
		<form class="js-ajax-form" action="<?php echo U('Wuliu/adds');?>" method="post">
			<div class="table-actions">
				<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('Order/delete');?>" data-subcheck="true" data-msg="你确定删除吗？"><?php echo L('DELETE');?></button>
				<button class="btn btn-primary btn-small " type="submit" data-subcheck="true" >批量新增轨迹</button>
			</div>
			<table class="table table-hover table-bordered table-list">
				<thead>
					<tr>
						<th width="15"><label><input type="checkbox" class="js-check-all" data-direction="x" data-checklist="js-check-x"></label></th>
						<th>运单号</th>
						<th>转单号</th>
						<th>日期时间</th>
						<th>目的地</th>
						<th>说明</th>
						<th><?php echo L('ACTIONS');?></th>
					</tr>
				</thead>
				<?php if(is_array($order)): foreach($order as $key=>$vo): ?><tr>
					<td><input type="checkbox" class="js-check" data-yid="js-check-y" data-xid="js-check-x" name="ids[]" value="<?php echo ($vo["id"]); ?>" title="ID:<?php echo ($vo["id"]); ?>"></td>
                                        <td><a href="<?php echo U('Wuliu/index',array('w_yid'=>$vo['o_yid']));?>"><?php echo ($vo["o_yid"]); ?></a></td>
					<td><?php echo ($vo["o_zid"]); ?></td>
                                        <td><?php echo ($vo["o_date"]); ?></td>
                                        <td><?php echo ($vo["o_end"]); ?></td>
                                        <td><?php echo ($vo["o_content"]); ?></td>
					</td>
					<td>    
                                            <a href="<?php echo U('Wuliu/add',array('w_yid'=>$vo['o_yid']));?>">增加轨迹</a> | 
                                            <a href="<?php echo U('Order/edit',array('id'=>$vo['id']));?>">修改</a> | 
                                            <a href="<?php echo U('Order/delete',array('id'=>$vo['id']));?>" class="js-ajax-delete">删除</a>
                                        </td>
				</tr><?php endforeach; endif; ?>
				<tfoot>
					<tr>
						<th width="15"><label><input type="checkbox" class="js-check-all" data-direction="x" data-checklist="js-check-x"></label></th>
						<th>运单号</th>
						<th>转单号</th>
						<th>日期时间</th>
						<th>目的地</th>
						<th>说明</th>
						<th><?php echo L('ACTIONS');?></th>
					</tr>
				</tfoot>
			</table>
			<div class="table-actions">
				<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('Order/delete');?>" data-subcheck="true" data-msg="你确定删除吗？"><?php echo L('DELETE');?></button>
				
			</div>
			<div class="pagination"><?php echo ($Page); ?></div>
		</form>
	</div>
	<script src="/public/js/common.js"></script>
	<script>
		function refersh_window() {
			var refersh_time = getCookie('refersh_time');
			if (refersh_time == 1) {
				window.location = "<?php echo U('Order/index',$formget);?>";
			}
		}
		setInterval(function() {
			refersh_window();
		}, 2000);
		$(function() {
			setCookie("refersh_time", 0);
			Wind.use('ajaxForm', 'artDialog', 'iframeTools', function() {
				//批量移动
				$('.js-articles-move').click(function(e) {
					var str = 0;
					var id = tag = '';
					$("input[name='ids[]']").each(function() {
						if ($(this).attr('checked')) {
							str = 1;
							id += tag + $(this).val();
							tag = ',';
						}
					});
					if (str == 0) {
						art.dialog.through({
							id : 'error',
							icon : 'error',
							content : '您没有勾选信息，无法进行操作！',
							cancelVal : '关闭',
							cancel : true
						});
						return false;
					}
					var $this = $(this);
					art.dialog.open("/index.php?g=portal&m=Order&a=move&ids="+ id, {
						title : "批量移动",
						width : "80%"
					});
				});
			});
		});
	</script>
</body>
</html>