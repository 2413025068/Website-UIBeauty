<?php
session_start();
include '../koneksi.php';

if ($_SESSION['role'] != 'admin') {
    header("Location: ../login.php");
    exit;
}

if(isset($_POST['simpan'])){
    $nama = $_POST['nama'];
    $harga = $_POST['harga'];
    $kategori = $_POST['kategori'];

    $gambar = $_FILES['gambar']['name'];
    move_uploaded_file($_FILES['gambar']['tmp_name'], "../img/".$gambar);

    mysqli_query($conn,"INSERT INTO produk VALUES(
        NULL,'$nama','$harga','$gambar','$kategori'
    )");

    header("Location: produk.php");
}
?>
<!DOCTYPE html>
<html>
<head>
<title>Tambah Produk</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
<h3 class="text-danger">Tambah Produk</h3>

<form method="POST" enctype="multipart/form-data">
<input name="nama" class="form-control mb-2" placeholder="Nama Produk" required>
<input name="harga" type="number" class="form-control mb-2" placeholder="Harga" required>
<input name="kategori" class="form-control mb-2" placeholder="Kategori" required>
<input type="file" name="gambar" class="form-control mb-3" required>

<button name="simpan" class="btn btn-success">Simpan</button>
<a href="produk.php" class="btn btn-secondary">Batal</a>
</form>
</div>

</body>
</html>
