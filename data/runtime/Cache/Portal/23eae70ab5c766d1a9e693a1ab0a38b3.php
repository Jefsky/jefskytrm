<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html class="no-js">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="">
		<meta name="keywords" content="">
		<meta name="author" content="Jefsky" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>运单<?php echo ($wuliu[0]["w_yid"]); ?>轨迹查询</title>

		<!-- Set render engine for 360 browser -->
		<meta name="renderer" content="webkit">

		<!-- No Baidu Siteapp-->
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="icon" type="image/png" href="assets/i/favicon.png">

		<!-- Add to homescreen for Chrome on Android -->
		<meta name="mobile-web-app-capable" content="yes">
		<link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

		<!-- Add to homescreen for Safari on iOS -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

		<!-- Tile icon for Win8 (144x144 + tile color) -->
		<meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
		<meta name="msapplication-TileColor" content="#0e90d2">

		<link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.7.1/css/amazeui.min.css">
	</head>

	<body>
		<header class="am-topbar">
			<h1 class="am-topbar-brand">
		    	<a href="javascript:history.back(-1);">运单轨迹查询</a>
		 	</h1>	
	
			<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
	
			<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
				<div class="am-topbar-right">
					<form class="am-topbar-form am-topbar-left am-form-inline" role="search" method="post" action="<?php echo U('Index/sublists');?>">
						<div class="am-form-group">
							<input type="text" name="w_yid" class="am-form-field am-input-sm" placeholder="搜索" >
						</div>
					</form>
				</div>
			</div>
		</header>
		<div class="am-container">
			<blockquote>
				<p>运单：<?php echo ($wuliu[0]["w_yid"]); ?>详情</p> | <a href="javascript:history.back(-1);">返回首页</a>
			</blockquote>
			<table class="am-table am-table-bordered am-table-striped am-table-hover">
				<thead>
					<tr>
                                                <th>运单号</th>
						<th>日期时间</th>
						<th>区域</th>
						<th>详细信息</th>
					</tr>
				</thead>
				<tbody>
				<?php if(is_array($wuliu)): foreach($wuliu as $key=>$vo): ?><tr>
					<td><?php echo ($vo["w_yid"]); ?></td>
                                        <td><?php echo ($vo["w_date"]); ?></td>
                                        <td><?php echo ($vo["w_place"]); ?></td>
                                        <td><?php echo ($vo["w_content"]); ?></td>
				</tr><?php endforeach; endif; ?>
				</tbody>
			</table>
                    <a href="javascript:history.back(-1);">返回</a>
		</div>
		<footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }">
			<div class="am-footer-switch">
				<span class="am-footer-ysp" data-rel="mobile" data-am-modal="{target: '#am-switch-mode'}">
	          			云适配版
	    			</span>
				<span class="am-footer-divider"> | </span>
				<a id="godesktop" data-rel="desktop" class="am-footer-desktop" href="javascript:">
					电脑版
				</a>
			</div>
			<div class="am-footer-miscs ">
	
				<p>由
					<a href="http://www.jefsky.com/" title="Jefsky" target="_blank" class="">Jefsky</a>
					提供技术支持</p>
				<p>CopyRight©2015-2018 物流管理系统2.1   <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256263090'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256263090%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script></p>
			</div>
			<!-- <div class="am-footer-miscs ">
				<p><a href="http://www.hipi7.com/youhui" title="汇淘地——领券优惠,商家内部券,领券秒杀,领券商品分享,内部优惠券">汇淘地——淘宝优惠券分享，让你一次淘个够</a></p>
			</div> -->
		</footer>
	
		<div id="am-footer-modal" class="am-modal am-modal-no-btn am-switch-mode-m am-switch-mode-m-default">
			<div class="am-modal-dialog">
				<div class="am-modal-hd am-modal-footer-hd">
					<a href="javascript:void(0)" data-dismiss="modal" class="am-close am-close-spin " data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					您正在浏览的是
	
					<span class="am-switch-mode-owner">
	            云适配
	        </span>
	
					<span class="am-switch-mode-slogan">
	              为您当前手机订制的移动网站。
	        </span>
				</div>
			</div>
		</div>
	
		<!--在这里编写你的代码-->
	
		<!--[if (gte IE 9)|!(IE)]><!-->
		<script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
		<!--<![endif]-->
		<!--[if lte IE 8 ]>
	<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
	<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
	<![endif]-->
		<script src="http://cdn.amazeui.org/amazeui/2.7.1/js/amazeui.min.js"></script>
		
	</body>

</html>