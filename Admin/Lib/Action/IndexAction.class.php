<?php
header("Content-Type:text/html;charset=GB2312");  
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
	
	//加载登录页面
    public function index(){
		$this->display();
    }
	 
	//登录验证
	public function logincheck(){
		
		extract($_REQUEST);
		
		$admin = M("admin",null);
		
		$rs = $admin->where("a_name = '$a_name' AND a_pwd = '$a_pwd'")->find();
		
		
		if($rs){
			session('a_name',$a_name);
			$this->success("登录成功","__APP__/Index/admin_index");
		}else{
			$this->error("登录失败");
		}
	}
	
	//加载运单管理页
	public function admin_index(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$order = M("order",null);
		
		//查询运单
		if(isset($_REQUEST['s_date'])){
			
			//根据时间查询
			$o_date = $_REQUEST['s_date'];
			//$rs = $order->where("o_date = '$o_date'")->select();
			$rs = $order->where("o_date like '%$o_date%'")->select();
			
		}else if(isset($_REQUEST['s_end'])){
			
			//根据目的地查询  
			$o_end = $_REQUEST['s_end'];
			$rs = $order->where("o_end like '%$o_end%'")->select();
			
		}else if(isset($_REQUEST['s_content'])){
			
			//根据说明查询
			$o_content = $_REQUEST['s_content'];
			$rs = $order->where("o_content like '%$o_content%'")->select();
			
		}else if(isset($_REQUEST['s_yunid'])){
			
			//根据运单号查询 
			$o_yunid = $_REQUEST['s_yunid'];
			$rs = $order->where("o_yid = '$o_yunid'")->select();
			
		}else{
			
			//无条件查询
			$rs = $order->select();
			
		}
		
		$this->assign("order",$rs);

		$wuliu = M("wuliu",null);
		
		//查询物流
		if(isset($_REQUEST['w_yid'])){
			
			$w_yid = $_REQUEST['w_yid'];
			$wu = $wuliu->where("w_yid = '$w_yid'")->select();
			
		}

		$this->assign("wuliu",$wu);
		
		$this->display();
	}
	
	//注销登录 
	public function logon(){
		
		 session('[destroy]'); 
		 $this->error('正在注销', '__APP__/Index','1000');
		 
	}
	
	//增加订单
	public function ad_order(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$order = M("order",null);
		
		extract($_REQUEST);
		
		$data['o_yid'] = $o_yid;
		$data['o_zid'] = $o_zid;
		$data['o_date'] = $o_date;
		$data['o_end'] = $o_end;
		$data['o_content'] = $o_content; 
		
		$rs = $order->add($data);
		
		if($rs){
			$this->success("运单添加成功，稍后请主动添加物流信息！","__APP__/Index/admin_index");
		}else{
			$this->error("失败");
		}
		
	}
	
	//修改订单(加载)
	public function update_order(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$o_id = $_REQUEST['o_id'];
		
		$order = M("order",null);
		
		$rs = $order->where(" o_id = '$o_id'")->find();
		
		$this->assign("order",$rs);
		
		$this->display();
	}
	
	//修改订单
	public function up_order(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$order = M("order",null);
		
		extract($_REQUEST);
		
		$data['o_zid'] = $o_zid;
		$data['o_date'] = $o_date;
		$data['o_end'] = $o_end;
		$data['o_content'] = $o_content; 
		
		$rs = $order->where(" o_yid = '$o_yid' ")->data($data)->save(); 
		 
		if($rs){
			$this->success("运单修改成功","__APP__/Index/admin_index");
		}else{
			$this->error("失败");
		}
		
	}
	
	//删除订单
	public function del_order(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$o_id = $_REQUEST['o_id'];
			
		$order = M("order",null);
					
		$rs=$order->where(" o_id = '$o_id'")->delete(); 
					
		if($rs){
			$this->success("删除成功");
		}else{
			$this->error("删除失败");
		}
		
	}
	

	
	//增加物流
	public function ad_content(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$wuliu = M("wuliu",null);
		
		extract($_REQUEST);
		
		$data['w_yid'] = $w_yid;
		$data['w_place'] = $w_place;
		$data['w_date'] = $w_date;
		$data['w_content'] = $w_content;
		
		$rs = $wuliu->add($data);
		
		if($rs){
			
			//同步更新运单当前说明
			$order = M("order",null);
			 
			$data['o_content'] = $w_content; 
			
			$rs = $order->where(" o_yid = '$w_yid' ")->data($data)->save(); 
		 
			if($rs){
				$this->success("物流信息添加成功","__APP__/Index/admin_index");
			}else{
				$this->error("失败");
			}
			
			
		}else{
			$this->error("失败");
		}
		
	}
	
	//修改物流(加载)
	public function update_content(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$w_id = $_REQUEST['w_id'];
		
		$wuliu = M("wuliu",null);
		
		$rs = $wuliu->where(" w_id = '$w_id'")->find();
		
		$this->assign("wuliu",$rs);
		
		$this->display();
	}
	 
	//修改物流 UPDATE `wuliu` SET `w_place`='222',`w_date`='222',`w_content`='333' WHERE ( w_yid = '' ) [ RunTime:0.000525s ]
	public function up_content(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$wuliu = M("wuliu",null);
		
		extract($_REQUEST);
		
		$data['w_place'] = $w_place;
		$data['w_date'] = $w_date;
		$data['w_content'] = $w_content;
		
		$rs = $wuliu->where(" w_id = '$w_id' ")->data($data)->save(); 
		 
		if($rs){
			$this->success("物流信息修改成功","__APP__/Index/admin_index");
		}else{
			$this->error("失败");
		}
		
	}
	
	//删除物流
	public function del_content(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$w_id = $_REQUEST['w_id'];
			
		$wuliu = M("wuliu",null);
					
		$rs=$wuliu->where(" w_id = '$w_id'")->delete(); 
					
		if($rs){
			$this->success("删除成功");
		}else{
			$this->error("删除失败");
		}
		
	}
	
	//加载用户列表
	public function admin(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$admin = M("admin",null);
		
		$rs = $admin->select();
		
		$this->assign("admin",$rs);
		
		$this->display();
	}
	
	//增加用户
	public function ad_admin(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$admin = M("admin",null);
		
		extract($_REQUEST);
		
		$data['a_name'] = $a_name;
		$data['a_pwd'] = $a_pwd;
		
		$rs = $admin->add($data);
		
		if($rs){
			$this->success("添加成功","__APP__/Index/admin");
		}else{
			$this->error("添加失败");
		}
		
	}
	
	//修改密码
	public function up_apwd(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$admin = M("admin",null);
		
		extract($_REQUEST);
		
		$data['a_pwd'] = $pwd;
		
		$rs = $admin->where(" a_id = '$val' ")->data($data)->save(); 
		 
		if($rs){
			echo "ok";
		}else{
			$this->error();
		}
	}
	
	//删除用户
	public function del_admin(){
		
		if(!session('?a_name')) {
		   $this->error('请先登录后再进行操作！','__APP__/Index');
		};
		
		$a_id = $_REQUEST['val'];
			
		$admin = M("admin",null);
					
		$rs=$admin->where(" a_id = '$a_id'")->delete(); 
					
		if($rs){
			echo "删除成功";
		}else{
			echo "删除失败";
		}
	}
	
	
}