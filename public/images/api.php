<?php

$tab = $_GET['tab'];
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<title>货运价格计算</title>
';
$sn = $_POST["sn"];
$mn = $_POST["mn"];
$en = $_POST["en"];
$citys = $_POST["citys"];
$citym = $_POST["citym"];
$citye = $_POST["citye"];
$project = $_POST["project"];
$tonnage = $_POST["tonnage"];
$mileage = $_POST["mileage"];
if($tab==1){
	$add_1 = $citys.$sn;
	if($mn!=""){
	$add_2 = $citym.$mn;
	}else{
	$add_2 = 0;
	}
	$add_3 = $citye.$en;
	$contents = getcontents($add_1,$add_2,$add_3);
	//echo $contents;
	if($contents == 1){
		echo "起点地址输入有误，请注意明确填写“区”、“镇”、“村”等信息";
	}elseif($contents == 2){
		echo "中转地址输入有误，请注意明确填写“区”、“镇”、“村”等信息";
	}elseif($contents == 3){
		echo "终点地址输入有误，请注意明确填写“区”、“镇”、“村”等信息";
	}else{
		$journey_1 = getSubstr($contents,"单","km"); 
		$journey_2 = getSubstr($contents,"全","公里"); 
		$fuel = getfuel($journey_2,$project,$tonnage);
		echo "去程约 ".$journey_1." 公里，全程约 ". $journey_2." 公里,油费 ".$fuel." 元,</br>报价 ";
		echo getprice($journey_2,$project,$tonnage);
	}
}elseif($tab==2){
	$journey = 2*ceil($mileage+5);
	$fuel = getfuel($journey,$project,$tonnage);
	echo "去程 ".$mileage." 公里，全程约 ". $journey." 公里,油费 ".$fuel." 元,</br>报价 ";
	echo getprice($journey,$project,$tonnage);
}
/*子程序，取指定文本*/
function getSubstr($str, $leftStr, $rightStr){
    $left = strpos($str, $leftStr);
    $right = strpos($str, $rightStr,$left);
    if($left < 0 or $right < $left){
		return 0;
	}else{
		$restr = substr($str, $left + strlen($leftStr), $right-$left-strlen($leftStr));
		if(strlen($restr)<10){
			return substr($str, $left + strlen($leftStr), $right-$left-strlen($leftStr));
		}else{
			return 0;
		}
	}
}
/*子程序，运费计算*/
function getprice($journey,$project,$tonnage){
	/*里程倍率*/
	if($journey <= 50 ){
		$Wage =100 ;
	}elseif($journey <= 100 ){
		$Wage = 200;
	}elseif($journey <= 200 ){
		$Wage = 300;
	}else{
		$Wage =50*(ceil($journey/50)+1);
	}
	if( $journey > 200 ){
		$Wage = $Wage + $journey - 150;
	}	
	
	/*不同类型的倍率*/
	if( $project == 1 ){
		//拉货
		if($tonnage < 3){
		$tonnage=1.2;
		}elseif($tonnage < 4){
		$tonnage=1.3;
		}elseif($tonnage < 5){
		$tonnage=1.4;
		}elseif($tonnage < 6){
		$tonnage=1.5;
		}else{
		$tonnage=1.6;
		}
		$project=1.7;
	}elseif($project == 2){
		//搬家
		$tonnage=1.2;
		$project=2.1;
	}else{
		//搬厂
		$tonnage=1.4;
		$project=2.0;
	}
	$price_max = 10*ceil($project*$journey*$tonnage/10)+$Wage;
	if($price_max>400){
	$price_max = 50*ceil($price_max/50);
	}
	$length = strlen(ceil($price_max));
	if($length > 3){
	$price_max = 50*(ceil($price_max/50));
	}
	$price_min = 10*ceil(0.92*$price_max/10);
	return $price_min." - ".$price_max." 元";
}
//子程序，计算路程
function getcontents($add_1,$add_2,$add_3){
	$url_0 = "http://api.map.baidu.com/?qt=nav&c=131&sn=2$$$$$$%B9%E3%D6%DD%CA%D0%B6%AB%C6%D4%D5%F2$$$$&en=2$$$$$$".$add_1."$$$$";
	if($add_2 != ""){
	$url_1 = "http://api.map.baidu.com/?qt=nav&c=131&sn=2$$$$$$".$add_1."$$$$&en=2$$$$$$".$add_2."$$$$";
	$url_2 = "http://api.map.baidu.com/?qt=nav&c=131&sn=2$$$$$$".$add_2."$$$$&en=2$$$$$$".$add_3."$$$$";
	$contents_2 = getSubstr(file_get_contents($url_2),"全程","公里;");
	}else{
	$url_1 = "http://api.map.baidu.com/?qt=nav&c=131&sn=2$$$$$$".$add_1."$$$$&en=2$$$$$$".$add_3."$$$$"; 
	$contents_2 = 0;
	}
	$contents_0 = getSubstr(file_get_contents($url_0),"全程","公里;"); 
	$contents_1 = getSubstr(file_get_contents($url_1),"全程","公里;");
	if( $contents_0 == 0 ){
	$contents_all = 1;//起点地址错误
	}elseif($contents_1 == 0){
		if($add_2 !=0){
			$contents_all = 2;//中转地址错误
		}else{
			$contents_all = 3;//终点地址错误
		}
	}elseif($contents_2 == 0 & $add_2 != 0 ){
			$contents_all = 3;//终点地址错误
	}else{
		if($contents_0>10){
			$contents_all = "单".ceil($contents_0+$contents_1+$contents_2+1)."km，全".ceil($contents_0+2*($contents_1+$contents_2+1))."公里";
		}else{
			$contents_all = "单".ceil($contents_0+$contents_1+$contents_2+1)."km，全".ceil(2*($contents_0+$contents_1+$contents_2+1))."公里";
		}
	}
	return $contents_all;
}
//子程序，计算油费
function getfuel($journey,$project,$tonnage){
	if( $project == 1 ){
		//拉货
		if($tonnage < 3){
		$tonnages =1.5;
		}elseif($tonnage < 4){
		$tonnages =1.6;
		}elseif($tonnage < 5){
		$tonnages =1.7;
		}elseif($tonnage < 6){
		$tonnages =1.8;
		}elseif($tonnage < 7){
		$tonnages =2.0;
		}
	}elseif($project == 2){
		//搬家
		$tonnages=1.5;
	}else{
		//搬厂
		$tonnages=1.8;
	}
	$fuel_jiage = ceil($tonnages*$journey);
	return $fuel_jiage;
}
?>