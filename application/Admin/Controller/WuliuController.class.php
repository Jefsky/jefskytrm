<?php
/**
 * 运单管理
 */

namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class WuliuController extends AdminbaseController{
    
    protected $wuliu_model;
	protected $order_model;
    
    function _initialize() {
        parent::_initialize();
        $this->wuliu_model=D("common/Wuliu");
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
            'w_yid' => array("field" => "w_yid", "operator" => "="), 
            'w_place' => array("field" => "w_place", "operator" => "like"), 
            'w_date' => array("field" => "w_date", "operator" => "like"), 
            'w_content' => array("field" => "w_content", "operator" => "like"), 
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

            $count = $this -> wuliu_model -> where($where) -> count();

            $page = $this -> page($count, 20);

            $Wuliu = $this -> wuliu_model -> where($where)  -> order('w_date desc')-> limit($page -> firstRow . ',' . $page -> listRows)  -> select();
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
            $this -> assign("wuliu", $Wuliu);
    }
    
    /**
     *  添加
     */
    public function add() {
            $this -> assign("targets", $this -> targets);
            $this -> assign("formget", $_GET);
            $this -> display();
    }

    /**
     *  添加
     */
    public function add_post() {
            if (IS_POST) {
                    $Wuliu = I("post.wuliu");
                    $result = $this -> wuliu_model -> add($Wuliu);
					$order['o_yid'] = $_POST['wuliu']['w_yid'];
					$w_yid = $_POST['wuliu']['w_yid'];
					$order['o_content'] = $_POST['wuliu']['w_content'];
					$order['o_date'] = $_POST['wuliu']['w_date'];
					$update = $this -> order_model ->where(" o_yid = '$w_yid' ") -> save($order);
                    if ($result) {
                            $this -> success("添加成功！");
                    } else {
                            $this -> error("添加失败！");
                    }
            }
    }

    /**
     *  编辑
     */
    public function edit() {
            $id = I("get.id");
            $Wuliu = $this -> wuliu_model -> where("id=$id") -> find();
            $this -> assign('wuliu', $Wuliu);
            $this -> assign("targets", $this -> targets);
            $this -> display();
    }

    /**
     *  编辑
     */
    public function edit_post() {
            if (IS_POST) {
//                    $_POST['wuliu']['photo'] = sp_asset_relative_url($_POST['wuliu']['photo']);

                    //			$_POST['news']['cdate']=date("Y-m-d H:i:s",time());
                    $Wuliu = I("post.wuliu");
                    //			$article['smeta']=json_encode($_POST['smeta']);
//                    $Wuliu['content'] = htmlspecialchars_decode($Wuliu['content']);
                    $result = $this -> wuliu_model -> save($Wuliu);
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
                    if ($this -> wuliu_model -> where("id in ($tids)") -> delete()) {
                            $this -> success("删除成功！");
                    } else {
                            $this -> error("删除失败！");
                    }
            } else {
                    $id = intval(I("get.id"));
                    if ($this -> wuliu_model -> delete($id) !== false) {
                            $this -> success("删除成功！");
                    } else {
                            $this -> error("删除失败！");
                    }
            }
    }
	
	/**
     *  批量增加轨迹
     */
    public function adds() {
		$ids = $_POST['ids'];
		foreach( $ids as $key => $value){
			$yid[$key] = $this -> order_model -> where("id=$value") -> getField('o_yid');
		}
		$tids = join(",",$yid);
		$this -> assign("tids",$tids);
        $this -> assign("targets", $this -> targets);
        $this -> assign("formget", $_GET);
        $this -> display();
    }
	
	/**
     *  批量增加轨迹 post
     */
	public function adds_post() {
	    if (IS_POST) {
			$yid=explode(",",$_POST['wuliu']['w_yid']);
				foreach( $yid as $key => $value){
					$Wuliu = I("post.wuliu");
					$Wuliu['w_yid'] = $value;
					$result = $this -> wuliu_model -> add($Wuliu);
					$order['o_yid'] = $value;
					$w_yid = $value;
					$order['o_content'] = $_POST['wuliu']['w_content'];
					$order['o_date'] = $_POST['wuliu']['w_date'];
					$update = $this -> order_model ->where(" o_yid = '$w_yid' ") -> save($order);
					/* if ($result) {
							$this -> success("添加成功！");
					} else {
							$this -> error("添加失败！");
					} */
				}
			
			$this->success("批量操作完成");
		   
		}
    }
    
}

