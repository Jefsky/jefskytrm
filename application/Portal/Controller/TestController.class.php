<?php

/**

 * 某公司想寄21公斤普通货包裹从上海到德国，总运费多少？ 
 *答：公司选择某快递公司A，首重0.5公斤260元，续重0.5公斤/60元, 燃油附加费10%，折扣为8折。计算如下  
 *运费=260 (21×2-1) ×60=2720元 
 *首重运费＋(重量（公斤）×2－1)×续重运费 
 *总费用=2720×(1＋10%)×80%=2393.6元  
 *总费用＝(运费＋燃油附加费)×折扣＋包装费用＋其它费用
 */





namespace Portal\Controller;
use Common\Controller\HomebaseController; 


class TestController extends HomebaseController 
{
    function _initialize() {
        parent::_initialize();
        $this->weight_model=D("common/weight_cost"); //id,country,first_weight,additonal_weight,country_code
        $this->fuel_model=D("common/fuel_surcharge");     //id,way,fuel_surcharge
    }

    public function index() 
    {
        // $Freight = M("Setting"); // 实例化User对象                
        // $setting = unserialize($Freight->getField('config'));
        // $szfy = $setting['fwc']; //I('get.szfy');
        // $zl = $_POST['weight'];
        // $xzfy = $setting['awc']; //I('get.xzfy');
        // $data['yf'] = $szfy + ( $zl * 2 - 1 ) * $xzfy;
        // $ryf = $setting['fs']; //I('get.ryf');
        // $zk = $setting['discount']; //I('get.zk');
        // $bzf = $setting['bagging']; //I('get.bzf');
        // $qtf = $setting['else']; //I('get.qtf');
        // $data['zf'] = $data['yf'] * ( 1 + $ryf ) * $zk + $bzf + $qtf;
        // $this->AjaxReturn($data);

        $Freight = M("Setting");
        $setting = unserialize($Freight->getField('config'));
        $country_id = $_POST['country'];
        $fuel_surcharge = $_POST['way'];
        $weight = $_POST['weight'];
        $weight_data = $this->weight_model->where(" id = '$country_id'")->find();
        $data['weight'] = $weight;
        $ryf = $fuel_surcharge; //燃油费
        $zk = $setting['discount']; //折扣
        $bzf = $setting['bagging']; //包装费
        $qtf = $setting['else']; //其他费用
        $jx = $setting['jx'];    //重量界限
        $szfy = $weight_data['first_weight']; //首重;
        $data['xzfy'] = $xzfy = $weight_data['additional_weight']; //续重;
        $more = 0;

        /*
        if($weight > $jx){
            $more = $weight - $jx;
            $data['more'] = $more;
            $data['yf'] = $szfy + ( $jx * 2 - 1 ) * $xzfy; #界[限重量运费] 首重费用 + （ 界限重量 * 2 - 1 ） * 续重费用
            $zf = $data['yf'] * ( 1 + $ryf ) ; #[界限重量总费] 界限重量运费 * （ 1 + 燃油费 ）
            # more than $jx
            $data['zf'] = ($more * $weight_data['unit_price'] * ( 1 + $ryf ) + $zf) * $zk + $bzf + $qtf; #[最终总费] （(货物总费） 超出重量 * 单价 * （ 1 + 燃油费 ） + 界限重量总费) * 折扣 + 包装费 + 其他费用

            $data['yf_gs'] = $szfy .'+('. $jx .'* 2 - 1 ) * '.$xzfy;
            $data['zf_gs'] = $more .'*'. $weight_data['unit_price'] .'*'. $ryf .'+'. $bzf .'+'. $qtf .'+'. $zf;
        }else{  #小于$jx
            $zl = $weight;
            $data['yf'] = $szfy + ( $zl * 2 - 1 ) * $xzfy;
            $data['zf'] = $data['yf'] * ( 1 + $ryf ) * $zk + $bzf + $qtf;

            $data['yf_gs'] = $szfy .'+('. $zl .'* 2 - 1 ) * '.$xzfy;
            $data['zf_gs'] = $data['yf'] .'* ( 1 +'. $ryf .') *'. $zk .'+'. $bzf .'+'. $qtf;
        }
        */

/*  
21内
总费用 = （首重+（重量*2-1）*续重）*燃油附加费+杂费
21外
总费用 = 重量*单价*燃油附加费+杂费 
*/
        if($weight > $jx){  
            $data['zf_gs'] = $weight * $weight_data['unit_price'] * $ryf * $zk + $qtf + $bzf;
            // echo $weight.'*'.$weight_data['unit_price'].'*'.$ryf.'*'.$zk.'+'.$qtf.'+'.$bzf;
        }else{  #小于$jx
            $data['zf_gs'] = ( $jx + ( $weight * 2 - 1 ) * $xzfy ) * $ryf * $zk + $bzf + $qtf;
        }     
        $data['status'] = 1;
        $this->AjaxReturn($data);

 
    }
    

}



