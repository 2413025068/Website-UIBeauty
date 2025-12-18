<?php
$host = "127.0.0.1";
$user = "root";
$pass = "";
$db   = "db_projectu&i"; // ✅ TANPA &
$port = 3307;           // ✅ WAJIB

$conn = mysqli_connect($host, $user, $pass, $db, $port);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
