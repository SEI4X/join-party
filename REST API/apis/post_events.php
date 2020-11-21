<?php 
include_once('../common/include.php');

$conn=getConnection();

$creator = mysqli_real_escape_string($conn, $_POST['creator_id']);
$name = mysqli_real_escape_string($conn, $_POST['event_name']);
$place = mysqli_real_escape_string($conn, $_POST['place']);
$date = mysqli_real_escape_string($conn, $_POST['event_datetime']);
$image = mysqli_real_escape_string($conn, $_POST['image_url']);
$description = mysqli_real_escape_string($conn, $_POST['event_description']);
$color = mysqli_real_escape_string($conn, $_POST['color_scheme']);
$lang = mysqli_real_escape_string($conn, $_POST['lang']);
$lat = mysqli_real_escape_string($conn, $_POST['lat']);
$tag = mysqli_real_escape_string($conn, $_POST['tag']);
$active = mysqli_real_escape_string($conn, $_POST['is_active']);
$private = mysqli_real_escape_string($conn, $_POST['is_private']);

$query = "INSERT INTO events (creator_id, event_name, place, event_datetime, image_url, event_description, color_scheme, lang, lat, tag, is_active, is_private)
          VALUES('$creator', '$name','$place', '$date', '$image', '$description', '$color', '$lang', '$lat', '$tag', '$active', '$private')";

$results = mysqli_query($conn, $query);
if($results>0)
{
    echo "event added successfully";
} else {
    echo "event didn't add";
}
?>