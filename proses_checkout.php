<?php
session_start();
include "koneksi.php";

if (!isset($_SESSION['id_user'])) {
    header("Location: login.php");
    exit;
}

$keranjang = $_SESSION['keranjang'] ?? [];
if (empty($keranjang)) {
    header("Location: keranjang.php");
    exit;
}

$id_user = $_SESSION['id_user'];
$total = 0;

foreach ($keranjang as $item) {
    $total += $item['harga'] * $item['qty'];
}

// simpan ke tabel pesanan
mysqli_query($conn, "INSERT INTO pesanan (id_user, total) VALUES ('$id_user','$total')");
$id_pesanan = mysqli_insert_id($conn);

// simpan detail
foreach ($keranjang as $id_produk => $item) {
    $harga = $item['harga'];
    $qty   = $item['qty'];

    mysqli_query($conn, "
        INSERT INTO order_detail (id_pesanan, id_produk, harga, qty)
        VALUES ('$id_pesanan','$id_produk','$harga','$qty')
    ");
}

// kosongkan keranjang
unset($_SESSION['keranjang']);

header("Location: pesanan.php");
exit;
