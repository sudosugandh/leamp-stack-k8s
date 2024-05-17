<?php
$servername = "mysql"; // This should match the name of your MySQL service in Kubernetes
$username = $_ENV['MYSQL_USER']; // Assuming you're using the same username as in the MySQL deployment
$password = $_ENV['MYSQL_ROOT_PASSWORD']; // Assuming you're using the root password from the Secret
$database = "your_database"; // Replace with your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully";

// Close connection
$conn->close();
?>
