<?php
/**
 * 运单管理
 */

namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class OrderController extends AdminbaseController{
    
    protected $order_model;
    
    function _initialize() {
        parent::_initialize();
        $this->order_model=D("common/Order");
    }
    
    /**
     * 显示列表
     */
    public function index() {
	$this -> _lists();
	$this -> display();
    }
    
    private function _lists() {
            $where_ands = array();
            $fields = array(
            'o_yid' => array("field" => "o_yid", "operator" => "="), 
            'o_end' => array("field" => "o_end", "operator" => "like"), 
            'o_date' => array("field" => "o_date", "operator" => "like"), 
            'o_content' => array("field" => "o_content", "operator" => "like"), 
            );
            if (IS_POST) {

                    foreach ($fields as $param => $val) {
                            if (isset($_POST[$param]) && !empty($_POST[$param])) {					$operator = $val['operator'];
                                    $field = $val['field'];
                                    $get = $_POST[$param];
                                    $_GET[$param] = $get;
                                    if ($operator == "like") {
                                            $get = "%$get%";
                                    }
                                    array_push($where_ands, "$field $operator '$get'");
                            }
                    }
            } else {
                    foreach ($fields as $param => $val) {
                            if (isset($_GET[$param]) && !empty($_GET[$param])) {
                                    $operator = $val['operator'];
                                    $field = $val['field'];
                                    $get = $_GET[$param];
                                    if ($operator == "like") {
                                            $get = "%$get%";
                                    }
                                    array_push($where_ands, "$field $operator '$get'");
                            }
                    }
            }

            $where = join(" and ", $where_ands);

            $count = $this -> order_model -> where($where)-> count();

            $page = $this -> page($count, 20);

            $Order = $this -> order_model -> where($where) -> order('o_date desc') -> limit($page -> firstRow . ',' . $page -> listRows)  -> select();
            $users_obj = M("Users");
            $users_data = $users_obj -> field("id,user_login") -> where("user_status=1") -> select();
            $users = array();
            foreach ($users_data as $u) {
                    $users[$u['id']] = $u;
            }
            $this -> assign("users", $users);
            $this -> assign("Page", $page -> show('Admin'));
            $this -> assign("current_page", $page -> GetCurrentPage());
            unset($_GET[C('VAR_URL_PARAMS')]);
            $this -> assign("formget", $_GET);
            $this -> assign("order", $Order);
    }
    
    /**
     *  添加
     */
    public function add() {
            $this -> assign("targets", $this -> targets);
            $this -> display();
    }

    /**
     *  添加
     */
	/**
    public function add_post() {
            if (IS_POST) {
                   // $_POST['order']['photo'] = sp_asset_relative_url($_POST['order']['photo']);

                    			// $_POST['news']['cdate']=date("Y-m-d H:i:s",time());
                    $Order = I("post.order");
                    			// $article['smeta']=json_encode($_POST['smeta']);
                   // $Order['content'] = htmlspecialchars_decode($Order['content']);
                    $result = $this -> order_model -> add($Order);
                    if ($result) {
                            $this -> success("添加成功！");
                    } else {
                            $this -> error("添加失败！");
                    }
            }
    }
	**/

    /**
     *  编辑
     */
    public function edit() {
            $id = I("get.id");
            $Order = $this -> order_model -> where("id=$id") -> find();
            $this -> assign('order', $Order);
            $this -> assign("targets", $this -> targets);
            $this -> display();
    }

    /**
     *  编辑
     */
    public function edit_post() {
            if (IS_POST) {
//                    $_POST['order']['photo'] = sp_asset_relative_url($_POST['order']['photo']);

                    //			$_POST['news']['cdate']=date("Y-m-d H:i:s",time());
                    $Order = I("post.order");
                    //			$article['smeta']=json_encode($_POST['smeta']);
//                    $Order['content'] = htmlspecialchars_decode($Order['content']);
                    $result = $this -> order_model -> save($Order);
                    if ($result) {
                            $this -> success("保存成功！");
                    } else {
                            $this -> error("保存失败！");
                    }
            }
    }

    /**
     *  删除
     */
    public function delete() {
            if (isset($_POST['ids'])) {
                    $tids = join(",", $_POST['ids']);
                    $data['status'] = 0;
                    if ($this -> order_model -> where("id in ($tids)") -> delete()) {
                            $this -> success("删除成功！");
                    } else {
                            $this -> error("删除失败！");
                    }
            } else {
                    $id = intval(I("get.id"));
                    if ($this -> order_model -> delete($id) !== false) {
                            $this -> success("删除成功！");
                    } else {
                            $this -> error("删除失败！");
                    }
            }
    }
    
	/**
     *  批量增加运单 post  order[o_yid]
     */
	public function add_post() {
	    if (IS_POST) {
			$yid=explode(",",$_POST['order']['o_yid']);
				foreach( $yid as $key => $value){
					$Order = I("post.order");
					$Order['o_yid'] = $value;
					$result = $this -> order_model -> add($Order);
				}
			
			$this->success("操作完成");
		   
		}
				
    }
}

