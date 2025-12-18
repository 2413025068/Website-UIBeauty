<?php
session_start();
include 'koneksi.php';

if (!isset($_SESSION['id_user'])) {
    header("Location: login.php");
    exit;
}

$id_user = $_SESSION['id_user'];
$nama_toko = "U & I Beauty";

$query = mysqli_query($conn, "
    SELECT * FROM orders 
    WHERE id_user='$id_user'
    ORDER BY tanggal_order DESC
");
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Pesanan Saya | <?= $nama_toko; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>
    body { background:#f8f9fa; }
    .order-card { border-radius:16px; }
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar bg-danger shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold text-white">
            <i class="bi bi-bag-heart-fill me-2"></i><?= $nama_toko; ?>
        </a>
        <a href="produk.php" class="btn btn-light btn-sm rounded-pill">
            <i class="bi bi-arrow-left"></i> Kembali ke Produk
        </a>
    </div>
</nav>

<div class="container pb-5">

<h3 class="fw-bold text-danger mb-4">
    <i class="bi bi-receipt me-2"></i>Riwayat Pesanan Saya
</h3>

<?php if (mysqli_num_rows($query) == 0) { ?>
    <div class="alert alert-warning text-center rounded-4">
        <i class="bi bi-info-circle"></i>
        Kamu belum memiliki pesanan.
    </div>
<?php } ?>

<?php while ($o = mysqli_fetch_assoc($query)) { ?>

<div class="card shadow-sm border-0 mb-4 order-card">
    <div class="card-body">

        <div class="d-flex justify-content-between align-items-center mb-2">
            <span class="badge bg-danger rounded-pill px-3">
                Order #<?= $o['id_order']; ?>
            </span>
            <small class="text-muted">
                <?= date('d M Y, H:i', strtotime($o['tanggal_order'])); ?>
            </small>
        </div>

        <p class="fw-bold mb-1">Total Pembayaran:</p>
        <h5 class="text-success fw-bold">
            Rp <?= number_format($o['total'], 0, ',', '.'); ?>
        </h5>

        <hr>

        <p class="fw-bold mb-3">Detail Produk:</p>

        <?php
      $detail = mysqli_query($conn, "
    SELECT 
        od.jumlah,
        od.harga,
        (od.jumlah * od.harga) AS subtotal,
        p.nama_produk,
        p.gambar
    FROM order_detail od
    JOIN produk p ON od.id_produk = p.id_produk
    WHERE od.id_order='{$o['id_order']}'
");

        ?>

        <ul class="list-group list-group-flush">
        <?php while ($d = mysqli_fetch_assoc($detail)) { ?>
            <li class="list-group-item d-flex align-items-center gap-3">

                <!-- GAMBAR -->
                <img src="img/<?= $d['gambar']; ?>" 
                     width="70" height="70"
                     class="rounded shadow-sm"
                     style="object-fit:cover;">

                <!-- INFO -->
                <div class="flex-grow-1">
                    <div class="fw-bold"><?= $d['nama_produk']; ?></div>
                    <small class="text-muted">
                        <?= $d['jumlah']; ?> x Rp <?= number_format($d['harga'],0,',','.'); ?>
                    </small>
                </div>

                <!-- SUBTOTAL -->
                <span class="fw-bold text-danger">
                    Rp <?= number_format($d['subtotal'],0,',','.'); ?>
                </span>

            </li>
        <?php } ?>
        </ul>

    </div>
</div>

<?php } ?>

</div>

</body>
</html>
