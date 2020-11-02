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
if (!isset($_POST["challenge_name"])) {
  echo json_encode($data);
  exit();
}

$challengeName = $_POST["challenge_name"];
$userResult = array();

//Query to SELECT join selection from 3 tables for the global leaderboard attribute.
$sql = "SELECT CONCAT(users.fname, users.lname) as 'name', leaderboard.avg_score as 'avg_score', leaderboard.time as 'time' from leaderboard, challenges , users where leaderboard.challenge_id = challenges.challenge_id AND challenges.challenge_name = '{$challengeName}' AND leaderboard.user_id = users.user_id ORDER BY leaderboard.avg_score DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  $data["exists"] = true;
  // output data of each row
  while($row = $result->fetch_assoc()) {
    array_push($userResult, $row);
  }
}

//passing the rank as attribute
$j = 1;
for ($i = 0; $i < count($userResult); $i++) {
  $userResult[$i]['position'] = strval($j) ;
  ++$j;
}

$data['result'] = $userResult;
echo json_encode($data, JSON_PRETTY_PRINT);

$conn->close();
?>

