<?php

// Enable CORS for API access
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "notesdb"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection Failed"]));
}

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"), true);

switch ($method) {
    case "GET":   // Fetch notes -- mysql la request send houn response yeil ani hach response GUI var display kru ..
        $sql = "select * from notes order by noteid DESC";  
        $result = $conn->query($sql);
        $notes = $result->fetch_all(MYSQLI_ASSOC);
        echo json_encode($notes);
        break;
    
    case "POST":  // Add new Note -- mysql db madhe record add kr
        $title = $data["title"];
        $content = $data["content"];
        $tags = $data["tags"];
        $sql = "INSERT INTO notes(title, content, tags) VALUES('$title', '$content', '$tags');";
        echo json_encode(["success" => $conn->query($sql)]);
        break;
    
    case "PUT":    // update notes 
        $id = $data["noteid"]; 
        $title = $data["title"];
        $content = $data["content"];
        $tags = $data["tags"];
        $sql = "UPDATE notes SET title='$title', content='$content', tags='$tags' WHERE noteid=$id;";
        echo json_encode(["success" => $conn->query($sql)]);
        break;

    case "DELETE":  // delete note 🗑
        $id = $data["id"];  
        $sql = "DELETE FROM notes WHERE noteid=$id;";
        echo json_encode(["success" => $conn->query($sql)]);
        break;
}

$conn->close();

?>
