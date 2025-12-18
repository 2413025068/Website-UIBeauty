-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 18 Des 2025 pada 00.35
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
(44, 18, '2025-12-17 14:19:14', 429000.00, NULL);

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
  `harga` decimal(10,2) DEFAULT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id_detail`, `id_order`, `id_produk`, `nama_produk`, `jumlah`, `harga`, `subtotal`) VALUES
(1, 44, NULL, 'Eyeliner Dior', 1, 429000.00, 429000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` int(255) NOT NULL,
  `jumlah` int(255) NOT NULL,
  `total` int(255) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `password` varchar(100) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `photo`, `email`, `username`, `password`, `role`) VALUES
(3, '', 'anin@gmail.com', 'ninin', '$2y$10$xrlIgYHk1YP6wWnbKOHZYOOFqix8lJWkCxE2P.u.jmA', 'user'),
(4, '', 'kkkkkkkk@gmail.com', 'NNN', '$2y$10$lUWltpQ6/jJRJWBJSfja5ey3uahXKGw0xrX31CV7dKS', 'user'),
(7, '', 'azizahidayah13@gmail.com', 'azizah', '$2y$10$poXUCdUmFOL958J4fUQr2OCrx.0Wfz55RhpjerEuDW6', 'user'),
(9, '', 'anin@gmail.com', 'anine', '$2y$10$kmUII0daupc/JlZx1h3/qOtu/99D0wQByH8wC7QMkMg', 'user'),
(10, '', 'isnayabelummandi@gmail.com', 'naya', '$2y$10$E9QrHgFUS9EKkspa6sWkDOf9N6r3NdlDkgEP1w7OWR6', 'user'),
(11, '', 'dianwwgwgw@gmail.com', 'sekar', '$2y$10$PDZvTKTla2LnSg3TFWF2vOtbp/2l/wXNBzhp5RF9gi6', 'user'),
(12, '', 'nayacantik@gmail.com', 'naya', '$2y$10$oK//q4WAu1ScYpxXEAX0z.Xqpp1ABsTFLjaayRORj07', 'user'),
(14, '', 'aaaaaaaaaaaaa@gmail.com', 'addin', '$2y$10$UJGURuT599ClEp6lfJHNi..AfzZOhb8anEXNWPhexik7ouKnDCdVq', 'user'),
(15, '', 'aziahhjxnhks@gmail.com', 'zozo', '$2y$10$WghrbVPr5WiRa2rrphAwy.x4BtwX46SVy2TZaLhBvfiSMthSlbxpG', 'user'),
(16, '', 'azizseee@gmail.com', 'zize', '$2y$10$yYuUika5rJisVbKh4V46EuzdKZrZ5xSHNRRIfe7hstXd7uonBdyUq', 'user'),
(17, '', 'azizah12@gmail.com', 'azizah', '$2y$10$KGiMxeVPk6KHzKgXY88DpOAjoi5SVn.pEzWmai.yqKLNtVoJkaL9G', 'user'),
(18, 'azizaaa_1765952048_pp kucing.jpg', 'azizahhhh12@gmail.com', 'azizaaa', '$2y$10$GydYZx54iVESVzz77jnnhOMIEdAtdMLShthbOj8Vo4xjMCIR9lG02', 'user'),
(19, '', 'admin@gmail.com', 'admin', '$2y$10$RshfG6srJxsDDo5TbF1WF.kWMBDbdDUsxDu0H4PGRpLiLFtKjl3X2', 'admin'),
(20, '', 'azizahidayah13@gmail.com', 'azizahhh', '$2y$10$dp6xGzykjB0B2ESLvz.z2eNDgIlXqaD9nh3XS/YqKI.ATwZ1cVr/O', 'user'),
(21, '', 'azizahidayah13@gmail.com', 'zozo', '$2y$10$2hyLhWMAz3NhUmBljR6LkONbl8U/9ElY9U1SDkcPt14gbRnWxi136', 'user');

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
  ADD PRIMARY KEY (`id_pesanan`);

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
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
