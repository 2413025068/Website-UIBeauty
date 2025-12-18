<?php
session_start();

/*
  File ini untuk menghapus 1 produk dari keranjang
  berdasarkan ID produk
*/

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    if (isset($_SESSION['keranjang'][$id])) {
        unset($_SESSION['keranjang'][$id]);
    }
}

// kembali ke halaman keranjang
header("Location: keranjang.php");
exit;
