-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30 Sep 2020 pada 15.23
-- Versi Server: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Compass Gazelle Low Blue Sky', 'Sepatu', 'Pakaian Pria', 300000, 9, 'sepatu_compass.jpg'),
(2, 'Roughneck Bomber Gotta Fight', 'Bomber Jacket', 'Pakaian Pria', 200000, 18, 'roughneck.jpg'),
(3, 'Rucas Classic Biker', 'Jeans', 'Pakaian Pria', 300000, 30, 'rucas.jpg'),
(4, 'Maternal Disaster Seragam SMA', 'Kemeja', 'Pakaian Pria', 179000, 40, 'seragam_sma.jpg'),
(5, 'Erigo Coach Your Mind Black', 'Coach Jacket', 'Pakaian Pria', 185000, 50, 'jacket.jpg'),
(6, 'Apple AirPods Pro', 'TWS', 'Elektronik', 3000000, 60, 'MWP22.jpg'),
(8, 'Samsung Galaxy Buds Live', 'TWS', 'Elektronik', 2600000, 70, 'Samsung-Galaxy-Buds-Live-1.jpg'),
(9, 'Ipad Pro ', 'Ipad Pro 11" Grey 128GB', 'Elektronik', 31500000, 80, 'apple_my232ll_a_11_ipad_pro_early_1553824.jpg'),
(10, 'Kebaya Jasmine', 'Atasan Kebaya Modern ', 'Pakaian Wanita', 146000, 90, '24660395_B.jpg'),
(12, 'Dumbbell Hexagonal', 'Dumbbell Besi 5 KG', 'Peralatan Olahraga', 200000, 110, '42331056-1-f.jpg'),
(13, 'Piama Baju Tidur', 'Piama Baju Tidur Anak Laki-Laki', 'Pakaian Anak_anak', 46000, 100, 'piyama-baju-tidur-anak-laki-laki-lengan-panjang-tsum-tsum-woffi-biru-08115734198-small1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(4, 'Aan Taufiqur Rochman', 'Jl Lebak 010101', '2020-09-16 13:32:01', '2020-09-17 13:32:01'),
(5, '', '', '2020-09-17 19:47:35', '2020-09-18 19:47:35'),
(6, '', '', '2020-09-17 19:48:18', '2020-09-18 19:48:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 2, 5, 'Erigo Coach Your Mind Black', 1, 185000, ''),
(2, 2, 3, 'Rucas Classic Biker', 1, 300000, ''),
(3, 2, 2, 'Roughneck Bomber Gotta Fight', 1, 200000, ''),
(4, 3, 5, 'Erigo Coach Your Mind Black', 1, 185000, ''),
(5, 3, 4, 'Maternal Disaster Seragam SMA', 1, 179000, ''),
(6, 4, 1, 'Compass Gazelle Low Blue Sky', 1, 300000, ''),
(7, 4, 2, 'Roughneck Bomber Gotta Fight', 1, 200000, ''),
(8, 4, 3, 'Rucas Classic Biker', 1, 300000, ''),
(9, 4, 4, 'Maternal Disaster Seragam SMA', 1, 179000, ''),
(10, 4, 5, 'Erigo Coach Your Mind Black', 1, 185000, ''),
(11, 5, 1, 'Compass Gazelle Low Blue Sky', 1, 300000, ''),
(12, 6, 2, 'Roughneck Bomber Gotta Fight', 2, 200000, '');

--
-- Trigger `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN 
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', '123', 2),
(4, 'aan', 'atrkings', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
