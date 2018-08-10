<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
    public function index(){
		
		if(isset($_REQUEST['str'])){
			
			$str = $_REQUEST['str'];
			
			$map['o_yid'] = array ('in',$str);
				
			$order = M("order",null);
			
			$rs = $order->where($map)->select();
			
			$this->assign("order",$rs);
			
			 
			$m=M('order',null); 
			$m1=M('wuliu',null); 
			 
			$parent=$m->where($map)->select(); 
			
			foreach($parent as $n=> $val){ 
				$parent[$n]['voo']=$m1->where('w_yid='.$val['o_yid'].'')->select(); 
			} 
			
			$this->assign('list',$parent);   
						 
		}

		$this->display();
		
    }
	
	//查询物流
	public function wuliu(){
		$w_yid = $_REQUEST['id'];
		$wu = $wuliu->where("w_yid = '$w_yid'")->select();
		$this->assign("wuliu",$wu);
	} 
	
	//测试
	public function test(){
		
		
			  
			
	}
}