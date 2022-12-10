<?php
  // Connect to the database
  $conn = new mysqli("localhost", "root","","junkyard");

  // Query the database
  $result = $conn->query("SELECT * FROM ENGINE");

  // Convert the result to JSON format
  $json = array();
  while ($row = $result->fetch_assoc()) {
    $json[] = $row;
  }
  echo json_encode($json);
  
?>