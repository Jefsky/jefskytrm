<?php
/**
 * 运单管理
 */

namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class FreightController extends AdminbaseController{

    public static $field = [
        'weight_model' => [
            'country_code' => array("field" => "country_code", "operator" => "like"), 
            'country' => array("field" => "country", "operator" => "like"), 
        ],
        'unit_model' => [
            'country_code' => array("field" => "country_code", "operator" => "like"), 
            'country' => array("field" => "country", "operator" => "like"), 
        ],
        'fuel_model' => [
            'way' => array("field" => "way", "operator" => "like"), 
        ]
    ];
        
    function _initialize() {
        parent::_initialize();
        $this->weight_model=D("common/weight_cost"); //id,country,first_weight,additonal_weight,country_code
        $this->unit_model=D("common/unit_price");     //id,country,unit_price,country_code
        $this->fuel_model=D("common/fuel_surcharge");     //id,way,fuel_surcharge
    }

    public function index(){
        $Freight = M("Setting");
        if(IS_POST){
            $Data['config'] = serialize(I("post.freight"));
            $setting = $Freight->where("name = 'freight'")->save($Data);
            if($setting !== false){
                $this->success('保存成功！');
            }else{
                $this->error('保存失败！');                
            }
        }else{
            $setting = unserialize($Freight->getField('config'));
            $this->assign('freight',$setting);
            $this->display('index');
        }
    }
    
    /**
     * 显示列表
     */
    public function weight() {
    $this->_lists('weight_model');
	$this->display('weight');
    }
    public function unit() {
        $this->_lists('unit_model');
        $this->display('unit');
    }
    public function fuel() {
        $this->_lists('fuel_model');
        $this->display('fuel');
    }
    
    private function _lists($model) {
            $where_ands = array();
            $fields = $field[$model];
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

            $count = $this->$model->where($where)->count();

            $page = $this->page($count, 20);

            $Data = $this->$model->where($where)->order('id desc')->limit($page->firstRow . ',' . $page->listRows)->select();
            $users_obj = M("Users");
            $users_data = $users_obj->field("id,user_login")->where("user_status=1")->select();
            $users = array();
            foreach ($users_data as $u) {
                    $users[$u['id']] = $u;
            }
            $this->assign("users", $users);
            $this->assign("Page", $page->show('Admin'));
            $this->assign("current_page", $page->GetCurrentPage());
            unset($_GET[C('VAR_URL_PARAMS')]);
            $this->assign("formget", $_GET);
            $this->assign("order", $Data);
    }
    
    /**
     *  添加
     */
    public function add() {
        $model = I('get.model');
        if(IS_POST){
            $Data = I("post.data");
            $result = $this->$model->add($Data);
            if ($result) {
                $this->success("添加成功！");
            } else {
                $this->error("添加失败！");
            }
        }else{
            $this->assign("targets", $this->targets);
            $this->display('add'.$model);
        }
       
    }

    /**
     *  编辑
     */
    public function edit() {
        $model = I('get.model');
        if(IS_POST){
            $Data = I("post.data");
            $result = $this->$model->save($Data);
                if ($result !== fasle) {
                        $this->success("保存成功！");
                } else {
                        $this->error("保存失败！");
                }
        }else{
            $id = I("get.id");
            if(empty($id)) $this->error('ID 参数缺失');
            $Data = $this->$model->where("id=$id")->find();
            $this->assign('data',$Data);
            $this->assign("targets",$this->targets);
            $this->display('edit'.$model);
        }
        
    }


    /**
     *  删除
     */
    public function delete() {
        $model = I('get.model');
        if (isset($_POST['ids'])) {
            $tids = join(",", $_POST['ids']);
            $data['status'] = 0;
            if ($this->$model->where("id in ($tids)")->delete()) {
                    $this->success("删除成功！");
            } else {
                    $this->error("删除失败！");
            }
        } else {
            $id = intval(I("get.id"));
            if ($this->$model->delete($id) !== false) {
                    $this->success("删除成功！");
            } else {
                    $this->error("删除失败！");
            }
        }
    }
    
	
}

