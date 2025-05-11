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

// Create the table if it does not exist
$table_sql = "CREATE TABLE IF NOT EXISTS quotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    author VARCHAR(255) NOT NULL
)";

if ($conn->query($table_sql) === TRUE) {
    echo "Table 'quotes' created successfully or already exists.\n";
} else {
    echo "Error creating table: " . $conn->error;
}

// Array of quotes to be inserted
$quotes = [
    ["text" => "The only way to do great work is to love what you do.", "author" => "Steve Jobs"],
    ["text" => "Believe you can and you're halfway there.", "author" => "Theodore Roosevelt"],
    ["text" => "Don't watch the clock; do what it does. Keep going.", "author" => "Sam Levenson"],
    ["text" => "You miss 100% of the shots you don’t take.", "author" => "Wayne Gretzky"],
    ["text" => "It does not matter how slowly you go as long as you do not stop.", "author" => "Confucius"],
    ["text" => "The best way to predict the future is to invent it.", "author" => "Alan Kay"],
    ["text" => "Success is not final, failure is not fatal: it is the courage to continue that counts.", "author" => "Winston Churchill"],
    ["text" => "Hardships often prepare ordinary people for an extraordinary destiny.", "author" => "C.S. Lewis"],
    ["text" => "Act as if what you do makes a difference. It does.", "author" => "William James"],
    ["text" => "Everything you’ve ever wanted is on the other side of fear.", "author" => "George Addair"]
];

// Prepare the insert statement
$stmt = $conn->prepare("INSERT INTO quotes (text, author) VALUES (?, ?)");

if ($stmt === false) {
    die("Error preparing the SQL statement: " . $conn->error);
}

// Loop through the quotes array and insert each quote
foreach ($quotes as $quote) {
    $text = $quote['text'];
    $author = $quote['author'];

    // Bind the parameters to the prepared statement
    $stmt->bind_param("ss", $text, $author);

    // Execute the prepared statement
    if ($stmt->execute()) {
        echo "Quote by $author added successfully.\n";
    } else {
        echo "Error adding quote by $author: " . $stmt->error . "\n";
    }
}

// Close the prepared statement and connection
$stmt->close();
$conn->close();
?>
