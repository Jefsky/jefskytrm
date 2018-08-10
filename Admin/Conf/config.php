<?php
return array(
	//'配置项'=>'配置值'
	
	'DB_TYPE'   => 'mysql', // 数据库类型
	'DB_HOST'   => 'localhost', // 服务器地址
	'DB_NAME'   => 'ljf', // 数据库名
	'DB_USER'   => 'ljf', // 用户名
	'DB_PWD'    => 'J5q8A6w3', // 密码
	'DB_PORT'   => 3306, // 端口
	
	'SHOW_PAGE_TRACE'=>true, //开启调试窗口 
	'SESSION_AUTO_START' => true, //是否开启session
	 
	//自定义超级全局变量
	'TMPL_PARSE_STRING'=>array(
									'__CSS__'=>'/Public/CSS',
									'__JS__'=>'/Public/JS',
									'__IMG__'=>'/Public/IMG',
								
							   ),
	//页面跳转
	'TMPL_ACTION_ERROR' => 'Index/dispatch_jump',
	'TMPL_ACTION_SUCCESS' => 'Index/dispatch_jump',
);
?>