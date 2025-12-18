<?php
session_start();
include '../koneksi.php';

if ($_SESSION['role'] != 'admin') {
    header("Location: ../login.php");
    exit;
}

$data = mysqli_query($conn, "SELECT * FROM produk ORDER BY id_produk DESC");
?>
<!DOCTYPE html>
<html>
<head>
<title>Kelola Produk</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
<h3 class="fw-bold text-danger mb-3">Kelola Produk</h3>

<a href="tambah_produk.php" class="btn btn-success mb-3">+ Tambah Produk</a>

<table class="table table-bordered bg-white shadow-sm">
<tr class="table-danger">
    <th>No</th>
    <th>Gambar</th>
    <th>Nama</th>
    <th>Harga</th>
    <th>Kategori</th>
    <th>Aksi</th>
</tr>

<?php $no=1; while($p=mysqli_fetch_assoc($data)){ ?>
<tr>
<td><?= $no++; ?></td>
<td>
    <img src="../img/<?= $p['gambar']; ?>" width="60">
</td>
<td><?= $p['nama_produk']; ?></td>
<td>Rp <?= number_format($p['harga']); ?></td>
<td><?= $p['kategori']; ?></td>
<td>
    <a href="edit_produk.php?id=<?= $p['id_produk']; ?>" class="btn btn-warning btn-sm">Edit</a>
    <a href="hapus_produk.php?id=<?= $p['id_produk']; ?>" 
       class="btn btn-danger btn-sm"
       onclick="return confirm('Hapus produk ini?')">Hapus</a>
</td>
</tr>
<?php } ?>
</table>

<a href="dashboard.php" class="btn btn-secondary">← Kembali</a>
</div>

</body>
</html>
