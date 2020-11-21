<?php
include_once('../common/include.php');
//get connection from database.php
$conn=getConnection();

if($conn==null){
    //send response if connection error occurred.
    echo('0');
}else{
    $sql = "SELECT * FROM events";
    $result = $conn->query($sql);
    
    //check if event list available 
    if ($result->num_rows > 0) {
        $events=array();
        while($row = $result->fetch_assoc()) {
            $event=array(
                "id" =>  $row["id"],
                "creator_id" => $row["creator_id"],
                "chat_id" => $row["chat_id"],
                "contact" => $row["event_name"],
            );
            array_push($events,$event);
        }
        echo(json_encode($events));
        //sendResponse(200,$events,'event List');
    } else {
        echo("Bad");
        sendResponse(404,[],'event not available');
    }
    //closing connection
    $conn->close();
}
?>