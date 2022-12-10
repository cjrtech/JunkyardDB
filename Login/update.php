<?php
  // Connect to the database
  $conn = new mysqli("localhost", "username", "password", "database");

  // Check for form submission
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the form data
    $name = $_POST["name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];

    // Construct the SQL query
    $sql = "INSERT INTO contacts (name, email, phone) VALUES ('$name', '$email', '$phone')";

    // Execute the query
    $conn->query($sql);
  }

  // Construct the SQL query to retrieve all records from the database
  $sql = "SELECT * FROM contacts";

  // Execute the query
  $result = $conn->query($sql);

  // Loop through the result set and display the records
  while ($row = $result->fetch_assoc()) {
    echo "<p>Name: " . $row["name"] . "</p>";
    echo "<p>Email: " . $row["email"] . "</p>";
    echo "<p>Phone: " . $row["phone"] . "</p>";
  }

  // Close the connection
  $conn->close();
?>
