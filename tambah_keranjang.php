<?php
session_start();
include "koneksi.php";

if (!isset($_POST['id_produk'])) {
    die("ID produk tidak terkirim");
}

$id_produk = (int) $_POST['id_produk'];
$qty = isset($_POST['qty']) ? (int) $_POST['qty'] : 1;

// ambil produk dari database
$q = mysqli_query($conn, "SELECT * FROM produk WHERE id_produk='$id_produk'");
$p = mysqli_fetch_assoc($q);

if (!$p) {
    die("Produk tidak ditemukan");
}

// inisialisasi keranjang
if (!isset($_SESSION['keranjang'])) {
    $_SESSION['keranjang'] = [];
}

// tambah / update
if (isset($_SESSION['keranjang'][$id_produk])) {
    $_SESSION['keranjang'][$id_produk]['qty'] += $qty;
} else {
    $_SESSION['keranjang'][$id_produk] = [
        'nama'  => $p['nama_produk'],
        'harga' => $p['harga'],
        'qty'   => $qty
    ];
}

// DEBUG (sementara)
// echo "<pre>";
// print_r($_SESSION['keranjang']);
// exit;

header("Location: keranjang.php");
exit;
