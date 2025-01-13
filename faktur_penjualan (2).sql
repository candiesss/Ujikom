-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2025 pada 09.00
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faktur_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `perusahaan_cust` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `perusahaan_cust`, `alamat`) VALUES
(1, 'Cahyadi', 'PT. Sejahtera Abadi', 'Jl. Sejahtera No. 1, Jakarta'),
(2, 'Jaya Saputra', 'CV. Maju Jaya', 'Jl. Maju No. 2, Surabaya'),
(3, 'Kurniaman', 'Toko Kurnia', 'Jl. Kurnia No. 3, Bandung'),
(4, 'Sri Rejeki', 'UD. Sumber Rejeki', 'Jl. Sumber No. 4, Medan'),
(5, 'Rizkya', 'Toko Harapana', 'Jl. Harapan No. 5, Yogyakartaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_faktur`
--

CREATE TABLE `detail_faktur` (
  `id_produk` int(11) NOT NULL,
  `no_faktur` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_faktur`
--

INSERT INTO `detail_faktur` (`id_produk`, `no_faktur`, `qty`, `price`) VALUES
(1, 'F001', 1, '12000000.00'),
(1, 'F004', 2, '12000000.00'),
(1, 'f12', 10, '1000.00'),
(2, 'F001', 1, '8500000.00'),
(2, 'F005', 2, '8500000.00'),
(2, 'f12', 20, '3000.00'),
(3, 'F002', 3, '1500000.00'),
(3, 'F003', 2, '1500000.00'),
(4, 'F002', 2, '250000.00'),
(4, 'F004', 1, '250000.00'),
(5, 'F003', 2, '3000000.00'),
(5, 'F005', 1, '3000000.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktur`
--

CREATE TABLE `faktur` (
  `no_faktur` varchar(50) NOT NULL,
  `tgl_faktur` date NOT NULL,
  `due_date` date NOT NULL,
  `metode_bayar` varchar(50) NOT NULL,
  `ppn` decimal(10,2) NOT NULL,
  `dp` decimal(10,2) NOT NULL,
  `grand_total` decimal(15,2) NOT NULL,
  `user` varchar(100) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_perusahaan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `faktur`
--

INSERT INTO `faktur` (`no_faktur`, `tgl_faktur`, `due_date`, `metode_bayar`, `ppn`, `dp`, `grand_total`, `user`, `id_customer`, `id_perusahaan`) VALUES
('F001', '2025-01-10', '2025-01-20', 'Transfer Bank', '1500000.00', '2000000.00', '16000000.00', 'admin', 1, 1),
('F002', '2025-01-11', '2025-01-21', 'Tunai', '500000.00', '1000000.00', '9500000.00', 'admin', 2, 2),
('F003', '2025-01-12', '2025-01-22', 'Transfer Bank', '200000.00', '500000.00', '3200000.00', 'admin', 3, 3),
('F004', '2025-01-13', '2025-01-23', 'Transfer Bank', '300000.00', '1500000.00', '5000000.00', 'admin', 4, 4),
('F005', '2025-01-14', '2025-01-24', 'Tunai', '800000.00', '1200000.00', '10000000.00', 'admin', 5, 5),
('f12', '2121-12-12', '2121-12-21', 'Tunai', '7000.00', '0.00', '77000.00', '', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `alamat`, `no_telp`, `fax`) VALUES
(1, 'Jl. Raya No. 10, Jakarta', '021-12345678', '021-12345679'),
(2, 'Jl. Merdeka No. 20, Bandung', '022-98765432', '022-98765433'),
(3, 'Jl. Sudirman No. 30, Surabaya', '031-11122334', '031-11122335'),
(4, 'Jl. Pahlawan No. 5, Medan', '061-33445566', '061-33445567'),
(5, 'Jl. Pemuda No. 12, Yogyakarta', '555554', '1333334');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `price`, `jenis`, `stock`) VALUES
(1, 'Laptop ASUS', '12000000.00', 'Elektronik', 10),
(2, 'Kulkas Samsung', '8500000.00', 'Elektronik', 5),
(3, 'Meja Kayu', '1500000.00', 'Furnitur', 20),
(4, 'Lampu LED', '250000.00', 'Elektronik', 50),
(5, 'Ponsel Xiaomii', '1111110.00', 'Elektronik', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat_user` varchar(255) DEFAULT NULL,
  `telp_user` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `jenis_kelamin`, `alamat_user`, `telp_user`, `email`) VALUES
(3, 'yunita', '$2y$10$JCdpx0rPUBAJmyCEtUwJbOPQpNoxOvoNCcZosNOJfsbsIUxvIPa..', 'Yunita', 'Perempuan', 'Jl. Tulip no. 2, Bogor', '089646608598', 'yunita@example.com'),
(4, 'irgi', '$2y$10$HeoKjOgjKvlJDWwcdhwByecxd6SgNh4g5pPji7sNsd2z42EF9Es6O', 'Irgi Alghitraf', 'Laki-laki', 'Jl. Kamboja No. 4', '089652456953', 'irgial@example.com'),
(5, 'ina', '$2y$10$Uq62yTJsUs.8q3tFXSo0w.DNzsFxQVRIJRPdXAVaTNRPZnIAL3Jaq', 'Ina Yustriana Sari', 'Perempuan', 'Jl. Anggrek no. 3', '082138128123', 'ina@example.com'),
(6, 'andre', '$2y$10$0ZbQkkZoUhwyl3XwgcjEkOPlY2yWScFUgj9j3w/FlyZtkA6hv2cIG', 'Andre Farhan Saputra', 'Laki-laki', 'Jl. Matahari No. 19, Bekasi', '087733932416', 'andre@example.com'),
(7, 'tsar', '$2y$10$oghsmGSXaEn5535DwFUEQe6BF7BnU/pp3.W.BPeIa8KOXwv0prlmu', 'Tsar', 'Laki-laki', 'tsar', '12', 'tsar');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `detail_faktur`
--
ALTER TABLE `detail_faktur`
  ADD PRIMARY KEY (`id_produk`,`no_faktur`),
  ADD KEY `no_faktur` (`no_faktur`);

--
-- Indeks untuk tabel `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`no_faktur`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_perusahaan` (`id_perusahaan`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_faktur`
--
ALTER TABLE `detail_faktur`
  ADD CONSTRAINT `detail_faktur_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `detail_faktur_ibfk_2` FOREIGN KEY (`no_faktur`) REFERENCES `faktur` (`no_faktur`);

--
-- Ketidakleluasaan untuk tabel `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `faktur_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `faktur_ibfk_2` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
