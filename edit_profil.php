<?php
session_start();
include 'koneksi.php';

// Jika user belum login
if (!isset($_SESSION['username'])) {
    echo "<script>alert('Silakan login terlebih dahulu'); window.location='login.php';</script>";
    exit;
}

$username = $_SESSION['username'];

// Ambil data user
$query = "SELECT * FROM user WHERE username='$username'";
$result = $conn->query($query);
$data = $result->fetch_assoc();

// Jika tombol update ditekan
if (isset($_POST['update'])) {

    $new_username = $_POST['username'];
    $new_email    = $_POST['email'];

    // Proses upload foto
    $new_photo = $data['photo']; // default: foto lama
    if (!empty($_FILES['photo']['name'])) {

        $file = $_FILES['photo']['name'];
        $tmp  = $_FILES['photo']['tmp_name'];

        $newName = $new_username . "_" . time() . "_" . $file;

        move_uploaded_file($tmp, "uploads/" . $newName);

        $new_photo = $newName;
    }

    // Update ke database
    $update = "UPDATE user SET 
               username='$new_username',
               email='$new_email',
               photo='$new_photo'
               WHERE username='$username'";

    if ($conn->query($update)) {

        // Update session username
        $_SESSION['username'] = $new_username;

        echo "<script>alert('Profil berhasil diperbarui!'); window.location='profil.php';</script>";
    } 
    else {
        echo "<script>alert('Gagal memperbarui profil!');</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .box {
            width: 450px;
            padding: 20px;
            margin: auto;
            border-radius: 10px;
            background: #f8f8f8;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid #ddd;
        }
        input[type=text], input[type=email] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: #0275d8;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: #d9534f;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="box">
    <h2 style="text-align:center;">Edit Profil</h2>

    <!-- Foto Lama -->
    <center>
        <img src="uploads/<?= $data['photo'] ?: 'default.png'; ?>" alt="Foto Profil">
    </center>

    <form method="POST" enctype="multipart/form-data">

        <label><b>Username</b></label>
        <input type="text" name="username" value="<?= $data['username']; ?>" required>

        <label><b>Email</b></label>
        <input type="email" name="email" value="<?= $data['email']; ?>" required>

        <label><b>Foto Baru (opsional)</b></label>
        <input type="file" name="photo"><br><br>

        <button type="submit" name="update">Simpan Perubahan</button>
    </form>

    <br>
    <center>
        <a href="profil.php">Kembali ke Profil</a>
    </center>

</div>

</body>
</html>
