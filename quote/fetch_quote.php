<?php
$servername = "localhost";
$username = "root"; // your database username
$password = ""; // your database password
$dbname = "notesdb"; // your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Select the database
$conn->select_db($dbname);

// SQL query to fetch quotes
$sql = "SELECT text, author FROM quotes";
$result = $conn->query($sql);

// Check if there are any quotes in the database
if ($result->num_rows > 0) {
    $quotes = [];
    // Fetch all quotes and store them in an array
    while($row = $result->fetch_assoc()) {
        $quotes[] = $row;
    }
    // Return the quotes as a JSON response
    echo json_encode($quotes);
} else {
    // If no quotes found, return an empty array
    echo json_encode([]);
}

// Close the connection
$conn->close();
?>
