<?php
$servername = "localhost";
$username = "ps2025";
$password = "9r4utzGPCQIJfzP";
$dbname = "ps2025";
//the action perfromed from the app to do operations in the databse
$action = $_POST["action"];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
  return;
}

//If the connection is OK...
//table USER
$table_user = "Users";
//create table

//RETRIEVE DATA FROM USERS TABLE
if("GET_USER"== $action){
    $db_data = array();
    $sql = "SELECT * FROM $table_user ";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
        $db_data[] = $row;  
        //array_push($db_data, array("user_id" => $row["user_id"], "fname" => $row['fname'], "lname" => $row['lname'],"email" => $row['email'], "uname" => $row['uname'], "password" => $row['password'],"utype" => $row['utype']));
        //send back complete record as a json
        echo json_encode($arr, JSON_PRETTY_PRINT);
      }
    } else {
      echo "Error- 0 results";
    }
    $conn->close();
    return;
}

//INSERT USER REGISTRATION
if("ADD_USER"== $action){
  
}

if (isset($_POST['value'])) {
  echo json_encode(array("value" => $_POST['value']));
}




?>