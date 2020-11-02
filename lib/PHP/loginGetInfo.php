<?php
$servername = "localhost";
$username = "ps2025";
$password = "9r4utzGPCQIJfzP";
$dbname = "ps2025";

$data = array("exists" => false);

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//If the post'username' isn't passed properly
if (!isset($_POST["username"])) {
  echo json_encode($data);
  exit();
}

$uname = $_POST['username'] ;

$sql = "SELECT * FROM users where uname = '$uname'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
  $data["exists"] = true;
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $data["firstName"] = $row["fname"];
    $data["lastName"] = $row["lname"];
    $data["username"] = $row["uname"];
    $data["email"] = $row["email"];
    $data["usertype"] = $row["utype"];
  }
}

echo json_encode($data);
$conn->close();
?>