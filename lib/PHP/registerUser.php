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
$fname = $_POST['firstName'];
$lname = $_POST['lastName'];
$email = $_POST['email'];
$uname = $_POST['username'];
$password1 = $_POST['password'];
$utype = $_POST['type'];

//Queries and scripts
$sql = "INSERT INTO $table (fname, lname, email,uname, pass,utype )
VALUES ('$fname','$lname','$email','$uname','$password1','$utype')";

if ($conn->query($sql) === TRUE) {
  //echo "New record created successfully";
  echo json_encode(array("success" => true));
} else {
  
  echo json_encode(array("success" => false));
}
$conn->close();
?>
