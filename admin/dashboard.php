<?php
session_start();
include '../koneksi.php';

// 🔐 PROTEKSI ADMIN
if (!isset($_SESSION['id_user']) || $_SESSION['role'] != 'admin') {
    header("Location: ../login.php");
    exit;
}

// HITUNG JUMLAH PRODUK
$produk = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM produk"));
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Dashboard Admin | U & I Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>
body { background:#f8f9fa; }
.card-menu {
    border-radius: 18px;
    transition: 0.2s;
}
.card-menu:hover {
    transform: translateY(-5px);
}
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar bg-danger shadow-sm">
    <div class="container">
        <span class="navbar-brand fw-bold text-white">
            <i class="bi bi-shield-lock-fill me-2"></i>Admin Dashboard
        </span>
        <a href="../logout.php" class="btn btn-light btn-sm rounded-pill">
            Logout
        </a>
    </div>
</nav>

<div class="container mt-5">

<h3 class="fw-bold text-danger mb-4">
    Selamat datang, <?= $_SESSION['username']; ?> 👋
</h3>

<div class="row g-4">

    <!-- PRODUK -->
    <div class="col-md-4">
        <div class="card shadow-sm border-0 card-menu">
            <div class="card-body text-center">
                <i class="bi bi-box-seam text-danger fs-1"></i>
                <h5 class="mt-3 fw-bold">Produk</h5>
                <p class="text-muted mb-2">
                    Total Produk: <b><?= $produk; ?></b>
                </p>
                <a href="produk.php" class="btn btn-danger rounded-pill">
                    Kelola Produk
                </a>
            </div>
        </div>
    </div>

</div>

</div>

</body>
</html>
