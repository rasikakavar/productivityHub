<?php

// you can use this file as template 

$servername = "localhost";
$username = "root"; // Use your MySQL username
$password = ""; // Use your MySQL password

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE DATABASE notesdb;" ;
$conn->query($sql);
echo "db done "."<br>";



$sql = "USE notesdb;" ;
$conn->query($sql);
echo "switch done   ";


$sql = "CREATE TABLE notes(noteid INT AUTO_INCREMENT PRIMARY KEY,title VARCHAR(255) NOT NULL,content TEXT NOT NULL,tags VARCHAR(255));" ;

$conn->query($sql);
echo "notes table done  ";

?> 
