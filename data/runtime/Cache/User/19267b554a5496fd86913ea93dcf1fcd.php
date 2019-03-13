<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

<head>
    <title><?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
    <meta name="description" content="<?php echo ($site_seo_description); ?>">
    <meta name="author" content="ThinkCMF">
    <?php  function _sp_helloworld(){ echo "hello ThinkCMF!"; } function _sp_helloworld2(){ echo "hello ThinkCMF2!"; } function _sp_helloworld3(){ echo "hello ThinkCMF3!"; } ?>
<?php $portal_index_lastnews="2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"ThinkCMFX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
<meta name="author" content="Jefsky">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">

<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />

<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
<link rel="icon" href="/themes/simplebootx/Public/images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/themes/simplebootx/Public/images/favicon.ico" type="image/x-icon">
<link href="/themes/simplebootx/Public/simpleboot/themes/simplebootx/theme.min.css" rel="stylesheet">
<link href="/themes/simplebootx/Public/simpleboot/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="/themes/simplebootx/Public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--[if IE 7]>
	<link rel="stylesheet" href="/themes/simplebootx/Public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<link href="/themes/simplebootx/Public/css/style.css" rel="stylesheet">
<style>
    /*html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);-webkit-filter: grayscale(1);}*/
    
    #backtotop {
        position: fixed;
        bottom: 50px;
        right: 20px;
        display: none;
        cursor: pointer;
        font-size: 50px;
        z-index: 9999;
    }
    
    #backtotop:hover {
        color: #333
    }
    
    #main-menu-user li.user {
        display: none
    }
</style>
</head>

<body class="body-white">
    <!-- <?php echo hook('body_start');?>
<div class="navbar navbar-fixed-top">
   <div class="navbar-inner">
     <div class="container">
       <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </a>
       <a class="brand" href="/"><img src="/themes/simplebootx/Public/images/logo.png"/></a>
       <div class="nav-collapse collapse" id="main-menu">
       	<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
		
		<ul class="nav pull-right" id="main-menu-user">
			<li class="dropdown user login">
	            <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	            <img src="/themes/simplebootx//Public/images/headicon.png" class="headicon"/>
	            <span class="user-nicename"></span><b class="caret"></b></a>
	            <ul class="dropdown-menu pull-right">
	               <li><a href="<?php echo U('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a></li>
	               <li class="divider"></li>
	               <li><a href="<?php echo U('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a></li>
	            </ul>
          	</li>
          	<li class="dropdown user offline">
	            <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	           		<img src="/themes/simplebootx//Public/images/headicon.png" class="headicon"/>登录<b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu pull-right">
	               <li><a href="<?php echo U('api/oauth/login',array('type'=>'sina'));?>"><i class="fa fa-weibo"></i> &nbsp;微博登录</a></li>
	               <li><a href="<?php echo U('api/oauth/login',array('type'=>'qq'));?>"><i class="fa fa-qq"></i> &nbsp;QQ登录</a></li>
	               <li><a href="<?php echo leuu('user/login/index');?>"><i class="fa fa-sign-in"></i> &nbsp;登录</a></li>
	               <li class="divider"></li>
	               <li><a href="<?php echo leuu('user/register/index');?>"><i class="fa fa-user"></i> &nbsp;注册</a></li>
	            </ul>
          	</li>
		</ul>
		<div class="pull-right">
        	<form method="post" class="form-inline" action="<?php echo U('portal/search/index');?>" style="margin:18px 0;">
				 <input type="text" class="" placeholder="Search" name="keyword" value="<?php echo I('get.keyword');?>"/>
				 <input type="submit" class="btn btn-info" value="Go" style="margin:0"/>
			</form>
		</div>
       </div>
     </div>
   </div>
 </div> -->

    <div class="container tc-main">
        <div class="row">
            <div class="span4 offset4">
                <h2 class="text-center">用户登录</h2>
                <form class="form-horizontal js-ajax-forms" action="<?php echo U('user/login/dologin');?>" method="post">
                    <div class="control-group">
                        <input type="text" id="input_username" name="username" placeholder="手机号/邮箱/用户名" class="span4">
                    </div>

                    <div class="control-group">
                        <input type="password" id="input_password" name="password" placeholder="密码" class="span4">
                    </div>

                    <div class="control-group">
                        <div class="span4" style="margin-left: 0px;">
                            <input type="text" id="input_verify" name="verify" placeholder="验证码" style="width:252px;"> <?php echo sp_verifycode_img('length=4&font_size=14&width=100&height=34&charset=2345678&use_noise=1&use_curve=0');?>
                        </div>

                    </div>

                    <div class="control-group">
                        <button class="btn btn-primary js-ajax-submit span4" type="submit" style="margin-left: 0px">确定</button>
                    </div>

                    <div class="control-group" style="text-align: center;">
                        <ul class="inline">
                            <li><a href="<?php echo leuu('user/register/index');?>">现在注册</a></li>
                            <!-- <li><a href="<?php echo U('user/login/forgot_password');?>">忘记密码</a></li> -->
                        </ul>
                    </div>
                </form>
            </div>
        </div>

        <footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }">
            <div class="am-footer-switch">
                <span class="am-footer-ysp" data-rel="mobile" data-am-modal="{target: '#am-switch-mode'}">
							  移动版
						</span>
                <span class="am-footer-divider"> | </span>
                <a id="godesktop" data-rel="desktop" class="am-footer-desktop" href="javascript:">
						电脑版
					</a>
            </div>
            <div class="am-footer-miscs ">

                <p>由
                    <a href="http://www.jefsky.com/" title="Jefsky" target="_blank" class="">Jefsky</a> 提供技术支持
                </p>
                <p>CopyRight©2015-2017 杰夫斯基物流管理系统2.0
                    <script type="text/javascript">
                        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                        document.write(unescape("%3Cspan id='cnzz_stat_icon_1256263090'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256263090%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
                    </script>
                </p>
            </div>
            <!-- <div class="am-footer-miscs ">
				<p><a href="http://www.hipi7.com/youhui" title="汇淘地——领券优惠,商家内部券,领券秒杀,领券商品分享,内部优惠券">汇淘地——淘宝优惠券分享，让你一次淘个够</a></p>
			</div> -->
        </footer>

    </div>
    <!-- /container -->

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
    <script src="/themes/simplebootx/Public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
    <script src="/public/js/frontend.js"></script>
	<script>
	$(function(){
		$('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { e.stopPropagation(); });
		
		$("#main-menu li.dropdown").hover(function(){
			$(this).addClass("open");
		},function(){
			$(this).removeClass("open");
		});
		
		$.post("<?php echo U('user/index/is_login');?>",{},function(data){
			if(data.status==1){
				if(data.user.avatar){
					$("#main-menu-user .headicon").attr("src",data.user.avatar.indexOf("http")==0?data.user.avatar:"/data/upload/avatar/"+data.user.avatar);
				}
				
				$("#main-menu-user .user-nicename").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
				$("#main-menu-user li.login").show();
				
			}
			if(data.status==0){
				$("#main-menu-user li.offline").show();
			}
			
		});	
		;(function($){
			$.fn.totop=function(opt){
				var scrolling=false;
				return this.each(function(){
					var $this=$(this);
					$(window).scroll(function(){
						if(!scrolling){
							var sd=$(window).scrollTop();
							if(sd>100){
								$this.fadeIn();
							}else{
								$this.fadeOut();
							}
						}
					});
					
					$this.click(function(){
						scrolling=true;
						$('html, body').animate({
							scrollTop : 0
						}, 500,function(){
							scrolling=false;
							$this.fadeOut();
						});
					});
				});
			};
		})(jQuery); 
		
		$("#backtotop").totop();
		
		
	});
	</script>


</body>

</html>