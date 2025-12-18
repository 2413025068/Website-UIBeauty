-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 17 Des 2025 pada 02.07
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_projectu&i`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tanggal_order` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id_order`, `id_user`, `tanggal_order`, `total`, `status`) VALUES
(25, 16, '2025-12-13 14:59:07', 70000.00, NULL),
(26, 16, '2025-12-13 14:59:51', 139000.00, NULL),
(27, 16, '2025-12-13 15:00:48', 140000.00, NULL),
(28, 16, '2025-12-13 15:01:16', 100000.00, NULL),
(29, 16, '2025-12-13 15:03:29', 89000.00, NULL),
(30, 16, '2025-12-13 15:32:20', 89000.00, NULL),
(31, 16, '2025-12-13 15:32:28', 89000.00, NULL),
(32, 16, '2025-12-13 15:39:40', 89000.00, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id_detail` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `jumlah` int(255) NOT NULL,
  `total` int(255) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `nama_produk`, `harga`, `jumlah`, `total`, `tanggal`) VALUES
(1, 'Two Way Cake Glad2Glow', 89000, 1, 89000, '2025-12-07 09:14:14'),
(2, 'Two Way Cake Glad2Glow', 89000, 1, 89000, '2025-12-07 09:14:19'),
(3, 'Two Way Cake Glad2Glow', 89000, 1, 89000, '2025-12-07 09:23:27'),
(4, 'Blush On Barrenblis', 70000, 1, 70000, '2025-12-07 09:23:39'),
(5, 'Blush On Barrenblis', 70000, 1, 70000, '2025-12-07 09:26:18'),
(6, 'Face Wash Skintific', 139000, 1, 139000, '2025-12-07 09:28:17'),
(7, 'Face Wash Skintific', 139000, 1, 139000, '2025-12-07 09:29:19'),
(8, 'Face Wash Skintific', 139000, 1, 139000, '2025-12-07 09:29:21'),
(9, 'Blush On Barrenblis', 70000, 1, 70000, '2025-12-07 09:35:03'),
(10, 'Blush On Barrenblis', 70000, 1, 70000, '2025-12-07 09:36:31'),
(11, 'Blush On Barrenblis', 70000, 1, 70000, '2025-12-07 09:38:00'),
(12, 'Blush On Barrenblis', 70000, 2, 140000, '2025-12-07 09:38:15'),
(13, 'Blush On Barrenblis', 70000, 2, 140000, '2025-12-07 09:39:06'),
(14, 'Mascara Maybelline', 100000, 1, 100000, '2025-12-07 09:39:19'),
(15, 'Face Wash Skintific', 139000, 1, 139000, '2025-12-07 10:10:05'),
(16, 'Lipstick  Matte Maybelline', 140000, 1, 140000, '2025-12-13 06:39:56'),
(17, 'Serum Anua', 300000, 1, 300000, '2025-12-13 06:40:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(150) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `kategori` enum('Makeup','Skincare') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `gambar`, `kategori`) VALUES
(5, 'Lipstick Matte Maybelline', 140000, 'lipstick.jpg', 'Makeup'),
(6, 'Foundation Maybelline', 175000, 'foundation.jpg', 'Makeup'),
(7, 'Two Way Cake Glad2Glow', 89000, 'TWC.jpg', 'Makeup'),
(8, 'Blush On Barrenblis', 70000, 'blushon.jpg', 'Makeup'),
(9, 'Mascara Maybelline', 100000, 'mascara.jpg', 'Makeup'),
(10, 'Eyeliner Dior', 429000, 'eyeliner.jpg', 'Makeup'),
(11, 'Toner CosRX', 200000, 'toner.jpg', 'Skincare'),
(12, 'Serum Anua', 300000, 'serum.jpg', 'Skincare'),
(13, 'Moisturizer Skintific', 125000, 'moist.jpg', 'Skincare'),
(14, 'Face Wash Skintific', 139000, 'fw.jpg', 'Skincare'),
(15, 'Sunscreen Facetology', 90000, 'sunscreen.jpg', 'Skincare'),
(16, 'Masker Glad2Glow', 30000, 'masker.jpg', 'Skincare');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `photo`, `email`, `username`, `password`) VALUES
(3, '', 'anin@gmail.com', 'ninin', '$2y$10$xrlIgYHk1YP6wWnbKOHZYOOFqix8lJWkCxE2P.u.jmA'),
(4, '', 'kkkkkkkk@gmail.com', 'NNN', '$2y$10$lUWltpQ6/jJRJWBJSfja5ey3uahXKGw0xrX31CV7dKS'),
(7, '', 'azizahidayah13@gmail.com', 'azizah', '$2y$10$poXUCdUmFOL958J4fUQr2OCrx.0Wfz55RhpjerEuDW6'),
(9, '', 'anin@gmail.com', 'anine', '$2y$10$kmUII0daupc/JlZx1h3/qOtu/99D0wQByH8wC7QMkMg'),
(10, '', 'isnayabelummandi@gmail.com', 'naya', '$2y$10$E9QrHgFUS9EKkspa6sWkDOf9N6r3NdlDkgEP1w7OWR6'),
(11, '', 'dianwwgwgw@gmail.com', 'sekar', '$2y$10$PDZvTKTla2LnSg3TFWF2vOtbp/2l/wXNBzhp5RF9gi6'),
(12, '', 'nayacantik@gmail.com', 'naya', '$2y$10$oK//q4WAu1ScYpxXEAX0z.Xqpp1ABsTFLjaayRORj07'),
(13, 'nopal_1765179863_ada.jpg.jpg', 'ajjajjaja@gmail.com', 'imeh', '$2y$10$7spQgffzm/Yd0wuDrOzbTeuYe1NbHGO.NBTt/92SqOhn6YeJoFTGy'),
(14, '', 'aaaaaaaaaaaaa@gmail.com', 'addin', '$2y$10$UJGURuT599ClEp6lfJHNi..AfzZOhb8anEXNWPhexik7ouKnDCdVq'),
(15, '', 'aziahhjxnhks@gmail.com', 'zozo', '$2y$10$WghrbVPr5WiRa2rrphAwy.x4BtwX46SVy2TZaLhBvfiSMthSlbxpG'),
(16, '', 'azizseee@gmail.com', 'zize', '$2y$10$yYuUika5rJisVbKh4V46EuzdKZrZ5xSHNRRIfe7hstXd7uonBdyUq'),
(17, '', 'azizah12@gmail.com', 'azizah', '$2y$10$KGiMxeVPk6KHzKgXY88DpOAjoi5SVn.pEzWmai.yqKLNtVoJkaL9G'),
(18, '', 'azizahhhh12@gmail.com', 'azizaaa', '$2y$10$GydYZx54iVESVzz77jnnhOMIEdAtdMLShthbOj8Vo4xjMCIR9lG02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
