<?php
// tracker.php - Creates database and table

$servername = "localhost";
$username = "root"; // Change if needed
$password = ""; // Change if needed
$dbname = "notesdb";


// Connect to the newly created database
$conn = new mysqli($servername, $username, $password, $dbname);

// Create table
$sql = "CREATE TABLE IF NOT EXISTS habits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) NOT NULL,
    streak TEXT NOT NULL
)";

if ($conn->query($sql) === TRUE) {
    echo "Table created successfully\n";
} else {
    echo "Error creating table: " . $conn->error . "\n";
}

$conn->close();
