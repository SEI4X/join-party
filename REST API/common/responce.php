<?php
function sendResponse($resp_code,$data,$message){
    $arr = array('code'=>$resp_code,'message'=>$message,'data'=>$data);
    echo json_encode($arr);
}
?>