<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="运单轨迹查询">
    <meta name="author" content="Jefsky" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>运单轨迹查询</title>

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
    <style>
        tr {
            font-size: 13px;
        }
        
        .test_hide {
            display: none;
        }
    </style>
</head>

<body>
    <header class="am-topbar">
        <h1 class="am-topbar-brand">
            <a href="/">运单轨迹查询</a>
        </h1>
        <?php $user = sp_get_current_user();?>

        <!-- <div class="am-topbar-right">
            <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span> 注册</button>
        </div> -->

        <div class="am-topbar-right">
            <?php if(empty($user['user_login'])): ?><a class="am-btn am-btn am-topbar-btn am-btn-sm" href="<?php echo leuu('user/login/index');?>"><span class="am-icon-user"></span> 登录</a>
                <a class="am-btn am-btn am-topbar-btn am-btn-sm" href="<?php echo leuu('user/register/index');?>"><span class="am-icon-user"></span> 注册</a>

                <?php else: ?>
                <a class="am-btn am-btn am-topbar-btn am-btn-sm" href="<?php echo leuu('user/login/index');?>"><span class="am-icon-user"></span>您好，<?php echo ($user['user_login']); ?>!</a>
                <a class="am-btn am-btn am-topbar-btn am-btn-sm" href="<?php echo leuu('user/index/logout');?>"><span class="am-icon-user"></span>退出</a><?php endif; ?>
        </div>
        <!-- <a class="" style="float:right;"><i class="fa fa-sign-in"></i> &nbsp;登录</a> -->
    </header>
    <div class="am-g am-container">
        <form class="am-topbar-form am-topbar-left am-form-inline" role="search" id="askForm" method="post" action="<?php echo U('Index/sublists');?>" style="width:100%;min-height:300px;margin-top:30px;">
            <input type="text" name="w_yid" class="am-form-field am-input-sm" placeholder="运单轨迹查询" style="width:100%">
            <button type="submit" class="am-btn am-btn-primary am-btn-block">运单查询</button>
        </form>
    </div>
    <?php if(!empty($user['user_login'])): ?><div class="am-g am-container">
            <form class="am-forme" role="search" method="post" action="" style="width:100%;min-height:300px;margin-top:30px;">
                <fieldset>
                    <div class="am-form-group">
                        <label for="doc-select-1">国家</label>
                        <select id="country" name='country'>
                            <?php if(is_array($weight)): $i = 0; $__LIST__ = $weight;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["country"]); ?>-<?php echo ($vo["country_code"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                        <span class="am-form-caret"></span>
                    </div>
                    <div class="am-form-group">
                        <label for="doc-select-1">途径</label>
                        <select id="way" name='way'>
                            <?php if(is_array($fuel)): $i = 0; $__LIST__ = $fuel;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["fuel_surcharge"]); ?>"><?php echo ($vo["way"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                        <span class="am-form-caret"></span>
                    </div>
                    <div class="am-form-group">
                        <label for="doc-ipt-email-1">货重</label>
                        <input type="text" class="" id="weight" placeholder="输入货重（KG）" name="weight">
                    </div>
                    <p><button type="button" id="ask" class="am-btn am-btn-primary am-btn-block">运费查询</button></p>
                </fieldset>
                
                <!-- <input type="text" name="weight" id="weight" class="am-form-field am-input-sm" placeholder="请输入货重" style="width:100%"> -->
                
                <h2>本次查询结果</h2>
                <!-- <h3>运费：<span id="yf">0</span></h3> -->
                <h3>总费用：<span id="zf" style="font-size: 50px;color: red;">0</span>元</h3>
            </form>
        </div><?php endif; ?>
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
                <a href="http://www.jefsky.com" title="Jefsky" target="_blank" class="">Jefsky</a> 提供技术支持
            </p>
            <p>CopyRight©2015-2018 物流管理系统2.1
                <script type="text/javascript">
                    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                    document.write(unescape("%3Cspan id='cnzz_stat_icon_1256263090'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256263090%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
                </script>
            </p>
        </div>
        <!--<div class="am-footer-miscs ">
            <p><a href="http://www.hipi7.com/youhui" title="汇淘地——领券优惠,商家内部券,领券秒杀,领券商品分享,内部优惠券">汇淘地——淘宝优惠券分享，让你一次淘个够</a></p>
        </div>-->
    </footer>
    <div id="am-footer-modal" class="am-modal am-modal-no-btn am-switch-mode-m am-switch-mode-m-default">
        <div class="am-modal-dialog">
            <div class="am-modal-hd am-modal-footer-hd">
                <a href="javascript:void(0)" data-dismiss="modal" class="am-close am-close-spin " data-am-modal-close>&times;</a>
            </div>
            <div class="am-modal-bd">
                您正在浏览的是

                <span class="am-switch-mode-owner">
	            Jefsky
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
    <script src="https://s4.cnzz.com/z_stat.php?id=1256263090&web_id=1256263090" language="JavaScript"></script>
    <script>
        $('#ask').click(function() {
            var weight = $('#weight').val();
            var country = $('#country').val();
            var way = $('#way').val();
            $.ajax({
                type: "POST",
                url: "<?php echo leuu('test/index');?>",
                data: {
                    weight: weight,
                    way:way,
                    country:country
                },
                dataType: 'json',
                error: function(request) {
                    alert("请稍后重试");
                },
                success: function(data) {
                    console.log(data);
                    $('#zf').html(data['zf_gs']);
                }
            });
        });
    </Script>
</body>

</html>