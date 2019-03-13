<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class IndexController extends HomebaseController {
    
    protected $order_model;
    protected $wuliu_model;
    
    function _initialize() {
        parent::_initialize();
        $this->order_model=D("common/Order");
        $this->wuliu_model=D("common/Wuliu");
        $this->weight_model=D("common/WeightCost"); //id,country,first_weight,additonal_weight,country_code
        $this->fuel_model=D("common/FuelSurcharge");     //id,way,fuel_surcharge
    }
	
    //首页
	public function index() {
        $weight = $this->weight_model->select();
        $fuel = $this->fuel_model->select();
        $this->assign('weight',$weight);
        $this->assign('fuel',$fuel);
    	$this->display(":index");
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
                            if (isset($_POST[$param]) && !empty($_POST[$param])) {					
                                    $operator = $val['operator'];
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

            $count = $this -> order_model -> where($where) -> count();

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
    
    public function sublists() {
		if(empty($_POST['w_yid'])){
			$this->index();
			exit();
		}
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
        } 
		else {
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
        $this->display(":sublists");
    }

}


