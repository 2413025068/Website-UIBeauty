<?php
session_start();
include 'koneksi.php';

if (isset($_POST['login'])) {

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query  = "SELECT * FROM user WHERE username='$username'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {

        $data = mysqli_fetch_assoc($result);

        if (password_verify($password, $data['password'])) {

            $_SESSION['id_user']  = $data['id_user'];
            $_SESSION['username'] = $data['username'];
            $_SESSION['role']     = $data['role'];

            // 🔀 REDIRECT SESUAI ROLE
            if ($data['role'] == 'admin') {
                header("Location: admin/dashboard.php");
            } else {
                header("Location: produk.php");
            }
            exit;

        } else {
            echo "<script>alert('Password salah!');</script>";
        }

    } else {
        echo "<script>alert('Username tidak ditemukan!');</script>";
    }
}
$nama_toko = "U & I Beauty";
$tahun = date("Y");
?>


<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - <?= $nama_toko; ?></title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body
class="min-vh-100 d-flex align-items-center justify-content-center"
style="
background:
linear-gradient(rgba(255,182,193,0.8), rgba(255,192,203,0.9)),
url('https://images.unsplash.com/photo-1611162616475-46b635cb6868?auto=format&fit=crop&w=1200&q=80')
center/cover no-repeat;
">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="card shadow-lg border-0 rounded-4 p-4">
                <div class="text-center mb-4">
                    <h3 class="fw-bold" style="color:#e91e63;">
                        <?= $nama_toko; ?>
                    </h3>
                    <p class="text-muted mb-0">
                        Silakan login untuk melanjutkan
                    </p>
                </div>

                <form method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-medium">Username</label>
                        <input type="text" name="username"
                               class="form-control form-control-lg rounded-pill"
                               placeholder="Masukkan username" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-medium">Kata Sandi</label>
                        <input type="password" name="password"
                               class="form-control form-control-lg rounded-pill"
                               placeholder="Masukkan password" required>
                    </div>

                    <button type="submit" name="login"
                            class="btn btn-lg w-100 rounded-pill fw-bold text-white"
                            style="background-color:#e91e63;">
                        Login
                    </button>
                </form>

                <div class="text-center mt-3">
                    <a href="register.php" class="text-decoration-none fw-medium" style="color:#e91e63;">
                        Belum punya akun? Daftar
                    </a><br>
                    <a href="produk.php" class="text-decoration-none fw-medium" style="color:#e91e63;">
                        Kembali ke Beranda
                    </a>
                </div>

            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
