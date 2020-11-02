<?php
//This script is used to insert the user data when account is 
//created and registration are done.

$servername = "localhost";
$username = "ps2025";
$password = "9r4utzGPCQIJfzP";
$dbname = "ps2025";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$table = "users";

$uname = $_POST['username'];


//Queries and scripts
$sql = "SELECT uname FROM $table WHERE uname = '$uname'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  echo json_encode(array("exist" => true));
} else {
  echo json_encode(array("exist" => false));
}
$conn->close();
?>
