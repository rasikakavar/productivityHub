<?php
header("Access-Control-Allow-Origin: *"); // Allow requests from any origin (for development)
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allow these HTTP methods
header("Access-Control-Allow-Headers: Content-Type"); // Allow Content-Type header
header("Content-Type: application/json");

$servername = "localhost"; // Change if needed
$username = "root"; // Replace with your MySQL username
$password = ""; // Replace with your MySQL password
$dbname = "notesdb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['success' => false, 'error' => "Connection failed: " . $conn->connect_error]));
}

$action = isset($_GET['action']) ? $_GET['action'] : (isset($_POST['action']) ? $_POST['action'] : null);

switch ($action) {
    case 'get_habits':
        $sql = "SELECT * FROM habits";
        $result = $conn->query($sql);

        $habits = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $row['streak'] = json_decode($row['streak'], true);
                $habits[] = $row;
            }
        }

        echo json_encode($habits);
        break;

    case 'add_habit':
        $data = json_decode(file_get_contents("php://input"), true);

        $name = $data['name'];
        $color = $data['color'];
        $streak = json_encode($data['streak']);

        $sql = "INSERT INTO habits (name, color, streak) VALUES ('$name', '$color', '$streak')";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'error' => $conn->error]);
        }
        break;

    case 'update_habit':
        $data = json_decode(file_get_contents("php://input"), true);

        $id = $data['id'];
        $streak = json_encode($data['streak']);

        $sql = "UPDATE habits SET streak = '$streak' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'error' => $conn->error]);
        }
        break;

    case 'delete_habit':
        $data = json_decode(file_get_contents("php://input"), true);

        $id = $data['id'];

        $sql = "DELETE FROM habits WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'error' => $conn->error]);
        }
        break;

    default:
        echo json_encode(['success' => false, 'error' => "Invalid action"]);
        break;
}

$conn->close();
?>