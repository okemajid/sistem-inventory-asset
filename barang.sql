-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14 Mei 2022 pada 09.40
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `id_transaksi`, `tanggal`, `kode_barang`, `nama_barang`, `jumlah`, `tujuan`, `satuan`) VALUES
(1, 'SJ-21220', '2022-05-15', 'NI-IG-70225', 'Nitrogen', '1', 'PT SUG', 'Tabung'),
(2, 'SJ-0522001', '2022-05-14', 'OK-Med-62213', 'Oksigen', '1', 'RS PERMATA', '');

--
-- Trigger `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `barang_keluar` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
	UPDATE gudang1 SET jumlah = jumlah-new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `pengirim` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `id_transaksi`, `tanggal`, `kode_barang`, `nama_barang`, `pengirim`, `jumlah`, `satuan`) VALUES
(2, 'TTBK-31213', '2022-05-16', 'NI-IG-70225', 'Nitrogen', 'PT SUG', '1', 'Tabung'),
(3, 'TTBK-0522014', '2022-05-14', 'OK-Med-62213', 'Oksigen', 'RS PERMATA', '1', '');

--
-- Trigger `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `barang_masuk` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE gudang1 SET jumlah = jumlah+new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `jumlah` varchar(250) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gudang`
--

INSERT INTO `gudang` (`id`, `kode_barang`, `nama_barang`, `jenis_barang`, `jumlah`, `satuan`) VALUES
(2, 'NI-IG-70225', 'Nitrogen', 'Tabung', '1', 'Tabung'),
(3, 'OK-Med-62213', 'Oksigen', 'Tabung', '1', 'Tabung'),
(4, 'NI-IG-60224', 'Nitrogen', 'Tabung', '1', 'Tabung'),
(5, 'OK-NM-62341', 'Oksigen', 'Tabung', '1', 'Tabung'),
(6, 'UT-63102', 'Udara Tekan', 'Tabung', '1', 'Tabung'),
(7, 'CO-20-3120', 'Karbondioksida', 'Tabung', '1', 'Tabung'),
(8, 'AC-2021', 'Acytylene', 'Tabung', '1', 'Tabung'),
(9, 'AR-IG-61254', 'Argon', 'Tabung', '1', 'Tabung'),
(10, 'AR-UHP-71234', 'Argon', 'Tabung', '1', 'Tabung'),
(11, 'HI-IG-65421', 'Hidrogen', 'Tabung', '1', 'Tabung'),
(12, 'NI-UHP-63476', 'Nitrogen', 'Tabung', '1', 'Tabung'),
(13, 'VGL-LOX-175-2354', 'VGL LOX', 'Gas', '1', 'Tabung'),
(14, 'VGL-LIN-210-110', 'VGL LIN', 'Tabung', '1', 'Tabung'),
(15, 'AM-50-1234', 'Amoniak', 'Tabung', '1', 'Tabung'),
(16, 'MG-Armix-76210', 'Mix Gas Armix', 'Tabung', '1', 'Tabung'),
(17, 'MG-Arnite-63244', 'Mix Gas Arnite', 'Tabung', '1', 'Tabung'),
(18, 'CR-OK-1111', 'Cradle Oksigen', 'Tabung', '1', 'Tabung'),
(19, 'CR-NI-IG-1234', 'Cradle Nitrogen', 'Tabung', '1', 'Tabung'),
(20, 'LPG-50-1123', 'LPG 50 Kg', 'Gas', '1', 'Tabung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id` int(100) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id`, `jenis_barang`) VALUES
(1, 'Tabung'),
(2, 'Gas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id` int(11) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id`, `jenis_barang`) VALUES
(5, 'Makanan'),
(6, 'Minuman'),
(7, 'Obat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `satuan`) VALUES
(5, 'Unit'),
(7, 'PCS'),
(8, 'Pack'),
(9, 'Kg'),
(10, 'Butir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_relasi`
--

CREATE TABLE `tb_relasi` (
  `id` int(100) NOT NULL,
  `kode_supplier` varchar(100) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_relasi`
--

INSERT INTO `tb_relasi` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `telepon`, `nama_barang`, `jumlah`) VALUES
(1, 'Rel-2132', 'PT SUG', 'CIKARANG', '083827969146', 'Nitrogen', '1'),
(2, 'Rel-013245', 'RS PERMATA', 'CIKARANG', '628212234512', 'Oksigen', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_satuan`
--

CREATE TABLE `tb_satuan` (
  `id` int(100) NOT NULL,
  `kode_satuan` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_satuan`
--

INSERT INTO `tb_satuan` (`id`, `kode_satuan`, `satuan`) VALUES
(1, 'ST-TBG', 'Tabung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(100) NOT NULL,
  `kode_supplier` varchar(100) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(10, 'SUP-1219001', 'PT Sahabat Utama', 'Jakarta Barat', '085546982020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(25) NOT NULL DEFAULT 'member',
  `foto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `alamat`, `telepon`, `username`, `password`, `level`, `foto`) VALUES
(26, '413242', 'Majid Aminurdin', '', '085624352346', 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', 'superadmin', 'IMG-20210912-WA0012.jpg'),
(28, '21331', 'Majid Aminurdin1', '', '083827969146', 'Admin', '014dc986fb514c2d500c6c94e0f111ef', 'admin', 'IMG-20210912-WA0012.jpg'),
(29, '213331', 'Nazril', '', '628212234512', 'petugas', 'b53fe7751b37e40ff34d012c7774d65f', 'petugas', 'teacher4.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_relasi`
--
ALTER TABLE `tb_relasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tb_relasi`
--
ALTER TABLE `tb_relasi`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
