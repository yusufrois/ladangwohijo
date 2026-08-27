-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2022 at 07:51 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ghinamart`
--

-- --------------------------------------------------------

--
-- Table structure for table `mp_banks`
--

CREATE TABLE `mp_banks` (
  `id` int(11) NOT NULL,
  `bankname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `branch` varchar(100) CHARACTER SET latin1 NOT NULL,
  `branchcode` varchar(100) CHARACTER SET latin1 NOT NULL,
  `title` varchar(100) CHARACTER SET latin1 NOT NULL,
  `accountno` varchar(100) CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_banks`
--

INSERT INTO `mp_banks` (`id`, `bankname`, `branch`, `branchcode`, `title`, `accountno`, `status`) VALUES
(1, 'Bank Central Asia', 'Karawang', '23567', 'PT. SiAP System', '12345678910', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_bank_opening`
--

CREATE TABLE `mp_bank_opening` (
  `id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `bank_id` int(11) NOT NULL,
  `amount` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_bank_transaction`
--

CREATE TABLE `mp_bank_transaction` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `payee_id` int(11) NOT NULL,
  `method` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cheque_amount` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ref_no` varchar(100) CHARACTER SET latin1 NOT NULL,
  `transaction_status` int(1) NOT NULL,
  `transaction_type` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_bank_transaction`
--

INSERT INTO `mp_bank_transaction` (`id`, `transaction_id`, `bank_id`, `payee_id`, `method`, `cheque_amount`, `ref_no`, `transaction_status`, `transaction_type`) VALUES
(3, 243, 1, 18, 'Cash', '1000000', '', 0, 'recieved'),
(4, 244, 1, 18, 'Cheque', '500000', '12345678', 0, 'paid'),
(5, 245, 1, 4, 'Cheque', '0', '98099', 1, 'paid'),
(6, 249, 1, 18, 'Cheque', '900000', '1234', 1, 'paid'),
(7, 250, 1, 18, 'Cheque', '50000', '50000', 1, 'paid'),
(8, 251, 1, 18, 'Cheque', '5000', '500009', 1, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `mp_barcode`
--

CREATE TABLE `mp_barcode` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `random_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` longtext CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_barcode`
--

INSERT INTO `mp_barcode` (`id`, `barcode`, `random_no`, `description`) VALUES
(3, 'A8FR250-Fan Regulator', 'J220H000051', 'sdad'),
(4, 'aaaaaaaa', '4073127917', 'hhh'),
(6, 'NEO RHEUMACYL 20 TABLET', '8817103623', ''),
(7, 'BODREX TAB LAPIS DUA 20 TABLET', '9078129874', '');

-- --------------------------------------------------------

--
-- Table structure for table `mp_brand`
--

CREATE TABLE `mp_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_brand`
--

INSERT INTO `mp_brand` (`id`, `name`) VALUES
(1, 'Merk A'),
(2, 'Merk B'),
(3, 'Merk C'),
(4, 'Merk D'),
(5, 'Merk E');

-- --------------------------------------------------------

--
-- Table structure for table `mp_brand_sector`
--

CREATE TABLE `mp_brand_sector` (
  `id` int(11) NOT NULL,
  `sector` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_brand_sector`
--

INSERT INTO `mp_brand_sector` (`id`, `sector`, `created`, `updated`) VALUES
(1, 'Merk Minuman Segar', '2018-05-28', '2019-07-27'),
(2, 'Merk Obat dan Kesehatan', '2018-05-29', '2019-07-27'),
(3, 'Merk Kosmetik dan Skincare', '2018-05-29', '2019-07-27'),
(4, 'Merk Pembersih Rumah Tangga', '2018-05-29', '2019-07-27'),
(5, 'Merk Rokok', '2018-06-04', '2019-07-27'),
(6, 'Merk Makanan dan Snack', '2018-07-05', '2019-07-27');

-- --------------------------------------------------------

--
-- Table structure for table `mp_buy`
--

CREATE TABLE `mp_buy` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `mg` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_buy`
--

INSERT INTO `mp_buy` (`id`, `product_id`, `product_no`, `order_id`, `product_name`, `mg`, `price`, `purchase`, `qty`, `tax`) VALUES
(1, 1375, '', 1, 'NEO RHEUMACYL 20 TABLET', 1, '4000.00', '3400.00', 100, '0.00'),
(2, 1416, '123456', 2, 'kopi kenangan', 100, '60000.00', '45000.00', 12, '0.00'),
(3, 1379, '', 2, 'VIDORAN SYRUP RS JERUK 225ML', 1, '20000.00', '18000.00', 1, '0.00'),
(4, 1376, '', 3, 'BODREX TAB LAPIS DUA 20 TABLET', 1, '4500.00', '3000.00', 1, '0.00'),
(5, 1417, '1980', 4, 'criping', 11, '2500.00', '0.00', 1, '0.00'),
(6, 1417, '1980', 4, 'criping', 11, '2500.00', '0.00', 1, '0.00'),
(7, 1418, '123456', 4, 'tape', 10, '5500.00', '4500.00', 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `mp_category`
--

CREATE TABLE `mp_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `register_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `added_by` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_category`
--

INSERT INTO `mp_category` (`id`, `category_name`, `description`, `register_date`, `status`, `added_by`) VALUES
(1, 'Alat Mandi', 'Alat Mandi', '2019-07-27', 0, 'Supper Admin'),
(2, 'Kosmetik', 'Kosmetik', '2019-07-27', 0, 'Supper Admin'),
(3, 'Minuman', 'Minuman', '2019-07-27', 0, 'Supper Admin'),
(4, 'Obat', 'Obat', '2019-07-27', 0, 'Supper Admin'),
(5, 'Parfum', 'Parfum', '2019-07-27', 0, 'Supper Admin'),
(6, 'Pembersih', 'Pembersih', '2019-07-27', 0, 'Supper Admin'),
(7, 'Rokok', 'Rokok', '2019-07-27', 0, 'Supper Admin'),
(8, 'Sembako', 'Sembako', '2019-07-27', 0, 'Supper Admin'),
(9, 'Skincare', 'Skincare', '2019-07-27', 0, 'Supper Admin'),
(10, 'Snack', 'Snack', '2019-07-27', 0, 'Supper Admin'),
(11, 'Suplemen', 'Suplemen', '2019-07-27', 0, 'Supper Admin');

-- --------------------------------------------------------

--
-- Table structure for table `mp_contactabout`
--

CREATE TABLE `mp_contactabout` (
  `id` int(11) NOT NULL,
  `contact_title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `contact_description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone_number` varchar(255) CHARACTER SET latin1 NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `facebook` varchar(255) CHARACTER SET latin1 NOT NULL,
  `twitter` varchar(255) CHARACTER SET latin1 NOT NULL,
  `linked` varchar(255) CHARACTER SET latin1 NOT NULL,
  `googleplus` varchar(255) CHARACTER SET latin1 NOT NULL,
  `about_title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `about_quotation` varchar(255) CHARACTER SET latin1 NOT NULL,
  `about_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `about_title2` varchar(255) CHARACTER SET latin1 NOT NULL,
  `about_description` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_contactabout`
--

INSERT INTO `mp_contactabout` (`id`, `contact_title`, `contact_description`, `phone_number`, `address`, `email`, `facebook`, `twitter`, `linked`, `googleplus`, `about_title`, `about_quotation`, `about_name`, `about_title2`, `about_description`) VALUES
(1, 'Contact Us', 'Tangail Marcel', '01715932630', 'Karawang', 'pos@gmail.com', 'pos@gmail.com', 'rumahit_id', 'rumahit_id', 'rumah_it', '« Lorem Ipsum is simply dummy text of the printing  »', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.p;#039;s standard dummy text ever since the 1500s, when an unknown printer took a ga', '— Medix Pharmacy', 'About Us', 'Praesent convallis tortor et enim laoreet, vel consectetur purus latoque penatibus et dis parturient.');

-- --------------------------------------------------------

--
-- Table structure for table `mp_customer_payments`
--

CREATE TABLE `mp_customer_payments` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `method` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agentname` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_customer_payments`
--

INSERT INTO `mp_customer_payments` (`id`, `transaction_id`, `customer_id`, `amount`, `method`, `date`, `description`, `agentname`) VALUES
(1, 275, 1, '100000.00', '26', '2022-08-20', 'cek coba', 'Supper Admin');

-- --------------------------------------------------------

--
-- Table structure for table `mp_drivers`
--

CREATE TABLE `mp_drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `contact` varchar(15) CHARACTER SET latin1 NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lisence` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ref` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `cus_picture` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_drivers`
--

INSERT INTO `mp_drivers` (`id`, `name`, `contact`, `address`, `lisence`, `ref`, `date`, `cus_picture`, `status`) VALUES
(2, 'gfsdf', '568', 'gdfgds', '63863', 'grt', '2018-07-05', 'default.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_expense`
--

CREATE TABLE `mp_expense` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `head_id` int(11) NOT NULL,
  `total_bill` varchar(255) CHARACTER SET latin1 NOT NULL,
  `total_paid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `user` varchar(255) CHARACTER SET latin1 NOT NULL,
  `method` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` longtext CHARACTER SET latin1 NOT NULL,
  `payee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_expense`
--

INSERT INTO `mp_expense` (`id`, `transaction_id`, `head_id`, `total_bill`, `total_paid`, `date`, `user`, `method`, `description`, `payee_id`) VALUES
(1, 256, 6, '25000', '25000', '2022-07-18', 'Supper Admin', 'Cash', 'bayar lunas', 9),
(2, 276, 1, '50000', '50000', '2022-08-20', 'Supper Admin', '26', 'gaji', 17),
(3, 277, 14, '250000', '250000', '2022-08-20', 'Supper Admin', '2', 'listrik', 9),
(4, 278, 20, '25000', '25000', '2022-08-20', 'Supper Admin', '2', 'tes', 1),
(5, 279, 6, '45000', '45000', '2022-08-20', 'Supper Admin', '26', 'telfon', 17),
(6, 280, 20, '25000', '25000', '2022-08-20', 'Supper Admin', '2', 'cust tes', 9);

-- --------------------------------------------------------

--
-- Table structure for table `mp_generalentry`
--

CREATE TABLE `mp_generalentry` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT '0',
  `date` date NOT NULL,
  `naration` varchar(255) CHARACTER SET latin1 NOT NULL,
  `generated_source` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_generalentry`
--

INSERT INTO `mp_generalentry` (`id`, `customer_id`, `date`, `naration`, `generated_source`) VALUES
(198, 0, '2019-07-01', 'Modal awal perusahaan', 'Journal Voucher'),
(199, 0, '2019-07-02', 'Sewa kantor selama satu tahun', 'Journal Voucher'),
(200, 0, '2019-07-04', 'Membeli Peralatan Kantor', 'Journal Voucher'),
(201, 0, '2019-07-08', 'Pendapatan dari penjualan tunai', 'Journal Voucher'),
(202, 0, '2019-07-16', 'Gaji Karyawan bulan Juli', 'Journal Voucher'),
(203, 0, '2019-07-27', 'Transaction occured from POS', 'pos'),
(204, 0, '2019-07-27', 'Transaction occured from create purchases', 'create_purchases'),
(205, 0, '2019-07-27', 'Transaction occured from create purchases', 'create_purchases'),
(206, 0, '2019-07-27', 'Transaction occured from Supplier payments', 'supplier_payment'),
(207, 0, '2019-07-28', 'Transaction occured from POS', 'pos'),
(208, 0, '2019-07-28', 'Transaction occured from POS', 'pos'),
(209, 0, '2019-07-28', 'Transaction occured from customer payments', 'customer_payment'),
(210, 0, '2019-07-30', 'Transaction occured from POS', 'pos'),
(211, 0, '2019-07-30', 'Transaction occured from POS', 'pos'),
(212, 0, '2019-07-30', 'Transaction occured from POS', 'pos'),
(213, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(214, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(215, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(216, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(217, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(218, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(219, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(220, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(221, 0, '2019-07-31', 'Transaction occured from POS', 'pos'),
(222, 0, '2019-08-02', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(223, 0, '2019-08-02', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(224, 0, '2019-08-02', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(225, 0, '2019-08-03', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(226, 0, '2019-08-04', 'Transaction occured from expense', 'expense'),
(227, 0, '2019-08-05', 'Setoran Bank', 'deposit'),
(228, 0, '2019-08-05', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(229, 0, '2019-08-05', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(230, 0, '2019-08-05', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(231, 0, '2022-06-22', 'jurnal beban sewa', 'Journal Voucher'),
(232, 1, '2022-06-22', 'saldo awal', 'Opening balance'),
(233, 1, '2022-06-22', 'kedua', 'Opening balance'),
(234, 0, '2022-06-22', '234', 'deposit'),
(235, 1, '2022-06-22', 'saldo awal BNI', 'Opening balance'),
(236, 0, '2022-06-22', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(237, 0, '2022-06-23', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(238, 0, '2022-06-23', 'utag', 'Journal Voucher'),
(239, 0, '2022-06-28', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(240, 0, '2022-06-28', 'tgl 23', 'Journal Voucher'),
(241, 0, '2022-06-28', '23 ke2', 'Journal Voucher'),
(242, 0, '2022-06-28', 'ke3 23', 'Journal Voucher'),
(243, 0, '2022-06-28', '', 'deposit'),
(244, 0, '2022-06-28', 'saldo awal', 'cheque'),
(245, 0, '2022-06-28', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(246, 0, '2022-06-28', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(247, 0, '2022-06-28', '2306', 'Journal Voucher'),
(248, 0, '2022-06-29', 'Transaksi dilakukan dari Pembelian ke Supplier', 'create_purchases'),
(249, 0, '2022-06-29', 'saldo awal BNI 2', 'cheque'),
(250, 0, '2022-06-29', 'bni 3', 'cheque'),
(251, 0, '2022-06-29', 'bca 5000', 'cheque'),
(252, 1, '2022-07-18', 'coba pembukaan saldo', 'Opening balance'),
(253, 1, '2022-07-18', 'tes coba akun karyawan', 'Opening balance'),
(254, 1, '2022-07-18', 'kredit pakai karyawan', 'Opening balance'),
(255, 0, '2022-07-18', 'cimb pakai entri jurnal', 'Journal Voucher'),
(256, 0, '2022-07-18', 'Transaksi dilakukan dari pengeluaran / expense', 'expense'),
(257, 0, '2022-07-19', 'Transaksi dilakukan dari Pembelian ke Supplier - 2022', 'create_purchases'),
(259, 0, '2022-07-20', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(260, 0, '2022-07-28', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(261, 0, '2022-08-02', 'Transaksi dilakukan dari Retur Pembelian', 'purchases_return'),
(262, 0, '2022-08-11', 'Transaksi dilakukan dari Pembelian ke Supplier - 12345', 'create_purchases'),
(263, 0, '2022-08-11', 'Transaksi dilakukan dari Pembelian ke Supplier - 234', 'create_purchases'),
(264, 0, '2022-08-11', 'Transaksi dilakukan dari Pembelian ke Supplier - 12', 'create_purchases'),
(265, 0, '2022-08-11', 'Transaksi dilakukan dari Pembelian ke Supplier - 1', 'create_purchases'),
(266, 0, '2022-08-11', '12345', 'Journal Voucher'),
(267, 0, '2022-08-11', '123459', 'Journal Voucher'),
(268, 0, '2022-08-11', '123459', 'Journal Voucher'),
(269, 0, '2022-08-11', '123459', 'Journal Voucher'),
(270, 0, '2022-08-11', '123459', 'Journal Voucher'),
(271, 0, '2022-08-11', '234', 'Journal Voucher'),
(272, 0, '2022-08-19', 'Transaksi dilakukan dari Retur Pembelian', 'purchases_return'),
(273, 0, '2022-08-19', 'Transaksi dilakukan dari Retur Pembelian12444', 'purchases_return'),
(274, 1, '2022-08-20', 'pembukaan saldo permata', 'Opening balance'),
(275, 0, '2022-08-20', 'Transaksi dilakukan dari pembayaran Customer', 'customer_payment'),
(276, 0, '2022-08-20', 'Transaksi dilakukan dari pengeluaran / expense', 'expense'),
(277, 0, '2022-08-20', 'Transaksi dilakukan dari pengeluaran / expense', 'expense'),
(278, 0, '2022-08-20', 'Transaksi dilakukan dari pengeluaran / expense', 'expense'),
(279, 9, '2022-08-20', 'Transaksi dilakukan dari pengeluaran / expense', 'expense'),
(280, 9, '2022-08-20', 'Transaksi dilakukan dari pengeluaran / expense', 'expense'),
(281, 0, '2022-08-20', 'Transaksi dilakukan dari pembayaran ke Supplier', 'supplier_payment'),
(282, 0, '2022-08-21', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(283, 0, '2022-08-24', 'Transaksi dilakukan dari Pembelian ke Supplier - 12345', 'create_purchases'),
(284, 0, '2022-08-27', 'Transaksi dilakukan dari Pembelian ke Supplier - 123', 'create_purchases'),
(285, 0, '2022-08-27', 'Transaksi dilakukan dari Pembelian ke Supplier - 5000', 'create_purchases'),
(286, 0, '2022-08-27', 'Transaksi dilakukan dari penjualan POS', 'pos'),
(287, 0, '2022-08-28', 'Transaksi dilakukan dari Retur penjualan.', 'return_pos'),
(294, 0, '2022-08-28', 'Transaksi dilakukan dari Retur penjualan.', 'return_pos'),
(295, 0, '2022-08-28', 'Transaksi dilakukan dari Retur penjualan.', 'return_pos');

-- --------------------------------------------------------

--
-- Table structure for table `mp_head`
--

CREATE TABLE `mp_head` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nature` varchar(50) CHARACTER SET latin1 NOT NULL,
  `type` varchar(50) CHARACTER SET latin1 NOT NULL,
  `relation_id` int(11) NOT NULL,
  `expense_type` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_head`
--

INSERT INTO `mp_head` (`id`, `name`, `nature`, `type`, `relation_id`, `expense_type`) VALUES
(1, '[501] Beban Gaji', 'Expense', 'Lancar', 0, 'Beban Kas'),
(2, '[101] Kas', 'Assets', 'Lancar', 0, 'pembayaran'),
(3, '[401] Pendapatan Penjualan', 'Revenue', 'Lancar', 0, '-'),
(4, '[102] Piutang Usaha (AR)', 'Assets', 'Lancar', 0, '-'),
(5, '[201] Hutang Usaha (AP)', 'Liability', 'Lancar', 0, '-'),
(6, '[502] Beban Telepon', 'Expense', 'Lancar', 0, 'Beban Kas'),
(7, '[301] Modal Usaha', 'Equity', 'Lancar', 0, '-'),
(8, '[103] Tanah', 'Assets', 'Tetap', 0, '-'),
(9, '[104] Bangunan', 'Assets', 'Tetap', 0, '-'),
(10, '[202] Hutang Wesel', 'Liability', 'Lancar', 0, '-'),
(11, '[105] Peralatan Kantor', 'Assets', 'Lancar', 0, '-'),
(12, '[402] Pendapatan Jasa', 'Revenue', 'Lancar', 0, '-'),
(13, '[503] Beban Administrasi', 'Expense', 'Lancar', 0, 'Beban Kas'),
(14, '[504] Beban Listrik &amp; Air', 'Expense', 'Lancar', 0, 'Beban Kas'),
(15, '[505] Beban Iklan', 'Expense', 'Lancar', 0, 'Beban Kas'),
(16, '[106] Kas Bank', 'Assets', 'Lancar', 0, 'pembayaran'),
(17, '[107] Asuransi dibayar dimuka', 'Assets', 'Lancar', 0, '-'),
(18, '[108] Sewa dibayar dimuka', 'Assets', 'Lancar', 0, '-'),
(19, '[506] Beban Perlengkapan', 'Expense', 'Lancar', 0, 'Beban Kas'),
(20, '[507] Beban Bunga', 'Expense', 'Lancar', 0, 'Beban Kas'),
(21, '[109] Persediaan', 'Assets', 'Lancar', 0, '-'),
(22, '[101.1] Bank BNI', 'Assets', 'Lancar', 0, 'pembayaran'),
(23, '[101.2] Bank Mandiri', 'Assets', 'Lancar', 0, 'pembayaran'),
(24, '[101.3] Bank BCA', 'Assets', 'Lancar', 0, 'pembayaran'),
(25, '[101.4] Bank CIMB', 'Assets', 'Lancar', 0, 'pembayaran'),
(26, '[101.5] Bank Permata', 'Assets', 'Lancar', 0, 'pembayaran');

-- --------------------------------------------------------

--
-- Table structure for table `mp_invoices`
--

CREATE TABLE `mp_invoices` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `discount` decimal(11,2) NOT NULL,
  `status` int(1) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agentname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cus_picture` varchar(255) CHARACTER SET latin1 NOT NULL,
  `delivered_to` varchar(100) CHARACTER SET latin1 NOT NULL,
  `delivered_by` varchar(100) CHARACTER SET latin1 NOT NULL,
  `delivered_date` date NOT NULL,
  `delivered_description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `shippingcharges` decimal(11,2) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `payment_method` int(1) NOT NULL,
  `total_bill` decimal(11,2) NOT NULL,
  `bill_paid` decimal(11,2) NOT NULL,
  `source` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_invoices`
--

INSERT INTO `mp_invoices` (`id`, `transaction_id`, `date`, `discount`, `status`, `description`, `agentname`, `cus_id`, `cus_picture`, `delivered_to`, `delivered_by`, `delivered_date`, `delivered_description`, `shippingcharges`, `prescription_id`, `region_id`, `vehicle_id`, `driver_id`, `payment_method`, `total_bill`, `bill_paid`, `source`) VALUES
(1, 236, '2022-06-22', '0.00', 0, '', 'Supper Admin', 1, '', '', '', '0000-00-00', '', '0.00', 0, 0, 0, 0, 0, '400000.00', '400000.00', 0),
(2, 259, '2022-07-20', '0.00', 0, '', 'Supper Admin', 1, '', '', '', '0000-00-00', '', '0.00', 0, 0, 0, 0, 0, '20000.00', '20000.00', 0),
(3, 260, '2022-07-28', '0.00', 0, '', 'Supper Admin', 1, '', '', '', '0000-00-00', '', '0.00', 0, 0, 0, 0, 0, '4500.00', '4500.00', 0),
(4, 282, '2022-08-21', '0.00', 0, '', 'Supper Admin', 1, '', '', '', '0000-00-00', '', '0.00', 0, 0, 0, 0, 0, '2500.00', '2500.00', 0),
(5, 286, '2022-08-27', '100.00', 0, '', 'Supper Admin', 1, '', '', '', '0000-00-00', '', '0.00', 0, 0, 0, 0, 0, '2400.00', '2400.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_label`
--

CREATE TABLE `mp_label` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mg` varchar(255) CHARACTER SET latin1 NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `source` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pack` int(11) NOT NULL,
  `sales` decimal(11,0) NOT NULL,
  `disc` decimal(11,0) NOT NULL,
  `date_ex` date NOT NULL,
  `agentid` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `unit_type` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_produk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_langingpage`
--

CREATE TABLE `mp_langingpage` (
  `id` int(11) NOT NULL,
  `companyname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `companydescription` varchar(255) CHARACTER SET latin1 NOT NULL,
  `companykeywords` varchar(255) CHARACTER SET latin1 NOT NULL,
  `logo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `banner` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slider1` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slider2` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slider3` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slider4` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slider5` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title1` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title2` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title3` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title4` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title5` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title6` varchar(255) CHARACTER SET latin1 NOT NULL,
  `subtitle6` varchar(255) CHARACTER SET latin1 NOT NULL,
  `subtitle6one` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title8` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title9` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title10` varchar(255) CHARACTER SET latin1 NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(50) CHARACTER SET latin1 NOT NULL,
  `primarycolor` varchar(50) CHARACTER SET latin1 NOT NULL,
  `theme_pri_hover` varchar(50) CHARACTER SET latin1 NOT NULL,
  `expirey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_langingpage`
--

INSERT INTO `mp_langingpage` (`id`, `companyname`, `companydescription`, `companykeywords`, `logo`, `banner`, `slider1`, `slider2`, `slider3`, `slider4`, `slider5`, `title1`, `title2`, `title3`, `title4`, `title5`, `title6`, `subtitle6`, `subtitle6one`, `title8`, `title9`, `title10`, `currency`, `language`, `primarycolor`, `theme_pri_hover`, `expirey`) VALUES
(1, 'PT. Ghina Mart', 'Sistem Akuntansi dan Penjualan', 'Sistem Akuntansi dan Penjualan', 'dcb99169fed78154951d15df01aa5dbe.png', '1171127a5133603e62cc949a87aedda4.jpg', '0ae082ea4c6d3334de39a11840c07c09.jpg', 'a3cbfa5f37d75bd8de678ceded28da43.png', 'd6e2b9bad5eb6560699d95d0235b3e9e.png', '67e008061660613ba4497979db422f91.png', 'ec572d4564b40dec3412b2d305f6a59e.png', 'THE  PHARMACY AND POS SYSTEM', 'OUR SERVICES', 'THINGS YOU SHOULD KNOW ABOUT US', 'MEET OUR PHARMACIST!.', 'SEE WHAT PATIENTS ARE SAYING?.', 'CONTACT US.', 'Contact Info.', 'Having Any Query! Or Book an appointment.', 'Quick Links.', 'Follow us.', 'Copyright ©2022: GhinaMart.com\r\ndevelopment by: KantorKU IT APPS', 'IDR', 'ID', '#18dce2', '#16c8cd', 55);

-- --------------------------------------------------------

--
-- Table structure for table `mp_menu`
--

CREATE TABLE `mp_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `icon` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_menu`
--

INSERT INTO `mp_menu` (`id`, `name`, `icon`) VALUES
(1, 'Inventori', 'fa fa-barcode'),
(2, 'Pengaturan', 'fa fa-cog'),
(5, 'Laporan', 'fa fa-balance-scale'),
(6, 'POS', 'fa fa-clipboard'),
(7, 'Profil', 'fa fa-user'),
(12, 'Hak Akses', 'fa fa-users'),
(16, 'Supplier', 'fa fa-truck'),
(18, 'Bank', 'fa fa-bank'),
(20, 'Pembelian', 'fa fa-briefcase'),
(21, 'Supply Chain', 'fa fa-flask'),
(22, 'Atribut', 'fa fa-anchor'),
(23, 'Akuntansi', 'fa fa-calculator'),
(24, 'Statement', 'fa fa-line-chart'),
(25, 'Opsi Umum', 'fa fa-shopping-bag'),
(26, 'Dashboard', 'fa fa-tachometer'),
(27, 'Expense', 'fa fa-paper-plane'),
(28, 'Customer', 'fa fa-user'),
(29, 'Karyawan', 'fa fa-user'),
(30, 'Cetak Label', 'fa fa-paper-plane');

-- --------------------------------------------------------

--
-- Table structure for table `mp_menulist`
--

CREATE TABLE `mp_menulist` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `link` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_menulist`
--

INSERT INTO `mp_menulist` (`id`, `menu_id`, `title`, `link`) VALUES
(1, 1, 'Produk', 'product'),
(2, 1, 'Kategori', 'category'),
(3, 2, 'Tampilan & Sistem', 'layout'),
(4, 1, 'Barcode Generator', 'product/generate_barcode'),
(9, 28, 'Customer', 'customers'),
(10, 5, 'Laporan Penjualan', 'salesreport'),
(13, 6, 'Daftar Invoice', 'invoice/manage'),
(16, 7, 'Personal', 'profile'),
(17, 25, 'Pengguna', 'users'),
(18, 1, 'Permintaan Item', 'todolist'),
(26, 12, 'Atur Hak Akses', 'multiple_roles'),
(28, 16, 'Daftar Supplier', 'supplier'),
(29, 27, 'Expense', 'Expense'),
(30, 18, 'Cek', 'bank/written_cheque'),
(31, 18, 'Daftar Bank', 'bank'),
(34, 1, 'Pending stok', 'product/pending_stock'),
(36, 6, 'Buat Invoice', 'invoice'),
(37, 6, 'Retur Item', 'return_items'),
(38, 5, 'Laporan Retur', 'salesreport/returnitemreport'),
(39, 20, 'Daftar Pembelian', 'purchase'),
(40, 21, 'Daftar Pengiriman', 'supply'),
(41, 21, 'Sopir', 'supply/drivers'),
(42, 21, 'Kendaraan', 'supply/vehicle'),
(43, 22, 'Merk', 'initilization'),
(44, 22, 'Sektor Merk', 'initilization/brandSector'),
(45, 22, 'Region', 'initilization/region'),
(46, 22, 'Kota', 'initilization/town'),
(47, 22, 'Unit', 'initilization/units'),
(48, 22, 'Toko', 'initilization/stores'),
(49, 1, 'Peringatan Stok', 'stockAlertReport'),
(50, 1, 'Produk Kadaluarsa', 'product/expired_list'),
(51, 1, 'Stok', 'product/productStock'),
(52, 1, 'Stok Kadaluarsa', 'product/expired_stock'),
(53, 16, 'Pembayaran Supplier', 'supplier/payment_list'),
(54, 23, 'Buku Besar Customer', 'customers/ledger'),
(55, 23, 'Buku Besar Supplier', 'supplier/ledger'),
(56, 20, 'Retur Pembelian', 'purchase/return_list'),
(57, 4, 'Pembayaran Customer', 'customers/payment_list '),
(58, 23, 'Bagan Akun', 'accounts'),
(59, 24, 'Jurnal Umum', 'statements'),
(60, 24, 'Buku Besar', 'statements/leadgerAccounst'),
(61, 24, 'Neraca Saldo', 'statements/trail_balance'),
(62, 24, 'Laporan Laba Rugi', 'statements/income_statement'),
(63, 24, 'Neraca Keuangan', 'statements/balancesheet'),
(64, 23, 'Entri Jurnal', 'statements/journal_voucher'),
(65, 23, 'Pembukaan Saldo', 'statements/opening_balance'),
(66, 28, 'Pembayaran Customer', 'customers/payment_list '),
(68, 25, 'Backup Database', 'backup'),
(69, 25, 'Restore Database', 'backup/upload_restore'),
(70, 18, 'Deposito Bank', 'bank/deposit_list'),
(71, 18, 'Buku Bank', 'bank/bank_book'),
(72, 26, 'Dashboard', 'dashboard'),
(73, 25, 'Pengaturan Printer', 'Printer_settings'),
(74, 25, 'Format Data', 'backup/format'),
(75, 29, 'Daftar Karyawan', 'karyawan'),
(76, 5, 'Laporan Pembelian', 'purchasereport'),
(77, 1, 'Cetak Label', 'label'),
(79, 6, 'Second Invoice', 'invoice_2');

-- --------------------------------------------------------

--
-- Table structure for table `mp_multipleroles`
--

CREATE TABLE `mp_multipleroles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_Id` int(11) NOT NULL,
  `role` int(1) NOT NULL,
  `agentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_multipleroles`
--

INSERT INTO `mp_multipleroles` (`id`, `user_id`, `menu_Id`, `role`, `agentid`) VALUES
(117, 1, 12, 0, 1),
(118, 1, 1, 1, 1),
(119, 1, 2, 1, 1),
(120, 1, 5, 1, 1),
(121, 1, 6, 1, 1),
(122, 1, 7, 1, 1),
(123, 1, 16, 1, 1),
(124, 1, 18, 1, 1),
(125, 1, 20, 1, 1),
(126, 1, 21, 1, 1),
(127, 1, 22, 1, 1),
(128, 1, 23, 1, 1),
(129, 1, 24, 1, 1),
(130, 1, 25, 1, 1),
(131, 1, 26, 1, 1),
(132, 1, 27, 1, 1),
(133, 1, 28, 1, 1),
(134, 2, 1, 1, 1),
(135, 2, 2, 1, 1),
(136, 2, 5, 1, 1),
(137, 2, 6, 1, 1),
(138, 2, 7, 1, 1),
(139, 2, 12, 1, 1),
(140, 2, 16, 1, 1),
(141, 2, 18, 1, 1),
(142, 2, 20, 1, 1),
(143, 2, 21, 1, 1),
(144, 2, 22, 1, 1),
(145, 2, 23, 1, 1),
(146, 2, 25, 1, 1),
(147, 2, 26, 1, 1),
(148, 2, 27, 1, 1),
(149, 2, 28, 1, 1),
(150, 2, 24, 1, 1),
(151, 1, 29, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mp_payee`
--

CREATE TABLE `mp_payee` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cus_address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cus_contact_1` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_contact_2` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_company` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cus_picture` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cus_status` int(1) NOT NULL,
  `cus_region` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cus_town` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cus_type` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_balance` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cus_date` date NOT NULL,
  `customer_nationalid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `type` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_payee`
--

INSERT INTO `mp_payee` (`id`, `customer_name`, `cus_email`, `cus_password`, `cus_address`, `cus_contact_1`, `cus_contact_2`, `cus_company`, `cus_description`, `cus_picture`, `cus_status`, `cus_region`, `cus_town`, `cus_type`, `cus_balance`, `cus_date`, `customer_nationalid`, `type`) VALUES
(1, 'Vanessa Angel', 'walkin@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Jl. Apa Saja - 656', '56655556', '1722967053', 'PT. VA Internasional', '', '0e248f305b49f923eba0f4d1e5968499.jpg', 0, 'Jawa Barat', 'Karawang', 'Regular', '0.00', '2019-08-02', '1234578', 'customer'),
(4, 'PT. Angel Internusa', 'isya40@gmail.com', '', 'Jl. MH Thamrin 56', '089635774675', '089635774675', '', '', '6756e0e4720af9d6f6eaf51d6ea3a4c5.png', 0, 'Jakarta', 'Jakarta Pusat', 'Regular', '', '2019-08-02', '12335555', 'supplier'),
(9, 'PT. Burhan Corps', 'burhan@outlook.com', '', 'Jl. Ahmad Yani 56', '089635774675', '1712031466', 'Burhan ', '', 'ec9ff532bce3fb4fe0b7419dabeb5799.png', 0, 'Jawa Timur', 'Surabaya', 'Regular', '', '2019-08-02', '5656655666', 'supplier'),
(17, 'PT. Samsul United', 'companyemail@example.com', '', 'Jl. Malioboro 6', '5555555555', '089635774675', 'Samsul', '', '0b34c009affb48b3695f25f2418d00ee.png', 0, 'Yogyakarta', 'Sleman', 'Regular', '', '2019-08-02', '12335555', 'employee'),
(18, 'Walk-in Customer', '', '', '', '', '', '', '', 'default.jpg', 0, '', '', 'Walk in', '', '2019-08-05', '', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `mp_printer`
--

CREATE TABLE `mp_printer` (
  `id` int(11) NOT NULL,
  `printer_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fontsize` int(11) NOT NULL,
  `set_default` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_printer`
--

INSERT INTO `mp_printer` (`id`, `printer_name`, `fontsize`, `set_default`) VALUES
(6, 'Black Copper BC-85AC', 11, 0),
(7, 'XP-58', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mp_productslist`
--

CREATE TABLE `mp_productslist` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mg` varchar(50) CHARACTER SET latin1 NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `retail` decimal(11,2) NOT NULL,
  `expire` date NOT NULL,
  `manufacturing` date NOT NULL,
  `sideeffects` varchar(100) CHARACTER SET latin1 NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `min_stock` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `total_units` int(11) NOT NULL,
  `packsize` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sku` varchar(255) CHARACTER SET latin1 NOT NULL,
  `location` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tax` decimal(11,2) NOT NULL,
  `type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `brand_id` int(11) NOT NULL,
  `brand_sector_id` int(11) NOT NULL,
  `unit_type` varchar(50) CHARACTER SET latin1 NOT NULL,
  `net_weight` varchar(50) CHARACTER SET latin1 NOT NULL,
  `whole_sale` decimal(11,2) NOT NULL,
  `disc` decimal(11,0) NOT NULL,
  `date_disc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_productslist`
--

INSERT INTO `mp_productslist` (`id`, `category_id`, `product_name`, `mg`, `quantity`, `purchase`, `retail`, `expire`, `manufacturing`, `sideeffects`, `description`, `barcode`, `min_stock`, `status`, `total_units`, `packsize`, `sku`, `location`, `tax`, `type`, `image`, `brand_id`, `brand_sector_id`, `unit_type`, `net_weight`, `whole_sale`, `disc`, `date_disc`) VALUES
(1375, 4, 'NEO RHEUMACYL 20 TABLET', '1', 70, '0.00', '4000.00', '0000-00-00', '2019-07-09', 'No Effects', 'here', '8999908000101', 10, 0, 0, '10', '', 'Toko Kelontong', '0.00', 'Finished Products', 'cf7dfe436d8da53ed901cd0077f037ed.jpg', 1, 2, 'Pcs', '', '3900.00', '0', '0000-00-00'),
(1376, 4, 'BODREX TAB LAPIS DUA 20 TABLET', '1', 3, '3000.00', '4500.00', '2022-02-09', '2019-07-01', 'No Effects', 'here', '8999908000200', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '22e4a017c7045b788b878acdb7366f7f.jpg', 1, 2, 'Pcs', '', '4200.00', '0', '0000-00-00'),
(1377, 4, 'BODREXIN 20 TABLET', '1', 122, '12100.00', '18000.00', '2022-02-09', '2019-07-05', 'No Effects', 'here', '8999908000705', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'd578240bfc4fade6fa823392e2aec689.jpg', 1, 2, 'Pcs', '', '16000.00', '0', '0000-00-00'),
(1378, 4, 'OBB OBAT BATUK 60ML', '1', 124, '4200.00', '6300.00', '2022-06-08', '2019-07-18', 'No Effects', 'here', '8999908001207', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'e2b7b3d117c2865c0045f69f587f5aee.jpg', 1, 2, 'Pcs', '', '6000.00', '0', '0000-00-00'),
(1379, 4, 'VIDORAN SYRUP RS JERUK 225ML', '1', 142, '18000.00', '20000.00', '2030-02-05', '2019-07-02', 'No Effects', 'here', '8999908001603	', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '8599bb86dec6eb0f345caf50863e7fba.jpg', 1, 2, 'btl', '1', '19000.00', '0', '0000-00-00'),
(1380, 4, 'VIDORAN SIRUP RASA JERUK 120', '1', 144, '30000.00', '35000.00', '2024-06-04', '2019-06-06', 'No Effects', 'here', '8999908001801', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'a752c5e235933a2edf72711b7f208fa5.jpg', 1, 2, 'btl', '1', '33000.00', '0', '0000-00-00'),
(1381, 4, 'VITAMIN B1 IPI 50TAB', '1', 141, '4000.00', '5000.00', '2024-02-05', '2019-06-04', 'No Effects', 'here', '8999908005007', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'dc1255dbaac7427c6a4eb3953cb4631b.jpg', 1, 2, 'Pcs', '1', '4500.00', '0', '0000-00-00'),
(1382, 4, 'VITAMIN B IPI 50TAB', '1', 144, '4500.00', '5000.00', '2025-10-20', '2019-06-04', 'No Effects', 'here', '8999908005106', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'f36b984ef5549bd1623a1131a8ea34a6.jpg', 1, 2, 'Pcs', '1', '4700.00', '0', '0000-00-00'),
(1383, 4, 'VITAMIN C IPI 50TAB', '1', 144, '4000.00', '5000.00', '2026-05-18', '2019-01-10', 'No Effects', 'here', '8999908005205', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '682318af3078594b5207072119c6e9aa.jpg', 1, 2, 'Pcs', '1', '4500.00', '0', '0000-00-00'),
(1384, 4, 'VITAMIN B12 IPI 50TAB', '1', 144, '4000.00', '5000.00', '2025-06-17', '2019-02-13', 'No Effects', 'here', '8999908005304', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '2b7ab88ccf84a1a5a2249f06d9b24f51.jpg', 1, 2, 'Pcs', '1', '4500.00', '0', '0000-00-00'),
(1385, 4, 'VITAMIN A IPI 50TAB', '1', 144, '4000.00', '5000.00', '2026-09-27', '2019-04-03', 'No Effects', 'here', '8999908005502', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '8437c9fb3420b866ae04370898529fdd.jpg', 1, 2, 'Pcs', '1', '4500.00', '0', '0000-00-00'),
(1386, 3, 'F &amp; N SODA WATER 330 ML', '1', 26, '5000.00', '6000.00', '2025-05-11', '2019-04-10', 'No Effects', 'here', '8999908006301', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '0123a1f82f5c8f1634629e6209bc0ffa.jpg', 1, 1, 'btl', '1', '5500.00', '0', '0000-00-00'),
(1387, 3, 'F &amp; N COFFEE CREAM 330ML', '1', 144, '5000.00', '6000.00', '2026-09-20', '2019-03-05', 'No Effects', 'here', '8999908006400', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'a50a80b15959eb343271118ee265c90b.jpg', 1, 1, 'btl', '1', '5500.00', '0', '0000-00-00'),
(1388, 3, 'F &amp; N ORANGE 330 ML', '1', 144, '5000.00', '6000.00', '2024-05-19', '2019-04-10', 'No Effects', 'here', '8999908006509', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'd47abfc30399185e9134b7e6b02278b5.jpg', 1, 1, 'Pcs', '1', '5500.00', '0', '0000-00-00'),
(1389, 3, 'F &amp; N STRAWB 330 ML', '1', 144, '5000.00', '6000.00', '2024-09-22', '2019-03-06', 'No Effects', 'here', '8999908006608', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'eed22de8d5737027ed879d47644f1c32.jpg', 1, 1, 'Pcs', '1', '5500.00', '0', '0000-00-00'),
(1390, 3, 'F &amp; N SARSI 330 ML', '1', 144, '5000.00', '6000.00', '2028-06-13', '2019-03-05', 'No Effects', 'here', '8999908006707', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '01834ff2a9426ae862e8f17fd3977a8f.png', 1, 1, 'Pcs', '1', '5500.00', '0', '0000-00-00'),
(1391, 1, 'CLAUDIA BEAUTY HIJAU 80G', '1', 142, '2000.00', '3000.00', '2025-05-18', '2019-04-03', 'No Effects', 'here', '8999908009203', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '3831f1aaf282e02c009945212facd022.png', 1, 3, 'Pcs', '1', '2500.00', '0', '2022-08-31'),
(1392, 1, 'TOTALCARE JUNIOR ORANGE 50G', '1', 142, '15000.00', '17500.00', '2026-06-16', '2018-12-12', 'No Effects', 'here', '8999908034601	', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '8ce2512ee79394f6b55d7e72c3f8ddc9.jpg', 1, 3, 'Pcs', '1', '16500.00', '0', '0000-00-00'),
(1393, 1, 'MY BABY POWDER 50 GR', '1', 143, '20000.00', '23000.00', '2024-09-22', '2019-04-24', 'No Effects', 'here', '8999908042408', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '037a90ae3336ac42c616cc6f1e61458d.jpg', 1, 3, 'Pcs', '1', '22400.00', '0', '0000-00-00'),
(1394, 1, 'MY BABY SOAP 100G', '1', 142, '16000.00', '17000.00', '2023-05-21', '2019-03-06', 'No Effects', 'here', '8999908043108	', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '1d9ce7b6c03c8ee1348320c9eaa11814.jpg', 1, 3, 'Pcs', '1', '16500.00', '0', '0000-00-00'),
(1395, 1, 'CLAUDIA BEAUTY PINK 80G', '1', 143, '2000.00', '3000.00', '2023-09-17', '2019-03-13', 'No Effects', 'here', '8999908009401', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '171f0e86a0717518feef49524874045a.jpg', 1, 3, 'Pcs', '1', '2500.00', '0', '0000-00-00'),
(1396, 9, 'MARINA MILK CLEANS 100M', '1', 143, '23000.00', '25000.00', '2025-06-10', '2019-03-05', 'No Effects', 'here', '8999908009807', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'fc671295a814b91a2ef3b174046c4705.jpg', 1, 3, 'Pcs', '1', '24000.00', '0', '0000-00-00'),
(1397, 9, 'NATURAL HONEY HBL DRY 100ML', '1', 144, '15000.00', '18000.00', '2024-05-12', '2019-06-11', 'No Effects', 'here', '8999908029607', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '5d89d8767d9f54b9f1ddb2b7e3936613.jpg', 1, 3, 'Pcs', '1', '16500.00', '0', '0000-00-00'),
(1398, 9, 'MARINA H&amp;B LOT PINK 100M', '1', 143, '16000.00', '19000.00', '2025-05-11', '2019-04-16', 'No Effects', 'here', '8999908010100', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'be8acfd66d7b3e72fdd55971a786b9c9.jpg', 1, 3, 'Pcs', '1', '17000.00', '0', '0000-00-00'),
(1399, 9, 'MARINA H&amp;B LOTION ALOE V 100M', '1', 144, '15000.00', '18000.00', '2025-05-11', '2019-04-10', 'No Effects', 'here', '8999908010308', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '1f77015e2e67a02e191303fe17dbc828.jpg', 1, 3, 'Pcs', '1', '17000.00', '0', '0000-00-00'),
(1400, 11, 'HEMAVITON JRENG BOX 10X4 GR', '1', 144, '4000.00', '5000.00', '2023-05-21', '2019-03-06', 'No Effects', 'here', '8999908045805	', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'e7e59494eefec5801223024b5492173f.jpg', 1, 1, 'bks', '1', '4500.00', '0', '0000-00-00'),
(1401, 11, 'HEMAVITON JRENG MANGGA 4GR', '1', 144, '3000.00', '5000.00', '2024-05-13', '2019-04-10', 'No Effects', 'here', '8999908217400', 10, 0, 0, '1', '', 'Ware House', '1.00', 'Finished Products', '617cdcedefd37b8eecfb03424cb24e82.jpg', 1, 1, 'bks', '1', '4000.00', '0', '0000-00-00'),
(1403, 11, 'NEO HORMOVITON GRENG 10X4.2GR', '1', 0, '5000.00', '7000.00', '2022-05-15', '2019-03-13', 'No Effects', 'here', '8999908057907', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '0e9463ada9628acebe1f358d0230743c.jpg', 1, 2, 'bks', '1', '6000.00', '0', '0000-00-00'),
(1404, 11, 'HEMAVITON JRENG COLA 10X4GR', '1', 0, '6000.00', '8000.00', '2024-05-19', '2019-01-16', 'No Effects', 'here', '8999908206800', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'd7aeb87e322417203c4707405699949d.jpg', 1, 1, 'btl', '1', '7000.00', '0', '0000-00-00'),
(1405, 5, 'CHARLIE DEO STICK ORIGIN 40G', '1', 0, '22000.00', '24000.00', '2024-05-13', '2019-05-15', 'No Effects', 'here', '8999908031303', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '67d8c72a63b95ddf3a2bcc3eb8e29cdb.jpg', 1, 3, 'btl', '1', '23000.00', '0', '0000-00-00'),
(1406, 6, 'SOS PEMBERSIH LANTAI APL 1600M', '1', 0, '14000.00', '16000.00', '2024-05-12', '2019-03-14', 'No Effects', 'here', '8999908079602', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'dd07223d5cb209031eeeb3306d4e3da7.jpg', 1, 4, 'Pcs', '1', '15000.00', '0', '0000-00-00'),
(1407, 6, 'SOS PEMBERSIH LANTAI LMN 1600M', '1', 0, '16000.00', '18000.00', '2026-05-11', '2019-04-17', 'No Effects', 'here', '8999908079701', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'a83d4dab400169a8a7bee7048f94c496.jpg', 1, 4, 'Pcs', '1', '17000.00', '0', '0000-00-00'),
(1408, 6, 'SOS LANTAI ORANGE 1600 REFIL', '1', -1, '16000.00', '18000.00', '2023-09-18', '2019-03-14', 'No Effects', 'here', '8999908079800', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '54edc041a1500c5f4f3a2e192acd119c.jpg', 1, 4, 'Pcs', '1', '17000.00', '0', '0000-00-00'),
(1409, 6, 'SOS KARBOL EXTRA STRONG 800ML', '1', 0, '18000.00', '20000.00', '2024-09-22', '2019-04-17', 'No Effects', 'here', '8999908264107', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '26dd26031c93466ba292b2549fedb460.png', 1, 4, 'Pcs', '1', '19000.00', '0', '0000-00-00'),
(1410, 6, 'SOS KARBOL CLASSIC PINE 1800ML', '1', -1, '18000.00', '21000.00', '2023-05-15', '2019-04-24', 'No Effects', 'here', '8999908264206', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'd51291a23a319a0a25fc131220e278e6.png', 1, 4, 'Pcs', '1', '19000.00', '0', '0000-00-00'),
(1411, 3, 'HEMAVITON C1000 150ML', '1', -1, '3000.00', '5000.00', '2023-09-18', '2019-04-17', 'No Effects', 'here', '8999908260802', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '5b03d74dadb2764a8a2262f6e7c89363.jpg', 1, 1, 'btl', '1', '4000.00', '0', '0000-00-00'),
(1412, 3, 'HEMAVITON HEALTH DRINK 150ML', '1', 3, '4000.00', '5000.00', '2023-05-23', '2019-04-10', 'No Effects', 'here', '8999908059109', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '97d2bb83fb5029248a1831e8a814f775.jpg', 1, 1, 'Pcs', '1', '4500.00', '0', '0000-00-00'),
(1413, 3, 'HEMAVITON E DRINK COLA 330ML', '1', 0, '3000.00', '5000.00', '2023-05-14', '2019-05-08', 'No Effects', 'here', '8999908218902', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '0fb2ea1e5c97198bc58d9b9e5561ddd2.jpg', 1, 1, 'Pcs', '1', '4000.00', '0', '0000-00-00'),
(1414, 4, 'OSKADON SP 4 TABLET', '1', 0, '2000.00', '4000.00', '2022-05-16', '2019-03-06', 'No Effects', 'here', '8999908043801', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '3446ea5f7b4997d942a04a3d620df200.png', 1, 2, 'Pcs', '1', '3500.00', '0', '0000-00-00'),
(1415, 4, 'OSKADON O S KEPALA 4TAB', '1', -1, '3000.00', '4500.00', '2024-11-20', '2019-02-20', 'No Effects', 'here', '8999908039309', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', 'f3a31e32e15e2b52f6cff16f2873aafb.jpg', 1, 2, 'Pcs', '1', '4000.00', '0', '0000-00-00'),
(1416, 3, 'kopi kenangan', '100', 0, '45000.00', '5500.00', '2022-09-28', '2022-06-28', 'tidak efek', '                                ', '123456', 5, 0, 1, '12', '123456', 'Kost Alfin', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'btl', '100', '60000.00', '0', '0000-00-00'),
(1417, 1, 'criping', '11', 352, '0.00', '2500.00', '2022-08-11', '2022-08-10', 'no', '                  bbbbb              ', '1980', 20, 0, 10, '12', '1980', 'Toko Kelontong', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'Pcs', '11', '2400.00', '100', '2022-08-31'),
(1418, 1, 'tape', '10', 129, '5000.00', '5500.00', '2022-08-20', '2022-08-20', 'tidak ada', 'olahan ketan', '999999', 10, 0, 0, '10', '123456', 'Toko Kelontong', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'Pcs', '100', '55000.00', '200', '2022-08-25'),
(1419, 1, 'tape', '10', 129, '5000.00', '5500.00', '2022-08-20', '2022-08-20', 'tidak ada', 'olahan ketan', '999999', 10, 0, 0, '10', '123456', 'Toko Kelontong', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'Pcs', '100', '55000.00', '200', '2022-08-25'),
(1420, 1, 'tape', '10', 20, '5000.00', '5500.00', '2022-08-20', '2022-08-20', 'tidak ada', 'olahan ketan', '999999', 10, 0, 0, '10', '123456', 'Toko Kelontong', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'Pcs', '100', '55000.00', '200', '2022-08-25');

-- --------------------------------------------------------

--
-- Table structure for table `mp_productslist_resturn`
--

CREATE TABLE `mp_productslist_resturn` (
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_productslist_resturn`
--

INSERT INTO `mp_productslist_resturn` (`id_produk`, `jumlah`) VALUES
(0, 1),
(1, 11),
(2, 10),
(3, 11),
(4, 11),
(1417, 100),
(1418, 10),
(1419, 10);

-- --------------------------------------------------------

--
-- Table structure for table `mp_purchase`
--

CREATE TABLE `mp_purchase` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `description` longtext CHARACTER SET latin1 NOT NULL,
  `total_amount` decimal(11,2) NOT NULL,
  `payment_type_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_date` date NOT NULL,
  `cash` decimal(11,2) NOT NULL,
  `cus_picture` varchar(50) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_purchase`
--

INSERT INTO `mp_purchase` (`id`, `transaction_id`, `date`, `supplier_id`, `store`, `invoice_id`, `description`, `total_amount`, `payment_type_id`, `payment_date`, `cash`, `cus_picture`, `status`) VALUES
(1, 237, '2022-06-23', 4, 1, 2306, '', '150000.00', '5', '2022-06-23', '75000.00', 'default.jpg', 0),
(2, 239, '2022-06-28', 4, 1, 12345, '', '1750000.00', '5', '2022-06-28', '0.00', 'default.jpg', 0),
(3, 245, '2022-06-28', 4, 1, 2345, 'coba cek 450', '450000.00', '5', '2022-06-28', '0.00', 'default.jpg', 0),
(4, 246, '2022-06-28', 4, 1, 6789, 'coba kes', '50000.00', '24', '2022-06-28', '50000.00', 'default.jpg', 0),
(5, 248, '2022-06-29', 4, 1, 9800, 'head 51', '5000.00', '5', '2022-06-29', '0.00', 'default.jpg', 0),
(6, 257, '2022-07-19', 4, 1, 2022, '', '300000.00', '24', '2022-07-19', '300000.00', 'default.jpg', 0),
(7, 261, '2022-08-02', 4, 1, 1234, 'tes retur', '10000.00', '24', '2022-08-02', '10000.00', 'default.jpg', 1),
(8, 262, '2022-08-11', 4, 1, 123459, 'rokok dan gula', '100000.00', '22', '2022-08-11', '100000.00', 'default.jpg', 0),
(9, 263, '2022-08-11', 4, 1, 234, 'tes', '75000.00', '24', '2022-08-11', '75000.00', 'default.jpg', 0),
(10, 264, '2022-08-11', 4, 1, 12, '0', '5000.00', '5', '2022-08-12', '0.00', 'default.jpg', 0),
(11, 265, '2022-08-11', 4, 1, 1, '0', '10000.00', '4', '2022-08-11', '0.00', 'default.jpg', 0),
(12, 272, '2022-08-19', 4, 1, 1222222, 'tes retir', '50000.00', '2', '2022-08-19', '50000.00', 'default.jpg', 1),
(13, 273, '2022-08-19', 4, 1, 12444, 'cek ret', '100000.00', '22', '2022-08-19', '100000.00', 'default.jpg', 1),
(14, 283, '2022-08-24', 4, 1, 12345, 'stok', '10000.00', '2', '2022-08-24', '10000.00', 'default.jpg', 0),
(15, 284, '2022-08-27', 4, 1, 123, 'tape', '50000.00', '2', '2022-08-27', '50000.00', 'default.jpg', 0),
(16, 285, '2022-08-27', 4, 1, 5000, 'a', '50000.00', '2', '2022-08-27', '50000.00', 'default.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_region`
--

CREATE TABLE `mp_region` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_region`
--

INSERT INTO `mp_region` (`id`, `name`, `code`) VALUES
(1, 'Jawa', '1001'),
(2, 'Luar Jawa', '1002');

-- --------------------------------------------------------

--
-- Table structure for table `mp_return`
--

CREATE TABLE `mp_return` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cus_id` int(11) NOT NULL,
  `agent` varchar(255) CHARACTER SET latin1 NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `return_amount` decimal(11,2) NOT NULL,
  `total_bill` decimal(11,2) NOT NULL,
  `discount_given` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_return`
--

INSERT INTO `mp_return` (`id`, `transaction_id`, `date`, `cus_id`, `agent`, `invoice_id`, `return_amount`, `total_bill`, `discount_given`) VALUES
(1, 287, '2022-08-28', 1, 'Sub Admin', 1234, '2500.00', '2500.00', '0.00'),
(2, 294, '2022-08-28', 1, 'Sub Admin', 5, '2500.00', '2500.00', '0.00'),
(3, 295, '2022-08-28', 1, 'Sub Admin', 2, '2500.00', '2500.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `mp_return_list`
--

CREATE TABLE `mp_return_list` (
  `id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mg` varchar(255) CHARACTER SET latin1 NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_return_list`
--

INSERT INTO `mp_return_list` (`id`, `return_id`, `barcode`, `product_no`, `product_id`, `product_name`, `mg`, `price`, `purchase`, `qty`, `tax`) VALUES
(1, 1, '1980', '1980', 1417, 'criping', '11', '2500.00', '0.00', 1, '0.00'),
(2, 2, '1980', '1980', 1417, 'criping', '11', '2500.00', '0.00', 1, '0.00'),
(3, 3, '1980', '1980', 1417, 'criping', '11', '2500.00', '0.00', 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `mp_sales`
--

CREATE TABLE `mp_sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `mg` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_sales`
--

INSERT INTO `mp_sales` (`id`, `product_id`, `product_no`, `order_id`, `product_name`, `mg`, `price`, `purchase`, `qty`, `tax`) VALUES
(1, 1375, '', 1, 'NEO RHEUMACYL 20 TABLET', 1, '4000.00', '3400.00', 100, '0.00'),
(2, 1416, '123456', 2, 'kopi kenangan', 100, '60000.00', '45000.00', 12, '0.00'),
(3, 1379, '', 2, 'VIDORAN SYRUP RS JERUK 225ML', 1, '20000.00', '18000.00', 1, '0.00'),
(4, 1376, '', 3, 'BODREX TAB LAPIS DUA 20 TABLET', 1, '4500.00', '3000.00', 1, '0.00'),
(5, 1417, '1980', 4, 'criping', 11, '2500.00', '0.00', 1, '0.00'),
(6, 1417, '1980', 4, 'criping', 11, '2500.00', '0.00', 1, '0.00'),
(7, 1418, '123456', 4, 'tape', 10, '5500.00', '4500.00', 1, '0.00'),
(8, 1417, '1980', 5, 'criping', 11, '2500.00', '0.00', 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `mp_sessions`
--

CREATE TABLE `mp_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mp_sessions`
--

INSERT INTO `mp_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('09kpdo0kgvotnfm35dubld16if30g268', '::1', 1660910958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931303935383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('0m756a9occdp5vj5pkm4tb81fb640qgu', '::1', 1661004419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313030343431393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('0n30scmuvhagp4ctg6ahadsfc6cugd0t', '::1', 1660223016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232333031363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('147102j0fp0ird0b68nqmrig6phuldgp', '::1', 1660232271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233323237313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39353a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e2043726561746564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('1hciecpoht2k0r7p51ng4545bt2uf1d1', '::1', 1661086356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038363335363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('1i2votvdch0lak40b6k1he7qa230h4ge', '::1', 1660912329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931323332393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('1lkgjdkdislt68llpote3fc1sn7lnn9o', '::1', 1660929328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393332383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('1u3gfagl9aujd5nq8c0ef6nte0kt5b3k', '::1', 1661612737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631323733373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('1vpu36b0ttq7lcm6u18gba24k24bhp6v', '::1', 1661612040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631323034303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('2b0b173hr408a6bl0sua3hm2t7dj3k60', '::1', 1661516573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531363537333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('2frjkgo0kql0m22ij8jfe2qttcsfq37s', '::1', 1660228616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232383631363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('2gup8898udtp1ms1lq7mpos057du5l84', '::1', 1661089092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038383937303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('2jnmv872ka6aoblp9cjivmlkk11sn0rq', '::1', 1661620154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632303135343b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('2vm0rd2htdjulraslc6i7gvmig3hdcpe', '::1', 1660915445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931353434353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('3eob9ql1i4hk0rg9pr3594vjmijfmuq1', '::1', 1660227594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232373539343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('3g4oh9crhfqvo4t9nghepq96rnvho9oe', '::1', 1660928174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932383137343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('3g94kbrec3576gq6ksi1vdnqiqps2alu', '::1', 1661614687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631343638373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('47479cflpqmu5d8mrulhgabo41nj4tae', '::1', 1661622035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632313933303b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39363a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e2052657475726e6564207375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('48aujliatd58r8d7br0hogirh01ivo7a', '::1', 1661084954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038343935343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('4eeu077jb2gdp3jbo7lg2udvb1e4amck', '::1', 1660919461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931393436313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('4i5heucpb5gv9g2lr6jg7nuhqd6fuarv', '::1', 1660981664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938313636343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a38323a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d74726173682d6f2220617269612d68696464656e3d2274727565223e3c2f693e205265636f72642072656d6f766564223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('4p0ual1e0cmc92ostvno2h3vktb2233o', '::1', 1661612353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631323335333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('4pnpcesj4lp5k0t7957f1qkvhr5eq5bm', '::1', 1661085583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038353538333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('4um93gm40m19mu965f06j7sl77b7u3q8', '::1', 1660234511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233343334383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('53kjq15mlod4p73dtgq7ge6l33ceqcmk', '::1', 1661611676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631313637363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('5skquih4kurdjt75eb12fouisg9kjif4', '::1', 1660146775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134363737353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('6nulfvhb3on4pouk0gvejfu3inn4r3mc', '::1', 1660993177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939333137373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('6ph87bgj51a52jf21egv0hp6plvp176s', '::1', 1660929024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393032343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('7lsq3kut8lddtos01c9rfidq6gg1skgl', '::1', 1660931710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933313731303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a38333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565222f3e2053746f636b206164646564223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('7n4bvqja71iovf1g0ah3q1t5l0kh7g9l', '::1', 1661083936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038333933363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('82om42bmf20s5j9hh5kr23ls7a83jk65', '::1', 1660982873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938323837333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('8j8tofrc0trnn65da0i3j18kgifbkaa6', '::1', 1661005088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313030343739373b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('8jvfh17dc76d3vo0r8b5uatet6ok0vud', '::1', 1661082300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038323330303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('8mql5afv00kkvfi1miidjd83s178sdm7', '::1', 1661613839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631333833393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('8oo413neqfvfnjk01b55q03s8gb6p6dj', '::1', 1661618777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631383737373b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('8os8hm6am7vdmosthh8bh2qfp2guk0vi', '::1', 1661613058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631333035383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('8rcirsm2mqfuv8mu44h1sut681t86aqe', '::1', 1661512270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531323237303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204164646564207375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('8re0m7gv42m5853emmbpmp7b410rquan', '::1', 1661082838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038323833343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('97a3jbg437dfulshog01hckmsla43vmo', '::1', 1661573093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537333039333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('98ij7b1km05s0ob2f0fjc47lpqoa0ckk', '::1', 1661516216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531363231363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9jelkgmt6dgo97degfghst11pplq7tri', '::1', 1660229463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232393436333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9o8i36jkudfekr16ljvrmmeocchgqp3o', '::1', 1660926440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932363434303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9rinke1d53nvaljh3ikonqh12l27be3f', '::1', 1660929657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393635373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9u4265nebm0qecvkpuh214c2lj4a7q5m', '::1', 1660911591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931313539313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('abahjga7q80tl47068st85i4869mku8m', '::1', 1660146255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134363235353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('achdg3jnqmqfu31fe28vme842ifssqh0', '::1', 1661085266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038353236363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ahlaa9gj64igut8veonlp61isi56e7g2', '::1', 1661352305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313335323330353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('b4cfo7mhbkd3d2jq6m4ffo5hcqc0ek29', '::1', 1661355051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313335353035313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('b4ljva3gq6qlnkb5gclvbpu8hbb94av2', '::1', 1660917808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931373830383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('b7fs023teb1qfagavp3n3piiq88j3rh2', '::1', 1661619420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631393432303b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('ba5r92ii7i08dq60vo9ogjapirphh73q', '::1', 1661085949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038353934393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('bll5j4927hkri0hada0v5qpt78kj9qm2', '::1', 1661515395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531353339353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('bln9l87hqvqsksj21vec34le4eci6qv8', '::1', 1661621158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632313135383b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('c12t3vro5cei02imdiv510nsqddjlsg4', '::1', 1660926838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932363833383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('c71jtpi859cjef0n4040lugu8o5qcdh6', '::1', 1661617646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631373634363b7374617475737c613a323a7b733a333a226d7367223b733a39373a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20456d61696c20626572686173696c2064696b6972696d223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('cojqgno8djm33bldg5dg2gk7cth95csr', '::1', 1661610089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631303038393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('css61j84cdad1jnlf5c1vdj463dmog1a', '::1', 1660145749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134353734393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('cvqojt3h4ej6o5ckv5j9la823bh7p4ge', '::1', 1661083407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038333430373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('dgo6i90n63vfmvg1kk85195jjtm9iqa4', '::1', 1660223327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232333332373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('dv0motb78a2cg37d95j9f9q2ap6lgg56', '::1', 1660932446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933323337353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('e09111mlpgdvjul8bbfugg43h2p5ftkv', '::1', 1661351880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313335313838303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('e8jol1dbtedq7dae3ls1c5am3cpk08hq', '::1', 1660910464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931303436343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('eadae5nku5godibkhkg5koq1btqd6sj1', '::1', 1660234348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233343334383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ec1ma39m68pitg62t6p0r3qspan9vj6q', '::1', 1660932015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933323031353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('eju0aqtptioof8p9alon4lhjcr0ga4rh', '::1', 1661515731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531353733313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('el1mrbgdco7gd75agcarl3gvnh0ll01e', '::1', 1660918730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931383733303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('f8atrdlehdi8s631pi37t7hjk0sgh8fr', '::1', 1660910066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931303036363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('fhp14i1p6ee5e11oml86c7mtt9koflc7', '::1', 1661586252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313538363235323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ficrffcgcajebiui6m0fdgc3pe8vr0j4', '::1', 1661513694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531333639343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('fv2klr8q3bkdavsodgq6go0hlnoor661', '::1', 1661617783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631373738333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('g544iqe8j9nsujdbnad5rkr598u5a5ps', '::1', 1661620514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632303531343b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('g6n88475ajsl2u4hqbl6oq03lh4lj7oe', '::1', 1660916092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931363039323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('g7rnn0vrvlonip3v1nvd4mtf2kerf9uq', '::1', 1660932375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933323337353b),
('gat5nu3rhovvmf6tpgpcavgjpj7lh4j6', '::1', 1660229793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232393739333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('gq1d2k46dfpholsublsv1pe765j5edg8', '::1', 1660930392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933303339323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('h766m4adugqt6qg3mkckrstbe5nu29so', '::1', 1661618385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631383338353b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('hckb7d1rfjgsfecfdhmblpbugt3ti023', '::1', 1661087989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038373236343b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('hmthmddeb9ks9nh3sjemng1nkobf4hmc', '::1', 1661617334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631373333343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('hokaoiqg6ppqafj2k1o6kt7hsqi87r5l', '::1', 1661620026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632303032363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('hota7ve19o75bk29nb8h0da6mtf9olme', '::1', 1660144550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134343535303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('hsvo2k3jcpt8i7jqb5cifb924rsmd9kv', '::1', 1661004781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313030343738313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ht85962ngr9gte5qvmscg61dogpcqqvk', '::1', 1660143888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134333838383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('i022ov8iof28naq3ltnp8g03t8h7dq14', '::1', 1661086916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038363931363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130343a223c69207374796c653d22636f6c6f723a236330302220636c6173733d2266612066612d6578636c616d6174696f6e2d747269616e676c652220617269612d68696464656e3d2274727565223e3c2f693e20536f727279206e6f206974656d732073656c6563746564223b733a353a22616c657274223b733a363a2264616e676572223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('i0mseo5d0likc48egukqfdrbpflrkvjd', '::1', 1660992191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939323139313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('i1c0eq35tqdjohdpoef7o86gekuj3osl', '::1', 1660981294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938313239343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('irqdrj826jft85drdb1dl3r7lcb068gl', '::1', 1661586579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313538363537393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('j0ac6rmst54gai10e2dtlim1pen7q972', '::1', 1660230256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233303235363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('j6cpq1b9m1a219nb4ulh8o922dqlrbhq', '::1', 1660909363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303930393336333b),
('jekn79t60641ed0dtehs6fhumccnrj1h', '::1', 1660995904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939353930333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('jmf4vq3kkkobhotqatuolehbcm01sov2', '::1', 1660992858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939323835383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('jt7a1fsirvpfooq7rdqqla98048l9bm6', '::1', 1660991173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939313137333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130313a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20457870656e7365206164646564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('k2nj2qnblo6jsorh0nqc9jqeoh056gnu', '::1', 1661087264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038373236343b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('kc6aahuiq39o7tgug6k5cfg6pub0mns9', '::1', 1661620841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632303834313b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('keq0qd6e71ev2fntpnc341onh45hnttj', '::1', 1660992503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939323530333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('korg45u3hltd2ujvcql95f8e91ql1c6m', '::1', 1660144240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134343234303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ks6iqrr5q33gi2pj3svm5pv2eav158ik', '::1', 1660231541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233313534313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('kvmdol2fes62l3jddc52nlc42p6jm9lh', '::1', 1661081972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038313937323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('l1ue5pj9o5t8jvr7f3hsf7qfiqotrfi7', '::1', 1661574209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537343230393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('l2c2rqraecodg9rd6vvo6viivt1im8ja', '::1', 1661621930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632313933303b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('l3c270ncnb2bt3itquh32bmtcji3qgac', '::1', 1661574516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537343531363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('l7dn0ot52nicvjgrrgeb44d3fqq1kti6', '::1', 1660914236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931343233363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('lg94od145sdaqq0hg9t57qifis19v0ni', '::1', 1661575620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537353632303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ljcko2q6q0rrhvsqdr8fs5k9isp30gkr', '::1', 1661610471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631303437313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('llhd7hsljfmerpt9k5l1co7gqr98apr6', '::1', 1661619796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631393739363b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('m40cj3853lmk1k9uff3ttr2o26scimgv', '::1', 1660914948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931343934383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('m5vs7nnrn4hj2i5lll50tk859vqpp9s1', '::1', 1661082834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038323833343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('mai97n0d6l7gq42ajgnbqhudeq2ap38a', '::1', 1660909761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303930393736313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('mkq8f6v8f7t5p6kodrpglch0u20vt70b', '::1', 1661619102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631393130323b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('mtalvi1r593qcgtsf4r3vf5bqcjtsaci', '::1', 1660997220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939373232303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('n5fg8a3n9ovhp8hg3e72moaid5fktoaq', '::1', 1660928518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932383531383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('nhc1f2p1k8mgphvlki6o2p4cmj3l8fo0', '::1', 1660145433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134353433333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('nll1ecopqhcul6m13coapcvra3o36r4u', '::1', 1660227932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232373933323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('nnlc7ofgk4jra03v5krssmtjd7mtdlmj', '::1', 1660979819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303937393831393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204164646564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('nqsm9v872ekflqee1t0l4jqrh82bid51', '::1', 1660982155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938323135353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a38323a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d74726173682d6f2220617269612d68696464656e3d2274727565223e3c2f693e205265636f72642072656d6f766564223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('o4fro2quigb49gihrbmopigaek0judgg', '::1', 1661082511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038323330303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('o7efngvvcabqk444f0j0593kf0m2tmnu', '::1', 1660927285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932373238353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('o9qk910le7iqq6845hlkiiffnp26a9g3', '::1', 1661517472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531373437323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ob9pvj7lt2r81mq9aanb91oa2v7ira1h', '::1', 1661621554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632313535343b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3132323a223c69207374796c653d22636f6c6f723a236330302220636c6173733d2266612066612d6578636c616d6174696f6e2d747269616e676c652220617269612d68696464656e3d2274727565223e3c2f693e204572726f722063616e6e6f742062652072657475726e6564206f7220656d7074792062696c6c206e6f223b733a353a22616c657274223b733a363a2264616e676572223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('oo7vbptil079qbf4nvjg06fgm5f1a4n1', '::1', 1661576026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537363032363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('p6500d8ks9ga9dnnb2lbcmfvvjn85ibo', '::1', 1661615818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631353831383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('phb3sg6n3ph23rs1leh44egotirgjbba', '::1', 1660231862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233313836323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('po2q4v4j5m17dplkpm8uk99pafq6pibo', '::1', 1660980572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938303537323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ppuc8h92lqlh4fdilov7rh8edqgbfgv3', '::1', 1660223680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232333638303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130323a223c69207374796c653d22636f6c6f723a236330302220636c6173733d2266612066612d6578636c616d6174696f6e2d747269616e676c652220617269612d68696464656e3d2274727565223e3c2f693e204572726f722063616e6e6f74206265206164646564223b733a353a22616c657274223b733a363a2264616e676572223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('pt7gk71b5usjn0406crhlnra5mv3oudd', '::1', 1660231233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233313233333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('pvhp8e19ni6m5b3f0femamspb8bkeirr', '::1', 1660222568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232323536383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('q9uhi9p2nqm1us5gs0tr8min9lqp0pqe', '::1', 1661607656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313630373635363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qclrebpgrbtnm153hkis3iednjbl2lt3', '::1', 1661573406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537333430363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qhnsi8qjur4porq9brko84c3p5p62c66', '::1', 1660931029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933313032393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qiej2p5f57sa845h3pjn7opoh13etesj', '::1', 1660909056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303930393035363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qlt724huhokdfu2tejtepkm1q01mcpn2', '::1', 1661610810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631303831303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qovls3jspi25uuoss0f91sp2q8mhhbnm', '::1', 1660912648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931323634383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qsogasiboqnhimfvuobf7tr6m577k202', '::1', 1660927677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932373637373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('r1ln86bt4e9h0vajcs8jl8365crfam0q', '::1', 1661615012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631353031323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('r2mo4sl5s4maul9c5lnmtt42eb8pcuqm', '::1', 1661615361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631353336313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('r8pnvh41siv96545rjfp5gfrf4coejha', '::1', 1660978618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303937383631383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('rfilgv2t0kj5ta1kuuvldbi0rgv6i495', '::1', 1661616628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631363632383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130343a223c69207374796c653d22636f6c6f723a236330302220636c6173733d2266612066612d6578636c616d6174696f6e2d747269616e676c652220617269612d68696464656e3d2274727565223e3c2f693e20536f727279206e6f206974656d732073656c6563746564223b733a353a22616c657274223b733a363a2264616e676572223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('rofndtlj07ag8ijlvp8d1l8m5f6krugt', '::1', 1660991640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939313634303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('rtfs2vqte42i5vojgtfo33iuv41s4g9a', '::1', 1661618029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313631383032393b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('scjv575ipfcevjfujgvf1duo1s90f4n0', '::1', 1660996208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939363230383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('sdmgodjd2ng8nj9nirimrt1704ogtu7q', '::1', 1661622047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632323034373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('sfve75of5rsnlhqllvb90p9c3n5ejrae', '::1', 1661088970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038383937303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('sp412j19apl7rfb6rppojuliip6e2dud', '::1', 1661515064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313531353036343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('t03n5e0bmp8kjofaat4pp3neshfqcjai', '::1', 1661354399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313335343339393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('tajdnjl9hst7juscip1d3aqkbkglg7t9', '::1', 1660914606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931343630363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('takn0k5cbeg96bj488qdrru7gv8j8t1s', '::1', 1661622047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313632323034373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('tfe5eh9k9kefisbi306qnjdjkbgsgofi', '::1', 1660996672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939363637323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('tfvqqah3t79ptc8e85nq8scjhi32oa42', '::1', 1660926044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932363034343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('tg3msn18ve78418gb4k43sp4hlfum1ov', '::1', 1660912953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931323935333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('trdgur5bkcome4s92ou7agqjl60fda07', '::1', 1661088132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038383031393b757365725f69647c613a323a7b733a323a226964223b733a313a2232223b733a343a226e616d65223b733a393a225375622041646d696e223b7d),
('u61b2pmmn9cm7ns234hmddf7upqqg2p3', '::1', 1660144900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134343930303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ug82ducjq4ej4ub1tjusrpj8qpgu1vtb', '::1', 1660929961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393936313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('uhj316f4htporl4jt402orkoaum8h612', '::1', 1660229016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232393031363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ujtqqlb6k2vdgmrp8nhlef98f0vn6o7j', '::1', 1661572456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537323435363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('upjfu7och4unfo9lmqrnmihcn2cg07cv', '::1', 1660993520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303939333532303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('uvvjt40vvbfp4l5vje3uo0hbfrcoor7f', '::1', 1661086711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313038363731313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('vjfbjcqufpvt01e7aua1bllei3sosd9f', '::1', 1660915759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931353735393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226e6577223b7d),
('vliqkh1p8ql091hd2nkai7s9o305ua7t', '::1', 1660911282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931313238323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('vo07ttb2em2ismjscn7qrr1s8aafec2t', '::1', 1660982534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938323533343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('volgtije1vg2q32bi5mbmrbetl1pibgt', '::1', 1661573890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636313537333839303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('voqtdmj6qqb3q6eudlnl043dpqcog7bo', '::1', 1660228303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232383330333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('vqv6n9rjtblfph123fr7nm33otb4uhba', '::1', 1660983373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303938333337333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130313a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20457870656e7365206164646564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `mp_stock`
--

CREATE TABLE `mp_stock` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `manufacturing` date NOT NULL,
  `expiry` date NOT NULL,
  `qty` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `added` varchar(255) CHARACTER SET latin1 NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `selling` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_stock`
--

INSERT INTO `mp_stock` (`id`, `mid`, `manufacturing`, `expiry`, `qty`, `description`, `date`, `added`, `purchase`, `selling`) VALUES
(1, 0, '2018-07-05', '2020-01-01', 0, '', '2018-07-05', 'Md. Habibur Rahman', '0.00', '0.00'),
(2, 1392, '2022-06-28', '2022-06-28', 10, '', '2022-06-28', 'Supper Admin', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `mp_stores`
--

CREATE TABLE `mp_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_stores`
--

INSERT INTO `mp_stores` (`id`, `name`, `code`, `address`) VALUES
(1, 'Toko Kelontong', '101', 'Jl. Apa saja asal - Bareng 56'),
(2, 'Toko Aing Mart', '1005', 'Jl. Jendral Sudirman no. 56 Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `mp_sub_entry`
--

CREATE TABLE `mp_sub_entry` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `accounthead` int(11) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_sub_entry`
--

INSERT INTO `mp_sub_entry` (`id`, `parent_id`, `accounthead`, `amount`, `type`) VALUES
(1, 235, 22, '1500000.00', 0),
(2, 236, 2, '400000.00', 0),
(3, 236, 3, '400000.00', 1),
(4, 237, 21, '150000.00', 0),
(5, 237, 2, '0.00', 1),
(6, 237, 5, '150000.00', 1),
(7, 238, 21, '150000.00', 1),
(8, 238, 22, '150000.00', 0),
(9, 239, 21, '1750000.00', 0),
(10, 239, 2, '0.00', 1),
(11, 239, 5, '1750000.00', 1),
(12, 240, 5, '150000.00', 1),
(13, 240, 2, '150000.00', 0),
(14, 241, 2, '150000.00', 0),
(15, 241, 5, '150000.00', 1),
(16, 242, 5, '150000.00', 0),
(17, 242, 2, '150000.00', 1),
(18, 243, 16, '1000000.00', 0),
(19, 243, 23, '1000000.00', 1),
(20, 244, 2, '500000.00', 0),
(21, 244, 16, '500000.00', 1),
(22, 245, 21, '450000.00', 0),
(23, 245, 16, '0.00', 1),
(24, 245, 5, '450000.00', 1),
(25, 246, 21, '50000.00', 0),
(26, 246, 2, '50000.00', 1),
(27, 247, 5, '450000.00', 0),
(28, 247, 2, '450000.00', 1),
(29, 248, 21, '5000.00', 0),
(30, 248, 2, '0.00', 1),
(31, 248, 5, '5000.00', 1),
(32, 249, 22, '900000.00', 0),
(33, 249, 16, '900000.00', 1),
(34, 250, 22, '50000.00', 0),
(35, 250, 16, '50000.00', 1),
(36, 251, 24, '5000.00', 0),
(37, 251, 16, '5000.00', 1),
(38, 252, 1, '500000.00', 0),
(39, 253, 25, '100000.00', 0),
(40, 254, 25, '50000.00', 1),
(41, 255, 7, '500000.00', 1),
(42, 255, 25, '500000.00', 0),
(43, 256, 6, '25000.00', 0),
(44, 256, 2, '25000.00', 1),
(45, 257, 21, '300000.00', 0),
(46, 257, 24, '300000.00', 1),
(49, 259, 2, '20000.00', 0),
(50, 259, 3, '20000.00', 1),
(51, 260, 2, '4500.00', 0),
(52, 260, 3, '4500.00', 1),
(53, 261, 2, '10000.00', 0),
(54, 261, 21, '10000.00', 1),
(55, 262, 21, '100000.00', 0),
(56, 262, 2, '50000.00', 1),
(57, 262, 5, '50000.00', 1),
(58, 263, 21, '75000.00', 0),
(59, 263, 2, '50000.00', 1),
(60, 263, 5, '25000.00', 1),
(61, 264, 21, '5000.00', 0),
(62, 264, 5, '0.00', 1),
(63, 264, 5, '5000.00', 1),
(64, 265, 21, '10000.00', 0),
(65, 265, 2, '0.00', 1),
(66, 265, 5, '10000.00', 1),
(67, 266, 4, '50000.00', 1),
(68, 266, 23, '50000.00', 0),
(69, 267, 4, '50000.00', 1),
(70, 267, 24, '50000.00', 0),
(71, 268, 4, '50000.00', 1),
(72, 268, 22, '50000.00', 0),
(73, 269, 4, '50000.00', 1),
(74, 269, 25, '50000.00', 0),
(75, 270, 4, '50000.00', 1),
(76, 270, 22, '50000.00', 0),
(77, 271, 4, '25000.00', 1),
(78, 271, 24, '25000.00', 0),
(79, 272, 2, '50000.00', 0),
(80, 272, 21, '50000.00', 1),
(81, 273, 22, '100000.00', 0),
(82, 273, 21, '100000.00', 1),
(83, 274, 26, '1000000.00', 0),
(84, 275, 26, '100000.00', 0),
(85, 275, 4, '100000.00', 1),
(86, 276, 1, '50000.00', 0),
(87, 276, 26, '50000.00', 1),
(88, 277, 14, '250000.00', 0),
(89, 277, 26, '250000.00', 1),
(90, 278, 20, '25000.00', 0),
(91, 278, 26, '25000.00', 1),
(92, 279, 6, '45000.00', 0),
(93, 279, 26, '45000.00', 1),
(94, 280, 20, '25000.00', 0),
(95, 280, 2, '25000.00', 1),
(96, 281, 5, '100000.00', 0),
(97, 281, 26, '100000.00', 1),
(98, 282, 2, '2500.00', 0),
(99, 282, 3, '2500.00', 1),
(100, 283, 21, '10000.00', 0),
(101, 283, 2, '10000.00', 1),
(102, 284, 21, '50000.00', 0),
(103, 284, 2, '50000.00', 1),
(104, 285, 21, '50000.00', 0),
(105, 285, 2, '50000.00', 1),
(106, 286, 22, '2400.00', 0),
(107, 286, 3, '2400.00', 1),
(108, 287, 3, '2500.00', 0),
(109, 287, 2, '2500.00', 1),
(116, 294, 3, '2500.00', 0),
(117, 294, 2, '2500.00', 1),
(118, 295, 3, '2500.00', 0),
(119, 295, 22, '2500.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mp_supplier_payments`
--

CREATE TABLE `mp_supplier_payments` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `method` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agentname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `mode` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_supplier_payments`
--

INSERT INTO `mp_supplier_payments` (`id`, `transaction_id`, `supplier_id`, `amount`, `method`, `date`, `description`, `agentname`, `mode`) VALUES
(1, 281, 4, '100000.00', '26', '2022-08-20', 'sama', 'Supper Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_supply`
--

CREATE TABLE `mp_supply` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `region_id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `expense` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_temp_barcoder_invoice`
--

CREATE TABLE `mp_temp_barcoder_invoice` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mg` varchar(255) CHARACTER SET latin1 NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `agentid` int(11) NOT NULL,
  `source` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pack` int(11) NOT NULL,
  `disc` decimal(11,0) DEFAULT NULL,
  `date_disc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_temp_barcoder_purchase`
--

CREATE TABLE `mp_temp_barcoder_purchase` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mg` varchar(255) CHARACTER SET latin1 NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `agentid` int(11) NOT NULL,
  `source` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pack` int(11) NOT NULL,
  `sales` decimal(11,0) NOT NULL,
  `disc` decimal(11,0) NOT NULL,
  `date_ex` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_temp_record_purc`
--

CREATE TABLE `mp_temp_record_purc` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mg` varchar(255) CHARACTER SET latin1 NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `purchase` decimal(11,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `source` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pack` int(11) NOT NULL,
  `sales` decimal(11,0) NOT NULL,
  `disc` decimal(11,0) NOT NULL,
  `date_ex` date NOT NULL,
  `agentid` int(11) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `date_purc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_todolist`
--

CREATE TABLE `mp_todolist` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `addedby` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mp_town`
--

CREATE TABLE `mp_town` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `region` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_town`
--

INSERT INTO `mp_town` (`id`, `name`, `region`, `status`) VALUES
(1, 'Jakarta', 'Jawa', 0),
(2, 'Bali', 'Luar Jawa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mp_units`
--

CREATE TABLE `mp_units` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `symbol` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_units`
--

INSERT INTO `mp_units` (`id`, `name`, `symbol`) VALUES
(1, 'Pieces', 'Pcs'),
(2, 'Botol', 'btl'),
(3, 'Paket', 'pkt'),
(4, 'Sacet', 'sct'),
(5, 'Bungkus', 'bks'),
(6, 'Dus', 'Dus');

-- --------------------------------------------------------

--
-- Table structure for table `mp_users`
--

CREATE TABLE `mp_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_address` varchar(100) CHARACTER SET latin1 NOT NULL,
  `user_contact_1` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_contact_2` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cus_picture` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL,
  `user_description` varchar(100) CHARACTER SET latin1 NOT NULL,
  `user_password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_date` date NOT NULL,
  `agentname` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_users`
--

INSERT INTO `mp_users` (`id`, `user_name`, `user_email`, `user_address`, `user_contact_1`, `user_contact_2`, `cus_picture`, `status`, `user_description`, `user_password`, `user_date`, `agentname`) VALUES
(1, 'Supper Admin', 'yusufrois07@gmail.com', 'Jl . Bareng Jadian Kaga', '01745519614', '01715932630', '86ed815b3c9225ba422bcdad8cb8e3d8.png', 0, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2017-08-23', 'Supper Admin'),
(2, 'Sub Admin', 'argonbaru@gmail.com', 'dfgdsf', '5678686', '5686', 'default.jpg', 0, 'User', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2018-06-01', 'Md. Habibur Rahman');

-- --------------------------------------------------------

--
-- Table structure for table `mp_vehicle`
--

CREATE TABLE `mp_vehicle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `number` varchar(255) CHARACTER SET latin1 NOT NULL,
  `vehicle_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `chase_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `engine_no` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_vehicle`
--

INSERT INTO `mp_vehicle` (`id`, `name`, `number`, `vehicle_id`, `chase_no`, `engine_no`, `date`, `status`) VALUES
(1, 'PIkup', '101', '1123465', '123456', '1452', '2018-05-28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id` int(11) NOT NULL,
  `kode_produk` varchar(255) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `kategori_produk` varchar(255) DEFAULT NULL,
  `harga_beli` varchar(255) DEFAULT NULL,
  `harga_jual` varchar(255) DEFAULT NULL,
  `diskon` varchar(255) DEFAULT NULL,
  `harga_diskon` varchar(25) NOT NULL,
  `status_produk` varchar(255) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(1, 'GHNM0001', 'INDOMIE MIEGHETTI', 'MAKANAN', '0', '3200', '0', '3200', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(2, 'GHNM0002', 'CHITATO SAPI PNGANG', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(3, 'GHNM0003', 'CHITATO MAXX CHIL', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(4, 'GHNM0004', 'CHITATO SP PNGGANG 68', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(5, 'GHNM0005', 'CHITATO SP PNGGANG 55', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(6, 'GHNM0006', 'QTELA YAM GPREK', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(7, 'GHNM0007', 'CHITATO SP BMBU', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(8, 'GHNM0008', 'CHITATO KJ SUPRME', 'MAKANAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(9, 'GHNM0009', 'JETZ STICK CHO ', 'MAKANAN', '0', '4000', '0', '4000', 'Normal', '2022-08-09 13:48:59', 'admin', '12G'),
(10, 'GHNM0010', 'JETZ STICK CHO 40', 'MAKANAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '40G'),
(11, 'GHNM0011', 'QTELA AYM GPREK', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(12, 'GHNM0012', 'QTELA ORI 60', 'MAKANAN', '0', '5800', '0', '5800', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(13, 'GHNM0013', 'QTELA BBQ', 'MAKANAN', '0', '5800', '0', '5800', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(14, 'GHNM0014', 'QTELA BALADO', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(15, 'GHNM0015', 'QTELA CBE RWT ', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(16, 'GHNM0016', 'QTELA RMP LAUT', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(17, 'GHNM0017', 'QTELA UBI UNG', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '45G'),
(18, 'GHNM0018', 'QTELA ORI ', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(19, 'GHNM0019', 'SUN MRIE RLL B', 'MAKANAN', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(20, 'GHNM0020', 'PROMINA BISC', 'MAKANAN', '0', '14800', '0', '14800', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(21, 'GHNM0021', 'TARO JNG CHIC ', 'MAKANAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '36G'),
(22, 'GHNM0022', 'CHITATO LT RMPLT 68', 'MAKANAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(23, 'GHNM0023', 'CHITATO LT RMPLT 120', 'MAKANAN', '0', '15500', '0', '15500', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(24, 'GHNM0024', 'CHITATO LT RMPLT', 'MAKANAN', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '168G'),
(25, 'GHNM0025', 'LEE MNR BT 1.5', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '600ML'),
(26, 'GHNM0026', 'RAJARASA STIK PDS', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '160G'),
(27, 'GHNM0027', 'KRPK SNGKONG', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(28, 'GHNM0028', 'KRPIK SNGKONG PDS', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(29, 'GHNM0029', 'RAJARASA APML PDAS', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(30, 'GHNM0030', 'DEO GORIO VNRTG', 'MAKANAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(31, '2553223', 'ZUMAIKA BNGKT CK ', 'MAKANAN', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '400G'),
(32, '2553224', 'ZUMAIKA MOND SS ', 'MAKANAN', '0', '23000', '0', '23000', 'Normal', '2022-08-24 08:54:36', 'admin', '400G'),
(33, '2553225', 'ZUMAIKA KUE KC', 'MAKANAN', '0', '20000', '0', '20000', 'Normal', '2022-08-24 08:54:10', 'admin', '350G'),
(34, 'GHNM0031', 'POTABEE RUMLT ', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(35, 'GHNM0032', 'POTABEE BBQ', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(36, 'GHNM0033', 'POTABEE SLT EGG ', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(37, 'GHNM0034', 'POTABEE BF STEAK', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(38, 'GHNM0035', 'SUKI AYM KCP', 'MAKANAN', '0', '7900', '0', '7900', 'Normal', '2022-03-29 00:00:00', 'Admin', '125G'),
(39, 'GHNM0036', 'OSH POP JGBKR', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(40, 'GHNM0037', 'TICTIC SMBAL CLK', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(41, 'GHNM0038', 'TICTIC BWANG', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(42, 'GHNM0039', 'POTABEE MLT CHES', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '57G'),
(44, 'GHNM0041', 'CHITATO SPBUM BKR', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(45, 'GHNM0042', 'CHITATO LITE RMP', 'MAKANAN', '0', '5800', '0', '5800', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(46, 'GHNM0043', 'CHITATO AYM BUMB', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(47, 'GHNM0044', 'CHITATO SP PNGGANG', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(48, 'GHNM0045', 'PIATTOS SMB GPREK', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(49, 'GHNM0046', 'TARO SEAWEED', 'MAKANAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(50, 'GHNM0047', 'TARO CWB STK', 'MAKANAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '36G'),
(51, 'GHNM0048', 'TARO PTT BBQ', 'MAKANAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '36G'),
(52, 'GHNM0049', 'KRISBEE KETNG GRG', 'MAKANAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(53, 'GHNM0050', 'SIIP RST CORN ', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(54, 'GHNM0051', 'SIIP RICHO', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(55, 'GHNM0052', 'SIIP CHEESE', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(56, 'GHNM0053', 'CHITATO CHEESE', 'MAKANAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(57, 'GHNM0054', 'PIATTOS SP PANGNG', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(58, 'GHNM0055', 'PIATTOS SMB GPREK', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(59, 'GHNM0056', 'PIATTOS SMB MTH', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(60, 'GHNM0057', 'PIATTOS SMB TRS', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(61, 'GHNM0058', 'PIATTOS IGA PNYT', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(62, 'GHNM0059', 'PIATTOS BBQ KN', 'MAKANAN', '0', '8500', '2000', '6500', 'PROMO', '2022-03-29 00:00:00', 'Admin', '75G'),
(63, 'GHNM0060', 'PIATTOS RMP LAUT', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-07-17 21:23:47', 'admin', '75G'),
(64, 'GHNM0061', 'PIATTOS AYM TRYAKI', 'MAKANAN', '0', '9800', '1800', '8000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '85G'),
(65, 'GHNM0062', 'PIATTOS BBQ 75G', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-07-17 21:23:04', 'admin', '75G'),
(66, 'GHNM0063', 'MKRANI BNCABE L10', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(67, 'GHNM0064', 'GARUDA OCRN SALT', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(68, 'GHNM0065', 'GARUDA KC KLT', 'MAKANAN', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '155G'),
(69, 'GHNM0066', 'GARUDA KC KLT 60', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(70, 'GHNM0067', 'GARUDA PTT BBQ', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(71, 'GHNM0068', 'GARUDA KC TLR', 'MAKANAN', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '220G'),
(72, 'GHNM0069', 'TICTAC ORI', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(73, 'GHNM0070', 'TICTAC PDS', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(74, 'GHNM0071', 'TICTAC RMP LAUT', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-08-04 10:16:51', 'admin', '90G'),
(75, 'GHNM0072', 'TICTAC AYM BWG', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-08-04 10:15:50', 'admin', '90G'),
(76, 'GHNM0073', 'TICTAC SP PANG', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-08-04 10:16:21', 'admin', '90G'),
(77, 'GHNM0074', 'TICTAC MIX', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-08-04 10:17:43', 'admin', '90G'),
(78, 'GHNM0075', 'PILUS SP PANG ', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(79, 'GHNM0076', 'SUKRO ORI ', 'MAKANAN', '0', '8600', '0', '8600', 'Normal', '2022-08-09 11:07:08', 'admin', '120G'),
(80, 'GHNM0077', 'KC KORO RMPLT', 'MAKANAN', '0', '9800', '0', '9800', 'Normal', '2022-08-04 10:18:26', 'admin', '65G'),
(81, 'GHNM0078', 'KC POLONG ORI', 'MAKANAN', '0', '8800', '0', '8800', 'Normal', '2022-03-29 00:00:00', 'Admin', '65G'),
(82, 'GHNM0079', 'TORTILLA JGUNG BKR', 'MAKANAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(83, 'GHNM0080', 'MONDE GOLD', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(84, 'GHNM0081', 'PIEBIS ALMOND', 'MAKANAN', '0', '9200', '0', '9200', 'Normal', '2022-06-16 09:26:15', 'admin', '190G'),
(85, 'GHNM0082', 'TOSS RMP LAUT ', 'MAKANAN', '0', '8800', '0', '8800', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(86, 'GHNM0083', 'TOSS SP PANG', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(87, 'GHNM0084', 'HPPYTOS JG BKR', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(88, 'GHNM0085', 'HPPYTOS KEJU', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(89, 'GHNM0086', 'JAPOTA HONEY', 'MAKANAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(90, 'GHNM0087', 'JAPOTA RMP LAUT', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '68G'),
(91, 'GHNM0088', 'TWSITKO JG BKAR', 'MAKANAN', '0', '12500', '0', '12500', 'Normal', '2022-03-29 00:00:00', 'Admin', '145G'),
(92, 'GHNM0089', 'TWISTKO KEJU', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(93, 'GHNM0090', 'TWISTKO JG BKAR', 'MAKANAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(94, 'GHNM0091', 'DELUX COOKIES CHO', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '160G'),
(95, 'GHNM0092', 'GABIN COK ', 'MAKANAN', '0', '23000', '0', '23000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350G'),
(96, 'GHNM0093', 'SLAIOLAI NNAS', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '240G'),
(97, 'GHNM0094', 'BONBON BISC CHO', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(98, 'GHNM0095', 'BUTTER CREM BISC', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '220G'),
(99, 'GHNM0096', ' MEGARING ORG BISC', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '260G'),
(100, 'GHNM0097', 'COCOPUFF COK', 'MAKANAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '240G'),
(101, 'GHNM0098', 'HATARI WHT COFFEE', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(102, 'GHNM0099', 'KG SUPERCO ', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '138G'),
(103, 'GHNM0100', 'GLAZIN CCNUT', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-05-07 12:04:49', 'admin', '175G'),
(104, 'GHNM0101', 'HATARI LMN BISC', 'MAKANAN', '0', '5200', '0', '5200', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(105, 'GHNM0102', 'HATARI CAPPU', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(106, 'GHNM0103', 'HITMMNIS WHTCFFE BISC', 'MAKANAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '99G'),
(107, 'GHNM0104', 'HTMMNIS MELON', 'MAKANAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '99G'),
(108, 'GHNM0105', 'SALTCHEESE CMB ', 'MAKANAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '175G'),
(109, 'GHNM0106', 'UNIBIS SHRTCK  BLUEBRR ', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '225G'),
(110, 'GHNM0107', 'UNIBIS SHRTCK  STRAW ', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '225G'),
(111, 'GHNM0108', 'KG COMBOCIZ', 'MAKANAN', '0', '10500', '0', '10500', 'Normal', '2022-06-25 11:23:15', 'admin', '175G'),
(112, 'GHNM0109', 'GOODTIME CLSC', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '72G'),
(113, 'GHNM0110', 'OZLO CHOC ', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125G'),
(114, 'GHNM0111', 'GLAZIN CCNUT 90', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-05-07 12:06:07', 'admin', '90G'),
(115, 'GHNM0112', 'GERY SLT MATCH', 'MAKANAN', '0', '6500', '1000', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(116, 'GHNM0113', 'NEXTAR COK ', 'MAKANAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '34G'),
(117, 'GHNM0114', 'LEMONIA CHOC BISC', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '130G'),
(118, 'GHNM0115', 'TANGO WF CHO', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '176G'),
(119, 'GHNM0116', 'NABATI RICHEESE', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '130G'),
(120, 'GHNM0117', 'NABATI PINK LV', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '130G'),
(121, 'GHNM0118', 'NABATI RICHEESE 46', 'MAKANAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '46G'),
(122, 'GHNM0119', 'NABATI WHITE', 'MAKANAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '46G'),
(123, 'GHNM0120', 'NISSIN WF CHO', 'MAKANAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '42G'),
(124, 'GHNM0121', 'SELAMAT WF CHO', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(125, 'GHNM0122', 'BISVIT KLPA', 'MAKANAN', '0', '1500', '0', '1500', 'Normal', '2022-03-29 00:00:00', 'Admin', '36G'),
(126, 'GHNM0123', 'MARIEDUO PEANT', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(127, 'GHNM0124', 'OREO RLL PNUTCHO', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '123G'),
(128, 'GHNM0125', 'OREO RLL ICECRE', 'MAKANAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '133G'),
(129, 'GHNM0126', 'OREO RLL REDVEL', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '123G'),
(130, 'GHNM0127', 'OREO RLL FIZZY', 'MAKANAN', '0', '8300', '0', '8300', 'Normal', '2022-08-09 11:40:19', 'admin', '123G'),
(131, 'GHNM0128', 'OREO RLL DARKWHT', 'MAKANAN', '0', '7500', '0', '7500', 'Normal', '2022-08-09 11:40:48', 'admin', '123G'),
(132, 'GHNM0129', 'OREO RLL STR', 'MAKANAN', '0', '7300', '0', '7300', 'Normal', '2022-08-09 11:38:46', 'admin', '123G'),
(133, 'GHNM0130', 'CRUNCH WF CHO', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '10G'),
(134, 'GHNM0131', 'ZYLUC STCK CHO', 'MAKANAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '45G'),
(135, 'GHNM0132', 'PRETZ PIZZA STK', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '31G'),
(136, 'GHNM0133', 'PRETZ JGUNG MNS ', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '31G'),
(137, 'GHNM0134', 'POCKY DCHO ', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '47G'),
(138, 'GHNM0135', 'POCKY CREAM', 'MAKANAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '40G'),
(139, 'GHNM0136', 'POCKY MATCHA', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '33G'),
(140, 'GHNM0137', 'POCKY BNN', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '42G'),
(141, 'GHNM0138', 'TWISTER CHO', 'MAKANAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '45G'),
(142, 'GHNM0139', 'FULLO CHOSTR', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '24.8G'),
(143, 'GHNM0140', 'DEKA WF RLLCCNUT', 'MAKANAN', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '24.8G'),
(144, 'GHNM0141', 'CHOCOLATOS CK ', 'MAKANAN', '0', '11000', '0', '11000', 'Normal', '2022-03-29 00:00:00', 'Admin', '24G'),
(145, 'GHNM0142', 'DEKA WFR RLLCHO', 'MAKANAN', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '24.8G'),
(146, 'GHNM0143', 'NABATI WF RICHEE', 'MAKANAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(147, 'GHNM0144', 'FULLO VANMILK', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '24.7G'),
(148, 'GHNM0145', 'BRIKO BLCK', 'MAKANAN', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(149, 'GHNM0146', 'TANGO PCH CHO', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '125G'),
(150, 'GHNM0147', 'KRISBEE STR', 'MAKANAN', '0', '11000', '0', '11000', 'Normal', '2022-03-29 00:00:00', 'Admin', '110G'),
(151, 'GHNM0148', 'TANGO PCH BNNA', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(152, 'GHNM0149', 'PILLOW DURIAN', 'MAKANAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '110G'),
(153, 'GHNM0150', 'REBO MILK', 'MAKANAN', '0', '16500', '0', '16500', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(154, 'GHNM0151', 'REBO GREENTEA', 'MAKANAN', '0', '15500', '0', '15500', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(155, 'GHNM0152', 'REBO CRMEL ', 'MAKANAN', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(156, 'GHNM0153', 'REBO ORI', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(157, '2553235', 'MATAHARI ULIR', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(158, '2553237', 'MATAHARI GJAH', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(159, '2553234', 'MATAHARI KEJU', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(160, '2553238', 'MATAHARI BLT', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(161, '2553635', 'YAYO JGUNG PDS', 'MAKANAN', '0', '10300', '0', '10300', 'Normal', '2022-07-20 10:14:21', 'admin', '100G'),
(162, '2553239', 'MATAHARI COK', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(163, '2553233', 'MATAHARI PSNG', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(164, '2553235', 'MATAHARI ULIR PDS', 'MAKANAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(165, 'GHNM0154', 'REGAL MARIE BISC', 'MAKANAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(166, 'GHNM0155', 'REGAL MARIE BISC 230', 'MAKANAN', '0', '19000', '0', '19000', 'Normal', '2022-03-29 00:00:00', 'Admin', '230G'),
(167, 'GHNM0156', 'MILK MRIE BISC', 'MAKANAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125G'),
(168, 'GHNM0157', 'SUN MRIE RLL ', 'MAKANAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(169, 'GHNM0158', 'BOURBON BLCK ', 'MAKANAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140G'),
(170, 'GHNM0159', 'GENJI CHOC BISC', 'MAKANAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '110G'),
(171, 'GHNM0160', 'GENJI STR BISC', 'MAKANAN', '0', '8800', '0', '8800', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(172, 'GHNM0161', 'GENJI MN PIE', 'MAKANAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '50G'),
(173, 'GHNM0162', 'WALENS CHOC SOES', 'MAKANAN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(174, 'GHNM0163', 'MALKIST COK ', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(175, 'GHNM0164', 'MALKIST RMPT LAUT', 'MAKANAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '135G'),
(176, 'GHNM0165', 'MONDE BUTTR COOKS ', 'MAKANAN', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(177, 'GHNM0166', 'MONDE KEJU COOKS', 'MAKANAN', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(178, 'GHNM0167', 'SNACKIT PIA KH', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(179, 'GHNM0168', 'SNACKIT PIA COK', 'MAKANAN', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(180, '2553227', 'ZUMAIKA SUMPRIT', 'MAKANAN', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300G'),
(181, '2553226', 'ZUMAIKA LDH KCNG', 'MAKANAN', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350G'),
(182, '2553228', 'ZUMAIKA BNGKT MWR', 'MAKANAN', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300G'),
(183, 'GHNM0169', 'OZLO CHOC CKIES', 'MAKANAN', '0', '15500', '0', '15500', 'Normal', '2022-03-29 00:00:00', 'Admin', '145G'),
(184, 'GHNM0170', 'BSKTOP BTTR BISC', 'MAKANAN', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '370G'),
(185, 'GHNM0171', 'BSKTOP ASS COLLCTION', 'MAKANAN', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '400G'),
(186, 'GHNM0172', 'BSKTOP ASS CHO', 'MAKANAN', '0', '28000', '0', '28000', 'Normal', '2022-03-29 00:00:00', 'Admin', '400G'),
(187, 'GHNM0173', 'BSKTOP ASS MILK', 'MAKANAN', '0', '28000', '0', '28000', 'Normal', '2022-03-29 00:00:00', 'Admin', '400G'),
(188, 'GHNM0174', 'LEMONIA LMN KLG', 'MAKANAN', '0', '46000', '0', '46000', 'Normal', '2022-03-29 00:00:00', 'Admin', '650G'),
(189, 'GHNM0175', 'CHOCHO RLL CHO', 'MAKANAN', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '260G'),
(190, 'GHNM0176', 'HOLLANDA BTTR CKIES', 'MAKANAN', '0', '28000', '0', '28000', 'Normal', '2022-03-29 00:00:00', 'Admin', '225G'),
(191, 'GHNM0177', 'KHONG GUAN BISC', 'MAKANAN', '0', '58000', '0', '58000', 'Normal', '2022-03-29 00:00:00', 'Admin', '650G'),
(192, 'GHNM0178', 'OZLO JUST TWOFUS', 'MAKANAN', '0', '32000', '0', '32000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250G'),
(193, 'GHNM0179', 'MONDE EGG RLL', 'MAKANAN', '0', '58000', '0', '58000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300G'),
(194, 'GHNM0180', 'NARY SYBEAN ', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(195, 'GHNM0181', 'BEARBRAND TEH PTH ', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140ML'),
(196, 'GHNM0182', 'BEARBRAND MLT PTH', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140ML'),
(197, 'GHNM0183', 'SS TUJUH KURM ', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(198, 'GHNM0184', 'BEARBRAND ORI ', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-16 11:41:39', 'admin', '189ML'),
(199, 'GHNM0185', 'INDOMILK BT MLN', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '189ML'),
(200, 'GHNM0186', 'INDOMILK BT CK', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '190ML'),
(201, 'GHNM0187', 'GREENFL UHT STR', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(202, 'GHNM0188', 'ANLENE UHT COK ', 'MINUMAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '175ML'),
(203, 'GHNM0189', 'ANLENE UHT VAN', 'MINUMAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '175ML'),
(204, 'GHNM0190', 'PRENAGEN UHT ALMN', 'MINUMAN', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(205, 'GHNM0191', 'PRENAGEN UHT BRRLV', 'MINUMAN', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(206, 'GHNM0192', 'VIDORANT UHT STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '`175ML'),
(207, 'GHNM0193', 'CIMORY FRSMILK ALM', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(208, 'GHNM0194', 'CIMORY FRSMILK STR', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(209, 'GHNM0195', 'TANGO UHT STR', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(210, 'GHNM0196', 'CIMORY FRSMILK CHSW', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(211, 'GHNM0197', 'CIMORY UHT YGTSTR', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(212, 'GHNM0198', 'CIMORY UHT YGTBBR', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(213, 'GHNM0199', 'CIMORY UHTTYO STR', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(214, 'GHNM0200', 'CIMORY UHTTYO COK', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(215, 'GHNM0201', 'DANCOW UHT COK', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '110ML'),
(216, 'GHNM0202', 'MILO UHT COK 180', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '180ML'),
(217, 'GHNM0203', 'TEH UHTKTK MLTI', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(218, 'GHNM0204', 'ULTRAMILK UHT MOK', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(219, 'GHNM0205', 'ULTRAMIMI UHT COK', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(220, 'GHNM0206', 'GREENFL UHT STR 200', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(221, 'GHNM0207', 'MILO UHT COK', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '110ML'),
(222, 'GHNM0208', 'DANCOW UHT STR', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '110ML'),
(223, 'GHNM0209', 'ULTRAMIMI UHT STR', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(224, 'GHNM0210', 'COCO 9 UHT KLP', 'MINUMAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(225, 'GHNM0211', 'REALGD PCH STR', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(226, 'GHNM0212', 'GREENFL UHT FC ', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(227, 'GHNM0213', 'HYDROCOCO ORI ', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(228, 'GHNM0214', 'TEH UHTKTK LMN', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(229, 'GHNM0215', 'LASEGAR KLG STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(230, 'GHNM0216', 'BINTNG KLG ZRO', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '330ML'),
(231, 'GHNM0217', 'LRTAN K3 ANK LC', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(232, 'GHNM0218', 'LRTAN K3 ANK STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(233, 'GHNM0219', 'LRTAN K3 ANK JRK', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(234, 'GHNM0220', 'REDBULL KLG', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(235, 'GHNM0221', 'FANTA BT STR', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(236, 'GHNM0222', 'SPRITE BT ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(237, 'GHNM0223', 'FANTA SODA', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(238, 'GHNM0224', 'FLORIDINA BT ORG ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(239, 'GHNM0225', 'FLORIDINA BT ORGCOC', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(240, 'GHNM0226', 'GOODDAY TRMS', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(241, 'GHNM0227', 'GOODDAY AVCDO ', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(242, 'GHNM0228', 'ABC KOPSUS', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(243, 'GHNM0229', 'ABC CHOCMLT', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(244, 'GHNM0230', 'KOPIKO 78C', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '240ML'),
(245, 'GHNM0231', 'TORACFE CAPP', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '180ML'),
(246, 'GHNM0232', 'LUWAK WHTCOFF', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '220ML'),
(247, 'GHNM0233', 'TORACFE LATTE', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '180ML'),
(248, 'GHNM0234', 'GOLDA COFF', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(249, 'GHNM0235', 'KA SIGNATURE ', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(250, 'GHNM0236', 'NARY BT COK', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(251, 'GHNM0237', 'NARY BT STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(252, 'GHNM0238', 'NARY BT MLN', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(253, 'GHNM0239', 'NARY BT ORI', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(254, 'GHNM0240', 'CIMORY BT YGTBBR', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-06-03 12:03:33', 'admin', '240ML'),
(255, 'GHNM0241', 'CIMORY BT YGTSTR', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-06-03 12:03:54', 'admin', '240ML'),
(256, 'GHNM0242', 'MILKU BT COK', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(257, 'GHNM0243', 'MILKU BT STR', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(258, 'GHNM0244', 'CIMORY SQQZ ALV', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(259, 'GHNM0245', 'CIMORY SQQZ HNY', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(260, 'GHNM0246', 'CIMORY SQQZ ORI', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(261, 'GHNM0247', 'CIMORY YGTSTR SLP', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '5.70ML'),
(262, 'GHNM0248', 'LRUTAN KLG ANGR', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(263, 'GHNM0249', 'LRUTAN KLG MLN', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(264, 'GHNM0250', 'LRUTAN KLG LC', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '320ML'),
(265, 'GHNM0251', 'PANDA GRS JELLY', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '310ML'),
(266, 'GHNM0252', 'NARY KLG CNCU', 'MINUMAN', '0', '4900', '0', '4900', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(267, 'GHNM0253', 'NESCF KLG LATT', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-05-19 20:36:15', 'admin', '240ML'),
(268, 'GHNM0254', 'NESCF KLG LATTICE', 'MINUMAN', '0', '10000', '4000', '6000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '220ML'),
(269, 'GHNM0255', 'NESCF KLG CPP', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '220ML'),
(270, 'GHNM0256', 'MILO KLG COK', 'MINUMAN', '0', '10000', '3000', '7000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '240ML'),
(271, 'GHNM0257', 'DELMONTE KLG MATC', 'MINUMAN', '0', '10000', '1000', '9000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '240ML'),
(272, 'GHNM0258', 'OLATTE KLG PEACH', 'MINUMAN', '0', '10000', '1000', '9000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '240ML'),
(273, 'GHNM0259', 'OLATTE KLG PEAR', 'MINUMAN', '0', '10000', '1000', '9000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '240ML'),
(274, 'GHNM0260', 'CIMRY FRSMLK CHO', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(275, 'GHNM0261', 'LASEGAR BT', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(276, 'GHNM0262', 'LASEGAR BT 500', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(277, 'GHNM0263', 'LARUTN K3 BT ', 'MINUMAN', '0', '6800', '0', '6800', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(278, 'GHNM0264', 'LARUTN BDK BT', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(279, 'GHNM0265', 'LARUTN BT K3ANK', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(280, 'GHNM0266', 'PCARI SWT BT 500', 'MINUMAN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(281, 'GHNM0267', 'PCARI SWT BT', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-04-27 21:10:03', 'admin', '350ML'),
(282, 'GHNM0268', 'HEMVITN KLG C1000', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '150ML'),
(283, 'GHNM0269', 'YOUC 1000 ORG', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140ML'),
(284, 'GHNM0270', 'KRATINGDNG KLG', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150ML'),
(285, 'GHNM0271', 'HEMVITN KLG ', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150ML'),
(286, 'GHNM0272', 'KIRANTI HNY GINGR', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '150ML'),
(287, 'GHNM0273', 'KIRANTI ORG', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150ML'),
(288, 'GHNM0274', 'KIRANTI ORI', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '150ML'),
(289, 'GHNM0275', 'YUZU BT ORI', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(290, 'GHNM0276', 'COOLTIME KLP', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(291, 'GHNM0277', 'ORANGE WTR BT ', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(292, 'GHNM0278', 'ICHIOCHA GRTEA ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(293, 'GHNM0279', 'COCOBIT GV ', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(294, 'GHNM0280', 'COCOBIT MNGO', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(295, 'GHNM0281', 'COOLANT LC ', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(296, 'GHNM0282', 'YUZU ISO', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(297, 'GHNM0283', 'FRUITTEA STR ', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(298, 'GHNM0284', 'FRUITTEA BLCKCRR', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(299, 'GHNM0285', 'FRUITEA XTREME', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(300, 'GHNM0286', 'ICHIOCHA MLT', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(301, 'GHNM0287', 'ISOPLUS ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(302, 'GHNM0288', 'SPRITE WTRLMN', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '425ML'),
(303, 'GHNM0289', 'MIZONE CRANBRR', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(304, 'GHNM0290', 'TEH PUCK ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(305, 'GHNM0291', 'ORANAMIN C', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120ML'),
(306, 'GHNM0292', 'FIBE MINI ', 'MINUMAN', '0', '7800', '0', '7800', 'Normal', '2022-03-29 00:00:00', 'Admin', '100ML'),
(307, 'GHNM0293', 'YAKULT 5PCS SLP', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '65ML'),
(308, 'GHNM0294', 'MILK UHT STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(309, 'GHNM0295', 'ULTRAMIMI UHT FC ', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '125ML'),
(310, 'GHNM0296', 'NESCF UHT FV', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '180ML'),
(311, 'GHNM0297', 'NESCF UHT BLCK', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '180ML'),
(312, 'GHNM0298', 'MILK UHT CK', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(313, 'GHNM0299', 'COOLANT STR FRT', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '350ML'),
(314, 'GHNM0300', 'NESCF KLG ORI ', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '240ML'),
(315, 'GHNM0301', 'NESCF KLG CRML', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '240ML'),
(316, 'GHNM0302', 'JAVACAFE MOCH', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '240ML'),
(317, 'GHNM0303', 'POCRI SWT KLG', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '330ML'),
(318, 'GHNM0304', 'KIN YGT BBR', 'MINUMAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(319, 'GHNM0305', 'KIN YGT BBR', 'MINUMAN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(320, 'GHNM0306', 'YOGURT UHT STR', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(321, 'GHNM0307', 'ULTRAMILK UHT KRM', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(322, 'GHNM0308', 'ULTRAMILK UHT STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(323, 'GHNM0309', 'ULTRAMILK UHT FC', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(324, 'GHNM0310', 'ABC UHT JMB', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(325, 'GHNM0311', 'ABC UHT ORG', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(326, 'GHNM0312', 'ABC UHT APPL', 'MINUMAN', '0', '6800', '0', '6800', 'Normal', '2022-03-29 00:00:00', 'Admin', '250ML'),
(327, 'GHNM0313', 'ASIA PND MILK', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(328, 'GHNM0314', 'ADEMSR BT', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '600ML'),
(329, 'GHNM0315', 'KALBE HIC1000', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140ML'),
(330, 'GHNM0316', 'WCC CCPND CP', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(331, 'GHNM0317', 'HILO UHT TRO', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(332, 'GHNM0318', 'HILO UHT CHO', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(333, 'GHNM0319', 'LEE MNR BT 300', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1.5L'),
(334, 'GHNM0320', 'AQUA BT 1.5', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1.5L'),
(335, 'GHNM0321', 'OXYMAX BT', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1.5L'),
(336, 'GHNM0322', 'VIT BT', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1.5L'),
(337, 'GHNM0323', 'LABINI BT', 'MINUMAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '600ML'),
(338, 'GHNM0324', 'AQUA BT', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '600ML'),
(339, 'GHNM0325', 'NANOXY O2 BT', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500ML'),
(340, 'GHNM0326', 'SUPER 02 BT', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '385ML'),
(341, 'GHNM0327', 'NANOXY 02 BT 300', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(342, 'GHNM0328', 'AWATER BT', 'MINUMAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '330ML'),
(343, 'GHNM0329', 'ALKALINE WTR BT', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '330ML'),
(344, 'GHNM0330', 'CLEO BT 550', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '550ML'),
(345, 'GHNM0331', 'AWATER ORG BT', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '550ML'),
(346, 'GHNM0332', 'PRISTINE BT', 'MINUMAN', '0', '7000', '2000', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '600ML'),
(347, 'GHNM0333', 'PRISTINE BT', 'MINUMAN', '0', '3600', '0', '3600', 'Normal', '2022-03-29 00:00:00', 'Admin', '400ML'),
(348, 'GHNM0334', 'GOODMD BLCRRN', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '450ML'),
(349, 'GHNM0335', 'LEE MNR BT ', 'MINUMAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '330ML'),
(350, 'GHNM0336', 'AQUCUI BT ', 'MINUMAN', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(351, 'GHNM0337', 'CLEO BT', 'MINUMAN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '220ML'),
(352, 'GHNM0338', 'KCAP SEDAAP BT 100', 'SEMBAKO', '0', '32500', '0', '32500', 'Normal', '2022-03-29 00:00:00', 'Admin', '100ML'),
(353, 'GHNM0339', 'KCAP 2BRUNG BT', 'SEMBAKO', '0', '16000', '0', '16000', 'Normal', '2022-03-29 00:00:00', 'Admin', '625ML'),
(354, 'GHNM0340', 'KCAP SOTO BT', 'SEMBAKO', '0', '20000', '0', '20000', 'Normal', '2022-03-29 00:00:00', 'Admin', '620ML'),
(355, '2140558', 'SAOS LZ TMT', 'SEMBAKO', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '600ML'),
(356, '2566455', 'SAOS LZ SMB', 'SEMBAKO', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '630ML'),
(357, 'GHNM0341', 'KCAP INDFD RF', 'SEMBAKO', '0', '14500', '0', '14500', 'Normal', '2022-03-29 00:00:00', 'Admin', '520ML'),
(358, 'GHNM0342', 'KCAP ABC RF', 'SEMBAKO', '0', '20000', '0', '20000', 'Normal', '2022-03-29 00:00:00', 'Admin', '700ML'),
(359, 'GHNM0343', 'SASA SNTAN ', 'SEMBAKO', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200ML'),
(360, 'GHNM0344', 'SUN SNTAN', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '65ML'),
(361, 'GHNM0345', 'BLUEBND TB ', 'SEMBAKO', '0', '19700', '0', '19700', 'Normal', '2022-07-17 21:38:01', 'admin', '250G'),
(362, 'GHNM0346', 'SARMI ST 2', 'SEMBAKO', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '113G'),
(363, 'GHNM0347', 'SARMI GRENG 2', 'SEMBAKO', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '126G'),
(364, 'GHNM0348', 'SARMI KLDU', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-18 10:37:24', 'admin', '70G'),
(365, 'GHNM0349', 'SARMI AYM KRM', 'SEMBAKO', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125G'),
(366, 'GHNM0350', 'SUPRMIE STK AYM', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(367, 'GHNM0351', 'BIHUNK ST ', 'SEMBAKO', '0', '3200', '0', '3200', 'Normal', '2022-07-18 10:35:54', 'admin', '55G'),
(368, 'GHNM0352', 'BIHUNK AYM BWG', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-07-18 10:36:59', 'admin', '55G'),
(369, 'GHNM0353', 'BIHUNK ASM PDAS', 'SEMBAKO', '0', '3200', '0', '3200', 'Normal', '2022-07-18 10:35:05', 'admin', '55G'),
(370, 'GHNM0354', 'INDMIE ST LMG', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(371, 'GHNM0355', 'INDMIE AYM POP', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(372, 'GHNM0356', 'INDMIE MTH', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(373, 'GHNM0357', 'INDMIE RICA', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:39:16', 'admin', '85G'),
(374, 'GHNM0358', 'INDMIE ACEH', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:42:07', 'admin', '90G'),
(375, 'GHNM0359', 'INDMIE AYMBWG', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:37:49', 'admin', '69G'),
(376, 'GHNM0360', 'INDMIE KRAYM', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:39:41', 'admin', '72G'),
(377, 'GHNM0361', 'INDMIE RNDANG', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '91G'),
(378, 'GHNM0362', 'BIHUNK GRENG', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:36:26', 'admin', '55G'),
(379, 'GHNM0363', 'MIESDP ST PAK', 'SEMBAKO', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '375G'),
(380, 'GHNM0364', 'MIESDP ST ', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(381, 'GHNM0365', 'MIESDP KRSPSIAL', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '76G'),
(382, 'GHNM0366', 'MIESDP KRNGRG', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '87G'),
(383, 'GHNM0367', 'MIESDP GRENG', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(384, 'GHNM0368', 'MIESDP SNGPOR', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '83G'),
(385, 'GHNM0369', 'MIESDP AYMLMAU', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '89G'),
(386, 'GHNM0370', 'INDMIE STSPSIAL', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:40:34', 'admin', '75G'),
(387, 'GHNM0371', 'ABCMI AYMBWG', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '65G'),
(388, 'GHNM0372', 'ABCMI PDSLIMA', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(389, 'GHNM0373', 'SJTMIE AYMPNG', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(390, 'GHNM0374', 'SJTMIE STAYM', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(391, 'GHNM0375', 'NISSNMI HTCRB', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '81G'),
(392, 'GHNM0376', 'NISSNMI AYMPDS', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(393, 'GHNM0377', 'NISSNMI PDSKH', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '74G'),
(394, 'GHNM0378', 'MIBNCAB GRG', 'SEMBAKO', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '105G'),
(395, 'GHNM0379', 'NISSNMI HTCRB', 'SEMBAKO', '0', '6600', '0', '6600', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(396, 'GHNM0380', 'LEMNLO AYMBWG', 'SEMBAKO', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(397, 'GHNM0381', 'LEMNLO KRAYM', 'SEMBAKO', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '73G'),
(398, 'GHNM0382', 'BAMBOE RWON', 'BUMBU', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '54G'),
(399, 'GHNM0383', 'SASAAYM KNG', 'BUMBU', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(400, 'GHNM0384', 'SJKU NSGOR PDS', 'BUMBU', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(401, 'GHNM0385', 'MSAKO SP ', 'BUMBU', '0', '6000', '0', '6000', 'Normal', '2022-05-07 12:18:04', 'admin', '100G'),
(402, 'GHNM0386', 'RYCO AYM', 'BUMBU', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '230G'),
(403, 'GHNM0387', 'RYCO SP', 'BUMBU', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '94G'),
(404, 'GHNM0388', 'SJKU SRBGNA', 'BUMBU', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '40G'),
(405, 'GHNM0389', 'MMSUKA RNDANG', 'BUMBU', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(406, 'GHNM0390', 'ANTKA BLD PDS', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(407, 'GHNM0391', 'ANTKA SMB BLD', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(408, 'GHNM0392', 'ANTKA JG BKR', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(409, 'GHNM0393', 'ANTKA BLD', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(410, 'GHNM0394', 'MMQU BLD', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(411, 'GHNM0395', 'MMQU BBQ', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(412, 'GHNM0396', 'AJNMOTO 100', 'BUMBU', '0', '5500', '0', '5500', 'Normal', '2022-08-17 09:57:48', 'admin', '100G'),
(413, 'GHNM0397', 'AJNMOTO 250', 'BUMBU', '0', '12000', '0', '12000', 'Normal', '2022-08-17 09:58:21', 'admin', '250G'),
(414, 'GHNM0398', 'SASA GRM', 'BUMBU', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250G'),
(415, 'GHNM0399', 'REFIM GRM ', 'BUMBU', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(416, 'GHNM0400', 'GYRI GRM', 'BUMBU', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(417, 'GHNM0401', '2ANK GRM', 'BUMBU', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '250G'),
(418, 'GHNM0402', 'MWON GRM ', 'BUMBU', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '300G'),
(419, 'GHNM0403', 'AJNMOTO 115', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '116G'),
(420, '77568898', 'MNTEP PCL PDS', 'BUMBU', '0', '14000', '0', '14000', 'Normal', '2022-03-29 00:00:00', 'Admin', '230G'),
(421, 'GHNM0404', 'MNTEP PCL SDG', 'BUMBU', '0', '14000', '0', '14000', 'Normal', '2022-03-29 00:00:00', 'Admin', '230G'),
(422, 'GHNM0405', 'MNTEP PCL PDS 90', 'BUMBU', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(423, 'GHNM0406', 'PARRT DRK CHO', 'BUMBU', '0', '29500', '0', '29500', 'Normal', '2022-07-17 21:32:41', 'admin', '500G'),
(424, 'GHNM0407', 'PRCHIZ SLC ', 'BUMBU', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(425, 'GHNM0408', 'FLMBOYNT CHO', 'BUMBU', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250G'),
(426, 'GHNM0409', 'PLMIA BTTR', 'BUMBU', '0', '8000', '1500', '6500', 'PROMO', '2022-03-29 00:00:00', 'Admin', '200G'),
(427, 'GHNM0410', 'AMNDA BTTR', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(428, 'GHNM0411', 'ABC TRSUDG', 'BUMBU', '0', '7500', '0', '7500', 'Normal', '2022-04-27 15:45:57', 'admin', '84G'),
(429, 'GHNM0412', 'MMSUKA TRSUDG', 'BUMBU', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(430, 'GHNM0413', 'KRAFT MN', 'BUMBU', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(431, 'GHNM0414', 'MSAKO AYM RTG', 'BUMBU', '0', '5800', '0', '5800', 'Normal', '2022-03-29 00:00:00', 'Admin', '9G'),
(432, 'GHNM0415', 'MSAKO SP RTG', 'BUMBU', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '9G'),
(433, 'GHNM0416', 'RYCO SP RTG', 'BUMBU', '0', '5800', '0', '5800', 'Normal', '2022-03-29 00:00:00', 'Admin', '8G'),
(434, 'GHNM0417', 'RYCO AYM RTG', 'BUMBU', '0', '5800', '0', '5800', 'Normal', '2022-03-29 00:00:00', 'Admin', '8G'),
(435, 'GHNM0418', 'LDPAS MRC RTG', 'BUMBU', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2.5G'),
(436, 'GHNM0419', 'BMBUK MRC RTG', 'BUMBU', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '2.5G'),
(437, 'GHNM0420', 'BONNRI PDS RTG', 'BUMBU', '0', '20500', '0', '20500', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(438, 'GHNM0421', 'BONNRI ORI RTG', 'BUMBU', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(439, 'GHNM0422', 'BMBUK KTM RTG', 'BUMBU', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(440, 'GHNM0423', 'CHILLIQU TMT RTG', 'BUMBU', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(441, 'GHNM0424', 'ABC TRS RTG', 'BUMBU', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(442, 'GHNM0425', 'KCAP SDAAP RF', 'SEMBAKO', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '63ML'),
(443, 'GHNM0426', 'KCAP SDAAPRF', 'SEMBAKO', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '225ML'),
(444, 'GHNM0427', 'KCAP SEDAAP BT 135', 'SEMBAKO', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '135ML'),
(445, 'GHNM0428', 'KCAP INDFD BT', 'SEMBAKO', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '135ML'),
(446, 'GHNM0429', 'KCAP KPS STE', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140ML'),
(447, 'GHNM0430', 'KCAP ABC ASNBT', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '133ML'),
(448, 'GHNM0431', 'KCAP SEDAAP BT', 'SEMBAKO', '0', '14500', '0', '14500', 'Normal', '2022-04-21 20:04:49', 'admin', '275ML'),
(449, 'GHNM0432', 'SAORI BT', 'SEMBAKO', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '133ML'),
(450, 'GHNM0433', 'SAOS INDF TMT', 'SEMBAKO', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '135ML'),
(451, 'GHNM0434', 'SAOS INDF DHSYT', 'SEMBAKO', '0', '7800', '0', '7800', 'Normal', '2022-07-17 21:43:11', 'admin', '135ML'),
(452, 'GHNM0435', 'SAOS INDF PDSMN', 'SEMBAKO', '0', '7000', '0', '7000', 'Normal', '2022-07-17 21:43:46', 'admin', '135ML'),
(453, 'GHNM0436', 'SAOS INDF PDS 135', 'SEMBAKO', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '135ML'),
(454, 'GHNM0437', 'SAOS INDF EXTPDS', 'SEMBAKO', '0', '7500', '0', '7500', 'Normal', '2022-07-17 21:44:40', 'admin', '135ML'),
(455, 'GHNM0438', 'SAOS INDF PDS 275', 'SEMBAKO', '0', '11000', '0', '11000', 'Normal', '2022-03-29 00:00:00', 'Admin', '275ML'),
(456, 'GHNM0439', 'SAOS INDF PDS', 'SEMBAKO', '0', '14500', '0', '14500', 'Normal', '2022-03-29 00:00:00', 'Admin', '335ML'),
(457, 'GHNM0440', 'SAOS ABC SMBASL', 'SEMBAKO', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '335ML'),
(458, 'GHNM0441', 'BONCB ORI LV15', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '45G'),
(459, 'GHNM0442', 'THOSND SLD MYO', 'SEMBAKO', '0', '24000', '0', '24000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300G'),
(460, 'GHNM0443', 'INDCF CAPP RTG', 'MINSERBUK', '0', '18500', '0', '18500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(461, 'GHNM0444', 'MILKO COK RTG', 'MINSERBUK', '0', '28000', '0', '28000', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(462, 'GHNM0445', 'MILKO VAN RTG', 'MINSERBUK', '0', '28000', '0', '28000', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(463, 'GHNM0446', 'MILO SRB RTG', 'MINSERBUK', '0', '18500', '0', '18500', 'Normal', '2022-03-29 00:00:00', 'Admin', '22G'),
(464, 'GHNM0447', 'WK TRIK MLK RTG', 'MINSERBUK', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(465, 'GHNM0448', 'TOP COFF RTG', 'MINSERBUK', '0', '9500', '0', '9500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(466, 'GHNM0449', 'KOPI LWK RTG', 'MINSERBUK', '0', '11200', '0', '11200', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(467, 'GHNM0450', 'ENRGEN COK RTG', 'MINSERBUK', '0', '19000', '0', '19000', 'Normal', '2022-05-07 12:38:18', 'admin', '34G'),
(468, 'GHNM0451', 'ENRGEN VAN RTG', 'MINSERBUK', '0', '19000', '0', '19000', 'Normal', '2022-05-07 12:38:44', 'admin', '32G'),
(469, 'GHNM0452', 'DNCOW VAN RTG', 'MINSERBUK', '0', '32000', '0', '32000', 'Normal', '2022-03-29 00:00:00', 'Admin', '27G'),
(470, 'GHNM0453', 'DNCOW COK RTG', 'MINSERBUK', '0', '32000', '0', '32000', 'Normal', '2022-03-29 00:00:00', 'Admin', '27G'),
(471, 'GHNM0454', 'SDMNCL KPJH RTG', 'MINSERBUK', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(472, 'GHNM0455', 'MAXTEA TRK RTG', 'MINSERBUK', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(473, 'GHNM0456', 'POPICE KH RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(474, 'GHNM0457', 'POPICE GRP RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(475, 'GHNM0458', 'POPICE MOC RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(476, 'GHNM0459', 'POPICE COKSU RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(477, 'GHNM0460', 'POPICE YGSTR RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(478, 'GHNM0461', 'POPICE STR RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(479, 'GHNM0462', 'POPICE BLBR RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(480, 'GHNM0463', 'POPICE COCRM RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(481, 'GHNM0464', 'POPICE VNBLUE RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(482, 'GHNM0465', 'POPICE GV RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(483, 'GHNM0466', 'POPICE CPP RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(484, 'GHNM0467', 'POPICE VL RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(485, 'GHNM0468', 'DRNK BENG RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(486, 'GHNM0469', 'TOP COFF RTG', 'MINSERBUK', '0', '7000', '2000', '5000', 'PROMO', '2022-03-29 00:00:00', 'Admin', '31G'),
(487, 'GHNM0470', 'GDJAH TBRUK ', 'MINSERBUK', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '150G'),
(488, 'GHNM0471', 'NSCFE CLSC RTG', 'MINSERBUK', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '10G'),
(489, 'GHNM0472', 'KPAL AP SPC', 'MINSERBUK', '0', '16000', '1500', '14500', 'PROMO', '2022-03-29 00:00:00', 'Admin', '24G'),
(490, 'GHNM0473', 'KKBM KPGNS RTG', 'MINSERBUK', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '32G'),
(491, 'GHNM0474', 'TOPCOFF TRJ RTG', 'MINSERBUK', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(492, 'GHNM0475', 'GDDAY MCFRI RTG', 'MINSERBUK', '0', '18500', '0', '18500', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(493, 'GHNM0476', 'GDDAY CKIES RTG', 'MINSERBUK', '0', '18500', '0', '18500', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(494, 'GHNM0477', 'NUTRISR STR RTG', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '11G'),
(495, 'GHNM0478', 'NUTRISR LC RTG', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '11G'),
(496, 'GHNM0479', 'NUTRISR SMK RTG', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '11G'),
(497, 'GHNM0480', 'NUTRISR GV RTG', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '11G'),
(498, 'GHNM0481', 'NUTRISR JP RTG', 'MINSERBUK', '0', '12500', '0', '12500', 'Normal', '2022-08-17 09:54:09', 'admin', '11G'),
(499, 'GHNM0482', 'NUTRISR JN RTG', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '11G'),
(500, 'GHNM0483', 'NUTRISR ER RTG', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '11G'),
(501, 'GHNM0484', 'JSJUS JMB ', 'MINSERBUK', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(502, 'GHNM0485', 'JSJUS LMN ', 'MINSERBUK', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(503, 'GHNM0486', 'JSJUS STR ', 'MINSERBUK', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(504, 'GHNM0487', 'ENRGEN KH RTG', 'MINSERBUK', '0', '19000', '0', '19000', 'Normal', '2022-05-07 13:02:17', 'admin', '30G'),
(505, 'GHNM0488', 'JHEKU ARN RTG', 'MINSERBUK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(506, 'GHNM0489', 'ANGT SR JN RTG', 'MINSERBUK', '0', '11300', '0', '11300', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(507, 'GHNM0490', 'CFFNO HZL RTG', 'MINSERBUK', '0', '14000', '0', '14000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(508, 'GHNM0491', 'CFFNO MOC RTG', 'MINSERBUK', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(509, 'GHNM0492', 'CHOCLTOS MTC RTG', 'MINSERBUK', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '24G'),
(510, 'GHNM0493', 'CHOCLTOS COK RTG', 'MINSERBUK', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '24G'),
(511, 'GHNM0494', 'TEH PCUK HRM', 'MINUMAN', '0', '11300', '0', '11300', 'Normal', '2022-08-09 13:37:16', 'admin', '1L'),
(512, 'GHNM0495', 'FANTA STR BT', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1L'),
(513, 'GHNM0496', 'SPRITE BT.', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1L'),
(514, 'GHNM0497', 'NRAYA SOY BT', 'MINUMAN', '0', '23000', '0', '23000', 'Normal', '2022-03-29 00:00:00', 'Admin', '920ML'),
(515, 'GHNM0498', 'PCARI SWT BT 900', 'MINUMAN', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '900ML'),
(516, 'GHNM0499', 'WCC NDC LYC', 'PUDDING', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '360G'),
(517, 'GHNM0500', 'WCC NDC DUGN', 'PUDDING', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '360G'),
(518, 'GHNM0501', 'WCC NDC STR', 'PUDDING', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '360G'),
(519, 'GHNM0502', 'INCO NDC STR', 'PUDDING', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000G'),
(520, 'GHNM0503', 'JLLYKU TWR ', 'PUDDING', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(521, 'GHNM0504', 'JELLY BUBBL TF', 'PUDDING', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(522, 'GHNM0505', 'NVJELLY TWR ', 'PUDDING', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(523, 'GHNM0506', 'MN PUDDNG FRT', 'PUDDING', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '168G'),
(524, 'GHNM0507', 'JELLY WCC ', 'PUDDING', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '112G'),
(525, 'GHNM0508', 'MYJELLY MN', 'PUDDING', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '70G'),
(526, 'GHNM0509', 'CHRRY BG JEL ', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(527, 'GHNM0510', 'IBB FRUITY', 'PUDDING', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '425ML'),
(528, 'GHNM0511', 'IBBN SUSU', 'PUDDING', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '425ML'),
(529, 'GHNM0512', 'IBBN COK', 'PUDDING', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '425ML'),
(530, 'GHNM0513', 'WCC PDNG JM', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(531, 'GHNM0514', 'WCC PDNG MG', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(532, 'GHNM0515', 'WCC PDNG TLR', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(533, 'GHNM0516', 'WCC PND TB', 'PUDDING', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000G'),
(534, 'GHNM0517', 'WCC LC TB', 'PUDDING', '0', '17500', '0', '17500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000G'),
(535, 'GHNM0518', 'BENG CHO', 'COKELAT/PERMEN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(536, 'GHNM0519', 'FITBAR NUT', 'COKELAT/PERMEN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '22G'),
(537, 'GHNM0520', 'TOP CHO', 'COKELAT/PERMEN', '0', '1200', '0', '1200', 'Normal', '2022-03-29 00:00:00', 'Admin', '9G'),
(538, 'GHNM0521', 'KOKOKRUNCH ', 'COKELAT/PERMEN', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(539, 'GHNM0522', 'CDBURY CHO 30', 'COKELAT/PERMEN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(540, 'GHNM0523', 'CDBURY NUT 30', 'COKELAT/PERMEN', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(541, 'GHNM0524', 'CDBURY CHO', 'COKELAT/PERMEN', '0', '15000', '0', '15000', 'Normal', '2022-05-31 12:02:06', 'admin', '62G'),
(542, 'GHNM0525', 'CDBURY NUT', 'COKELAT/PERMEN', '0', '16400', '0', '16400', 'Normal', '2022-05-31 12:01:17', 'admin', '62G'),
(543, 'GHNM0526', 'SLVRQN ALM', 'COKELAT/PERMEN', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '62G'),
(544, 'GHNM0527', 'SLVRQN FRNUT', 'COKELAT/PERMEN', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '62G'),
(545, 'GHNM0528', 'SLVRQN CHSW', 'COKELAT/PERMEN', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '62G'),
(546, 'GHNM0529', 'SLVRQN ALM', 'COKELAT/PERMEN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '28G'),
(547, 'GHNM0530', 'CHUNKY CSHW', 'COKELAT/PERMEN', '0', '23000', '0', '23000', 'Normal', '2022-03-29 00:00:00', 'Admin', '95G'),
(548, 'GHNM0531', 'CHUNKY ALM', 'COKELAT/PERMEN', '0', '23000', '0', '23000', 'Normal', '2022-03-29 00:00:00', 'Admin', '95G'),
(549, 'GHNM0532', 'FONNUT COK', 'COKELAT/PERMEN', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(550, 'GHNM0533', 'KITKAT 4', 'COKELAT/PERMEN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '17G'),
(551, 'GHNM0534', 'FITBAR BBLR', 'COKELAT/PERMEN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '22G'),
(552, 'GHNM0535', 'CHOCHOPIE ', 'COKELAT/PERMEN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '28G'),
(553, 'GHNM0536', 'CHACHA PNUT', 'COKELAT/PERMEN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(554, 'GHNM0537', 'CHACHA CHO', 'COKELAT/PERMEN', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(555, 'GHNM0538', 'STREPSILS ORI', 'COKELAT/PERMEN', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(556, 'GHNM0539', 'STREPSILS COOL', 'COKELAT/PERMEN', '0', '16000', '0', '16000', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(557, 'GHNM0540', 'STREPSILS LMN', 'COKELAT/PERMEN', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(558, 'GHNM0541', 'STREPSILS HNY', 'COKELAT/PERMEN', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '26G'),
(559, 'GHNM0542', 'PRM TLKANG', 'COKELAT/PERMEN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(560, 'GHNM0543', 'PRM KND MNT', 'COKELAT/PERMEN', '0', '3800', '0', '3800', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(561, 'GHNM0544', 'PRM KND HRB', 'COKELAT/PERMEN', '0', '3800', '0', '3800', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(562, 'GHNM0545', 'PRM KND STR', 'COKELAT/PERMEN', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(563, 'GHNM0546', 'PRM TLK MNT', 'COKELAT/PERMEN', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(564, 'GHNM0547', 'PRM WODS LMN', 'COKELAT/PERMEN', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(565, 'GHNM0548', 'PRM NANO JRK', 'COKELAT/PERMEN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(566, 'GHNM0549', 'PRM HEXOS MNT', 'COKELAT/PERMEN', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(567, 'GHNM0550', 'PRM MLTON HJ', 'COKELAT/PERMEN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(568, 'GHNM0551', 'PRM MLTON KN', 'COKELAT/PERMEN', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '25G'),
(569, 'GHNM0552', 'GLDEN CTY', 'COKELAT/PERMEN', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '50G'),
(570, 'GHNM0553', 'PRM TLK ANG', 'COKELAT/PERMEN', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(571, 'GHNM0554', 'PRM YUPI FRTY', 'COKELAT/PERMEN', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(572, 'GHNM0555', 'PRM BGBOL ASTR', 'COKELAT/PERMEN', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '128G'),
(573, 'GHNM0556', 'PRM BGBOL STR', 'COKELAT/PERMEN', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '140G'),
(576, 'GHNM0557', 'EXTRAJOSS', 'MINSERBUK', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '4G'),
(578, 'GHNM0558', 'HMVTON JRNG', 'MINSERBUK', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '4G'),
(580, 'GHNM0559', 'KKBIMA ANG', 'MINSERBUK', '0', '6500', '0', '6500', 'Normal', '2022-07-17 21:58:25', 'admin', '45G'),
(582, 'GHNM0560', 'KKBIMA ORI', 'MINSERBUK', '0', '6000', '0', '6000', 'Normal', '2022-07-17 21:58:53', 'admin', '45G'),
(585, 'GHNM0561', 'SDMNCL VITC1000', 'MINSERBUK', '0', '8500', '1000', '7500', 'Promo', '2022-03-29 00:00:00', 'Admin', '4G'),
(588, 'GHNM0562', 'SDMNCL VITC1001 JR', 'MINSERBUK', '0', '8500', '1000', '7500', 'Promo', '2022-03-29 00:00:00', 'Admin', '4G'),
(591, 'GHNM0563', 'TEH SSRO CLP', 'MINSERBUK', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(593, 'GHNM0564', 'TEH POC ASL', 'MINSERBUK', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '50G'),
(596, 'GHNM0565', 'TEH POC MLT', 'MINSERBUK', '0', '8800', '0', '8800', 'Normal', '2022-03-29 00:00:00', 'Admin', '50G'),
(599, 'GHNM0566', 'ADEM SR PAK', 'MINSERBUK', '0', '13500', '0', '13500', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(602, 'GHNM0567', 'TRPICNA CLSS 25', 'MINSERBUK', '0', '23000', '0', '23000', 'Normal', '2022-03-29 00:00:00', 'Admin', '62G'),
(605, 'GHNM0568', 'TRPICNA CLSS 50', 'MINSERBUK', '0', '43000', '0', '43000', 'Normal', '2022-03-29 00:00:00', 'Admin', '125G'),
(608, 'GHNM0569', 'TEH BOLAP 999', 'MINSERBUK', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '23G'),
(610, 'GHNM0570', 'NUTR YGT BLCK SCH', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(612, 'GHNM0571', 'NUTR TNP RAS SCH', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(615, 'GHNM0572', 'NUTR BBR SCH.', 'PUDDING', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '10G'),
(617, 'GHNM0573', 'NUTR COK SCH', 'PUDDING', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '20G'),
(620, 'GHNM0574', 'NUTR CINC SCH', 'PUDDING', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(622, 'GHNM0575', 'NUTR JM SCH', 'PUDDING', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '10G'),
(625, 'GHNM0576', 'NUTR YGT STR SCH', 'PUDDING', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(628, 'GHNM0577', 'NUTR BBR SCH', 'PUDDING', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(631, 'GHNM0578', 'NUTR SRSK SCH', 'PUDDING', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(635, 'GHNM0579', 'NUTR GRP SCH', 'PUDDING', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '10G'),
(637, 'GHNM0580', 'SRGNTNG AGR SCH', 'PUDDING', '0', '2500', '0', '2500', 'Normal', '2022-03-29 00:00:00', 'Admin', '7G'),
(640, 'GHNM0581', 'STELIT CHO SCH', 'PUDDING', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '6G'),
(643, 'GHNM0582', 'HAAN VAN ICE', 'PUDDING', '0', '12800', '0', '12800', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(646, 'GHNM0583', 'HAAN STR ICE', 'PUDDING', '0', '11500', '0', '11500', 'Normal', '2022-03-29 00:00:00', 'Admin', '85G'),
(648, 'GHNM0584', 'PUDLAP GULJA', 'PUDDING', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(651, 'GHNM0585', 'PUDSAN PNDAN', 'PUDDING', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '130G'),
(654, 'GHNM0586', 'MYUMI SRBGN', 'PUDDING', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(657, 'GHNM0587', 'CHOCO CHP ', 'PUDDING', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '45G'),
(660, 'GHNM0588', 'SFARI MSES', 'PUDDING', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '100G'),
(662, 'GHNM0589', 'MEYSES CHO', 'PUDDING', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '90G'),
(664, 'GHNM0590', 'CRMEL TPNG', 'PUDDING', '0', '14500', '0', '14500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(667, 'GHNM0591', 'PNEAPPLE TPNG', 'PUDDING', '0', '14500', '0', '14500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(670, 'GHNM0592', 'MOCHA TPNG ', 'PUDDING', '0', '14500', '0', '14500', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(673, '2556554', 'JGUNG POPCRN', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(676, '2556555', 'JGUNG MRPTI', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1KG'),
(679, 'GHNM0593', 'KOEPOE VAN PK', 'SEMBAKO', '0', '26000', '0', '26000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2G'),
(682, '2553443', 'TP MAIZENA HW', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '200G'),
(684, 'GHNM0594', 'TP TAPIOKA GA', 'SEMBAKO', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(686, 'GHNM0595', 'TP BERS PTH RS', 'SEMBAKO', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '50G'),
(689, 'GHNM0596', 'TP KETN PTH RS', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-04-27 15:42:19', 'admin', '500G'),
(692, 'GHNM0597', 'TP TERIGU LM', 'SEMBAKO', '0', '9800', '0', '9800', 'Normal', '2022-03-29 00:00:00', 'Admin', '1KG'),
(694, 'GHNM0598', 'TP TERIGU SB.', 'SEMBAKO', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1KG'),
(697, 'GHNM0599', 'TP TERIGU SB', 'SEMBAKO', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(698, 'GHNM0600', 'ABC AYMBWG CP', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(700, 'GHNM0601', 'SRWNGI TEH ASL', 'SEMBAKO', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '18G'),
(702, 'GHNM0602', 'SYMIE BS RTG', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(705, 'GHNM0603', 'POPMIE DWR CP', 'SEMBAKO', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(707, 'GHNM0604', 'POPMIE STMI CP', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '39G'),
(710, 'GHNM0605', 'POPMIE AYMBWG CP', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '39G'),
(712, 'GHNM0606', 'POPMIE BS CP.', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '39G'),
(715, 'GHNM0607', 'ABC BASO CP', 'SEMBAKO', '0', '5800', '0', '5800', 'Normal', '2022-07-20 10:01:02', 'admin', '60G'),
(718, 'GHNM0608', 'POPMIE GLEDK CP', 'SEMBAKO', '0', '5500', '0', '5500', 'Normal', '2022-07-18 10:31:14', 'admin', '75G'),
(721, 'GHNM0609', 'POPMIE STAYM CP', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '77G'),
(724, 'GHNM0610', 'ABC KRAYM CP', 'SEMBAKO', '0', '5800', '0', '5800', 'Normal', '2022-07-20 10:00:33', 'admin', '60G'),
(727, 'GHNM0611', 'POPMIE AYM CP', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-06-25 11:26:37', 'admin', '75G'),
(729, 'GHNM0612', 'POPMIE BS CP', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '75G'),
(731, 'GHNM0613', 'CHIYONT MKRN AKH', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(734, 'GHNM0614', 'CHIYONT MKRN AW', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '60G'),
(736, 'GHNM0615', 'CHIYONT LDI AKH', 'SEMBAKO', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(738, 'GHNM0616', 'SYMIE AYMBWG RTG', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30G'),
(741, 'GHNM0617', 'SPR BUBR AYM RTG', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '22G'),
(744, 'GHNM0618', 'MITLR 3AYM', 'SEMBAKO', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '120G'),
(746, 'GHNM0619', 'MIDRA PIPH', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '140G'),
(748, 'GHNM0620', 'BIHUN ATM ', 'SEMBAKO', '0', '7200', '0', '7200', 'Normal', '2022-07-20 09:59:41', 'admin', '290G'),
(750, 'GHNM0621', 'BIHUN JG PDM', 'SEMBAKO', '0', '3600', '0', '3600', 'Normal', '2022-03-29 00:00:00', 'Admin', '175G'),
(753, '1685532', 'MDU MRN SMBW', 'SEMBAKO', '0', '200000', '0', '200000', 'Normal', '2022-03-29 00:00:00', 'Admin', '630ML'),
(756, '2335707', 'IKAT RMB WRNI.', 'AKSESORIS', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '6PCS'),
(758, '2335695', 'JPIT RMB LK', 'AKSESORIS', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(761, '2335703', 'JPIT RMB MRC.', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(764, '8789442', 'JPIT RMB SLNGK.', 'AKSESORIS', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(767, '4744545', 'JPIT RMB TTL', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(769, '2335694', 'JPIT RMB BLS', 'AKSESORIS', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(772, '2335691', 'JPIT RMB MRC .', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(775, '2335697', 'JPIT RMB PNJG', 'AKSESORIS', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(777, '2335692', 'JPIT RMB GRITA', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(780, '2335700', 'JPIT RMB K3 ORI', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(783, '2335702', 'JPIT RMB BNGA', 'AKSESORIS', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(786, '2335693', 'JPIT RMB UDG', 'AKSESORIS', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(789, '2335701', 'JPIT RMB SFT', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(791, '2335705', 'JPIT RMB 2WRN', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(794, '2335698', 'JPIT RMB K3.', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(797, '2335703', 'JPIT RMB MRC A', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(800, '1617', 'JPIT RMB SLNGK', 'AKSESORIS', '0', '1900', '0', '1900', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(803, '2335704', 'JPIT RMB MRC', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(806, '2335699', 'JPIT GRS PJ', 'AKSESORIS', '0', '4500', '0', '4500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(809, '2335706', 'JPIT RMB K3 ', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(812, '3553223', 'JPIT KCL TTL', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2PCS'),
(815, '2544112', 'JPIT K3 KCL', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2PCS'),
(818, '2566363', 'BNDU MTR', 'AKSESORIS', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(821, '8588996', 'BNDU PITA', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(823, '2556556', 'IKAT RMB KRT.', 'AKSESORIS', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2PCS'),
(826, '2323221', 'BNDU KREA IMT', 'AKSESORIS', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(829, '1626', 'IKAT RMB KLNCI', 'AKSESORIS', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(832, '1628822', 'IKAT RMB SYHRNI', 'AKSESORIS', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(835, '2335708', 'IKAT RMB WRNI', 'AKSESORIS', '0', '5500', '0', '5500', 'Normal', '2022-03-29 00:00:00', 'Admin', '6PCS'),
(838, '4554665', 'IKAT RMB MTR', 'AKSESORIS', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(841, '7445665', 'JPIT KCL BG', 'AKSESORIS', '0', '1500', '0', '1500', 'Normal', '2022-03-29 00:00:00', 'Admin', '6PCS'),
(844, '2335722', 'IKAT RMB BTS', 'AKSESORIS', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(847, '2335709', 'IKAT RMB PTMTR', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(850, '8788966', 'JPIT RMB HTM', 'AKSESORIS', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '5PCS'),
(853, '5223223', 'IKAT RMB GLG', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2PCS'),
(856, '4633224', 'IKAT RMB KRT', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(859, '6556554', 'BROS BL PJG', 'AKSESORIS', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(861, '2335730', 'BROS PITA', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(864, '5654423', 'BROS BG', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(866, '5789966', 'BROS BG BNDL', 'AKSESORIS', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(870, '2544112', 'BROS PITA KCL', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(873, '162222', 'JPIT MN WRNI', 'AKSESORIS', '0', '1500', '0', '1500', 'Normal', '2022-03-29 00:00:00', 'Admin', '10PCS'),
(876, '2335716', 'TL MSKER BLT', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(878, '2335714', 'TL MSKER MTR', 'AKSESORIS', '0', '22000', '0', '22000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(881, '2335720', 'TL MSKER MR AB', 'AKSESORIS', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(884, '2335721', 'TL MSKER HTM', 'AKSESORIS', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(886, '2335715', 'TL MSKER MNIK', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(888, '2335711', 'TL MSKER RNTAI', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(890, '2335717', 'TL MSKER RINBW', 'AKSESORIS', '0', '6000', '0', '6000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(893, '2335713', 'TL MSKER MNK', 'AKSESORIS', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(896, '2335712', 'TL MSKER KAIN', 'AKSESORIS', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(899, '2232211', 'IKAT RMB KRTGL', 'AKSESORIS', '0', '3000', '0', '3000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(902, '4622321', 'JPIT RMB KCL', 'AKSESORIS', '0', '2000', '0', '2000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(905, '2335799', 'TLI MSKER PTH', 'AKSESORIS', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(908, '3366712', 'TAS KSM ZBRA', 'PERMANDI', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(911, '5587712', 'TAS MND PJ', 'PERMANDI', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(914, '8681132', 'TAS MND RL', 'PERMANDI', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(916, '1133515', 'DMP KCL KPG', 'PERMANDI', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(918, '3377115', 'DMP KTK BND', 'PERMANDI', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(921, '3235667', 'TAS PRNCS TMP', 'PERMANDI', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(923, '1194', 'SLSA BTH SPG', 'PERMANDI', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(926, '5223227', 'BATH SPG PJ', 'PERMANDI', '0', '8500', '0', '8500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(929, '6332332', 'BATH SPG BLT', 'PERMANDI', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(931, '5511356', 'BATH SPONGE KTK', 'PERMANDI', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(933, 'GHNM0622', 'SSR DRMON', 'PERANAK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(936, 'GHNM0623', 'SKAT BTL IKN', 'PERANAK', '0', '19500', '0', '19500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(938, 'GHNM0624', 'SKAT BTL ARS', 'PERANAK', '0', '19500', '0', '19500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(940, 'GHNM0625', 'SKAT NINIO ', 'PERANAK', '0', '8900', '0', '8900', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(941, 'GHNM0626', 'SKAT PRTY BBY', 'PERANAK', '0', '12500', '0', '12500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(942, '4556476', 'TAS MND KTK', 'PERMANDI', '0', '13000', '0', '13000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(943, '3233277', 'DMP LV KLT', 'AKSESORIS', '0', '100000', '0', '100000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(944, '5564655', 'DMP PSTA PRM', 'AKSESORIS', '0', '120000', '0', '120000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(945, '3233256', 'DMP KLT PRM', 'AKSESORIS', '0', '100000', '0', '100000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(946, '4466233', 'DMP CHNNEL', 'AKSESORIS', '0', '50000', '0', '50000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(947, '2335725', 'DMP CHNNEL STD', 'AKSESORIS', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(948, '3233778', 'DMP KLT AUGS', 'AKSESORIS', '0', '48000', '0', '48000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(949, '3233456', 'DMP EXC LEATHR', 'AKSESORIS', '0', '60000', '0', '60000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(950, 'GHNM0627', 'SCRLET SHOW PM', 'KOSMETIK', '0', '64500', '0', '64500', 'Normal', '2022-06-04 12:44:42', 'admin', '300ML'),
(951, 'GHNM0628', 'SCRLET SHOW JL.', 'KOSMETIK', '0', '63000', '0', '63000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(952, 'GHNM0629', 'SCRLET SHOW MG', 'KOSMETIK', '0', '63700', '0', '63700', 'Normal', '2022-06-04 12:44:07', 'admin', '300ML'),
(953, 'GHNM0630', 'SCRLET SHOW CFFE', 'KOSMETIK', '0', '63000', '0', '63000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(954, 'GHNM0631', 'SCRLET SHOW CCM', 'KOSMETIK', '0', '63000', '0', '63000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(955, 'GHNM0632', 'SCRLET SHOW JL', 'KOSMETIK', '0', '63000', '0', '63000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(956, 'GHNM0633', 'SCRLET SHOW FRSH', 'KOSMETIK', '0', '63000', '0', '63000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(957, 'GHNM0634', 'SCRLET BL FNTS', 'KOSMETIK', '0', '60000', '0', '60000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(958, 'GHNM0635', 'SCRLET BL JLLY', 'KOSMETIK', '0', '64000', '0', '64000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(959, 'GHNM0636', 'SCRLET BL FRSH', 'KOSMETIK', '0', '62000', '0', '62000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(960, 'GHNM0637', 'SCRLET BL RMNS', 'KOSMETIK', '0', '65000', '0', '65000', 'Normal', '2022-03-29 00:00:00', 'Admin', '300ML'),
(961, '2551122', 'ANJLY NAIL RM', 'KOSMETIK', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '40ML'),
(962, '6557562', 'MRMAR NAILP 3', 'KOSMETIK', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '18ML'),
(963, '2335724', 'BRSV NAILP 2', 'KOSMETIK', '0', '16000', '0', '16000', 'Normal', '2022-03-29 00:00:00', 'Admin', '12ML'),
(964, '9976644', 'ARZA PRF', 'KOSMETIK', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30ML'),
(965, '2335723', 'MLSA NAILP', 'KOSMETIK', '0', '20000', '0', '20000', 'Normal', '2022-03-29 00:00:00', 'Admin', '10ML'),
(966, '4554231', 'SRYATL PRF ', 'KOSMETIK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '10ML'),
(967, 'GHNM0638', 'XIUXIU 2IN1 MSEY', 'KOSMETIK', '0', '28700', '0', '28700', 'Normal', '2022-03-29 00:00:00', 'Admin', '4G'),
(968, 'GHNM0639', 'IMPLOR LIPTN', 'KOSMETIK', '0', '22000', '0', '22000', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(969, 'GHNM0640', 'BRSOV LIPTN', 'KOSMETIK', '0', '19000', '0', '19000', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(970, '2552335', 'REDZHR MRN', 'KOSMETIK', '0', '37000', '0', '37000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(971, '2552334', 'REDZHR BLC', 'KOSMETIK', '0', '37000', '0', '37000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(972, '2552333', 'REDZHR BRW', 'KOSMETIK', '0', '37000', '0', '37000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(973, '2552335', 'REDZHR RD', 'KOSMETIK', '0', '37000', '0', '37000', 'Normal', '2022-03-29 00:00:00', 'Admin', '15G'),
(974, '2547744', 'AHA INT WHT', 'KOSMETIK', '0', '45000', '0', '45000', 'Normal', '2022-03-29 00:00:00', 'Admin', '30ML'),
(975, 'GHNM0641', 'XIUXIU EYLN SFT', 'KOSMETIK', '0', '27500', '0', '27500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1ML'),
(976, 'GHNM0642', 'LOMRA LIPSR', 'KOSMETIK', '0', '22000', '0', '22000', 'Normal', '2022-03-29 00:00:00', 'Admin', '55G'),
(977, 'GHNM0643', 'IMPLOR LIPMT', 'KOSMETIK', '0', '21500', '0', '21500', 'Normal', '2022-06-04 12:51:45', 'admin', '29G'),
(978, 'GHNM0644', 'VIVA EYBRW', 'KOSMETIK', '0', '37500', '0', '37500', 'Normal', '2022-03-29 00:00:00', 'Admin', '13G'),
(979, 'GHNM0645', 'LOMRA MSKAR', 'KOSMETIK', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '4G'),
(980, '2556767', 'JPIT RMB KTKP', 'AKSESORIS', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(981, '2556766', 'JPIT RMB OVL', 'AKSESORIS', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(982, '8779987', 'SSMI LPTINT', 'KOSMETIK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(983, 'GHNM0646', 'FNBO EYBRW BRW', 'KOSMETIK', '0', '35000', '0', '35000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(984, 'GHNM0647', 'IMPLR LIPVEL', 'KOSMETIK', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '46G'),
(985, 'GHNM0648', 'HNSUI LIPSTN', 'KOSMETIK', '0', '22000', '0', '22000', 'Normal', '2022-03-29 00:00:00', 'Admin', '35G'),
(986, '8778996', 'MAC EYLNR', 'KOSMETIK', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(987, '6336233', 'JSTMISS EYPNC', 'KOSMETIK', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(988, '3233112', 'DMP BOSS KLT', 'KOSMETIK', '0', '75000', '0', '75000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(989, 'GHNM0649', 'IMPLOR EYSHA', 'KOSMETIK', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '13G'),
(990, 'GHNM0650', 'XIUXIU LIPCL', 'KOSMETIK', '0', '22000', '0', '22000', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(991, '1168', 'LIPSTICK MYBLLNE', 'KOSMETIK', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(992, 'GHNM0651', 'SLSA LIPMT', 'KOSMETIK', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '5G'),
(993, 'GHNM0652', 'LIPICE MTT PEACH', 'KOSMETIK', '0', '36000', '0', '36000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2G'),
(994, '1167', 'LIPSTICK RVLON ', 'KOSMETIK', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '2G'),
(995, '2328674', 'KRT MNYK BS', 'PERDAPUR', '0', '29000', '0', '29000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1BND'),
(996, '8879986', 'KRT NASI PINK', 'PERDAPUR', '0', '15000', '0', '15000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1BND'),
(997, '1693', 'TSK GIGI PND', 'PERDAPUR', '0', '3500', '0', '3500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1BND'),
(998, '9886799', 'PLSTK TKS ', 'PERDAPUR', '0', '4000', '0', '4000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1BND'),
(999, '8774336', 'PLSTK DAUN MS', 'PERDAPUR', '0', '9000', '0', '9000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1BND'),
(1000, '5887789', 'SDOTN BUAYA', 'PERDAPUR', '0', '1200', '0', '1200', 'Normal', '2022-06-03 19:53:19', 'admin', '1BND'),
(1001, '1642', 'TSK ST PNDA', 'PERDAPUR', '0', '5000', '0', '5000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1BND'),
(1002, '2553211', 'TSBIH DGT PRM', 'AKSESORIS', '0', '25000', '0', '25000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(1003, '32232111', 'KRMA BRR MD', 'MAKANAN', '0', '20000', '0', '20000', 'Normal', '2022-03-29 00:00:00', 'Admin', '250G'),
(1004, '33266777', 'KRMA MESIR', 'MAKANAN', '0', '40000', '0', '40000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(1005, '27756655', 'KRMA BARARI', 'MAKANAN', '0', '45000', '0', '45000', 'Normal', '2022-03-29 00:00:00', 'Admin', '500G'),
(1006, 'GHNM0653', 'DAIRY CHMP.', 'SUSU', '0', '56500', '0', '56500', 'Normal', '2022-06-30 09:46:37', 'admin', '2.5KG'),
(1007, 'GHNM0654', 'INDMILK PTH PCH', 'SUSU', '0', '17500', '0', '17500', 'Normal', '2022-03-29 00:00:00', 'Admin', '545G'),
(1008, 'GHNM0655', 'FRSIAN PTH PCH', 'SUSU', '0', '19800', '0', '19800', 'Normal', '2022-06-28 12:46:29', 'admin', '560G'),
(1009, 'GHNM0656', 'FRSIAN COK PCH', 'SUSU', '0', '17000', '0', '17000', 'Normal', '2022-03-29 00:00:00', 'Admin', '560G'),
(1010, 'GHNM0657', 'DAIRY CHMP', 'SUSU', '0', '25400', '0', '25400', 'Normal', '2022-06-30 09:46:14', 'admin', '1KG'),
(1011, 'GHNM0658', 'FRSIAN UHT FC', 'SUSU', '0', '17800', '0', '17800', 'Normal', '2022-03-29 00:00:00', 'Admin', '946ML'),
(1012, 'GHNM0659', 'FRSIAN UHT CHO', 'SUSU', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '900ML'),
(1013, 'GHNM0660', 'ULTRAMLK UHT FC', 'SUSU', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000ML'),
(1014, 'GHNM0661', 'ULTRAMLK UHT COK', 'SUSU', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000ML'),
(1015, 'GHNM0662', 'INDMILK UHT CHO', 'SUSU', '0', '18000', '0', '18000', 'Normal', '2022-03-29 00:00:00', 'Admin', '950ML'),
(1016, 'GHNM0663', 'MILK UHT FC', 'SUSU', '0', '18500', '0', '18500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000ML'),
(1017, 'GHNM0664', 'DAIRY CHMP KLG.', 'SUSU', '0', '24500', '0', '24500', 'Normal', '2022-03-29 00:00:00', 'Admin', '1000G'),
(1018, 'GHNM0665', 'DAIRY CHMP RTG', 'SUSU', '0', '6500', '0', '6500', 'Normal', '2022-03-29 00:00:00', 'Admin', '37G'),
(1019, 'GHNM0666', 'INDMILK PTH RTG', 'SUSU', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '37G'),
(1020, 'GHNM0667', 'ENAAK PTH RTG', 'SUSU', '0', '7800', '0', '7800', 'Normal', '2022-06-28 12:44:12', 'admin', '37G'),
(1021, 'GHNM0668', 'INDMILK COK RTG', 'SUSU', '0', '7500', '0', '7500', 'Normal', '2022-03-29 00:00:00', 'Admin', '37G'),
(1022, 'GHNM0669', 'KRMER PTH RTG', 'SUSU', '0', '7000', '0', '7000', 'Normal', '2022-03-29 00:00:00', 'Admin', '37G'),
(1023, 'GHNM0670', 'KRNCH MAXX ', 'SUSU', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '42G'),
(1024, 'GHNM0671', 'KRNCH STARS', 'SUSU', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '32G'),
(1025, 'GHNM0672', 'KRNCH CHO', 'SUSU', '0', '8000', '0', '8000', 'Normal', '2022-03-29 00:00:00', 'Admin', '32G'),
(1026, 'GHNM0673', 'KOKO KRNCH ', 'SUSU', '0', '11000', '0', '11000', 'Normal', '2022-03-29 00:00:00', 'Admin', '80G'),
(1027, 'GHNM0674', 'TIGA SP KLG', 'SUSU', '0', '12000', '0', '12000', 'Normal', '2022-03-29 00:00:00', 'Admin', '490G'),
(1028, 'GHNM0675', 'INDMILK COK KLG', 'SUSU', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '370G'),
(1029, 'GHNM0676', 'FRSIAN COK KLG', 'SUSU', '0', '10500', '0', '10500', 'Normal', '2022-03-29 00:00:00', 'Admin', '370G'),
(1030, 'GHNM0677', 'DAIRY CHMP KLG', 'SUSU', '0', '12500', '0', '12500', 'Normal', '2022-03-29 00:00:00', 'Admin', '480G'),
(1031, '8681133', 'MNGKOK MSKR', 'SUSU', '0', '10000', '0', '10000', 'Normal', '2022-03-29 00:00:00', 'Admin', '1PCS'),
(1033, '5564577', 'KOPYA PKST BNG', 'PERSHOLAT', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1034, '5478994', 'KOPYA RJT KMB', 'PERSHOLAT', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1035, '2311231', 'KOPYA RJT PTH', 'PERSHOLAT', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1036, '1251', 'KOPYA SLMET', 'PERSHOLAT', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1037, '1249', 'KOPYA LS PDANG', 'PERSHOLAT', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1038, '1247', 'KOPYA OMAN', 'PERSHOLAT', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1039, '8992321', 'KOPYA TRM CKL', 'PERSHOLAT', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1040, '1250', 'KOPYA MDN PTH', 'PERSHOLAT', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1041, '1254', 'KOPYA BRDIR', 'PERSHOLAT', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1042, '5544644', 'KOPYA PKST LMB', 'PERSHOLAT', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1043, '1255', 'KOPYA TRMP MKH', 'PERSHOLAT', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1044, '4465677', 'KOPYA ASGV EMS', 'PERSHOLAT', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1045, '1252', 'KOPYA BRDIR EMS', 'PERSHOLAT', '0', '30000', '0', '30000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1046, '9911332', 'KOPYA BGS HTM', 'PERSHOLAT', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1047, '9877665', 'SRUNG CNDAN 7000', 'PERSHOLAT', '0', '62000', '0', '62000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1048, '2553623', 'KLMBU BBY BSR', 'PERANAK', '0', '55000', '0', '55000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1049, '2553624', 'KJONG BY KIKI', 'PERANAK', '0', '36500', '0', '36500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60CM');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(1050, '2553622', 'KJONG BY INCO', 'PERANAK', '0', '43500', '0', '43500', 'Normal', '2022-04-03 00:00:00', 'Admin', 'P220'),
(1051, '4554677', 'PERLAT PRNT BBY', 'PERANAK', '0', '35500', '0', '35500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1052, '4554678', 'PERLAT PLOS KTS', 'PERANAK', '0', '32500', '0', '32500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1053, '2109', 'BTL GLNG BBY', 'PERANAK', '0', '50000', '0', '50000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1054, '8556548', 'SPTU ODRI ANK', 'PERANAK', '0', '24000', '0', '24000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1055, '13840', 'BTL VRA BBY', 'PERANAK', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1056, '2554673', 'SRUNG TNG BBY', 'PERANAK', '0', '6000', '0', '6000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1057, '8556533', 'TP SRNG TG ANK', 'PERANAK', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1058, '8556532', 'TPI HPPDY ANK', 'PERANAK', '0', '11000', '0', '11000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1059, '8556599', 'TPI 23 ORI ANK', 'PERANAK', '0', '65500', '0', '65500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1060, '8556600', 'SPTU VLFN ANK', 'PERANAK', '0', '29800', '0', '29800', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1061, '2554671', 'PKT BJ CHUI ANK', 'PERANAK', '0', '65000', '0', '65000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1062, '2335673', 'CLNA LK SD ', 'SERAGAM', '0', '76500', '0', '76500', 'Normal', '2022-04-03 00:00:00', 'Admin', '24S'),
(1063, '2335676', 'CLNA LK SD PRM', 'SERAGAM', '0', '72500', '0', '72500', 'Normal', '2022-04-03 00:00:00', 'Admin', '22S'),
(1064, '2335682', 'RK WNT SD PRM', 'SERAGAM', '0', '72000', '0', '72000', 'Normal', '2022-04-03 00:00:00', 'Admin', '6S'),
(1065, '2335668', 'SRGM ANDH PTH', 'SERAGAM', '0', '58500', '0', '58500', 'Normal', '2022-04-03 00:00:00', 'Admin', '6S'),
(1066, '2335669', 'SRGM ANDH PRM', 'SERAGAM', '0', '62000', '0', '62000', 'Normal', '2022-04-03 00:00:00', 'Admin', '5S'),
(1067, '2335666', 'HNDUK MTA JMB', 'PERMANDI', '0', '44000', '0', '44000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1068, '2335665', 'HNDUK BRRS SDG', 'PERMANDI', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1069, 'GHNM0668', 'HNDUK MRPTH 19D', 'PERMANDI', '0', '27400', '0', '27400', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1070, 'GHNM0669', 'HNDUK MRPTH KCL', 'PERMANDI', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1071, '1311', 'HNDUK PTH JMB', 'PERMANDI', '0', '75000', '0', '75000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1072, 'GHNM0670', 'HNDUK MRPTH JMB', 'PERMANDI', '0', '45000', '0', '45000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1073, '2335670', 'SRGM ANDH PRM.', 'SERAGAM', '0', '64000', '0', '64000', 'Normal', '2022-04-03 00:00:00', 'Admin', '6S'),
(1074, '2335679', 'RK WNT SD ', 'SERAGAM', '0', '70500', '0', '70500', 'Normal', '2022-04-03 00:00:00', 'Admin', '5S'),
(1075, '2335674', 'CLNA LK SD .', 'SERAGAM', '0', '70000', '0', '70000', 'Normal', '2022-04-03 00:00:00', 'Admin', '21S'),
(1076, '8556525', 'CD CWOK ', 'PAKAIAN', '0', '15900', '0', '15900', 'Normal', '2022-04-03 00:00:00', 'Admin', '3XL'),
(1077, 'GHNM0671', 'CD MSKULN', 'PAKAIAN', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '319'),
(1078, 'GHNM0672', 'CD CWEK PIAOLI', 'PAKAIAN', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1315'),
(1079, '8556524', 'CD CWEK KSNI', 'PAKAIAN', '0', '10500', '0', '10500', 'Normal', '2022-04-03 00:00:00', 'Admin', '8002'),
(1080, '2510', 'CD CWEK GG', 'PAKAIAN', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1081, '8556540', 'CD CWEK PIAOLI.', 'PAKAIAN', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '2077'),
(1082, 'GHNM0673', 'CD CWEK SSCA', 'PAKAIAN', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1116'),
(1083, 'GHNM0674', 'CD CWEK ANMEI', 'PAKAIAN', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1084, '8556542', 'CD CWEK GAIXN', 'PAKAIAN', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1085, '8556527', 'CD CWOK GDA', 'PAKAIAN', '0', '16500', '0', '16500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1086, '8556528', 'CD CWOK KRSHI', 'PAKAIAN', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1087, '8556531', 'CD CWOK FLDTEX', 'PAKAIAN', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1088, '8556526', 'CD CWEK MSLLY', 'PAKAIAN', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '3803'),
(1089, '8556522', 'CD CWEK ENROU', 'PAKAIAN', '0', '7500', '0', '7500', 'Normal', '2022-04-03 00:00:00', 'Admin', '667'),
(1090, '2232411', 'CD CWEK XIAN ', 'PAKAIAN', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1091, '11832', 'CD CWOK ANK', 'PAKAIAN', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1092, '2013', 'CD CWEK ANK', 'PAKAIAN', '0', '7000', '0', '7000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1093, '2232552', 'CD CWEK MSLLY.', 'PAKAIAN', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '8127'),
(1094, '111215', 'CD CWEK YTIND', 'PAKAIAN', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', 'XL'),
(1095, '8556523', 'CD CWEK 3IN1', 'PAKAIAN', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1096, '8556539', 'CD CWEK WNROU', 'PAKAIAN', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1097, 'GHNM0675', 'CD CWEK GN', 'PAKAIAN', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1098, '2232659', 'CD CWEK AISH', 'PAKAIAN', '0', '9000', '0', '9000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1099, '1291', 'CD KM SBLN', 'PAKAIAN', '0', '5900', '0', '5900', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1100, 'GHNM0676', 'MNISET AINIAN ', 'PAKAIAN', '0', '17000', '0', '17000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1101, '542', 'SLT GAIXIN BBY', 'PAKAIAN', '0', '7000', '0', '7000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1102, '1278', 'SLT CTR BRDR', 'PAKAIAN', '0', '7000', '0', '7000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1103, '2232004', 'SLT ORIN XL', 'PAKAIAN', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1104, '2232477', 'SLT BGUS 3L', 'PAKAIAN', '0', '7000', '0', '7000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1105, '2508', 'CLNA ANK GRS', 'PAKAIAN', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1106, '8556529', 'CD CWEK GN.', 'PAKAIAN', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1107, '1279', 'CD CWEK KPU', 'PAKAIAN', '0', '6900', '0', '6900', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1108, '10041', 'CD CWEK YUAYKI', 'PAKAIAN', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1109, '13413', 'BJU SET BEAR MRH', 'PAKAIAN', '0', '30000', '0', '30000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1110, '4554676', 'SLMUT BL CNTA', 'PERANAK', '0', '43500', '0', '43500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1111, '2335683', 'HSDUK MRHPTH', 'PAKAIAN', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1112, '11765', 'BJUST EROS ANK', 'PAKAIAN', '0', '40000', '0', '40000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1113, '10777', 'BJU MNI BNGA', 'PAKAIAN', '0', '27000', '0', '27000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1114, '2676', 'BJU ANK BNGA', 'PAKAIAN', '0', '34000', '0', '34000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1115, '2232399', 'BJU KAISHN ANK', 'PAKAIAN', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1116, '13496', 'BJU MRVO ANK', 'PAKAIAN', '0', '45000', '0', '45000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1117, '975542', 'IKT PNGG SD', 'SERAGAM', '0', '9000', '0', '9000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1118, '2335685', 'DASI SD BRDR', 'SERAGAM', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1119, 'GHNM0677', 'KRD BRGO CK', 'HIJAB', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1120, 'GHNM0678', 'KRD BRGO PTH', 'HIJAB', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1121, 'GHNM0679', 'KRD AQRZFA', 'HIJAB', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1122, 'GHNM0680', 'KRD BRGO HTM PRM', 'HIJAB', '0', '30000', '0', '30000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1123, 'GHNM0681', 'KRD BRGO HTM', 'HIJAB', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1124, 'GHNM0682', 'KRD BLLA SNR', 'HIJAB', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1125, 'GHNM0683', 'KRD PLISKET PLS', 'HIJAB', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1126, 'GHNM0684', 'KRD VIOLA LC', 'HIJAB', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1127, 'GHNM0685', 'KRD BLLA SQR PRM', 'HIJAB', '0', '30000', '0', '30000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1128, 'GHNM0686', 'KRD VIOLA LSR', 'HIJAB', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1129, 'GHNM0687', 'KRD HSNA SCR', 'HIJAB', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1130, 'GHNM0688', 'CPUT BRDR', 'HIJAB', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1131, 'GHNM0689', 'CDAR HJB', 'HIJAB', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1132, '568', 'SL 121K1 XL', 'PAKAIAN', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1133, '112321', 'SL CWEK GN L', 'PAKAIAN', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1134, '8556601', 'SL CWOK AGREE', 'PAKAIAN', '0', '32000', '0', '32000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1135, '8556603', 'SL AGREE HTM L', 'PAKAIAN', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1136, '510295', 'SL AGREE AB XL', 'PAKAIAN', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1137, '8556602', 'SL AGRE AB', 'PAKAIAN', '0', '33000', '0', '33000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1138, 'GHNM0690', 'VPE LIQ BLS', 'PARFUM', '0', '17500', '0', '17500', 'Normal', '2022-04-03 00:00:00', 'Admin', '45ML'),
(1139, 'GHNM0691', 'VPE LIQ ORG', 'PARFUM', '0', '17500', '0', '17500', 'Normal', '2022-04-03 00:00:00', 'Admin', '45ML'),
(1140, 'GHNM0692', 'VPE LIQ FR', 'PARFUM', '0', '16500', '0', '16500', 'Normal', '2022-04-03 00:00:00', 'Admin', '45ML'),
(1141, 'GHNM0693', 'HIT MTRF GT', 'PARFUM', '0', '6500', '0', '6500', 'Normal', '2022-04-03 00:00:00', 'Admin', '742G'),
(1142, 'GHNM0694', 'HIT MTRF CLSC', 'PARFUM', '0', '6500', '0', '6500', 'Normal', '2022-04-03 00:00:00', 'Admin', '742G'),
(1143, 'GHNM0695', 'HIT MTRF FLR', 'PARFUM', '0', '6500', '0', '6500', 'Normal', '2022-04-03 00:00:00', 'Admin', '742G'),
(1144, 'GHNM0696', 'BYGON MT 24', 'PARFUM', '0', '6500', '0', '6500', 'Normal', '2022-04-03 00:00:00', 'Admin', '43G'),
(1145, 'GHNM0697', 'HIT LIQ RF CLSC', 'PARFUM', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '123G'),
(1146, 'GHNM0698', 'BYGON JMB LVN', 'PARFUM', '0', '4500', '0', '4500', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1147, 'GHNM0699', 'BYGON JMB MKS', 'PARFUM', '0', '4500', '0', '4500', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1148, 'GHNM0700', 'VPE JMB BKR10', 'PARFUM', '0', '4000', '0', '4000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1149, 'GHNM0701', 'KINGKNG JMB', 'PARFUM', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1150, 'GHNM0702', 'VPE PRM BKR8', 'PARFUM', '0', '4500', '0', '4500', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1151, 'GHNM0703', 'VPE RF MT10 LV', 'PARFUM', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '43G'),
(1152, 'GHNM0704', 'VPE ST LIQ FR', 'PARFUM', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1153, 'GHNM0705', 'DHL SRB LMB', 'PARFUM', '0', '21500', '0', '21500', 'Normal', '2022-04-03 00:00:00', 'Admin', '450ML'),
(1154, 'GHNM0706', 'DHL SRB RFPNK', 'PARFUM', '0', '21500', '0', '21500', 'Normal', '2022-04-03 00:00:00', 'Admin', '450ML'),
(1155, 'GHNM0707', 'DHLIA TB 3', 'PARFUM', '0', '14200', '0', '14200', 'Normal', '2022-04-03 00:00:00', 'Admin', '120G'),
(1156, 'GHNM0708', 'SWLL TB 6', 'PARFUM', '0', '24000', '0', '24000', 'Normal', '2022-04-03 00:00:00', 'Admin', '240G'),
(1157, 'GHNM0709', 'DHL TB KCL K315', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1158, 'GHNM0710', 'DHL NTHBLL TRP', 'PARFUM', '0', '38000', '0', '38000', 'Normal', '2022-04-03 00:00:00', 'Admin', '500G'),
(1159, 'GHNM0711', 'DHL TB K32 6', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '240G'),
(1160, 'GHNM0712', 'DHL TB FRSH K31', 'PARFUM', '0', '21500', '0', '21500', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1161, 'GHNM0713', 'KMPER SAUD', 'PARFUM', '0', '7000', '0', '7000', 'Normal', '2022-04-03 00:00:00', 'Admin', '40G'),
(1162, 'GHNM0714', 'DHL TB FLRAL', 'PARFUM', '0', '21500', '0', '21500', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1163, 'GHNM0715', 'DHL TB GREN', 'PARFUM', '0', '21500', '0', '21500', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1164, 'GHNM0716', 'BGUS CLOUR TB 5', 'PARFUM', '0', '23800', '0', '23800', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1165, 'GHNM0717', 'SWLL TB JMB', 'PARFUM', '0', '17500', '0', '17500', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1166, 'GHNM0718', 'DHL TB TRPACK22', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1167, '8998654', 'HNGER TOP ', 'PERMANDI', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1168, '5542311', 'CD CWOK SPMEN', 'PAKAIAN', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1169, '1305545', 'CD CWOK BLTEX', 'PAKAIAN', '0', '27000', '0', '27000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1170, '1311223', 'CD CWOK LCUTESS', 'PAKAIAN', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1171, '12626', 'CD CWOK SMFIT', 'PAKAIAN', '0', '17300', '0', '17300', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1172, '2253446', 'CD CWOK OPTMA', 'PAKAIAN', '0', '55000', '0', '55000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1173, 'GHNM0719', 'MTU PKT BABY', 'PERANAK', '0', '55000', '0', '55000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1174, 'GHNM0720', 'ZWTSAL CMPLTE', 'PERANAK', '0', '63000', '0', '63000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1175, 'GHNM0721', 'CSSON ST PRPLE', 'PERANAK', '0', '55000', '0', '55000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1176, 'GHNM0722', 'CSSON ST MN PRP', 'PERANAK', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PKT'),
(1177, '3022322', 'BH BDYFIT', 'PAKAIAN', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1178, '13464', 'BH BWEN', 'PAKAIAN', '0', '16500', '0', '16500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1179, '2232825', 'BH A107', 'PAKAIAN', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1180, '8556543', 'BH SWEET', 'PAKAIAN', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1181, '8556552', 'BH FMA RNDA', 'PAKAIAN', '0', '28500', '0', '28500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1182, 'GHNM0723', 'BH CAIXIANER SDG', 'PAKAIAN', '0', '33000', '0', '33000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1183, 'GHNM0724', 'BH CAIXIANER JMB ', 'PAKAIAN', '0', '32500', '0', '32500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1184, '5455255', 'BH TELI B5', 'PAKAIAN', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1185, '1263', 'BH SELCA 403', 'PAKAIAN', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1186, '13866', 'BH OIMIO', 'PAKAIAN', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1187, '2232824', 'BH TELI 999 SCR', 'PAKAIAN', '0', '24000', '0', '24000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1188, '2232566', 'BH XINSHINI ', 'PAKAIAN', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1189, '8556547', 'BH WNROU ', 'PAKAIAN', '0', '20500', '0', '20500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1190, '8556521', 'BH GAIXN BRD', 'PAKAIAN', '0', '27000', '0', '27000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1191, '8556545', 'BH MSLLY 123', 'PAKAIAN', '0', '27500', '0', '27500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1192, '8556536', 'BH MSLLY6266', 'PAKAIAN', '0', '17000', '0', '17000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1193, 'GHNM0725', 'BH SLSA SPRT', 'PAKAIAN', '0', '17000', '0', '17000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1194, '8556550', 'BH FMA SFT', 'PAKAIAN', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1195, '8556549', 'BH WNROU B03', 'PAKAIAN', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1196, '8556553', 'BH FMA SPRT', 'PAKAIAN', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1197, '8556551', 'BH FMA LVESCR', 'PAKAIAN', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1198, '8556546', 'BH XINXIN ', 'PAKAIAN', '0', '21000', '0', '21000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1199, 'GHNM0726', 'BH GUINI JMB', 'PAKAIAN', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1200, 'GHNM0727', 'BH DSHLU ', 'PAKAIAN', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1201, '8556544', 'BH LA PRS ', 'PAKAIAN', '0', '28500', '0', '28500', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1202, 'GHNM0728', 'KRMA MINA ', 'MAKANAN', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '250G'),
(1203, 'GHNM0729', 'KRMA AJWA', 'MAKANAN', '0', '100000', '0', '100000', 'Normal', '2022-04-03 00:00:00', 'Admin', '500G'),
(1204, 'GHNM0730', 'DASI  BRD LK', 'SERAGAM', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1205, '1245', 'KOPYA ASGV BRD', 'PERSHOLAT', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1206, '1308', 'SPATU ANK MCN', 'PERANAK', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1207, '2232224', 'SL BAGUS L', 'PERANAK', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1208, '2232577', 'CLNA PTH MOTF', 'PERANAK', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1209, '1251', 'KOPYA SLMET.', 'PERSHOLAT', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1210, '1301', 'SL SWAN BRND', 'PERSHOLAT', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1211, '8977853', 'KOPYA PTH BNANG', 'PERSHOLAT', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1212, '2335681', 'ROK SD MRH', 'PERSHOLAT', '0', '68000', '0', '68000', 'Normal', '2022-04-03 00:00:00', 'Admin', '3S'),
(1213, '2311231', 'KOPYA RJUT PTH', 'PERSHOLAT', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1214, '25889944', 'KOPYA JMR HTM', 'PERSHOLAT', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '1PCS'),
(1215, 'GHNM0731', 'GTSBY FW OILC', 'SKINCARE', '0', '19900', '0', '19900', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1216, 'GHNM0732', 'GTSBY FW PPYA', 'SKINCARE', '0', '21000', '0', '21000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1217, 'GHNM0733', 'PONDS FW BBST', 'SKINCARE', '0', '35500', '0', '35500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1218, 'GHNM0734', 'PONDS FW ACNS', 'SKINCARE', '0', '29000', '0', '29000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1219, 'GHNM0735', 'GRNIER MN CHR', 'SKINCARE', '0', '30000', '0', '30000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150G'),
(1220, 'GHNM0736', 'GRNIER MN ICYCHR', 'SKINCARE', '0', '33000', '0', '33000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1221, 'GHNM0737', 'GRNIER MN MTCH', 'SKINCARE', '0', '25500', '0', '25500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1222, 'GHNM0738', 'GRNIER MN WSBI', 'SKINCARE', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1223, 'GHNM0739', 'GRNIER MN ICYSCR', 'SKINCARE', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1224, 'GHNM0740', 'GRNIER MN ACNFI', 'SKINCARE', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1225, 'GHNM0741', 'GRNIER MN CHAR', 'SKINCARE', '0', '30800', '0', '30800', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1226, 'GHNM0742', 'NVEA FW ACNOIL', 'SKINCARE', '0', '28700', '0', '28700', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1227, 'GHNM0743', 'PCELLE MC BV', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1228, 'GHNM0744', 'PCELLE MC JR', 'PARFUM', '0', '16200', '0', '16200', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1229, 'GHNM0745', 'PCELLE MC BB', 'PARFUM', '0', '18400', '0', '18400', 'Normal', '2022-06-03 19:25:40', 'admin', '100ML'),
(1230, 'GHNM0746', 'PCELLE MC SL', 'PARFUM', '0', '16200', '0', '16200', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1231, 'GHNM0747', 'PCELLE MC PG', 'PARFUM', '0', '18400', '0', '18400', 'Normal', '2022-06-03 19:27:31', 'admin', '100ML'),
(1232, 'GHNM0748', 'PCELLE MC WO', 'PARFUM', '0', '15600', '0', '15600', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1233, 'GHNM0749', 'ESKLN SC CNDRL', 'PARFUM', '0', '17500', '0', '17500', 'Normal', '2022-04-03 00:00:00', 'Admin', '125ML'),
(1234, 'GHNM0750', 'ESKN SC SW', 'PARFUM', '0', '16500', '0', '16500', 'Normal', '2022-04-03 00:00:00', 'Admin', '125ML'),
(1235, 'GHNM0751', 'ESKLN SC BLLE.', 'PARFUM', '0', '16500', '0', '16500', 'Normal', '2022-04-03 00:00:00', 'Admin', '125ML'),
(1236, 'GHNM0752', 'ESKLN SC CNDRL.', 'PARFUM', '0', '8500', '0', '8500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1237, 'GHNM0753', 'ESKLN SC BLLE', 'PARFUM', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1238, 'GHNM0754', 'ESKLN SC SW', 'PARFUM', '0', '7500', '0', '7500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1239, 'GHNM0755', 'RGZZA EDT FM', 'PARFUM', '0', '23900', '0', '23900', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1240, 'GHNM0756', 'RGZZA EDT PSS', 'PARFUM', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1241, 'GHNM0757', 'RGZZA EDT GLW', 'PARFUM', '0', '28600', '0', '28600', 'Normal', '2022-06-03 19:37:30', 'admin', '50ML'),
(1242, 'GHNM0758', 'RGZZA EDT SPH', 'PARFUM', '0', '23900', '0', '23900', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1243, 'GHNM0759', 'RGZZA EDT PRT', 'PARFUM', '0', '23900', '0', '23900', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1244, 'GHNM0760', 'VTALIS EDC MG', 'PARFUM', '0', '24600', '0', '24600', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1245, 'GHNM0761', 'VTALIS EDC FMM', 'PARFUM', '0', '24500', '0', '24500', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1246, 'GHNM0762', 'VTALIS EDC EMP', 'PARFUM', '0', '26000', '0', '26000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1247, 'GHNM0763', 'VTALIS EDC BLS', 'PARFUM', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1248, 'GHNM0764', 'PCELLE EDF V', 'PARFUM', '0', '38000', '0', '38000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1249, 'GHNM0765', 'PCELLE EDF A', 'PARFUM', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1250, 'GHNM0766', 'PCELLE EDF G', 'PARFUM', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1251, 'GHNM0767', 'VVLLE EDT PSR', 'PARFUM', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1252, 'GHNM0768', 'VVLLE EDT SW', 'PARFUM', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1253, 'GHNM0769', 'VVLLE EDT BBR', 'PARFUM', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1254, 'GHNM0770', 'VVLLE EDT ADR', 'PARFUM', '0', '28000', '0', '28000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1255, 'GHNM0771', 'BB KDS TTFRT', 'PARFUM', '0', '8500', '0', '8500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1256, 'GHNM0772', 'BB KDS RSBRR', 'PARFUM', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1257, 'GHNM0773', 'BB KDS STR', 'PARFUM', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1258, 'GHNM0774', 'ESKLN KDS GRN', 'PARFUM', '0', '9500', '0', '9500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1259, 'GHNM0775', 'ESKLN KDS PNNPL', 'PARFUM', '0', '9500', '0', '9500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1260, 'GHNM0776', 'CSBLNC SC DYN', 'PARFUM', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1261, 'GHNM0777', 'CSBLNC SC AMB', 'PARFUM', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1262, 'GHNM0778', 'CSBLNC SC INT', 'PARFUM', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1263, 'GHNM0779', 'CSBLNC SC RMT', 'PARFUM', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1264, 'GHNM0780', 'CSBLNC SC FNT', 'PARFUM', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1265, 'GHNM0781', 'CSBLNC SC SPR', 'PARFUM', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1266, 'GHNM0782', 'CSBLNC SC ENR', 'PARFUM', '0', '20700', '0', '20700', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1267, 'GHNM0783', 'RGZZA SC PSS', 'PARFUM', '0', '30500', '0', '30500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1268, 'GHNM0784', 'RGZZA SC SPH', 'PARFUM', '0', '30500', '0', '30500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1269, 'GHNM0785', 'RGZZA SC FM', 'PARFUM', '0', '30500', '0', '30500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1270, 'GHNM0786', 'RGZZA SC GLW', 'PARFUM', '0', '35000', '0', '35000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1271, 'GHNM0787', 'RGZZA SC PRT', 'PARFUM', '0', '30500', '0', '30500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1272, 'GHNM0788', 'CSBLNC SC RYL', 'PARFUM', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1273, 'GHNM0789', 'CSBLNC SC CLSC', 'PARFUM', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1274, 'GHNM0790', 'ESK HJB SY', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '125ML'),
(1275, 'GHNM0791', 'ESK HJB DP', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '125ML'),
(1276, 'GHNM0792', 'ESK HJB BT', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '125ML'),
(1277, 'GHNM0793', 'ESK SC SK', 'PARFUM', '0', '21000', '0', '21000', 'Normal', '2022-04-03 00:00:00', 'Admin', '110ML'),
(1278, 'GHNM0794', 'ESK SC MD', 'PARFUM', '0', '21000', '0', '21000', 'Normal', '2022-04-03 00:00:00', 'Admin', '110ML'),
(1279, 'GHNM0795', 'IZZI BM EL', 'PARFUM', '0', '11500', '0', '11500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1280, 'GHNM0796', 'IZZI BM SL', 'PARFUM', '0', '12900', '0', '12900', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1281, 'GHNM0797', 'IZZI BM DL', 'PARFUM', '0', '12900', '0', '12900', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1282, 'GHNM0798', 'IZZI BM TL', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1283, 'GHNM0799', 'IZZI BM FL', 'PARFUM', '0', '11500', '0', '11500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1284, 'GHNM0800', 'IZZI BM ML', 'PARFUM', '0', '11500', '0', '11500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1285, 'GHNM0801', 'CSBLNC BM RMN', 'PARFUM', '0', '13200', '0', '13200', 'Normal', '2022-08-04 10:26:06', 'admin', '100ML'),
(1286, 'GHNM0802', 'CSBLNC BM RYL', 'PARFUM', '0', '13500', '0', '13500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1287, 'GHNM0803', 'CSBLNC BM INT', 'PARFUM', '0', '13500', '0', '13500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1288, 'GHNM0804', 'CSBLNC BM DYN', 'PARFUM', '0', '13500', '0', '13500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1289, 'GHNM0805', 'CSBLNC BM SPR', 'PARFUM', '0', '13500', '0', '13500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1290, 'GHNM0806', 'CSBLNC BM AMB', 'PARFUM', '0', '13500', '0', '13500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1291, 'GHNM0807', 'CSBLNC BM ENR', 'PARFUM', '0', '14200', '0', '14200', 'Normal', '2022-08-04 10:25:20', 'admin', '100ML'),
(1292, 'GHNM0808', 'CSBLNC BM ELG', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1293, 'GHNM0809', 'CSBLNC SC ILL', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1294, 'GHNM0810', 'CSNLC BC AQ', 'PARFUM', '0', '7500', '0', '7500', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1295, 'GHNM0811', 'CSNLC BC ILL', 'PARFUM', '0', '7200', '0', '7200', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1296, 'GHNM0812', 'CSNLC BC INT', 'PARFUM', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1297, 'GHNM0813', 'CSNLC BC DYN', 'PARFUM', '0', '7500', '0', '7500', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1298, 'GHNM0814', 'GRNIER FW WHICH', 'PARFUM', '0', '32000', '0', '32000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1299, 'GHNM0815', 'NVEA MN CHSL', 'PARFUM', '0', '29000', '0', '29000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1300, 'GHNM0816', 'NVEA MN CHCAR', 'PARFUM', '0', '18500', '0', '18500', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1301, 'GHNM0817', 'GRNIER MN CHR.', 'PARFUM', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1302, 'GHNM0818', 'GRNIER FW WCIC', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1303, 'GHNM0819', 'NVEA MN CRNT', 'PARFUM', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1304, 'GHNM0820', 'NVEA MN WSB', 'PARFUM', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1305, 'GHNM0821', 'GTSBY WG SH5', 'PARFUM', '0', '7700', '0', '7700', 'Normal', '2022-04-03 00:00:00', 'Admin', '75G'),
(1306, 'GHNM0822', 'GTSBY WG H3', 'PARFUM', '0', '8900', '0', '8900', 'Normal', '2022-04-03 00:00:00', 'Admin', '75G'),
(1307, 'GHNM0823', 'FRHIM HC RD', 'PARFUM', '0', '25300', '0', '25300', 'Normal', '2022-04-03 00:00:00', 'Admin', '80G'),
(1308, 'GHNM0824', 'CLEAR HC ANDN', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1309, 'GHNM0825', 'FRHIM HC GLD', 'PARFUM', '0', '23300', '0', '23300', 'Normal', '2022-04-03 00:00:00', 'Admin', '80G'),
(1310, 'GHNM0826', 'RGZZA BSD CLSSY', 'PARFUM', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1311, 'GHNM0827', 'FRHIM HC SLV', 'PARFUM', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '80G'),
(1312, 'GHNM0828', 'BRSOV BM CP', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1313, 'GHNM0829', 'BRSOV BM VL', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1314, 'GHNM0830', 'BRSOV BM BL', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1315, 'GHNM0831', 'BRSOV BM HV', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1316, 'GHNM0832', 'BRSOV BM CG', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1317, 'GHNM0833', 'SIXCN BC CB', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1318, 'GHNM0834', 'SIXCN BC GO', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1319, 'GHNM0835', 'SIXCN BC RP', 'PARFUM', '0', '14500', '0', '14500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1320, 'GHNM0836', 'SIXCN BC FR', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1321, 'GHNM0837', 'SIXCN BC DP', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1322, 'GHNM0838', 'BRSOV EDP EXT', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1323, 'GHNM0839', 'BRSOV EDP LVL', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1324, 'GHNM0840', 'BRSOV EDP FRS', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1325, 'GHNM0841', 'BRSOV EDP DYN', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1326, 'GHNM0842', 'BRSOV EDP MYS', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1327, 'GHNM0843', 'VCTR BS SFY', 'PARFUM', '0', '19300', '0', '19300', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1328, 'GHNM0844', 'VCTR BS HN', 'PARFUM', '0', '17500', '0', '17500', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1329, 'GHNM0845', 'VCTR BS AL', 'PARFUM', '0', '17500', '0', '17500', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1330, 'GHNM0846', 'VCTR BS NR', 'PARFUM', '0', '19300', '0', '19300', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1331, 'GHNM0847', 'VCTR BS AGN', 'PARFUM', '0', '19300', '0', '19300', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1332, 'GHNM0848', 'ESKLN GL SD', 'PARFUM', '0', '9200', '0', '9200', 'Normal', '2022-06-03 19:32:09', 'admin', '50ML'),
(1333, 'GHNM0849', 'ESKLN GL TH', 'PARFUM', '0', '9200', '0', '9200', 'Normal', '2022-06-03 19:33:51', 'admin', '50ML'),
(1334, 'GHNM0850', 'ESKLN GL SN', 'PARFUM', '0', '9200', '0', '9200', 'Normal', '2022-06-03 19:32:31', 'admin', '50ML'),
(1335, 'GHNM0851', 'ESKLN GL STR', 'PARFUM', '0', '9200', '0', '9200', 'Normal', '2022-06-03 19:33:18', 'admin', '50ML'),
(1336, 'GHNM0852', 'ESKLN GL MN', 'PARFUM', '0', '9200', '0', '9200', 'Normal', '2022-06-03 19:31:47', 'admin', '50ML'),
(1337, 'GHNM0853', 'ESKLN GL WD', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1338, 'GHNM0854', 'ESKLN GL TH.', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1339, 'GHNM0855', 'ESKLN GL FRS', 'PARFUM', '0', '15700', '0', '15700', 'Normal', '2022-08-09 13:05:21', 'admin', '100ML'),
(1340, 'GHNM0856', 'ESKLN GL FRD', 'PARFUM', '0', '15800', '0', '15800', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1341, 'GHNM0857', 'ESKLN GL SND', 'PARFUM', '0', '15500', '0', '15500', 'Normal', '2022-08-09 13:42:57', 'admin', '100ML'),
(1342, 'GHNM0858', 'ESKLN GL SPD', 'PARFUM', '0', '15900', '0', '15900', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1343, 'GHNM0859', 'PINKME MS SA', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1344, 'GHNM0860', 'ESKLN GL STRD', 'PARFUM', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1345, 'GHNM0861', 'IZZI FM DD', 'PARFUM', '0', '12500', '0', '12500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1346, 'GHNM0862', 'IZZI FM HB', 'PARFUM', '0', '12500', '0', '12500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1347, 'GHNM0863', 'IZZI FM SC', 'PARFUM', '0', '12500', '0', '12500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1348, 'GHNM0864', 'BRBR BPD PNK', 'PARFUM', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1349, 'GHNM0865', 'BRBR BPD HTM', 'PARFUM', '0', '11000', '0', '11000', 'Normal', '2022-04-03 00:00:00', 'Admin', '50ML'),
(1350, 'GHNM0866', 'MRIS EDP PRN', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1351, 'GHNM0867', 'MRIS EDP VN', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1352, 'GHNM0868', 'FRSH MC PRT', 'PARFUM', '0', '9000', '0', '9000', 'Normal', '2022-04-03 00:00:00', 'Admin', '70ML'),
(1353, 'GHNM0869', 'MRNA BM PC', 'PARFUM', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1354, 'GHNM0870', 'AINIE EDC FRS', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '30ML'),
(1355, 'GHNM0871', 'VCTR PSS PKT', 'PARFUM', '0', '34500', '0', '34500', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1356, 'GHNM0872', 'PRBS LM GR', 'SKINCARE', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '235G'),
(1357, 'GHNM0873', 'PRBS LM PTH', 'SKINCARE', '0', '16300', '0', '16300', 'Normal', '2022-08-17 10:30:37', 'admin', '235G'),
(1358, 'GHNM0874', 'PRBS LM ZTN', 'SKINCARE', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '235G'),
(1359, 'GHNM0875', 'PRBS LM MTR', 'SKINCARE', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '235G'),
(1360, 'GHNM0876', 'PRBS LM BRG', 'SKINCARE', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '235G'),
(1361, 'GHNM0877', 'PRBS LM SSB.', 'SKINCARE', '0', '15500', '0', '15500', 'Normal', '2022-04-03 00:00:00', 'Admin', '235G'),
(1362, 'GHNM0878', 'PRBS LM SSB', 'SKINCARE', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '125G'),
(1363, 'GHNM0879', 'PRBS LM MTR.', 'SKINCARE', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '125G'),
(1364, 'GHNM0880', 'SHNZ BS HN', 'SKINCARE', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1365, 'GHNM0881', 'SHNZ BS KHN', 'SKINCARE', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1366, 'GHNM0882', 'SHNZ BS SKR', 'SKINCARE', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1367, 'GHNM0883', 'SHNZ BS MTS', 'SKINCARE', '0', '17000', '0', '17000', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1368, 'GHNM0884', 'SHNZ BS KRE', 'SKINCARE', '0', '12500', '0', '12500', 'Normal', '2022-04-03 00:00:00', 'Admin', '200G'),
(1369, 'GHNM0885', 'SCRLET BS PM', 'SKINCARE', '0', '65000', '0', '65000', 'Normal', '2022-04-03 00:00:00', 'Admin', '250ML'),
(1370, 'GHNM0886', 'HRB BL ALV', 'SKINCARE', '0', '14800', '0', '14800', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1371, 'GHNM0887', 'PRBSR ZTN PKT', 'SKINCARE', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '315G'),
(1372, 'GHNM0888', 'PRBSR PTH PKT', 'SKINCARE', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '315G'),
(1373, 'GHNM0889', 'MSTR SC BM', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1374, 'GHNM0890', 'MSTER SC EA.', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1375, 'GHNM0891', 'MSTER SC EA', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1376, 'GHNM0892', 'MSTER SC GF', 'PARFUM', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1377, 'GHNM0893', 'POSH BS GM', 'PARFUM', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1378, 'GHNM0894', 'POSH BS BG', 'PARFUM', '0', '22500', '0', '22500', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1379, 'GHNM0895', 'POSH BS BL', 'PARFUM', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1380, 'GHNM0896', 'POSH BS CB', 'PARFUM', '0', '22500', '0', '22500', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1381, 'GHNM0897', 'GTSBY PBS CMPS', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1382, 'GHNM0898', 'GTSBY PBS DPP', 'PARFUM', '0', '23000', '0', '23000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1383, 'GHNM0899', 'POSH GRL BP', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1384, 'GHNM0900', 'POSH GRL GB', 'PARFUM', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1385, 'GHNM0901', 'POSH GRL LS', 'PARFUM', '0', '22000', '0', '22000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1386, 'GHNM0902', 'VVLLE DBS HJ', 'PARFUM', '0', '21000', '0', '21000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1387, 'GHNM0903', 'VVLLE DBS BR', 'PARFUM', '0', '21000', '0', '21000', 'Normal', '2022-04-03 00:00:00', 'Admin', '150ML'),
(1388, 'GHNM0904', 'ENCHT EDC RMN', 'PARFUM', '0', '26400', '0', '26400', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1389, 'GHNM0905', 'ENCHT EDC TRS', 'PARFUM', '0', '25300', '0', '25300', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1390, 'GHNM0906', 'ENCHT EDC GLM', 'PARFUM', '0', '27300', '0', '27300', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1391, 'GHNM0907', 'VTLIS BS GLM', 'PARFUM', '0', '24000', '0', '24000', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1392, 'GHNM0908', 'VTLIS BS FNT', 'PARFUM', '0', '24500', '0', '24500', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1393, 'GHNM0909', 'VTLIS BS SHR', 'PARFUM', '0', '24000', '0', '24000', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1394, 'GHNM0910', 'VTLIS BS CG', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1395, 'GHNM0911', 'VTLIS BS TW', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1396, 'GHNM0912', 'VTLIS BS SS', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1397, 'GHNM0913', 'VTLIS BS BZR.', 'PARFUM', '0', '20000', '0', '20000', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1398, 'GHNM0914', 'VTLIS BS HE', 'PARFUM', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '120ML'),
(1399, 'GHNM0915', 'VTLIS BS BLS', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1400, 'GHNM0916', 'VTLIS BS BRZ', 'PARFUM', '0', '12500', '0', '12500', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1401, 'GHNM0917', 'VTLIS BS BZR', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1402, 'GHNM0918', 'VTLIS BS BLS.', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1403, 'GHNM0919', 'VTLIS BS BLSF', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1404, 'GHNM0920', 'VTALIS BS BLL', 'PARFUM', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '60ML'),
(1405, 'GHNM0921', 'GTSBY WG HS7', 'SKINCARE', '0', '11900', '0', '11900', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1406, 'GHNM0922', 'GTSBY WG SH5.', 'SKINCARE', '0', '11000', '0', '11000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1407, 'GHNM0923', 'GTSBY WG H3.', 'SKINCARE', '0', '11000', '0', '11000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100G'),
(1408, 'GHNM0924', 'FRS HJB CD', 'PARFUM', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '100ML'),
(1409, 'GHNM0925', 'MLTI TS GLG', 'TISSU', '0', '4500', '0', '4500', 'Normal', '2022-04-03 00:00:00', 'Admin', '85G'),
(1410, 'GHNM0926', 'SFTEX DS NW8', 'PEMBALUT', '0', '5500', '0', '5500', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1411, 'GHNM0927', 'SFTEX DS PNTL ', 'PEMBALUT', '0', '8800', '0', '8800', 'Normal', '2022-06-03 19:12:09', 'admin', '20P'),
(1412, 'GHNM0928', 'LRIER SLM 8', 'PEMBALUT', '0', '19000', '0', '19000', 'Normal', '2022-04-03 00:00:00', 'Admin', '35CM'),
(1413, 'GHNM0929', 'CHRM NW8', 'PEMBALUT', '0', '5000', '0', '5000', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1414, 'GHNM0930', 'LRIER AD W10', 'PEMBALUT', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '22CM'),
(1415, 'GHNM0931', 'LRIER AD W8', 'PEMBALUT', '0', '7000', '0', '7000', 'Normal', '2022-04-03 00:00:00', 'Admin', '25CM'),
(1416, 'GHNM0932', 'LRIER AD NWMX', 'PEMBALUT', '0', '6000', '0', '6000', 'Normal', '2022-04-03 00:00:00', 'Admin', '8P'),
(1417, 'GHNM0933', 'PRTEX ESFT W10', 'PEMBALUT', '0', '6500', '0', '6500', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1418, 'GHNM0934', 'CHRM HRB W16', 'PEMBALUT', '0', '16800', '0', '16800', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1419, 'GHNM0935', 'LRIER HS W6', 'PEMBALUT', '0', '15000', '0', '15000', 'Normal', '2022-04-03 00:00:00', 'Admin', '35CM'),
(1420, 'GHNM0936', 'PRTEX CNGHT W', 'PEMBALUT', '0', '18000', '0', '18000', 'Normal', '2022-04-03 00:00:00', 'Admin', '20P'),
(1421, 'GHNM0937', 'PRTEX ENW 23', 'PEMBALUT', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '24P'),
(1422, 'GHNM0938', 'KTEX NGHT W', 'PEMBALUT', '0', '25000', '0', '25000', 'Normal', '2022-04-03 00:00:00', 'Admin', '14P'),
(1423, 'GHNM0939', 'LRIER HS W9', 'PEMBALUT', '0', '10000', '0', '10000', 'Normal', '2022-04-03 00:00:00', 'Admin', '22CM'),
(1424, 'GHNM0940', 'CHRM W20', 'PEMBALUT', '0', '13000', '0', '13000', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1425, 'GHNM0941', 'CHRM NW20', 'PEMBALUT', '0', '14000', '0', '14000', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1426, 'GHNM0942', 'KTEX NW10', 'PEMBALUT', '0', '8000', '0', '8000', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1427, 'GHNM0943', 'PRTEX NW8', 'PEMBALUT', '0', '3500', '0', '3500', 'Normal', '2022-04-03 00:00:00', 'Admin', '23CM'),
(1428, 'GHNM0944', 'LRIER FP 25CM', 'PEMBALUT', '0', '12000', '0', '12000', 'Normal', '2022-04-03 00:00:00', 'Admin', '14P'),
(1429, 'GHNM0945', 'LRIER RN 35CM', 'PEMBALUT', '0', '9000', '0', '9000', 'Normal', '2022-04-03 00:00:00', 'Admin', '6P'),
(1430, 'GHNM0946', 'CHRM CLFRS W29', 'PEMBALUT', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '10P'),
(1431, 'GHNM0947', 'CHRM CLFRSW23', 'PEMBALUT', '0', '16000', '0', '16000', 'Normal', '2022-04-03 00:00:00', 'Admin', '16P'),
(1432, 'GHNM0948', 'PRTEX W23CM', 'PEMBALUT', '0', '3000', '0', '3000', 'Normal', '2022-04-03 00:00:00', 'Admin', '5P'),
(1433, 'GHNM0949', 'SFTEX NCOOL W29', 'PEMBALUT', '0', '15500', '0', '15500', 'Normal', '2022-04-03 00:00:00', 'Admin', '10P'),
(1435, 'GHNM0950', 'MTU WPS BT P', 'TISSU', '0', '14800', '0', '14800', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '60S'),
(1436, 'GHNM0951', 'MYBBY WPS HJ', 'TISSU', '0', '5500', '0', '5500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10S'),
(1437, 'GHNM0952', 'MTU WPS BT B', 'TISSU', '0', '16800', '0', '16800', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '60S'),
(1438, 'GHNM0953', 'MTU WPS BT HJ', 'TISSU', '0', '18500', '0', '18500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '60S'),
(1439, 'GHNM0954', 'SWTY WPS TLN', 'TISSU', '0', '17000', '0', '17000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '30S'),
(1440, 'GHNM0955', 'WTTS WPS MRH', 'TISSU', '0', '5500', '0', '5500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10S'),
(1441, 'GHNM0956', 'WTTS WPS HJ', 'TISSU', '0', '5500', '0', '5500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10S'),
(1442, 'GHNM0957', 'CSSON WPS BR', 'TISSU', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '2PCK'),
(1443, 'GHNM0958', 'TS SFT PRM', 'TISSU', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '230S'),
(1444, 'GHNM0959', 'KPS SLCTION', 'TISSU', '0', '9500', '0', '9500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '60G'),
(1445, 'GHNM0960', 'TS SFT POP', 'TISSU', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '180S'),
(1446, 'GHNM0961', 'TS TESSA SS', 'TISSU', '0', '18500', '0', '18500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '300S'),
(1447, 'GHNM0962', 'TS TESSA 10S', 'TISSU', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1448, 'GHNM0963', 'TS PSEO 8S', 'TISSU', '0', '18000', '0', '18000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1449, 'GHNM0964', 'TS PSEO 8S 10', 'TISSU', '0', '17800', '0', '17800', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1450, 'GHNM0965', 'KPS SAUDI ', 'TISSU', '0', '9500', '0', '9500', 'Normal', '2022-05-07 13:04:56', 'admin', '35G'),
(1451, 'GHNM0966', 'TS NICE POP ', 'TISSU', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200S'),
(1452, 'GHNM0967', 'TS SEE U ', 'TISSU', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '250S'),
(1453, 'GHNM0968', 'TS MLTI POP', 'TISSU', '0', '7500', '0', '7500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200S'),
(1454, 'GHNM0969', 'TS PSEO POP', 'TISSU', '0', '7500', '0', '7500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '130S'),
(1455, 'GHNM0970', 'TS MLTI RLL', 'TISSU', '0', '25000', '0', '25000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '6PCS'),
(1456, 'GHNM0971', 'TS NICE FC', 'TISSU', '0', '12000', '0', '12000', 'Normal', '2022-06-03 17:02:57', 'admin', '200S'),
(1457, 'GHNM0972', 'TS TESSA SP', 'TISSU', '0', '13000', '0', '13000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200S'),
(1458, 'GHNM0973', 'TS SFT GLG', 'TISSU', '0', '3500', '0', '3500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '170S');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(1459, 'GHNM0974', 'TS TESSA ORG', 'TISSU', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '50S'),
(1460, 'GHNM0975', 'TS PSEO ULTR', 'TISSU', '0', '7000', '0', '7000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '40S'),
(1461, 'GHNM0976', 'TS PSEO LUX', 'TISSU', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '60S'),
(1462, 'GHNM0977', 'TS PSEO BBY', 'TISSU', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '50S'),
(1463, 'GHNM0978', 'TS NICE 2PLY', 'TISSU', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '60S'),
(1464, 'GHNM0979', 'TS NASA NP', 'TISSU', '0', '3500', '0', '3500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'PK'),
(1465, 'GHNM0980', 'TS PSEO LUX ', 'TISSU', '0', '34000', '0', '34000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1KTK'),
(1466, 'GHNM0981', 'TS GREEN ', 'TISSU', '0', '3500', '0', '3500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '100S'),
(1467, 'GHNM0982', 'TS TESSA 2PLY', 'TISSU', '0', '32000', '0', '32000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '120S'),
(1468, 'GHNM0983', 'TS TESSA BR', 'TISSU', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '250S'),
(1469, 'GHNM0984', 'MYBBY WPS ALV', 'TISSU', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10S'),
(1470, '8558991', 'CLENG TB KCL', 'ATK', '0', '17000', '0', '17000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1471, '8558990', 'CLENG TB BSR', 'ATK', '0', '18000', '0', '18000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1472, '3655455', 'SPD JNSEN KCL', 'ATK', '0', '7000', '0', '7000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1473, 'GHNM0985', 'ALT HTUNG VS1', 'ATK', '0', '20000', '0', '20000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1474, '132140', 'TMP PNS KTK', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1475, 'GHNM0986', 'TMP PNS RT', 'ATK', '0', '24000', '0', '24000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1476, '8558233', 'BLON PLKD', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '5PCS'),
(1477, '4556478', 'BLON MTL', 'ATK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '5PCS'),
(1478, 'GHNM0987', 'ORGAMI 14X14', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1479, 'GHNM0988', 'ORGAMI 12X12', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1480, '178342', 'LBEL NO 112', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1481, 'GHNM0989', 'PNSL WRN LN', 'ATK', '0', '23000', '0', '23000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1482, 'GHNM0990', 'TMP PNSL LGKP', 'ATK', '0', '15000', '0', '15000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1483, '132143', 'TMP PNSL AP33', 'ATK', '0', '7000', '0', '7000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1484, '7991122', 'TMP PNSL HK', 'ATK', '0', '15000', '0', '15000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1485, '8558987', 'CLENG PLT ANJ', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1486, 'GHNM0991', 'KWI SP BLC', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '30ML'),
(1487, 'GHNM0992', 'CSTOL ADS', 'ATK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'BS'),
(1488, 'GHNM0993', 'CSTOL ADS MN', 'ATK', '0', '6500', '0', '6500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'KCL'),
(1489, 'GHNM0994', 'JYKO GLE', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '8G'),
(1490, 'GHNM0995', 'COX PN ', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1491, 'GHNM0996', 'LEM  YS0965', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1492, 'GHNM0997', 'LEM PRNC', 'ATK', '0', '4000', '0', '4000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1493, 'GHNM0998', 'JYKO HGLIG', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1494, 'GHNM0999', 'KWI SP FAC', 'ATK', '0', '26000', '0', '26000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '75ML'),
(1495, 'GHNM1000', 'STPLES RF 5MM', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1000S'),
(1496, 'GHNM1001', 'LRISS RF 5MM', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1000S'),
(1497, 'GHNM1002', 'SNW INK ', 'ATK', '0', '9500', '0', '9500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '20MG'),
(1498, 'GHNM1003', 'STPLES RF 6MM', 'ATK', '0', '7000', '0', '7000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1000S'),
(1499, 'GHNM1004', 'SNW RF INK WHT', 'ATK', '0', '14000', '0', '14000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '20WBI'),
(1500, 'GHNM1005', 'EXSIS THM', 'ATK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '30PCS'),
(1501, 'GHNM1006', 'KPUR AJ', 'ATK', '0', '3500', '0', '3500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '3G'),
(1502, '1052266', 'LEM CHINA', 'ATK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1503, 'GHNM1007', 'ALTECO', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '3G'),
(1504, 'GHNM1008', 'SMPUL BK BRW', 'ATK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1GLG'),
(1505, '1373', 'AMP EXC E304', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1506, '1374', 'AMP EXC E308', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1507, 'GHNM1009', 'AMP EXC E310', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1508, 'GHNM1010', 'MAP KNC PLKD', 'ATK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1509, 'GHNM1011', 'MAP KRT HJ', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1510, '3556422', 'ADSHV TP BSR', 'ATK', '0', '11000', '0', '11000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1511, '132150', 'KPS A800 BTS', 'ATK', '0', '3500', '0', '3500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1512, '132147', 'LKBAN BRW', 'ATK', '0', '7000', '0', '7000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1513, '448898', 'ISOLSI KRT PTH', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1514, '1325678', 'ISOLSI BOPP TP', 'ATK', '0', '9600', '0', '9600', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1515, '8566568', 'ISOLSI BRRY TP', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1516, '132137', 'ISOLSI EASY TP', 'ATK', '0', '11000', '0', '11000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1517, 'GHNM1012', 'PGRS LNGKP', 'ATK', '0', '17500', '0', '17500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1518, '8897884', 'NEHA FC WHT', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1519, '1592', 'LEM CAIR ', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1520, '1053', 'LEM GLVNAL', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1521, '1542', 'LM DLUKOL MN', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1522, '132134', 'ISOLS SLVR ', 'ATK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1523, '5644322', 'NEHA FC CLSSC', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1524, '7784456', 'STIKC WRNI', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1525, '1132232', 'JRUM KCL', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1526, 'GHNM1013', 'PITA 309', 'ATK', '0', '5500', '0', '5500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1527, 'GHNM1014', 'LEM CAIR 2023', 'ATK', '0', '4000', '0', '4000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1528, '2578112', 'ISOLS STR HTM', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1529, '447689', 'ISOLS ST BSR', 'ATK', '0', '2000', '0', '2000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1530, '5566852', 'ISOLS ST KCL', 'ATK', '0', '1000', '0', '1000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1531, 'GHNM1015', 'PITA 302 VS 1', 'ATK', '0', '4000', '0', '4000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1532, '2525633', 'WTER GLUE', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1533, '132149', 'KRT CREPE SML', 'ATK', '0', '6700', '0', '6700', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1534, '132148', 'KRT CREPE BSR', 'ATK', '0', '9200', '0', '9200', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1535, '7889889', 'PTA SRT BG PTH', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1536, '7889892', 'PTA SRT GRS', 'ATK', '0', '2000', '0', '2000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1537, '7889891', 'PTA SRT LV BR', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1538, '7889893', 'PTA SRT LV KN', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1539, '7889890', 'PTA SRT LV ORN', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1540, '7889894', 'PTA SRT LV PNK', 'ATK', '0', '1500', '0', '1500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1541, 'GHNM1016', 'EANGLES BLCK', 'KOSMETIK', '0', '7500', '0', '7500', 'Normal', '2022-07-20 10:32:32', 'admin', '10G'),
(1542, 'GHNM1017', 'EANGLES BRW', 'KOSMETIK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1543, 'GHNM1018', 'AL LTF HNNA', 'KOSMETIK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1544, 'GHNM1019', 'GLECHA BRW', 'KOSMETIK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1545, 'GHNM1020', 'GLECHA MRN', 'KOSMETIK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1546, 'GHNM1021', 'HENNA KN RD', 'KOSMETIK', '0', '11000', '0', '11000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1547, 'GHNM1022', 'GLECHA RD', 'KOSMETIK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1548, 'GHNM1023', 'RANE KHL', 'KOSMETIK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1549, 'GHNM1024', 'PTONG KK EVDI', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1550, '4556477', 'MY BOTTLE', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1551, '1312', 'BTL KTAK CPTN', 'ATK', '0', '6500', '0', '6500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1552, 'GHNM1025', 'ALARM LCK', 'ATK', '0', '70000', '0', '70000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1553, '2335728', 'PTONG KK KCL', 'ATK', '0', '7500', '0', '7500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1554, '2335727', 'STINLSS TWEEZR', 'ATK', '0', '4000', '0', '4000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1555, '5544632', 'NEHA BRWN', 'KOSMETIK', '0', '11000', '0', '11000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10G'),
(1556, '4554231', 'SRYA TLP PRF', 'PARFUM', '0', '12000', '0', '12000', '', '2022-04-21 20:30:10', 'admin', '10ML'),
(1557, 'GHNM1026', 'JAN VIERE PRF', 'PARFUM', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1558, '2532232', 'GNT GNIND FL', 'ATK', '0', '16000', '0', '16000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1559, '2532233', 'GNT GNIND SPM', 'ATK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1560, '2532235', 'GNT GNIND SPL', 'ATK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1561, 'GHNM1027', 'KNKO A300 CTT', 'ATK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1562, 'GHNM1028', 'KNKO L500 CTT', 'ATK', '0', '15000', '0', '15000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10ML'),
(1563, 'GHNM1029', 'BTR ALK AAA', 'ATK', '0', '17000', '0', '17000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '2PCS'),
(1564, 'GHNM1030', 'BTR  ALK AA', 'ATK', '0', '16000', '0', '16000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '2PCS'),
(1565, '7784457', 'CTTR KCL', 'ATK', '0', '2000', '0', '2000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1566, '2899887', 'PGRS HKTY', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1567, 'GHNM1031', 'PGRS BTTRFLY', 'ATK', '0', '3500', '0', '3500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '30CM'),
(1568, 'GHNM1032', 'PGRS BTRFLY KCL', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '20CM'),
(1569, '8544561', 'BTR ABC SPWR', 'ATK', '0', '5800', '0', '5800', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '2PCS'),
(1570, '2564478', 'DMNO YESO', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1571, '1792', 'GNTING RMP', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1572, 'GHNM1033', 'STCK NT 5146', 'ATK', '0', '8500', '0', '8500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1573, 'GHNM1034', 'STCK NT 0656', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1574, 'GHNM1035', 'STCK NT 5199', 'ATK', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1575, 'GHNM1036', 'STCK NT 6541', 'ATK', '0', '5500', '0', '5500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1576, 'GHNM1037', 'BK PPR FL B', 'ATK', '0', '27000', '0', '27000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200S'),
(1577, 'GHNM1038', 'BK PPR FL  S', 'ATK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '50S'),
(1578, 'GHNM1039', 'BK PPR FL K', 'ATK', '0', '8500', '0', '8500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '100S'),
(1579, 'GHNM1040', 'BK SUKHOI', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200S'),
(1580, 'GHNM1041', 'BK PPR FL KC', 'ATK', '0', '5500', '0', '5500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '100S'),
(1581, 'GHNM1042', 'BK KIKY MTL', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '100S'),
(1582, 'GHNM1043', 'BK KIKY KTK', 'ATK', '0', '20000', '0', '20000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200S'),
(1583, 'GHNM1044', 'MEMO UNCRN', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1584, 'GHNM1045', 'BK GMB DDO', 'ATK', '0', '2000', '0', '2000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1585, '978600362', 'BK MWR PAUD', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1586, 'GHNM1046', 'BK BT YOU ', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10PCS'),
(1587, 'GHNM1047', 'BK SIDU 38L', 'ATK', '0', '30900', '0', '30900', 'Normal', '2022-08-04 11:18:04', 'admin', '10PCS'),
(1588, 'GHNM1048', 'BK TBUNG ', 'ATK', '0', '5000', '0', '5000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1589, 'GHNM1049', 'BK SIDU 32L', 'ATK', '0', '19000', '0', '19000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '10PCS'),
(1590, 'GHNM1050', 'BK SIDU 38L 1', 'ATK', '0', '3000', '0', '3000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'PCS'),
(1591, 'GHNM1051', 'KRT LS LEAF ', 'ATK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '50S'),
(1592, 'GHNM1052', 'BK PPR NOTA', 'ATK', '0', '4300', '0', '4300', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '25S'),
(1593, 'GHNM1053', 'CRRCTION TP', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1594, 'GHNM1054', 'AMPL MRPT', 'ATK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1595, 'GHNM1055', 'AMPL AMBO', 'ATK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1596, 'GHNM1056', 'AMPL MRPT KC', 'ATK', '0', '7500', '0', '7500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PK'),
(1597, 'GHNM1057', 'IQRO JZ AMMA', 'BUKU', '0', '13000', '0', '13000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1598, 'GHNM1058', 'IQRO KCL', 'BUKU', '0', '6000', '0', '6000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1599, '5564552', 'PNTUN SHALAT', 'BUKU', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1600, '5564553', 'TRJM JZ AMMA', 'BUKU', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1601, 'GHNM1059', 'DGT TSB 2026', 'AKSESORIS', '0', '37500', '0', '37500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1602, '1054', 'TSBH DGT SXH5136', 'AKSESORIS', '0', '15000', '0', '15000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1603, 'GHNM1060', 'STAND BK UNI', 'ATK', '0', '28000', '0', '28000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1604, 'GHNM1061', 'MJA UJIAN KRKTER', 'ATK', '0', '18000', '0', '18000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1605, '1534', 'MJA  UJ KRK BSR', 'ATK', '0', '40000', '0', '40000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1606, '1684', 'SNTER ALK', 'ATK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1PCS'),
(1607, 'GHNM1062', 'KRT HVS CPYPR', 'ATK', '0', '45000', '0', '45000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'F4'),
(1608, 'GHNM1063', 'KRT HVS SIDU ', 'ATK', '0', '48000', '0', '48000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'F4'),
(1609, 'GHNM1064', 'KRT HVS MAXI', 'ATK', '0', '40000', '0', '40000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'F4'),
(1610, 'GHNM1065', 'KRT HVS MAXI', 'ATK', '0', '37000', '0', '37000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', 'A4'),
(1611, 'GHNM1066', 'CHOCHO GMES', 'MAKANAN', '0', '7000', '0', '7000', '', '2022-06-10 12:18:17', 'admin', '40G'),
(1612, 'GHNM1067', 'CHOCHO CKVN', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '40G'),
(1613, 'GHNM1068', 'CHOCHO JOY ', 'MAKANAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '20G'),
(1614, 'GHNM1069', 'NYAM2 BBP CK', 'MAKANAN', '0', '4000', '0', '4000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '18G'),
(1615, 'GHNM1070', 'NYAM2 BBP STR', 'MAKANAN', '0', '4000', '0', '4000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '18G'),
(1616, 'GHNM1071', 'YANYAN MJ ', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '30G'),
(1617, 'GHNM1072', 'CHO2 SNK CKVN', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '15G'),
(1618, 'GHNM1073', 'NBATI PCH YGT', 'MAKANAN', '0', '2000', '0', '2000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '46G'),
(1619, 'GHNM1074', 'PRM BLST CHO', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '125G'),
(1620, 'GHNM1075', 'PRM BLST NPO', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '125G'),
(1621, 'GHNM1076', 'MG SANIA RF', 'SEMBAKO', '0', '26000', '0', '26000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1L'),
(1622, 'GHNM1077', 'MG SIIP RF', 'SEMBAKO', '0', '42000', '0', '42000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '1800L'),
(1623, 'GHNM1078', 'MG SUNCO RF', 'SEMBAKO', '0', '50000', '0', '50000', 'Normal', '2022-06-30 09:47:50', 'admin', '2L'),
(1624, 'GHNM1079', 'KRFT ALLIN1', 'SEMBAKO', '0', '17000', '0', '17000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '165G'),
(1625, 'GHNM1080', 'BLUEBND SG', 'SEMBAKO', '0', '13000', '0', '13000', 'Normal', '2022-08-09 11:04:37', 'admin', '200G'),
(1626, 'GHNM1081', 'TOP CFF KMRTG', 'MINSERBUK', '0', '11000', '0', '11000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '30G'),
(1627, 'GHNM1082', 'TORA SSU FCRTG', 'MINSERBUK', '0', '13000', '0', '13000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '31G'),
(1628, 'GHNM1083', 'GOOD DY CPPRTG', 'MINSERBUK', '0', '18000', '0', '18000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '25G'),
(1629, 'GHNM1084', 'SDMN SUJA RTG', 'MINSERBUK', '0', '13000', '0', '13000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '27G'),
(1630, 'GHNM1085', 'SDMN SUJA SPRTG', 'MINSERBUK', '0', '18000', '0', '18000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '20G'),
(1631, 'GHNM1086', 'KRMA BARARI PRM', 'MAKANAN', '0', '25000', '0', '25000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '200G'),
(1632, 'GHNM1087', 'KRMA BRARI PRM', 'MAKANAN', '0', '40000', '0', '40000', 'NORMAL', '2022-04-06 00:00:00', 'Admin', '500G'),
(1634, '5887663', 'KRM BRARI PRM', 'MAKANAN', '0', '50000', '0', '50000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '500G'),
(1635, '5887665', 'KRM BRARI MDU', 'MAKANAN', '0', '25000', '0', '25000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '250G'),
(1636, '9876654', 'SB HJ KURSI', 'BODYCARE', '0', '9300', '0', '9300', 'Normal', '2022-08-04 10:47:39', 'admin', '120G'),
(1637, 'GHNM1088', 'HB ZAITN', 'BODYCARE', '0', '9500', '0', '9500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1638, 'GHNM1089', 'HB HRBRST CCNUT', 'BODYCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '145ML'),
(1639, 'GHNM1090', 'MNYK ZAITN', 'BODYCARE', '0', '16000', '0', '16000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75ML'),
(1640, 'GHNM1091', 'SBN SRH BT', 'BODYCARE', '0', '6500', '0', '6500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1641, 'GHNM1092', 'SBN SRH RS', 'BODYCARE', '0', '6500', '0', '6500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1642, 'GHNM1093', 'DTTOL AB ', 'BODYCARE', '0', '13400', '0', '13400', 'Normal', '2022-07-19 09:28:35', 'admin', '45ML'),
(1643, 'GHNM1094', 'MSSGE OIL LV', 'BODYCARE', '0', '27000', '0', '27000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '150ML'),
(1644, 'GHNM1095', 'MSSGE OIL JSM', 'BODYCARE', '0', '27000', '0', '27000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '150ML'),
(1645, 'GHNM1096', 'MNYK ZAITN', 'BODYCARE', '0', '24000', '0', '24000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '150ML'),
(1646, 'GHNM1097', 'HB HRB ZAITN', 'BODYCARE', '0', '17500', '0', '17500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '145ML'),
(1647, 'GHNM1098', 'HB PRB ZAITN ', 'BODYCARE', '0', '14500', '0', '14500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '220ML'),
(1648, 'GHNM1099', 'HB ZHNZUI MYR', 'BODYCARE', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '210ML'),
(1649, 'GHNM1100', 'HB MARN APLE', 'BODYCARE', '0', '8500', '0', '8500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190ML'),
(1650, 'GHNM1101', 'HB MARN MLBR', 'BODYCARE', '0', '8000', '0', '8000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190ML'),
(1651, 'GHNM1102', 'HB MARN SPF30', 'BODYCARE', '0', '15500', '0', '15500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190ML'),
(1652, 'GHNM1103', 'HB MARN AVCD', 'BODYCARE', '0', '8500', '0', '8500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190ML'),
(1653, 'GHNM1104', 'HB CITRA SKR', 'BODYCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '120ML'),
(1654, 'GHNM1105', 'HB CITRA PRL', 'BODYCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '120ML'),
(1655, 'GHNM1106', 'HB CITRA AVCD', 'BODYCARE', '0', '14700', '0', '14700', 'Normal', '2022-08-24 08:44:08', 'admin', '120ML'),
(1656, 'GHNM1107', 'HB CITRA BNGK', 'BODYCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '120ML'),
(1657, 'GHNM1108', 'HB CITRA BNG', 'BODYCARE', '0', '24000', '0', '24000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '230ML'),
(1658, 'GHNM1109', 'HB CITRA GLDN', 'BODYCARE', '0', '24600', '0', '24600', 'Normal', '2022-06-10 12:42:23', 'admin', '230ML'),
(1659, 'GHNM1110', 'HB CITRA SKR B', 'BODYCARE', '0', '24500', '0', '24500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '230ML'),
(1660, 'GHNM1111', 'HB CITRA NGHT', 'BODYCARE', '0', '24000', '0', '24000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '230ML'),
(1661, 'GHNM1112', 'HB CITRA PRL B', 'BODYCARE', '0', '20900', '0', '20900', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '230ML'),
(1662, 'GHNM1113', 'HB CITRA BNG B', 'BODYCARE', '0', '28000', '0', '28000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '380ML'),
(1663, 'GHNM1114', 'HB VSLINE PRFC10', 'BODYCARE', '0', '73500', '0', '73500', 'Normal', '2022-08-17 10:04:19', 'admin', '400ML'),
(1664, 'GHNM1115', 'HB SRM NVEA INST', 'BODYCARE', '0', '43000', '0', '43000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '180ML'),
(1665, 'GHNM1116', 'HB SRM NVEA CRPRT', 'BODYCARE', '0', '28000', '0', '28000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '180ML'),
(1666, 'GHNM1117', 'HB CITRA PRL P', 'BODYCARE', '0', '25500', '0', '25500', 'Normal', '2022-06-10 14:38:30', 'admin', '380ML'),
(1667, 'GHNM1118', 'HB MARN MILK', 'BODYCARE', '0', '8500', '0', '8500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '185ML'),
(1668, 'GHNM1119', 'HB NVEA RP', 'BODYCARE', '0', '18500', '0', '18500', 'Normal', '2022-06-10 11:56:23', 'admin', '100ML'),
(1669, 'GHNM1120', 'HB NVEA CP', 'BODYCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '70ML'),
(1670, 'GHNM1121', 'HB SHNZ HN', 'BODYCARE', '0', '10500', '0', '10500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1671, 'GHNM1122', 'HB VSLINE HWH', 'BODYCARE', '0', '15500', '0', '15500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1672, 'GHNM1123', 'HB VSLINE HB', 'BODYCARE', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1673, 'GHNM1124', 'HB NVEA RSMTH', 'BODYCARE', '0', '14000', '0', '14000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1674, 'GHNM1125', 'HB VSLINE P10', 'BODYCARE', '0', '26400', '0', '26400', 'Normal', '2022-06-10 12:44:47', 'admin', '100ML'),
(1675, 'GHNM1126', 'HB VSLINE ALOE', 'BODYCARE', '0', '17700', '0', '17700', 'Normal', '2022-06-25 14:42:35', 'admin', '100ML'),
(1676, 'GHNM1127', 'HB VSLINE ADV STR', 'BODYCARE', '0', '20500', '0', '20500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1677, 'GHNM1128', 'HB VSLINE SUN', 'BODYCARE', '0', '23000', '0', '23000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1678, 'GHNM1129', 'HB NVEA SUN', 'BODYCARE', '0', '24500', '0', '24500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1679, 'GHNM1130', 'HB NVEA 48J', 'BODYCARE', '0', '15000', '0', '15000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1680, 'GHNM1131', 'HB VSLINE SFT GL', 'BODYCARE', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1681, 'GHNM1132', 'HB LGLUTA', 'BODYCARE', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '250G'),
(1682, 'GHNM1133', 'SMB AYU PRL', 'BODYCARE', '0', '19000', '0', '19000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90ML'),
(1683, 'GHNM1134', 'KANNA WHT', 'BODYCARE', '0', '9500', '0', '9500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '15G'),
(1684, 'GHNM1135', 'KANNA KRG', 'BODYCARE', '0', '9000', '0', '9000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '15G'),
(1685, 'GHNM1136', 'SBN SRIH EN', 'BODYCARE', '0', '6500', '0', '6500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1686, 'GHNM1137', 'SMB AYU RS', 'BODYCARE', '0', '9000', '0', '9000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90ML'),
(1687, 'GHNM1138', 'MNYK TWON EE', 'BODYCARE', '0', '30000', '0', '30000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1688, 'GHNM1139', 'MNYK TAWON DD', 'BODYCARE', '0', '21500', '0', '21500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1689, 'GHNM1140', 'SB FRES CCMB', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1690, 'GHNM1141', 'SB FRES APPL', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1691, 'GHNM1142', 'SB FRES STR', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1692, 'GHNM1143', 'SB HRMN LMN', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '70G'),
(1693, 'GHNM1144', 'SB HRMN STR', 'BODYCARE', '0', '3000', '0', '3000', '', '2022-07-19 09:28:02', 'admin', '70G'),
(1694, 'GHNM1145', 'SB LRVIA MLK', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1695, 'GHNM1146', 'SB LRVIA AVC', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1696, 'GHNM1147', 'SB LRVIA RS', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1697, 'GHNM1148', 'SB SHNZ KNS', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '85G'),
(1698, 'GHNM1149', 'SB SHNZ MYR', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '85G'),
(1699, 'GHNM1150', 'SB LRVIA HNY', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1700, 'GHNM1151', 'SB LUX RS', 'BODYCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '3PCS'),
(1701, 'GHNM1152', 'SB DTTL ORI', 'BODYCARE', '0', '28500', '0', '28500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '4PCS'),
(1702, 'GHNM1153', 'SB DTTL ACT', 'BODYCARE', '0', '29000', '0', '29000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '5PCS'),
(1703, 'GHNM1154', 'SB DTTL ORI 5', 'BODYCARE', '0', '28500', '0', '28500', 'Normal', '2022-06-25 14:20:52', 'admin', '65G'),
(1704, 'GHNM1155', 'SB GIV HJ TN', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1705, 'GHNM1156', 'SB GIV GT', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1706, 'GHNM1157', 'SB GIV RS', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1707, 'GHNM1158', 'SB GIV BRRY', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1708, 'GHNM1159', 'SB GIV LLY', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1709, 'GHNM1160', 'SB GIV HJB SFRN', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1710, 'GHNM1161', 'SB GIV WHT PPY', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1711, 'GHNM1162', 'SB GIV WHT LMN', 'BODYCARE', '0', '2300', '0', '2300', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1712, 'GHNM1163', 'SB DOVE MLK', 'BODYCARE', '0', '6500', '0', '6500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1713, 'GHNM1164', 'SB DOVE PNK', 'BODYCARE', '0', '6500', '0', '6500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1714, 'GHNM1165', 'SB ZEN SNDWD', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1715, 'GHNM1166', 'SB ZEN SSLT', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1716, 'GHNM1167', 'SB CMY CLS', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1717, 'GHNM1168', 'SB CMY CHC', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1718, 'GHNM1169', 'SB CMY NTR', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1719, 'GHNM1170', 'SB NVO ACT', 'BODYCARE', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '110G'),
(1720, 'GHNM1171', 'SB NVO COOL', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '110G'),
(1721, 'GHNM1172', 'SB NVO PNK', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1722, 'GHNM1173', 'SB NVO LMN', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1723, 'GHNM1174', 'SB NVO MLK', 'BODYCARE', '0', '2200', '0', '2200', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1724, 'GHNM1175', 'SB NVO HJ', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1725, 'GHNM1176', 'SB NVO MRH', 'BODYCARE', '0', '2500', '0', '2500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '76G'),
(1726, 'GHNM1177', 'SB DTTL COOL', 'BODYCARE', '0', '5700', '0', '5700', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1727, 'GHNM1178', 'SB DTTL INV', 'BODYCARE', '0', '5700', '0', '5700', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1728, 'GHNM1179', 'SB DTTL ORI', 'BODYCARE', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1729, 'GHNM1180', 'SB DTTL SKN', 'BODYCARE', '0', '5700', '0', '5700', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1730, 'GHNM1181', 'SB DTTL FRS', 'BODYCARE', '0', '5700', '0', '5700', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1731, 'GHNM1182', 'SB DTTL FRS KC', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60G'),
(1732, 'GHNM1183', 'SB DTTL REE KC', 'BODYCARE', '0', '4000', '0', '4000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60G'),
(1733, 'GHNM1184', 'SB DTTL CL KC', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60G'),
(1734, 'GHNM1185', 'SB CTRA PRL', 'BODYCARE', '0', '3500', '0', '3500', 'Normal', '2022-05-31 12:08:14', 'admin', '70G'),
(1735, 'GHNM1186', 'SB CTRA BNK', 'BODYCARE', '0', '3500', '0', '3500', 'Normal', '2022-05-31 12:11:25', 'admin', '70G'),
(1736, 'GHNM1187', 'SB MRNA APPL', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '10G'),
(1737, 'GHNM1188', 'SB MRNA MLK', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '10G'),
(1738, 'GHNM1189', 'SB CLDIA MWR', 'BODYCARE', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '10G'),
(1739, 'GHNM1190', 'SB MYBY PNK', 'BODYCARE', '0', '3600', '0', '3600', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1740, 'GHNM1191', 'SB MYBY FRS', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1741, 'GHNM1192', 'SB MYBY OAT', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1742, 'GHNM1193', 'SB PRB DBRGH', 'BODYCARE', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1743, 'GHNM1194', 'SB PRB PTH', 'BODYCARE', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1744, 'GHNM1195', 'SB JHNS MLK', 'BODYCARE', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1745, 'GHNM1196', 'SB JHNS BR', 'BODYCARE', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1746, 'GHNM1197', 'SB CSSN BLB', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1747, 'GHNM1198', 'SB CSSN ALM', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1748, 'GHNM1199', 'SB CSSN MLK', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1749, 'GHNM1200', 'SB LFBY LMN', 'BODYCARE', '0', '4000', '0', '4000', 'Normal', '2022-05-31 12:09:46', 'admin', '75G'),
(1750, 'GHNM1201', 'SB LFBY CL', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1751, 'GHNM1202', 'SB LFBY MTC', 'BODYCARE', '0', '4000', '0', '4000', 'Normal', '2022-05-31 12:10:29', 'admin', '75G'),
(1752, 'GHNM1203', 'SB LFBY LMN B', 'BODYCARE', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '110G'),
(1753, 'GHNM1204', 'SB LFBY TTL', 'BODYCARE', '0', '5700', '0', '5700', 'Normal', '2022-05-31 12:12:02', 'admin', '110G'),
(1754, 'GHNM1205', 'SB LUX MDY AYN', 'BODYCARE', '0', '3600', '0', '3600', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1755, 'GHNM1206', 'SB LUX RS', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1756, 'GHNM1207', 'SB LUX ORC', 'BODYCARE', '0', '4800', '0', '4800', 'Normal', '2022-08-04 10:23:17', 'admin', '80G'),
(1757, 'GHNM1208', 'SB LUX YZU', 'BODYCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1758, 'GHNM1209', 'SB LUX CMEL', 'BODYCARE', '0', '4500', '0', '4500', 'Normal', '2022-06-10 11:51:57', 'admin', '80G'),
(1759, 'GHNM1210', 'SB LFBY LMN PK', 'BODYCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '4PCS'),
(1760, 'GHNM1211', 'SB LFBY TTL PK', 'BODYCARE', '0', '16700', '0', '16700', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '4PCS'),
(1761, 'GHNM1212', 'SB LFBY MLD PK', 'BODYCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '4PCS'),
(1762, 'GHNM1213', 'SB JF ANACN', 'BODYCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90G'),
(1763, 'GHNM1214', 'SB JF ANACN KC', 'BODYCARE', '0', '10000', '0', '10000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1764, 'GHNM1215', 'SB JF ACN SPT', 'BODYCARE', '0', '14000', '0', '14000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1765, 'GHNM1216', 'SB LEIVY GT', 'BODYCARE', '0', '10200', '0', '10200', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '85G'),
(1766, 'GHNM1217', 'SB PAQUITO', 'BODYCARE', '0', '16000', '0', '16000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1767, 'GHNM1218', 'SB PPY PQTO', 'BODYCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '135G'),
(1768, 'GHNM1219', 'SB PPYA REN', 'BODYCARE', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '135G'),
(1769, 'GHNM1220', 'SB ZWTSAL RH', 'BODYCARE', '0', '5000', '0', '5000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '70G'),
(1770, 'GHNM1221', 'SB ZWTSAL CLS', 'BODYCARE', '0', '5000', '0', '5000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '70G'),
(1771, 'GHNM1222', 'HB NTR E SEED', 'BODYCARE', '0', '13600', '0', '13600', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1772, 'GHNM1223', 'HB NTR E PNK', 'BODYCARE', '0', '15000', '0', '15000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1773, 'GHNM1224', 'SB HRB BRS PTH', 'BODYCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1774, 'GHNM1225', 'SB ZAITN ', 'BODYCARE', '0', '15000', '750', '14250', 'PROMO', '2022-04-10 00:00:00', 'Admin', '80G'),
(1775, 'GHNM1226', 'SB TWON', 'BODYCARE', '0', '8000', '0', '8000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1776, 'GHNM1227', 'SB HRMN ANG', 'BODYCARE', '0', '3000', '0', '3000', '', '2022-07-19 09:27:25', 'admin', '70G'),
(1777, 'GHNM1228', 'SB HOLLY HJ', 'BODYCARE', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '40G'),
(1778, 'GHNM1229', 'SB HOLLY HJ KRD', 'BODYCARE', '0', '5000', '0', '5000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60G'),
(1779, 'GHNM1230', 'SMB AYU CLR WHT', 'BODYCARE', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90ML'),
(1780, 'GHNM1231', 'PST KDMO STR', 'PERMANDI', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '45G'),
(1781, 'GHNM1232', 'PST SASHA ', 'PERMANDI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1782, 'GHNM1233', 'PST ENZIM MLD', 'PERMANDI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '63G'),
(1783, 'GHNM1234', 'PST ENZIM MNT', 'PERMANDI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '63G'),
(1784, 'GHNM1235', 'PST ENZM MLD', 'PERMANDI', '0', '38000', '0', '38000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '124G'),
(1785, 'GHNM1236', 'PST ENZM CLSC', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '124G'),
(1786, 'GHNM1237', 'PST SNSDYN WHT', 'PERMANDI', '0', '39000', '0', '39000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1787, 'GHNM1238', 'PST SNSDYN COOL', 'PERMANDI', '0', '32000', '0', '32000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1788, 'GHNM1239', 'PST SNSDYN ORI', 'PERMANDI', '0', '31000', '0', '31000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1789, 'GHNM1240', 'PST SNSDYN REPR', 'PERMANDI', '0', '41000', '0', '41000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1790, 'GHNM1241', 'PST SNSDYN MLT', 'PERMANDI', '0', '47000', '0', '47000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '160G'),
(1791, 'GHNM1242', 'PST SNSDYN FRSH', 'PERMANDI', '0', '43000', '0', '43000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1792, 'GHNM1243', 'PST CIPTA FRS', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190G'),
(1793, 'GHNM1244', 'PST CIPTA ORI', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190G'),
(1794, 'GHNM1245', 'PST CIPTA WHT', 'PERMANDI', '0', '12000', '0', '12000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '190G'),
(1795, 'GHNM1246', 'PST CIPTA OR', 'PERMANDI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '120G'),
(1796, 'GHNM1247', 'PST CIPTA FRS', 'PERMANDI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '120G'),
(1797, 'GHNM1248', 'PST CIPTA MNT', 'PERMANDI', '0', '7000', '0', '7000', 'Normal', '2022-07-19 09:25:15', 'admin', '75G'),
(1798, 'GHNM1249', 'PST PEPS MRH', 'PERMANDI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '225G'),
(1799, 'GHNM1250', 'PST PEPS MR', 'PERMANDI', '0', '5800', '0', '5800', 'Normal', '2022-08-04 11:24:08', 'admin', '75G'),
(1800, 'GHNM1251', 'PST PEPS SWK', 'PERMANDI', '0', '7500', '0', '7500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1801, 'GHNM1252', 'PST PEPS MR K', 'PERMANDI', '0', '3000', '0', '3000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '25G'),
(1802, 'GHNM1253', 'PST CLS UP B', 'PERMANDI', '0', '18500', '0', '18500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '160G'),
(1803, 'GHNM1254', 'PST CLS UP K', 'PERMANDI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '65G'),
(1804, 'GHNM1255', 'PST CIPTA FRS', 'PERMANDI', '0', '2000', '0', '2000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '30G'),
(1805, 'GHNM1256', 'PST SYSTEM ', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1806, 'GHNM1257', 'PST DEE ORG', 'PERMANDI', '0', '8000', '0', '8000', 'Normal', '2022-06-10 11:58:58', 'admin', '50G'),
(1807, 'GHNM1258', 'PST DEE STR', 'PERMANDI', '0', '8000', '0', '8000', 'Normal', '2022-06-10 11:59:56', 'admin', '50G'),
(1808, 'GHNM1259', 'PST CSSN JRK', 'PERMANDI', '0', '5500', '0', '5500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '45G'),
(1809, 'GHNM1260', 'HB LRVIA HNY', 'PERMANDI', '0', '21600', '0', '21600', 'Normal', '2022-06-10 11:55:55', 'admin', '200ML'),
(1810, 'GHNM1261', 'HB LRVIA AVC', 'PERMANDI', '0', '21500', '0', '21500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1811, 'GHNM1262', 'HB LRVIA SS', 'PERMANDI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1812, 'GHNM1263', 'HB NTR E HJ', 'PERMANDI', '0', '27000', '0', '27000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '245ML'),
(1813, 'GHNM1264', 'HB NTR PNK', 'PERMANDI', '0', '31000', '0', '31000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '245ML'),
(1814, 'GHNM1265', 'HB VSLIN MNT', 'PERMANDI', '0', '28000', '0', '28000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1815, 'GHNM1266', 'BD MTU CLSSC', 'PERBAYI', '0', '7500', '0', '7500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1816, 'GHNM1267', 'BD ZW CLSS', 'PERBAYI', '0', '28000', '0', '28000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300G'),
(1817, 'GHNM1268', 'BD KDMO CHM', 'PERBAYI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200G'),
(1818, 'GHNM1269', 'LIQ CLN CSSN ', 'PERBAYI', '0', '28000', '0', '28000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300ML'),
(1819, 'GHNM1270', 'BTH ZWT RH', 'PERBAYI', '0', '36000', '0', '36000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '450ML'),
(1820, 'GHNM1271', 'LIQ CLN SWTY', 'PERBAYI', '0', '25000', '0', '25000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '450ML'),
(1821, 'GHNM1272', 'BTH ZWT TLN', 'PERBAYI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '250ML'),
(1822, 'GHNM1273', 'BD CLDINE ORI', 'PERBAYI', '0', '11400', '0', '11400', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60G'),
(1823, 'GHNM1274', 'BD HRCYN BBY', 'PERBAYI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1824, 'GHNM1275', 'BD HRCYN ', 'PERBAYI', '0', '15800', '0', '15800', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '85G'),
(1825, 'GHNM1276', 'CLDINE LOT UNG', 'PERBAYI', '0', '21000', '0', '21000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '95ML'),
(1826, 'GHNM1277', 'SFFEL LT BNG', 'PERBAYI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80G'),
(1827, 'GHNM1278', 'SFFEL SPR GRN', 'PERBAYI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '80ML'),
(1828, 'GHNM1279', 'AUTN SPR RFRSH', 'PERBAYI', '0', '15600', '0', '15600', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '138G'),
(1829, 'GHNM1280', 'LIQSP PG HJ', 'PERBAYI', '0', '23200', '0', '23200', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1830, 'GHNM1281', 'AUTN ANK APL', 'PERBAYI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '12L'),
(1831, 'GHNM1282', 'AUTN NGHT LVN', 'PERBAYI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '15L'),
(1832, 'GHNM1283', 'CT BD WINA', 'PERBAYI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '1PCS'),
(1833, 'GHNM1284', 'CT BD SLCT', 'PERBAYI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '1PCS'),
(1834, 'GHNM1285', 'CT BD CSSN', 'PERBAYI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50S'),
(1835, 'GHNM1286', 'CT BD PIGEON', 'PERBAYI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100S'),
(1836, 'GHNM1287', 'CT BD GMED ', 'PERBAYI', '0', '8000', '0', '8000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200S'),
(1837, 'GHNM1288', 'CT BD GMED K', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200S'),
(1838, 'GHNM1289', 'BTH ZWT ALV', 'PERBAYI', '0', '35000', '0', '35000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300ML'),
(1839, 'GHNM1290', 'BTH ZWT CLSSC', 'PERBAYI', '0', '32000', '0', '32000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300ML'),
(1840, 'GHNM1291', 'BTH ZWT TLN', 'PERBAYI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1841, 'GHNM1292', 'BD ZWT ALV', 'PERBAYI', '0', '8000', '0', '8000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1842, 'GHNM1293', 'BD ZWT CLSSC', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1843, 'GHNM1294', 'SH ZWTS ALV', 'PERBAYI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '250ML'),
(1844, 'GHNM1295', 'BTH ZWT ALV K', 'PERBAYI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1845, 'GHNM1296', 'CLOGNE ZWT ALV', 'PERBAYI', '0', '19000', '0', '19000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1846, 'GHNM1297', 'SH CSSN AVCD', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1847, 'GHNM1298', 'SH CSSN ALM', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1848, 'GHNM1299', 'SH CSSN ALMD', 'PERBAYI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1849, 'GHNM1300', 'HL CSSN ALM', 'PERBAYI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1850, 'GHNM1301', 'HL CSSN CCN', 'PERBAYI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1851, 'GHNM1302', 'HL CSSN CCNUT', 'PERBAYI', '0', '26500', '0', '26500', 'Normal', '2022-06-25 14:43:15', 'admin', '100ML'),
(1852, 'GHNM1303', 'HL CSSN CNDL', 'PERBAYI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1853, 'GHNM1304', 'HL CSSN AVCDO', 'PERBAYI', '0', '20000', '0', '20000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1854, 'GHNM1305', 'HL CSSN ALMHNY', 'PERBAYI', '0', '21000', '0', '21000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1855, 'GHNM1306', 'HS LFBOUY ', 'PERBAYI', '0', '14000', '9000', '5000', 'PROMO', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1856, 'GHNM1307', 'BW KDMO ORG', 'PERBAYI', '0', '17000', '0', '17000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '250ML'),
(1857, 'GHNM1308', 'SH KDOMO STR', 'PERBAYI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1858, 'GHNM1309', 'SH MYBBY HNY', 'PERBAYI', '0', '16500', '0', '16500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1859, 'GHNM1310', 'SH MYBBY AVC', 'PERBAYI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1860, 'GHNM1311', 'BW MYBBY SS', 'PERBAYI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '180ML'),
(1861, 'GHNM1312', 'BW MYBBY CF', 'PERBAYI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '180ML'),
(1862, 'GHNM1313', 'SH ZWT NN', 'PERBAYI', '0', '14900', '0', '14900', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '180ML'),
(1863, 'GHNM1314', 'SH ZWT CF', 'PERBAYI', '0', '21000', '0', '21000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '180ML'),
(1864, 'GHNM1315', 'BD MTU FLR', 'PERBAYI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1865, 'GHNM1316', 'BD MTU CLSSC', 'PERBAYI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1866, 'GHNM1317', 'BD KDMO RM', 'PERBAYI', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1867, 'GHNM1318', 'BD KDMO CHA', 'PERBAYI', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1868, 'GHNM1319', 'BD JHNSON BLS', 'PERBAYI', '0', '13000', '0', '13000', 'Normal', '2022-06-10 11:55:23', 'admin', '75G'),
(1869, 'GHNM1320', 'BD JHNSON PTH', 'PERBAYI', '0', '8000', '0', '8000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1870, 'GHNM1321', 'BD JHNSON BDTM', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1871, 'GHNM1322', 'BD JHNSON MR', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1872, 'GHNM1323', 'BD MYBBY BR', 'PERBAYI', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1873, 'GHNM1324', 'BD CSSN MLD', 'PERBAYI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(1874, 'GHNM1325', 'BD CSSN BRRS', 'PERBAYI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '75G'),
(1875, 'GHNM1326', 'BD CSSN VN', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '150G'),
(1876, 'GHNM1327', 'BD CSSN BRRS JM', 'PERBAYI', '0', '18500', '0', '18500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '500G'),
(1877, 'GHNM1328', 'SH ESKLN MN', 'PERBAYI', '0', '3500', '0', '3500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '45ML'),
(1878, 'GHNM1329', 'BBY CR ZWT', 'PERBAYI', '0', '18000', '0', '18000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1879, 'GHNM1330', 'MYBBY HS ALV', 'PERBAYI', '0', '8800', '0', '8800', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1880, 'GHNM1331', 'CLDINE GEL ', 'PERBAYI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1881, 'GHNM1332', 'CLDINE BBY LIQSP', 'PERBAYI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '110ML'),
(1882, 'GHNM1333', 'MYBBY LOT TLN 8', 'PERBAYI', '0', '16500', '0', '16500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1883, 'GHNM1334', 'BD MYBBY SF', 'PERBAYI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1884, 'GHNM1335', 'MTU CLG SP', 'PERBAYI', '0', '7500', '0', '7500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1885, 'GHNM1336', 'MTU CLG FG', 'PERBAYI', '0', '7500', '0', '7500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1886, 'GHNM1337', 'BD JHNSON MR ', 'PERBAYI', '0', '15500', '0', '15500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300G'),
(1887, 'GHNM1338', 'BD JHNSON PTH', 'PERBAYI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300G'),
(1888, 'GHNM1339', 'BD JHNSON BED', 'PERBAYI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300G'),
(1889, 'GHNM1340', 'BD JHNSON BLS', 'PERBAYI', '0', '13000', '0', '13000', 'Normal', '2022-06-10 11:55:23', 'admin', '300G'),
(1890, 'GHNM1341', 'BD JHNSON BLS J', 'PERBAYI', '0', '23500', '0', '23500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '500G'),
(1891, 'GHNM1342', 'BD MYBBY FF J', 'PERBAYI', '0', '19500', '0', '19500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '500G'),
(1892, 'GHNM1343', 'BD MYBBY FF S', 'PERBAYI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '250G'),
(1893, 'GHNM1344', 'BD MYBBY FF K', 'PERBAYI', '0', '8000', '0', '8000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100G'),
(1894, 'GHNM1345', 'BD JHNSON BLS', 'PERBAYI', '0', '13000', '0', '13000', 'Normal', '2022-06-10 11:55:23', 'admin', '150G'),
(1895, 'GHNM1346', 'BD CSSN SKR', 'PERBAYI', '0', '18000', '0', '18000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '500G'),
(1896, 'GHNM1347', 'BD KDOMO BR', 'PERBAYI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300G'),
(1897, 'GHNM1348', 'BD KDOMO UNG', 'PERBAYI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '300G'),
(1898, 'GHNM1349', 'M TELN LANG ', 'PERBAYI', '0', '9800', '0', '9800', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '30ML'),
(1899, 'GHNM1350', 'M TELN LANG K', 'PERBAYI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '15ML'),
(1900, 'GHNM1351', 'M TELN LANG B', 'PERBAYI', '0', '27000', '0', '27000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1901, 'GHNM1352', 'MY BBY TLN LVN', 'PERBAYI', '0', '17000', '0', '17000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1902, 'GHNM1353', 'MY BBY TLN 8', 'PERBAYI', '0', '17000', '0', '17000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1903, 'GHNM1354', 'MY BBY TLN 8', 'PERBAYI', '0', '34500', '0', '34500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '150ML'),
(1904, 'GHNM1355', 'MY BBY TLN 8', 'PERBAYI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '90ML'),
(1905, 'GHNM1356', 'MY BBY TLN 12', 'PERBAYI', '0', '19400', '0', '19400', 'Normal', '2022-07-19 18:52:33', 'admin', '60ML'),
(1906, 'GHNM1357', 'MY BBY TLN 12', 'PERBAYI', '0', '19400', '0', '19400', 'Normal', '2022-07-19 18:52:33', 'admin', '90ML'),
(1907, 'GHNM1358', 'MYBBY BTH TEA', 'PERBAYI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1908, 'GHNM1359', 'HL MITU ALV', 'PERBAYI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1909, 'GHNM1360', 'SH JOHNSN ORG', 'PERBAYI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1910, 'GHNM1361', 'SH JOHNSN BR', 'PERBAYI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1911, 'GHNM1362', 'SH JOHNSN TOP', 'PERBAYI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1912, 'GHNM1363', 'BBY LOT JHNS BED', 'PERBAYI', '0', '17000', '0', '17000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1913, 'GHNM1364', 'MKP LANG', 'PERBAYI', '0', '38000', '0', '38000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '120ML'),
(1914, 'GHNM1365', 'MKP LANG', 'PERBAYI', '0', '20500', '0', '20500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1915, 'GHNM1366', 'MKP LANG', 'PERBAYI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '30ML'),
(1916, 'GHNM1367', 'MKP LANG', 'PERBAYI', '0', '6500', '0', '6500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '15ML'),
(1917, 'GHNM1368', 'SH JOHNSN PNK', 'PERBAYI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1918, 'GHNM1369', 'JHNSON CLG UNG', 'PERBAYI', '0', '21000', '0', '21000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1919, 'GHNM1370', 'ZWIT TLN NTR', 'PERBAYI', '0', '30000', '0', '30000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1920, 'GHNM1371', 'JHNSON BBY OIL', 'PERBAYI', '0', '10800', '0', '10800', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1921, 'GHNM1372', 'SH JHNSON ORG', 'PERBAYI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1922, 'GHNM1373', 'CSSN OIL MLD', 'PERBAYI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1923, 'GHNM1374', 'CSSN OIL SFT', 'PERBAYI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50ML'),
(1924, 'GHNM1375', 'CSSN OIL SFT S', 'PERBAYI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1925, 'GHNM1376', 'CCSN LOT NB', 'PERBAYI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1926, 'GHNM1377', 'CSSN HB NB', 'PERBAYI', '0', '19600', '0', '19600', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '200ML'),
(1927, 'GHNM1378', 'CSSN CRM NB', 'PERBAYI', '0', '18000', '0', '18000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '50G'),
(1928, 'GHNM1379', 'SH CSSN KDS BR', 'PERBAYI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1929, 'GHNM1380', 'SH CSSN NAUR', 'PERBAYI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1930, 'GHNM1381', 'SH MYBBY SFT', 'PERBAYI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1931, 'GHNM1382', 'SH ESK CNDR', 'PERBAYI', '0', '8300', '0', '8300', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1932, 'GHNM1383', 'M TLN KNCRE', 'PERBAYI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '30ML'),
(1933, 'GHNM1384', 'M TLN KNCRE', 'PERBAYI', '0', '19800', '0', '19800', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1934, 'GHNM1385', 'M STRNELA', 'PERBAYI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1935, 'GHNM1386', 'MKP KNCARE', 'PERBAYI', '0', '18500', '0', '18500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '60ML'),
(1936, 'GHNM1387', 'LSTERNE GRN TEA', 'PERMANDI', '0', '11500', '0', '11500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1937, 'GHNM1388', 'LSTERNE MLT ZR', 'PERMANDI', '0', '11500', '0', '11500', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1938, 'GHNM1389', 'LSTERNE SWK', 'PERMANDI', '0', '10200', '0', '10200', 'NORMAL', '2022-04-10 00:00:00', 'Admin', '100ML'),
(1940, '2255362', 'M RMB TITONI', 'SKINCARE', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40ML'),
(1941, '2553232', 'OTOK WR PM', 'MAKANAN', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(1942, '5255232', 'TERI PSP ORI', 'MAKANAN', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(1943, '5452233', 'MRNING JK', 'MAKANAN', '0', '20000', '0', '20000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '500G'),
(1944, '7844545', 'TERI PSP PD', 'MAKANAN', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(1945, '7855655', 'TRYM KC LRJK', 'MAKANAN', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250G'),
(1946, '8744544', 'TRYMI TP PDS', 'MAKANAN', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(1947, 'GHNM1390', 'STLLA SPR APPL', 'PEWANGI', '0', '20000', '0', '20000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(1948, 'GHNM1391', 'STLLA SPR JSM', 'PEWANGI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(1949, 'GHNM1392', 'STLLA SPR LMN', 'PEWANGI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(1950, 'GHNM1393', 'STLLA SPR APL', 'PEWANGI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1951, 'GHNM1394', 'GLDE SPR PNY', 'PEWANGI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1952, 'GHNM1395', 'GLDE SPR LMN', 'PEWANGI', '0', '15500', '0', '15500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1953, 'GHNM1396', 'GLDE SPR LVN', 'PEWANGI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1954, 'GHNM1397', 'STLLA HM LVN', 'PEWANGI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '350ML'),
(1955, 'GHNM1398', 'STLLA HM SKR', 'PEWANGI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '350ML'),
(1956, 'GHNM1399', 'HIT EXP FRS', 'PEWANGI', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1957, 'GHNM1400', 'HIT BR GRN', 'PEWANGI', '0', '37000', '0', '37000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1958, 'GHNM1401', 'HIT BR LLY', 'PEWANGI', '0', '29000', '0', '29000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1959, 'GHNM1402', 'HIT BR ORG', 'PEWANGI', '0', '29000', '0', '29000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1960, 'GHNM1403', 'BYGN SPR RSE', 'PEWANGI', '0', '36000', '0', '36000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1961, 'GHNM1404', 'BYGN SPR BLS', 'PEWANGI', '0', '36000', '0', '36000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1962, 'GHNM1405', 'BYGN SPR CHRY', 'PEWANGI', '0', '36000', '0', '36000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1963, 'GHNM1406', 'BYGN SPR FLW', 'PEWANGI', '0', '31000', '0', '31000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1964, 'GHNM1407', 'BYGN SPR CTRS', 'PEWANGI', '0', '38500', '0', '38500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1965, 'GHNM1408', 'FRCEMGC EUCLYP', 'PEWANGI', '0', '32000', '0', '32000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600ML'),
(1966, 'GHNM1409', 'TTL ALMEERA', 'DETERGEN', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900G'),
(1967, 'GHNM1410', 'RINS CLSC', 'DETERGEN', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600G'),
(1968, 'GHNM1411', 'TTL ALMR SPRT', 'DETERGEN', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(1969, 'GHNM1412', 'RINS RSE', 'DETERGEN', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '770G'),
(1970, 'GHNM1413', 'SPR PEL GLD', 'PEWANGI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '770ML'),
(1971, 'GHNM1414', 'SPR PEL LUXRY', 'PEWANGI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '700ML'),
(1972, 'GHNM1415', 'SO KLN LT LMN', 'PEWANGI', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '345ML'),
(1973, 'GHNM1416', 'SO KLN LT LVN', 'PEWANGI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(1974, 'GHNM1417', 'RPIKA CLBLU', 'PEWANGI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1975, 'GHNM1418', 'RPIKA EXC PRP', 'PEWANGI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1976, 'GHNM1419', 'RPIKA LUX GLD', 'PEWANGI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1977, 'GHNM1420', 'RPIKA PINK', 'PEWANGI', '0', '4500', '0', '4500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1978, 'GHNM1421', 'SPR PEL LV BLS', 'PEWANGI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '770ML'),
(1979, 'GHNM1422', 'KIT WSH CAR', 'PEWANGI', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(1980, 'GHNM1423', 'CRR SH MBL', 'PEWANGI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(1981, 'GHNM1424', 'CRR PNG BAN', 'PEWANGI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1982, 'GHNM1425', 'DTTL HW ENR RF', 'PEWANGI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(1983, 'GHNM1426', 'DTTL HW ORI RF', 'PEWANGI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(1984, 'GHNM1427', 'BYGN SPR CTR', 'PEWANGI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1985, 'GHNM1428', 'BYGN SPR LVN', 'PEWANGI', '0', '15900', '0', '15900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1986, 'GHNM1429', 'BYGN SPR FG', 'PEWANGI', '0', '15900', '0', '15900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1987, 'GHNM1430', 'HIT ORG KCL', 'PEWANGI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1988, 'GHNM1431', 'HIT LLY KCL', 'PEWANGI', '0', '15600', '0', '15600', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1989, 'GHNM1432', 'HIT BLMTE KCL', 'PEWANGI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1990, 'GHNM1433', 'VAPE SPR ORG', 'PEWANGI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1991, 'GHNM1434', 'VAPE SPR PRP', 'PEWANGI', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(1992, 'GHNM1435', 'KSPRY RSE', 'PEWANGI', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '21ML'),
(1993, 'GHNM1436', 'KSPRY GLD', 'PEWANGI', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '11ML'),
(1994, 'GHNM1437', 'RPKA BT PRP', 'PEWANGI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1995, 'GHNM1438', 'RPIKA BT CB', 'PEWANGI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(1996, 'GHNM1439', 'CLING BT APL', 'PEWANGI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '440ML'),
(1997, 'GHNM1440', 'CLING BT OCN', 'PEWANGI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '440ML'),
(1998, 'GHNM1441', 'PORSTX BR', 'PEWANGI', '0', '20000', '0', '20000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1000ML'),
(1999, 'GHNM1442', 'VXAL BT KH', 'PEWANGI', '0', '20000', '0', '20000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '780ML'),
(2000, 'GHNM1443', 'VXAL BT EK', 'PEWANGI', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '470ML'),
(2001, 'GHNM1444', 'WPC ANT KRK', 'PEWANGI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2002, 'GHNM1445', 'PORSTX BR KCL', 'PEWANGI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '500ML'),
(2003, 'GHNM1446', 'VXAL BT KH KC', 'PEWANGI', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '470ML'),
(2004, 'GHNM1447', 'SO KLN LT LVN', 'PEWANGI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900ML'),
(2005, 'GHNM1448', 'SO KLIN LT APPL', 'PEWANGI', '0', '7500', '0', '7500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2006, 'GHNM1449', 'SO KLIN LT LMN', 'PEWANGI', '0', '7500', '0', '7500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2007, 'GHNM1450', 'VNISH RF WHT', 'PEWANGI', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '425ML'),
(2008, 'GHNM1451', 'VNISH RF PNK', 'PEWANGI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150ML'),
(2009, 'GHNM1452', 'EKNOMI LMN LIQ', 'DETERGEN', '0', '11500', '0', '11500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '780ML'),
(2010, 'GHNM1453', 'MMA LMN RF', 'DETERGEN', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '780ML'),
(2011, 'GHNM1454', 'MMA LIME', 'DETERGEN', '0', '14500', '0', '14500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '780ML'),
(2012, 'GHNM1455', 'MMA LM DM RF', 'DETERGEN', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2013, 'GHNM1456', 'MMA LIME GTHBTS', 'DETERGEN', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2014, 'GHNM1457', 'MMA LIME SLT', 'DETERGEN', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2015, 'GHNM1458', 'SNLIGHT RF', 'DETERGEN', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '210ML'),
(2016, 'GHNM1459', 'MMA LME HBTS RF', 'DETERGEN', '0', '2000', '0', '2000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '115ML'),
(2017, 'GHNM1460', 'SNLIGHT HBTS RF', 'DETERGEN', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '210ML'),
(2018, 'GHNM1461', 'SNLIGHT ANTB  RF', 'DETERGEN', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '210ML'),
(2019, 'GHNM1462', 'SNLIGHT BT JN', 'DETERGEN', '0', '23000', '0', '23000', 'Normal', '2022-06-04 08:38:10', 'admin', '400ML'),
(2020, 'GHNM1463', 'VNSH RF PNK', 'DETERGEN', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '425ML'),
(2021, 'GHNM1464', 'RNSO CLSSC', 'DETERGEN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '460G'),
(2022, 'GHNM1465', 'RNSO CLSSC JM', 'DETERGEN', '0', '37000', '0', '37000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1.4KG'),
(2023, 'GHNM1466', 'DAIA PINK ', 'DETERGEN', '0', '9400', '0', '9400', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '530G'),
(2024, 'GHNM1467', 'SO KLN LVN', 'DETERGEN', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '490G'),
(2025, 'GHNM1468', 'SO KLN PNK', 'DETERGEN', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '490G'),
(2026, 'GHNM1469', 'SO KLN BRZ', 'DETERGEN', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '847G'),
(2027, 'GHNM1470', 'RINS ROS RF', 'DETERGEN', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '750ML'),
(2028, 'GHNM1471', 'RNSO GLD RF', 'DETERGEN', '0', '19500', '0', '19500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '750ML'),
(2029, 'GHNM1472', 'SO KLN PW PRP', 'DETERGEN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2030, 'GHNM1473', 'SO KLN LIQ PRP', 'DETERGEN', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '750ML'),
(2031, 'GHNM1474', 'SO KLN LIQ BL', 'DETERGEN', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '750ML'),
(2032, 'GHNM1475', 'SO KLN PW PNK', 'DETERGEN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2033, 'GHNM1476', 'SO KLN PW BL', 'DETERGEN', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2034, 'GHNM1477', 'GLDE SPR OCESC', 'PEWANGI', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2035, 'GHNM1478', 'GLDE SPR LVN', 'PEWANGI', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2036, 'GHNM1479', 'STLL HM ORG', 'PEWANGI', '0', '27500', '0', '27500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2037, 'GHNM1480', 'STLL HM APP', 'PEWANGI', '0', '27500', '0', '27500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2038, 'GHNM1481', 'GLDE SPR PNY', 'PEWANGI', '0', '29200', '0', '29200', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2039, 'GHNM1482', 'STLL GRN BOX', 'PEWANGI', '0', '61000', '0', '61000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1PK'),
(2040, 'GHNM1483', 'SH SLSUN BL ', 'PERMANDI', '0', '38000', '0', '38000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120ML'),
(2041, 'GHNM1484', 'SH SLSUN YLLW', 'PERMANDI', '0', '37000', '0', '37000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120ML'),
(2042, 'GHNM1485', 'SH LREAL PNK', 'PERMANDI', '0', '36000', '0', '36000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '165ML'),
(2043, 'GHNM1486', 'SH LREAL MRH ', 'PERMANDI', '0', '35500', '0', '35500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2044, 'GHNM1487', 'SB DTTL RF SKN', 'PERMANDI', '0', '33500', '0', '33500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2045, 'GHNM1488', 'SB DTTL RF FRSH', 'PERMANDI', '0', '34000', '0', '34000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2046, 'GHNM1489', 'SH CLEAR MNT', 'PERMANDI', '0', '48000', '0', '48000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300ML'),
(2047, 'GHNM1490', 'SH EMRN BLCK', 'PERMANDI', '0', '14500', '0', '14500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2048, 'GHNM1491', 'SH EMR HJB FRS', 'PERMANDI', '0', '15500', '0', '15500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2049, 'GHNM1492', 'DWNY ALLR ', 'PEWANGI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2050, 'GHNM1493', 'DWNY DRNG', 'PEWANGI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2051, 'GHNM1494', 'DWNY MYST', 'PEWANGI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2052, 'GHNM1495', 'RNS RF CLS', 'DETERGEN', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2053, 'GHNM1496', 'SO KLN SKR', 'DETERGEN', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2054, 'GHNM1497', 'SO KLN PNK', 'DETERGEN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2055, 'GHNM1498', 'SO KLN BLS', 'DETERGEN', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2056, 'GHNM1499', 'SO KLN WBRG', 'DETERGEN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2057, 'GHNM1500', 'VNISH RF PNK', 'PEWANGI', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2058, 'GHNM1501', 'PMTIH LMN', 'PEWANGI', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2059, 'GHNM1502', 'PMTIH LMN B', 'PEWANGI', '0', '3500', '0', '3500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2060, 'GHNM1503', 'PRCLIN PNK BT', 'DETERGEN', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '180ML'),
(2061, 'GHNM1504', 'WNGS BR ', 'DETERGEN', '0', '2000', '0', '2000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '500WB'),
(2062, 'GHNM1505', 'EKNOMI UNG', 'DETERGEN', '0', '1500', '0', '1500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '350K'),
(2063, 'GHNM1506', 'EKNOMI LMN ', 'DETERGEN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '168G'),
(2064, 'GHNM1507', 'VNISH TB PNK', 'DETERGEN', '0', '37000', '0', '37000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2065, 'GHNM1508', 'LNDRY PRF BT', 'DETERGEN', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2066, 'GHNM1509', 'DAIA PTH ', 'DETERGEN', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '850G'),
(2067, 'GHNM1510', 'DAIA VIO', 'DETERGEN', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '850G'),
(2068, 'GHNM1511', 'DAIA PNK', 'DETERGEN', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '850G'),
(2069, 'GHNM1512', 'DAIA LMN', 'DETERGEN', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '850G'),
(2070, 'GHNM1513', 'SMART CLR ', 'DETERGEN', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2071, 'GHNM1514', 'SH LFBY HJ', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:21:54', 'admin', '170ML'),
(2072, 'GHNM1515', 'SH LFBY ORG', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:22:27', 'admin', '170ML'),
(2073, 'GHNM1516', 'SH LFBY BR', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:22:56', 'admin', '170ML'),
(2074, 'GHNM1517', 'SH SNSLK BLCK', 'PERMANDI', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2075, 'GHNM1518', 'SH SNSLK HJB ', 'PERMANDI', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2076, 'GHNM1519', 'SH SNSLK SS', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2077, 'GHNM1520', 'SH ZINC CL', 'PERMANDI', '0', '20000', '3000', '17000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2078, 'GHNM1521', 'SH ZINC HF', 'PERMANDI', '0', '17600', '600', '17000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2079, 'GHNM1522', 'SH ZINC BLCK', 'PERMANDI', '0', '17500', '500', '17000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2080, 'GHNM1523', 'SH CLR MNT', 'PERMANDI', '0', '24500', '3500', '21000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2081, 'GHNM1524', 'SH CLR MN MNT', 'PERMANDI', '0', '24500', '3500', '21000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2082, 'GHNM1525', 'SH CLR HJB PR', 'PERMANDI', '0', '25000', '4000', '21000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2083, 'GHNM1526', 'SH CLR APPL', 'PERMANDI', '0', '22800', '1800', '21000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2084, 'GHNM1527', 'SH CLR LMN', 'PERMANDI', '0', '24500', '3500', '21000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '170ML'),
(2085, 'GHNM1528', 'SH CLR MNT', 'PERMANDI', '0', '23500', '2500', '21000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '125ML'),
(2086, 'GHNM1529', 'SB BIORE MLD', 'PERMANDI', '0', '10000', '2000', '8000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2087, 'GHNM1530', 'SB BIORE WHT', 'PERMANDI', '0', '10000', '2000', '8000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2088, 'GHNM1531', 'SB BIORE MTC', 'PERMANDI', '0', '10200', '2200', '8000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2089, 'GHNM1532', 'SB DTTL CL', 'PERMANDI', '0', '14500', '4500', '10000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100G'),
(2090, 'GHNM1533', 'SB DTTL SNSTV', 'PERMANDI', '0', '16000', '6000', '10000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100G'),
(2091, 'GHNM1534', 'SB DTTL ORI', 'PERMANDI', '0', '16000', '6000', '10000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100G'),
(2092, 'GHNM1535', 'SB LFBY MLD ', 'PERMANDI', '0', '11000', '2000', '9000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2093, 'GHNM1536', 'SB LFBY LMN', 'PERMANDI', '0', '4000', '0', '4000', 'Normal', '2022-05-31 12:09:46', 'admin', '100ML'),
(2094, 'GHNM1537', 'SB LFBY TTL', 'PERMANDI', '0', '5700', '0', '5700', 'Normal', '2022-05-31 12:12:02', 'admin', '100ML'),
(2095, 'GHNM1538', 'SB LFBY CL', 'PERMANDI', '0', '11000', '2000', '9000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2096, 'GHNM1539', 'SB LFBY MTC', 'PERMANDI', '0', '4000', '0', '4000', 'Normal', '2022-05-31 12:10:29', 'admin', '100ML'),
(2097, 'GHNM1540', 'SH EMRN SS', 'PERMANDI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2098, 'GHNM1541', 'SH PTNE RSK ', 'PERMANDI', '0', '13100', '0', '13100', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2099, 'GHNM1542', 'SH PTNE AVC', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2100, 'GHNM1543', 'SH PTNE RNTK', 'PERMANDI', '0', '11900', '0', '11900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2101, 'GHNM1544', 'PNTEN HTM CON', 'PERMANDI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '75ML'),
(2102, 'GHNM1545', 'SB BRE RLX RF', 'PERMANDI', '0', '29000', '0', '29000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2103, 'GHNM1546', 'SB LRV HNY RF', 'PERMANDI', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2104, 'GHNM1547', 'SB LRV AVC RF', 'PERMANDI', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2105, 'GHNM1548', 'SB LRV MLK RF', 'PERMANDI', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2106, 'GHNM1549', 'RYLE HT SMMR ', 'PEWANGI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '370ML'),
(2107, 'GHNM1550', 'RYLE STR NGHT', 'PEWANGI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800ML'),
(2108, 'GHNM1551', 'DWNY RF DRG', 'PEWANGI', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '680ML'),
(2109, 'GHNM1552', 'DWNY RF AB', 'PEWANGI', '0', '36000', '0', '36000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '680ML'),
(2110, 'GHNM1553', 'DWNY RF MLD GN', 'PEWANGI', '0', '28000', '0', '28000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '680ML'),
(2111, 'GHNM1554', 'DAIA PNK', 'DETERGEN', '0', '9400', '0', '9400', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '555G'),
(2112, 'GHNM1555', 'SH ZINC CL', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2113, 'GHNM1556', 'SH ZINC BLCK', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2114, 'GHNM1557', 'SH SNSLK PNK ', 'PERMANDI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2115, 'GHNM1558', 'SH SNSLK KN', 'PERMANDI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2116, 'GHNM1559', 'SH SNSLK BLC', 'PERMANDI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2117, 'GHNM1560', 'SH CLR MNT', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2118, 'GHNM1561', 'SH CLR MNT', 'PERMANDI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2119, 'GHNM1562', 'SH EMRN HF', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2120, 'GHNM1563', 'SH EMRN DC', 'PERMANDI', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2121, 'GHNM1564', 'SH EMRN SS', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2122, 'GHNM1565', 'SH PNTNE KRG', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2123, 'GHNM1566', 'SH PNTNE FLL', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2124, 'GHNM1567', 'SH PNTNE GLD', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2125, 'GHNM1568', 'SH EMRN BLCK', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2126, 'GHNM1569', 'SH SAFI ANT DRF', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2127, 'GHNM1570', 'SH SAFI HF', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2128, 'GHNM1571', 'SH HSHLD HF', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2129, 'GHNM1572', 'SH HSHLD MNT', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2130, 'GHNM1573', 'SH HSHLD LMN', 'PERMANDI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2131, 'GHNM1574', 'SH DOVE RNTK', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2132, 'GHNM1575', 'DOVE CON RSK', 'PERMANDI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2133, 'GHNM1576', 'SH DOVE NRM', 'PERMANDI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2134, 'GHNM1577', 'SH DOVE RSK', 'PERMANDI', '0', '9800', '0', '9800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2135, 'GHNM1578', 'SH RJOICE KST', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2136, 'GHNM1579', 'SH RJOICE KTM', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2137, 'GHNM1580', 'SH RJOICE LMB', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2138, 'GHNM1581', 'SH CLR KTM', 'PERMANDI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2139, 'GHNM1582', 'SH EMRN HF', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2140, 'GHNM1583', 'DAIA PTH ', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '290G'),
(2141, 'GHNM1584', 'DAIA VLT', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '290G'),
(2142, 'GHNM1585', 'DAIA BNG', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '290G'),
(2143, 'GHNM1586', 'DAIA BNGA', 'PERMANDI', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '850G'),
(2144, 'GHNM1587', 'SO KLN LVN', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '260G'),
(2145, 'GHNM1588', 'SO KLN SKR', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '260G'),
(2146, 'GHNM1589', 'SO KLN WB ', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '260G'),
(2147, 'GHNM1590', 'SO KLN RS', 'PERMANDI', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '260G'),
(2148, 'GHNM1591', 'DWNY RF MLD', 'PERMANDI', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2149, 'GHNM1592', 'DWNY RF PR', 'PERMANDI', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2150, 'GHNM1593', 'ELLPS JJB', 'PERMANDI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2151, 'GHNM1594', 'ELLPS ALOE', 'PERMANDI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2152, 'GHNM1595', 'ELLPS CP BLCK', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2153, 'GHNM1596', 'MRND CP JJB', 'PERMANDI', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2154, 'GHNM1597', 'ELLPS CP KRTN', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2155, 'GHNM1598', 'ELLPS CP KN', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2156, 'GHNM1599', 'MRND CP LDH ', 'PERMANDI', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2157, 'GHNM1600', 'ELLPS CP GNS', 'PERMANDI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2158, 'GHNM1601', 'ELLPS CP UNG', 'PERMANDI', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1ML'),
(2159, 'GHNM1602', 'SH HD SHL SS', 'PERMANDI', '0', '28000', '0', '28000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '160ML'),
(2160, 'GHNM1603', 'SH HD SHL SPR', 'PERMANDI', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '135ML'),
(2161, 'GHNM1604', 'SH HD SHL MNT', 'PERMANDI', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '160ML'),
(2162, 'GHNM1605', 'SH HDSHO MNT', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2163, 'GHNM1606', 'SH HDSHO LMN', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2164, 'GHNM1607', 'SH HDSHO SS', 'PERMANDI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2165, 'GHNM1608', 'SH DOVE LPK', 'PERMANDI', '0', '20000', '0', '20000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '135ML'),
(2166, 'GHNM1609', 'SH DOVE KTM', 'PERMANDI', '0', '25500', '0', '25500', 'Normal', '2022-06-04 10:20:50', 'admin', '135ML'),
(2167, 'GHNM1610', 'SH DOVE RNT ', 'PERMANDI', '0', '22000', '0', '22000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '135ML'),
(2168, 'GHNM1611', 'SH PNTEN AN KTM', 'PERMANDI', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '130ML'),
(2169, 'GHNM1612', 'SH PNTEN RNT', 'PERMANDI', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '130ML'),
(2170, 'GHNM1613', 'SH PNTEN RSK', 'PERMANDI', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '130ML'),
(2171, 'GHNM1614', 'SH PNTEN HLS', 'PERMANDI', '0', '27500', '0', '27500', 'Normal', '2022-06-25 15:05:49', 'admin', '130ML'),
(2172, 'GHNM1615', 'SH ZINC FRS', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2173, 'GHNM1616', 'SH ZINC HTM', 'PERMANDI', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2174, 'GHNM1617', 'SH ZINC COL', 'PERMANDI', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2175, 'GHNM1618', 'SH ZINC MN HF', 'PERMANDI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2176, 'GHNM1619', 'SH PNTEN HTM', 'PERMANDI', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '130ML'),
(2177, 'GHNM1620', 'SH SNSLK HJB', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2178, 'GHNM1621', 'SH SNSLK BLC', 'PERMANDI', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2179, 'GHNM1622', 'SH SNSLK SS', 'PERMANDI', '0', '9500', '0', '9500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2180, 'GHNM1623', 'SH RJOICE SS', 'PERMANDI', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2181, 'GHNM1624', 'SH RJOICE ANTK', 'PERMANDI', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2182, 'GHNM1625', 'SH RJOICE MS', 'PERMANDI', '0', '10300', '0', '10300', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2183, 'GHNM1626', 'SH LFBY HJ', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:21:54', 'admin', '70ML'),
(2184, 'GHNM1627', 'SH LFBY ORG', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:22:27', 'admin', '70ML'),
(2185, 'GHNM1628', 'SH LFBY BR', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:22:56', 'admin', '70ML'),
(2186, 'GHNM1629', 'SH EMRN DC', 'PERMANDI', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2187, 'GHNM1630', 'SH EMRN ANT DN', 'PERMANDI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2188, 'GHNM1631', 'SH RJOICE ANT K', 'PERMANDI', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2189, 'GHNM1632', 'SH CLR MNT', 'PERMANDI', '0', '11700', '0', '11700', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2190, 'GHNM1633', 'SH EMRN BLCK', 'PERMANDI', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '70ML'),
(2191, 'GHNM1634', 'ACNES FW E C', 'SKINCARE', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2192, 'GHNM1635', 'ONYX HR SRM', 'SKINCARE', '0', '35500', '0', '35500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '65ML'),
(2193, 'GHNM1636', 'NVEA MN DP 48', 'SKINCARE', '0', '11500', '0', '11500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '25ML'),
(2194, 'GHNM1637', 'NVEA MN BW', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '25ML'),
(2195, 'GHNM1638', 'NVEA WHT ST', 'SKINCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '25ML'),
(2196, 'GHNM1639', 'NVEA WHT SLK', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2197, 'GHNM1640', 'NVEA DRY CMF', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2198, 'GHNM1641', 'FAIR FFOAM', 'SKINCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '9G'),
(2199, 'GHNM1642', 'FAIR KRIM', 'SKINCARE', '0', '4500', '0', '4500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '9G'),
(2200, 'GHNM1643', 'RXONA MN CL', 'SKINCARE', '0', '2400', '0', '2400', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '9G'),
(2201, 'GHNM1644', 'PDTOX BT', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2202, 'GHNM1645', 'LUX BRD RF', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2203, 'GHNM1646', 'LUX RSE RF', 'PERMANDI', '0', '25500', '0', '25500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2204, 'GHNM1647', 'CITRA BNG RF', 'PERMANDI', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2205, 'GHNM1648', 'CITRA MRN RF', 'PERMANDI', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2206, 'GHNM1649', 'LUX MDY RF', 'PERMANDI', '0', '24900', '0', '24900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2207, 'GHNM1650', 'BIORE WHT RF', 'PERMANDI', '0', '27500', '0', '27500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2208, 'GHNM1651', 'BIORE PRMLD RF', 'PERMANDI', '0', '18600', '0', '18600', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2209, 'GHNM1652', 'BIORE GRD RF', 'PERMANDI', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2210, 'GHNM1653', 'BIORE CFRS RF', 'PERMANDI', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2211, 'GHNM1654', 'NUVO FRS RF', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2212, 'GHNM1655', 'NUVO MLD RF', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2213, 'GHNM1656', 'NUVO TTL RF', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2214, 'GHNM1657', 'SH ZINC LMN', 'PERMANDI', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2215, 'GHNM1658', 'SH ZINC GRN', 'PERMANDI', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2216, 'GHNM1659', 'SH ZINC JPN', 'PERMANDI', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2217, 'GHNM1660', 'SH ZINC ALM', 'PERMANDI', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2218, 'GHNM1661', 'SH LFBY ORG', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:22:27', 'admin', '1RTG'),
(2219, 'GHNM1662', 'SH LFBY BR', 'PERMANDI', '0', '12500', '0', '12500', 'Normal', '2022-06-04 10:22:56', 'admin', '1RTG'),
(2220, 'GHNM1663', 'NTURGO MSK', 'SKINCARE', '0', '3500', '0', '3500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10G'),
(2221, 'GHNM1664', 'WRDH RC MSK', 'SKINCARE', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2222, 'GHNM1665', 'WRDH VTC MSK', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2223, 'GHNM1666', 'YOU RH MSK', 'SKINCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '22G'),
(2224, 'GHNM1667', 'SRAYU BP MSK', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10G'),
(2225, 'GHNM1668', 'MRNDA MC14', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2226, 'GHNM1669', 'MRNDA MC7', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2227, 'GHNM1670', 'MRNDA MC3', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2228, 'GHNM1671', 'MRNDA MC19', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2229, 'GHNM1672', 'MRNDA MC4', 'SKINCARE', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2230, 'GHNM1673', 'MRNDA MC13', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2231, 'GHNM1674', 'MRNDA MC10', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2232, 'GHNM1675', 'MRNDA MC11', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2233, 'GHNM1676', 'MRNDA MCP2', 'SKINCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2234, 'GHNM1677', 'MRNDA MCP1', 'SKINCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2235, 'GHNM1678', 'MRNDA MC18', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2236, 'GHNM1679', 'MRNDA MC1', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2237, 'GHNM1680', 'MRNDA MC9', 'SKINCARE', '0', '10500', '0', '10500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2238, 'GHNM1681', 'MRNDA MC2', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2239, 'GHNM1682', 'MRNDA MC5', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2240, 'GHNM1683', 'MRNDA MC12', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2241, 'GHNM1684', 'MRNDA MC8', 'SKINCARE', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2242, 'GHNM1685', 'MRNDA MC17', 'SKINCARE', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2243, 'GHNM1686', 'SLSA S4', 'SKINCARE', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2244, 'GHNM1687', 'MRNDA MCP3', 'SKINCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10ML'),
(2245, 'GHNM1688', 'NYU CHR RD', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '30G'),
(2246, 'GHNM1689', 'NYU BRW', 'SKINCARE', '0', '14000', '0', '14000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '30G'),
(2247, 'GHNM1690', 'HI TOP', 'SKINCARE', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '35ML'),
(2248, 'GHNM1691', 'BLCK PLUS', 'SKINCARE', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '4G'),
(2249, 'GHNM1692', 'CLN&CLR PNK', 'SKINCARE', '0', '16000', '3000', '13000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2250, 'GHNM1693', 'PIXY FW ACN', 'SKINCARE', '0', '14000', '2000', '12000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '40G'),
(2251, 'GHNM1694', 'VIVA FT BK', 'SKINCARE', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2252, 'GHNM1695', 'VIVA FT SP', 'SKINCARE', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2253, 'GHNM1696', 'VIVA FT CCM', 'SKINCARE', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2254, 'GHNM1697', 'VIVA MC SP', 'SKINCARE', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2255, 'GHNM1698', 'VIVA MC CCM', 'SKINCARE', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2256, 'GHNM1699', 'VIVA MC BNK', 'SKINCARE', '0', '7500', '0', '7500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2257, 'GHNM1700', 'VIVA MC LMN', 'SKINCARE', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2258, 'GHNM1701', 'VIVA FT LMN', 'SKINCARE', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2259, 'GHNM1702', 'GRN MCL BR', 'SKINCARE', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '125ML'),
(2260, 'GHNM1703', 'GRN MCL PNK', 'SKINCARE', '0', '29000', '0', '29000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '125ML'),
(2261, 'GHNM1704', 'GRN MCL KN', 'SKINCARE', '0', '39500', '0', '39500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '125ML'),
(2262, 'GHNM1705', 'GRN MCL KNG', 'SKINCARE', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2263, 'GHNM1706', 'HRB ROSE WTR', 'SKINCARE', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2264, 'GHNM1707', 'OVLE 2IN1 BKG', 'SKINCARE', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(2265, 'GHNM1708', 'PNDS MCL CHAR', 'SKINCARE', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2266, 'GHNM1709', 'PNDS MCL RS', 'SKINCARE', '0', '9800', '0', '9800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '55ML'),
(2267, 'GHNM1710', 'POISE FF YZ', 'SKINCARE', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2268, 'GHNM1711', 'POISE FF YZ K', 'SKINCARE', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2269, 'GHNM1712', 'POISE FF LMN', 'SKINCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2270, 'GHNM1713', 'CLN&CLR DPAC', 'SKINCARE', '0', '15200', '0', '15200', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2271, 'GHNM1714', 'CLN&CLR PRE', 'SKINCARE', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2272, 'GHNM1715', 'BIORE FF BR ', 'SKINCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2273, 'GHNM1716', 'BIORE FF ACN', 'SKINCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2274, 'GHNM1717', 'PIXY FF ACN', 'SKINCARE', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2275, 'GHNM1718', 'PIXY FF BRG', 'SKINCARE', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2276, 'GHNM1719', 'PIXY FF BRG', 'SKINCARE', '0', '15500', '0', '15500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2277, 'GHNM1720', 'BIORE FF BRG', 'SKINCARE', '0', '24500', '0', '24500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2278, 'GHNM1721', 'GRNR PR ACT', 'SKINCARE', '0', '32500', '0', '32500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2279, 'GHNM1722', 'GRNR BRG SCR', 'SKINCARE', '0', '29500', '0', '29500', 'Normal', '2022-06-04 10:50:38', 'admin', '100ML');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(2280, 'GHNM1723', 'GRNR BRG ', 'SKINCARE', '0', '28500', '0', '28500', 'Normal', '2022-06-04 10:50:12', 'admin', '100ML'),
(2281, 'GHNM1724', 'GRNR SKR WHP', 'SKINCARE', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2282, 'GHNM1725', 'GRNR SKR', 'SKINCARE', '0', '28000', '0', '28000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2283, 'GHNM1726', 'GRNR PR SCR', 'SKINCARE', '0', '26900', '0', '26900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2284, 'GHNM1727', 'CTRA FF GT', 'SKINCARE', '0', '26500', '0', '26500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2285, 'GHNM1728', 'PIXY FW DLL', 'SKINCARE', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2286, 'GHNM1729', 'PNDS FF JRK', 'SKINCARE', '0', '28800', '0', '28800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '90G'),
(2287, 'GHNM1730', 'PNDS FF BLCK', 'SKINCARE', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2288, 'GHNM1731', 'PNDS F WTRMLN', 'SKINCARE', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '90G'),
(2289, 'GHNM1732', 'PNDS OLCN', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2290, 'GHNM1733', 'PNDS EXFL SN', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2291, 'GHNM1734', 'CITRA FF SKR', 'SKINCARE', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2292, 'GHNM1735', 'CITRA FF RA', 'SKINCARE', '0', '28000', '0', '28000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '90G'),
(2293, 'GHNM1736', 'CITRA FF GT', 'SKINCARE', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2294, 'GHNM1737', 'WRD C DFN', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '60ML'),
(2295, 'GHNM1738', 'WRD C DFNSE', 'SKINCARE', '0', '28000', '0', '28000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2296, 'GHNM1739', 'WRD CDFNS WHP', 'SKINCARE', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2297, 'GHNM1740', 'WRD BRG SMT', 'SKINCARE', '0', '25500', '0', '25500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2298, 'GHNM1741', 'WRD BRG OIL', 'SKINCARE', '0', '26500', '0', '26500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100ML'),
(2299, 'GHNM1742', 'WRD BRG OL K', 'SKINCARE', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '60ML'),
(2300, 'GHNM1743', 'WRD LGH EXF', 'SKINCARE', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2301, 'GHNM1744', 'WRD ACN DRM', 'SKINCARE', '0', '22000', '0', '22000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '60ML'),
(2302, 'GHNM1745', 'WRD MNR CL', 'SKINCARE', '0', '17000', '0', '17000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '60ML'),
(2303, 'GHNM1746', 'ACNES FW OL', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2304, 'GHNM1747', 'ACNES FW WHT', 'SKINCARE', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2305, 'GHNM1748', 'ACNES FW PR', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2306, 'GHNM1749', 'GRN LGH CMP', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2307, 'GHNM1750', 'GRN PR MTC', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2308, 'GHNM1751', 'EMNA FF WHP', 'SKINCARE', '0', '17800', '0', '17800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2309, 'GHNM1752', 'EMNA FF CAN', 'SKINCARE', '0', '15500', '0', '15500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2310, 'GHNM1753', 'FAIR LV FW', 'SKINCARE', '0', '25000', '0', '25000', 'Normal', '2022-05-20 08:38:04', 'admin', '100G'),
(2311, 'GHNM1754', 'FAIR LVE FW', 'SKINCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2312, 'GHNM1755', 'HRB ZTN FW', 'SKINCARE', '0', '17500', '0', '17500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '80G'),
(2313, 'GHNM1756', 'HRB ZTN BR FF', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '80G'),
(2314, 'GHNM1757', 'WRD FW SEAWD', 'SKINCARE', '0', '14500', '0', '14500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '60ML'),
(2315, 'GHNM1758', 'CTRA ACN CRM', 'SKINCARE', '0', '42000', '0', '42000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2316, 'GHNM1759', 'CTRA PRL CRM', 'SKINCARE', '0', '43000', '0', '43000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2317, 'GHNM1760', 'CTRA SKR CRM', 'SKINCARE', '0', '42000', '0', '42000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2318, 'GHNM1761', 'GRN SKR SPFCR', 'SKINCARE', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2319, 'GHNM1762', 'GRN L NGHT', 'SKINCARE', '0', '24500', '0', '24500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2320, 'GHNM1763', 'GRN SKR NGH', 'SKINCARE', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2321, 'GHNM1764', 'GRN SKR CRM', 'SKINCARE', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2322, 'GHNM1765', 'GRN LG SPF CRM', 'SKINCARE', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2323, 'GHNM1766', 'GRN LG CRM', 'SKINCARE', '0', '21000', '0', '21000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2324, 'GHNM1767', 'VEET SLK', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '25G'),
(2325, 'GHNM1768', 'WRD BB NTR', 'SKINCARE', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '15ML'),
(2326, 'GHNM1769', 'WRD NGH CRM', 'SKINCARE', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2327, 'GHNM1770', 'PNDS BRG CRM', 'SKINCARE', '0', '40000', '0', '40000', '', '2022-06-25 14:40:59', 'admin', '40G'),
(2328, 'GHNM1771', 'FAIR LV CRM', 'SKINCARE', '0', '18800', '0', '18800', 'Normal', '2022-08-04 11:23:38', 'admin', '25G'),
(2329, 'GHNM1772', 'PNDS BR SRM K', 'SKINCARE', '0', '21000', '0', '21000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2330, 'GHNM1773', 'PIXY WHT CRM', 'SKINCARE', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2331, 'GHNM1774', 'WRD TNUP CRM', 'SKINCARE', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20ML'),
(2332, 'GHNM1775', 'WRD BBCRM SPF', 'SKINCARE', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '15ML'),
(2333, 'GHNM1776', 'FAIR LV BB', 'SKINCARE', '0', '20900', '0', '20900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '15G'),
(2334, 'GHNM1777', 'RXN MN QN', 'SKINCARE', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2335, 'GHNM1778', 'RXN INV BW', 'SKINCARE', '0', '19900', '0', '19900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2336, 'GHNM1779', 'RXNA MN ICE', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2337, 'GHNM1780', 'RXNA DRM', 'SKINCARE', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2338, 'GHNM1781', 'RXNA NTR', 'SKINCARE', '0', '19000', '0', '19000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2339, 'GHNM1782', 'RXNA SHW', 'SKINCARE', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2340, 'GHNM1783', 'RXNA GLW', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2341, 'GHNM1784', 'RXNA ADVWHT', 'SKINCARE', '0', '21000', '0', '21000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2342, 'GHNM1785', 'RXNA MN INV', 'SKINCARE', '0', '21900', '0', '21900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2343, 'GHNM1786', 'RXNA MN NTR', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2344, 'GHNM1787', 'RXNA ADV BRG', 'SKINCARE', '0', '22000', '0', '22000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2345, 'GHNM1788', 'RXNA MN V8', 'SKINCARE', '0', '19400', '0', '19400', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2346, 'GHNM1789', 'DOVE SLK', 'SKINCARE', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2347, 'GHNM1790', 'DOVE CMP 48', 'SKINCARE', '0', '22000', '0', '22000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2348, 'GHNM1791', 'DOVE PWD ', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2349, 'GHNM1792', 'DOVE INV DRY', 'SKINCARE', '0', '21500', '0', '21500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2350, 'GHNM1793', 'DOVE GO FR', 'SKINCARE', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2351, 'GHNM1794', 'POSH WHT', 'SKINCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2352, 'GHNM1795', 'POSH ANT STN', 'SKINCARE', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50ML'),
(2353, 'GHNM1796', 'DTTL RF FRS', 'PERMANDI', '0', '30000', '0', '30000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '410G'),
(2354, 'GHNM1797', 'DTTL RF ORI', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '410G'),
(2355, 'GHNM1798', 'DTTL RF CL', 'PERMANDI', '0', '24000', '0', '24000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '410G'),
(2356, 'GHNM1799', 'DTTL RF SKN', 'PERMANDI', '0', '33000', '0', '33000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '410G'),
(2357, 'GHNM1800', 'LFBY RF MLD', 'PERMANDI', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2358, 'GHNM1801', 'LFBY RF TTL', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2359, 'GHNM1802', 'LFBY RF MTCH', 'PERMANDI', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2360, 'GHNM1803', 'LFBY RF LMN', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2361, 'GHNM1804', 'LFBY RF CL', 'PERMANDI', '0', '28500', '0', '28500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2362, 'GHNM1805', 'LFBY RF TTL10', 'PERMANDI', '0', '29500', '0', '29500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400ML'),
(2363, 'GHNM1806', 'LFBY RF HBTS', 'PERMANDI', '0', '32000', '0', '32000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '450ML'),
(2364, 'GHNM1807', 'LLR MND PNG BK', 'PERMANDI', '0', '25000', '0', '25000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '500G'),
(2365, 'GHNM1808', 'LLR MND PNG VN', 'PERMANDI', '0', '26000', '0', '26000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '500G'),
(2366, 'GHNM1809', 'BTITA 1+ MD', 'SUSU', '0', '70000', '0', '70000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900G'),
(2367, 'GHNM1810', 'DTITA 5+ MD', 'SUSU', '0', '68500', '0', '68500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900G'),
(2368, 'GHNM1811', 'SGM 1+ VN', 'SUSU', '0', '84000', '0', '84000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900G'),
(2369, 'GHNM1812', 'SGM 1+ MD', 'SUSU', '0', '82000', '0', '82000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900G'),
(2370, 'GHNM1813', 'SGM 1+ SYA', 'SUSU', '0', '102000', '0', '102000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '700G'),
(2371, 'GHNM1814', 'SGM ANA 6-12 ', 'SUSU', '0', '58800', '0', '58800', 'Normal', '2022-06-28 12:30:06', 'admin', '1000G'),
(2372, 'GHNM1815', 'SGM ANA 0-6', 'SUSU', '0', '92000', '0', '92000', 'Normal', '2022-06-03 12:17:08', 'admin', '1000G'),
(2373, 'GHNM1816', 'SGM 3+ MD', 'SUSU', '0', '76500', '0', '76500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '900G'),
(2374, 'GHNM1817', 'VDORN 1+ VN', 'SUSU', '0', '70000', '0', '70000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '950G'),
(2375, 'GHNM1818', 'VDORN 1+ MD', 'SUSU', '0', '70000', '0', '70000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '950G'),
(2376, 'GHNM1819', 'VDORN 3+ VN', 'SUSU', '0', '27000', '0', '27000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '350G'),
(2377, 'GHNM1820', 'SGM 3+ MD', 'SUSU', '0', '50500', '0', '50500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600G'),
(2378, 'GHNM1821', 'SGM 3+ VN', 'SUSU', '0', '51000', '0', '51000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600G'),
(2379, 'GHNM1822', 'SGM ANA 0-6', 'SUSU', '0', '92000', '0', '92000', 'Normal', '2022-06-03 12:17:08', 'admin', '600G'),
(2380, 'GHNM1823', 'SGM 3+ VN', 'SUSU', '0', '51000', '0', '51000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600G'),
(2381, 'GHNM1824', 'SGM 1+ MD', 'SUSU', '0', '56000', '0', '56000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600G'),
(2382, 'GHNM1825', 'SGM 1+ VN', 'SUSU', '0', '54000', '0', '54000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '600G'),
(2383, 'GHNM1826', 'SGM ANA 0-6 ', 'SUSU', '0', '92000', '0', '92000', 'Normal', '2022-06-03 12:17:08', 'admin', '600G'),
(2384, 'GHNM1827', 'SGM ANA 6-12 ', 'SUSU', '0', '58800', '0', '58800', 'Normal', '2022-06-28 12:30:06', 'admin', '400G'),
(2385, 'GHNM1828', 'SGM 3+ VN', 'SUSU', '0', '39500', '0', '39500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2386, 'GHNM1829', 'SGM 1+ MD', 'SUSU', '0', '39000', '0', '39000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2387, 'GHNM1830', 'SGM 3+ MD', 'SUSU', '0', '38000', '0', '38000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2388, 'GHNM1831', 'SGM 1+ VN', 'SUSU', '0', '39000', '0', '39000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2389, 'GHNM1832', 'SGM 1+ VN', 'SUSU', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(2390, 'GHNM1833', 'SGM 1+ MD', 'SUSU', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(2391, 'GHNM1834', 'SGM 1+ SYA', 'SUSU', '0', '63000', '0', '63000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2392, 'GHNM1835', 'SGM 1+ SY MD', 'SUSU', '0', '63000', '0', '63000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2393, 'GHNM1836', 'SGM SY 6-12', 'SUSU', '0', '62000', '0', '62000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2394, 'GHNM1837', 'SGM SY 0-6', 'SUSU', '0', '32000', '0', '32000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2395, 'GHNM1838', 'DNCW FG FC', 'SUSU', '0', '53000', '0', '53000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2396, 'GHNM1839', 'DNCW 1+ VN', 'SUSU', '0', '50000', '0', '50000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2397, 'GHNM1840', 'DNCW 3+ MD', 'SUSU', '0', '49000', '0', '49000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2398, 'GHNM1841', 'DNCW 5+ MD', 'SUSU', '0', '48000', '0', '48000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2399, 'GHNM1842', 'CHLKD 3 MD', 'SUSU', '0', '83200', '0', '83200', 'Normal', '2022-08-24 08:45:10', 'admin', '400G'),
(2400, 'GHNM1843', 'CHLKD 3 VN', 'SUSU', '0', '78500', '0', '78500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2401, 'GHNM1844', 'CHLML 2 6-12', 'SUSU', '0', '87000', '0', '87000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2402, 'GHNM1845', 'LCTG 1 0-6', 'SUSU', '0', '62500', '0', '62500', 'Normal', '2022-06-03 11:52:22', 'admin', '180G'),
(2403, 'GHNM1846', 'LCTG 2 6-12', 'SUSU', '0', '62800', '0', '62800', 'Normal', '2022-08-17 10:39:16', 'admin', '180G'),
(2404, 'GHNM1847', 'LCTG 3 1-3', 'SUSU', '0', '57200', '0', '57200', 'Normal', '2022-06-28 12:26:58', 'admin', '180G'),
(2405, 'GHNM1848', 'LCTG 1 0-6', 'SUSU', '0', '62500', '0', '62500', 'Normal', '2022-06-03 11:52:22', 'admin', '350G'),
(2406, 'GHNM1849', 'LCTG 2 6-12', 'SUSU', '0', '62800', '0', '62800', 'Normal', '2022-08-17 10:39:16', 'admin', '350G'),
(2407, 'GHNM1850', 'LCTG 3 1-3', 'SUSU', '0', '57200', '0', '57200', 'Normal', '2022-06-28 12:26:58', 'admin', '350G'),
(2408, 'GHNM1851', 'BTITA 1+ VN', 'SUSU', '0', '33000', '0', '33000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2409, 'GHNM1852', 'BTITA 1+ MD', 'SUSU', '0', '33000', '0', '33000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2410, 'GHNM1853', 'DTITA 3+ MD', 'SUSU', '0', '35000', '0', '35000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2411, 'GHNM1854', 'CHL MIL 2 6-12', 'SUSU', '0', '45000', '0', '45000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2412, 'GHNM1855', 'BMT 1 0-6', 'SUSU', '0', '49900', '0', '49900', 'Normal', '2022-08-24 08:43:40', 'admin', '200G'),
(2413, 'GHNM1856', 'CHLKID 3 MD', 'SUSU', '0', '40500', '0', '40500', 'Normal', '2022-08-24 08:45:37', 'admin', '200G'),
(2414, 'GHNM1857', 'CHLKID 3 VN', 'SUSU', '0', '41000', '0', '41000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2415, 'GHNM1858', 'LVTON 1 0-6', 'SUSU', '0', '21000', '0', '21000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2416, 'GHNM1859', 'LVTON 2 6-12', 'SUSU', '0', '20000', '0', '20000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2417, 'GHNM1860', 'LVTON 1+ MD', 'SUSU', '0', '22000', '0', '22000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2418, 'GHNM1861', 'PRIMAML 0-6 ', 'SUSU', '0', '48200', '0', '48200', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2419, 'GHNM1862', 'FRS 456 MD', 'SUSU', '0', '24500', '0', '24500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2420, 'GHNM1863', 'LVTON 2 6-12', 'SUSU', '0', '38000', '0', '38000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2421, 'GHNM1864', 'LCTG 3 MD', 'SUSU', '0', '112000', '0', '112000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '750G'),
(2422, 'GHNM1865', 'LCTG 2 HP', 'SUSU', '0', '119000', '0', '119000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '750G'),
(2423, 'GHNM1866', 'LCTG 1 HP', 'SUSU', '0', '127500', '0', '127500', 'Normal', '2022-08-24 08:44:37', 'admin', '750G'),
(2424, 'GHNM1867', 'DNCOW 5+ MD', 'SUSU', '0', '88000', '0', '88000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2425, 'GHNM1868', 'DNCOW FG INS', 'SUSU', '0', '88000', '0', '88000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2426, 'GHNM1869', 'DNCOW 3+ VN', 'SUSU', '0', '90000', '0', '90000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2427, 'GHNM1870', 'DNCOW 3+ MD', 'SUSU', '0', '76500', '0', '76500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2428, 'GHNM1871', 'ANLEN GLD CK', 'SUSU', '0', '45000', '0', '45000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250G'),
(2429, 'GHNM1872', 'ANLEN ACT ORI', 'SUSU', '0', '34000', '0', '34000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250G'),
(2430, 'GHNM1873', 'ANLEN ACT ORI', 'SUSU', '0', '68000', '0', '68000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250G'),
(2431, 'GHNM1874', 'DIABTSL CHO', 'SUSU', '0', '44000', '3000', '41000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '180G'),
(2432, 'GHNM1875', 'BNETO CRMVN', 'SUSU', '0', '39500', '2500', '37000', 'PROMO', '2022-04-13 00:00:00', 'Admin', '350G'),
(2433, 'GHNM1876', 'BNETO YMCHO', 'SUSU', '0', '45000', '7000', '38000', 'PROMO ', '2022-04-13 00:00:00', 'Admin', '350G'),
(2434, 'GHNM1877', 'HILO SCH CHO', 'SUSU', '0', '43000', '2500', '40500', 'PROMO ', '2022-04-13 00:00:00', 'Admin', '250G'),
(2435, 'GHNM1878', 'MILO ACT MSC', 'SUSU', '0', '74800', '39800', '35000', 'PROMO ', '2022-04-13 00:00:00', 'Admin', '800G'),
(2436, 'GHNM1879', 'MILO ACT 3IN1', 'SUSU', '0', '35000', '15000', '20000', 'PROMO ', '2022-04-13 00:00:00', 'Admin', '300G'),
(2437, 'GHNM1880', 'LVMIL VN', 'SUSU', '0', '22000', '4500', '17500', 'PROMO', '2022-04-13 00:00:00', 'Admin', '120G'),
(2438, 'GHNM1881', 'PRGEN MM STR', 'SUSU', '0', '42000', '0', '42000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2439, 'GHNM1882', 'PRGEN MM VN', 'SUSU', '0', '42000', '0', '42000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2440, 'GHNM1883', 'PRMN CHOAVC', 'BUBUR', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2441, 'GHNM1884', 'PRMN PSG SS', 'BUBUR', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2442, 'GHNM1885', 'MLNA PSG', 'BUBUR', '0', '16500', '0', '16500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2443, 'GHNM1886', 'CRLAC BB WBL', 'BUBUR', '0', '18000', '0', '18000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2444, 'GHNM1887', 'CRLAC BB AJP', 'BUBUR', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2445, 'GHNM1888', 'CRLAC BB AYMS', 'BUBUR', '0', '16500', '0', '16500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2446, 'GHNM1889', 'CRLAC BB AYMB', 'BUBUR', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2447, 'GHNM1890', 'CRLAC BB KH', 'BUBUR', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2448, 'GHNM1891', 'CRLAC BB BM', 'BUBUR', '0', '12000', '0', '12000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2449, 'GHNM1892', 'SUN BBR BW', 'BUBUR', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2450, 'GHNM1893', 'SUN BBR UBI', 'BUBUR', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2451, 'GHNM1894', 'SUN BBR BM', 'BUBUR', '0', '8900', '0', '8900', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2452, 'GHNM1895', 'SUN BBR JAP', 'BUBUR', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2453, 'GHNM1896', 'SUN BBR AKBY', 'BUBUR', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2454, 'GHNM1897', 'MLNA SDB', 'BUBUR', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2455, 'GHNM1898', 'MLNA SAJ', 'BUBUR', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2456, 'GHNM1899', 'MLNA DKP', 'BUBUR', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2457, 'GHNM1900', 'MLNA LBU', 'BUBUR', '0', '16500', '0', '16500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2458, 'GHNM1901', 'MLNA SCA', 'BUBUR', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2459, 'GHNM1902', 'MLNA HAB', 'BUBUR', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2460, 'GHNM1903', 'MLNA SAW', 'BUBUR', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2461, 'GHNM1904', 'SUN EKN PS', 'BUBUR', '0', '7500', '0', '7500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2462, 'GHNM1905', 'SUN EKN BM', 'BUBUR', '0', '7500', '0', '7500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2463, 'GHNM1906', 'SUN EKN KH', 'BUBUR', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2464, 'GHNM1907', 'SUN EKN SPAY', 'BUBUR', '0', '7500', '0', '7500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2465, 'GHNM1908', 'SGM AN 0-6', 'SUSU', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(2466, 'GHNM1909', 'SGM AN 6-12', 'SUSU', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '150G'),
(2467, 'GHNM1910', 'PRMG 1+ MD', 'SUSU', '0', '52000', '0', '52000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2468, 'GHNM1911', 'PRMG 1+ CK', 'SUSU', '0', '50000', '0', '50000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2469, 'GHNM1912', 'FRS BBY 1', 'SUSU', '0', '48200', '0', '48200', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2470, 'GHNM1913', 'FRS BBY 2', 'SUSU', '0', '48000', '0', '48000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '400G'),
(2471, 'GHNM1914', 'PRMAML 6-12', 'SUSU', '0', '98500', '0', '98500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2472, 'GHNM1915', 'FRS BBY 2', 'SUSU', '0', '197000', '0', '197000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2473, 'GHNM1916', 'PRMGR 1+ VN', 'SUSU', '0', '88000', '0', '88000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '800G'),
(2474, 'GHNM1917', 'PRMN BB AKKP', 'SUSU', '0', '16000', '0', '16000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2475, 'GHNM1918', 'ANLNE ACT VN', 'SUSU', '0', '34000', '0', '34000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250G'),
(2476, 'GHNM1919', 'CHLGO 1+ MD', 'SUSU', '0', '31000', '0', '31000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2477, 'GHNM1920', 'CHLGO 1+ VN', 'SUSU', '0', '31000', '0', '31000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2478, 'GHNM1921', 'CHLGO 3+ MD', 'SUSU', '0', '29500', '0', '29500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2479, 'GHNM1922', 'RXNA MN ADV', 'SKINCARE', '0', '15000', '0', '15000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45ML'),
(2480, 'GHNM1923', 'SPR BBR ST', 'MAKANAN', '0', '3800', '0', '3800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '46G'),
(2481, 'GHNM1924', 'SPR BBR KR', 'MAKANAN', '0', '3800', '0', '3800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '46G'),
(2482, 'GHNM1925', 'SPR BBR AY', 'MAKANAN', '0', '3800', '0', '3800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '46G'),
(2483, 'GHNM1926', 'BANGO RF ', 'SEMBAKO', '0', '23500', '0', '23500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '550ML'),
(2484, 'GHNM1927', 'FRS CCNT ', 'MINUMAN', '0', '18800', '0', '18800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1L'),
(2485, 'GHNM1928', 'FRS LOW FT', 'MINUMAN', '0', '18500', '0', '18500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1L'),
(2486, 'GHNM1929', 'INDMLK FC', 'MINUMAN', '0', '18800', '0', '18800', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1L'),
(2487, 'GHNM1930', 'FRTEA PCH ST', 'MINUMAN', '0', '3000', '0', '3000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(2488, 'GHNM1931', 'FRTEA PCH BR', 'MINUMAN', '0', '3000', '0', '3000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(2489, 'GHNM1932', 'KIN YGT BLC', 'MINUMAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2490, 'GHNM1933', 'KIN YGT ORG', 'MINUMAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2491, 'GHNM1934', 'KIN YGT ORI', 'MINUMAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2492, 'GHNM1935', 'KIN YGT STR', 'MINUMAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200G'),
(2493, 'GHNM1936', 'CMRY FM BNN', 'MINUMAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2494, 'GHNM1937', 'CMRY FM BBR', 'MINUMAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2495, 'GHNM1938', 'FRS UHT STR', 'MINUMAN', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2496, 'GHNM1939', 'FRS UHT KTN', 'MINUMAN', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2497, 'GHNM1940', 'FRS UHT CCON', 'MINUMAN', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225ML'),
(2498, 'GHNM1941', 'ULTR UHT FC', 'MINUMAN', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(2499, 'GHNM1942', 'ULTR UHT TRO', 'MINUMAN', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(2500, 'GHNM1943', 'ULTR UHT KRM', 'MINUMAN', '0', '4500', '0', '4500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '200ML'),
(2501, 'GHNM1944', 'ULTR UHT STR', 'MINUMAN', '0', '6000', '0', '6000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250ML'),
(2502, 'GHNM1945', 'TEH POCI', 'MINUMAN', '0', '3000', '0', '3000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2503, 'GHNM1946', 'TEH CP BTL', 'MINUMAN', '0', '3000', '0', '3000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2504, 'GHNM1947', 'NRAY ORG CND', 'PERMEN/COKLAT', '0', '27000', '0', '27000', 'Normal', '2022-05-10 09:16:38', 'admin', '500G'),
(2505, 'GHNM1948', 'GRDA TING', 'PERMEN/COKLAT', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '125G'),
(2506, 'GHNM1949', 'MILO NGT', 'PERMEN/COKLAT', '0', '11500', '0', '11500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '25G'),
(2507, 'GHNM1950', 'RLXA LMN', 'PERMEN/COKLAT', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '25G'),
(2508, 'GHNM1951', 'CHO2 LLP STR', 'PERMEN/COKLAT', '0', '1500', '0', '1500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10G'),
(2509, 'GHNM1952', 'CHO2 LLP CK', 'PERMEN/COKLAT', '0', '1500', '0', '1500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10G'),
(2510, 'GHNM1953', 'GLDEN CT CHO', 'PERMEN/COKLAT', '0', '5000', '0', '5000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2511, 'GHNM1954', 'CHYNTA MKR LJ', 'MAKANAN', '0', '12500', '0', '12500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '100G'),
(2512, 'GHNM1955', 'CHYNTA MKR AK', 'MAKANAN', '0', '13500', '0', '13500', 'Normal', '2022-06-25 12:03:53', 'admin', '100G'),
(2513, 'GHNM1956', 'GD TME CLS', 'MAKANAN', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '72G'),
(2514, 'GHNM1957', 'GD TME DCHO', 'MAKANAN', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '72G'),
(2515, 'GHNM1958', 'GD TME RNBW', 'MAKANAN', '0', '7000', '0', '7000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '72G'),
(2516, 'GHNM1959', 'NSS CRSPY CRK', 'MAKANAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '250G'),
(2517, 'GHNM1960', 'NSS CRSPY CRK', 'MAKANAN', '0', '13500', '0', '13500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1RTG'),
(2518, 'GHNM1961', 'TOP WF COK', 'MAKANAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2519, 'GHNM1962', 'TOP WF PAN', 'MAKANAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '300G'),
(2520, 'GHNM1963', 'TOP WF STR', 'MAKANAN', '0', '11500', '0', '11500', 'Normal', '2022-07-20 09:59:11', 'admin', '300G'),
(2521, 'GHNM1964', 'HTR SH PUFF', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '245G'),
(2522, 'GHNM1965', 'BSKUAT CK', 'MAKANAN', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '134G'),
(2523, 'GHNM1966', 'BSKUAT ORI', 'MAKANAN', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '134G'),
(2524, 'GHNM1967', 'TIMTAM CK', 'MAKANAN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '81G'),
(2525, 'GHNM1968', 'WFR CRM CHO', 'MAKANAN', '0', '5500', '0', '5500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '105G'),
(2526, 'GHNM1969', 'BENG SHR IT', 'MAKANAN', '0', '11000', '0', '11000', 'Normal', '2022-08-04 10:17:17', 'admin', '95G'),
(2527, 'GHNM1970', 'GDBIS CR CRK', 'MAKANAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '380G'),
(2528, 'GHNM1971', 'UNB SHR CHVN', 'MAKANAN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '225G'),
(2529, 'GHNM1972', 'KKS KLP ', 'MAKANAN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '218G'),
(2530, 'GHNM1973', 'GO CRPS CHO', 'MAKANAN', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '9G'),
(2531, 'GHNM1974', 'NBTI WF CHO', 'MAKANAN', '0', '10000', '0', '10000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2532, 'GHNM1975', 'CHOCOLTS ', 'MAKANAN', '0', '11000', '0', '11000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', 'PK'),
(2533, 'GHNM1976', 'HL PNDA STR', 'MAKANAN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45G'),
(2534, 'GHNM1977', 'HL PNDA VN', 'MAKANAN', '0', '8500', '0', '8500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45G'),
(2535, 'GHNM1978', 'HL PNDA CRM', 'MAKANAN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45G'),
(2536, 'GHNM1979', 'HL PNDA CHO', 'MAKANAN', '0', '8000', '0', '8000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '45G'),
(2537, 'GHNM1980', 'PRGLS ORI', 'MAKANAN', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2538, 'GHNM1981', 'PRGLS ON', 'MAKANAN', '0', '9000', '0', '9000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '50G'),
(2539, 'GHNM1982', 'GRY MLK CCN', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '105G'),
(2540, 'GHNM1983', 'GRY MLK COK', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '105G'),
(2541, 'GHNM1984', 'GRY MLK CHCN', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '105G'),
(2542, 'GHNM1985', 'GRY MLK CHES', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '105G'),
(2543, 'GHNM1986', 'CHOCLTS 25', 'MAKANAN', '0', '2000', '0', '2000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '24G'),
(2544, 'GHNM1987', 'CHOLTS CHES 25', 'MAKANAN', '0', '2000', '0', '2000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '24G'),
(2545, 'GHNM1988', 'NBATI BRY', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '46G'),
(2546, 'GHNM1989', 'NBATI PNK', 'MAKANAN', '0', '2000', '0', '2000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '46G'),
(2547, 'GHNM1990', 'INC NCC VN', 'MAKANAN', '0', '14500', '0', '14500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '1000G'),
(2548, 'GHNM1991', 'KCC SRKL CP', 'MAKANAN', '0', '4500', '0', '4500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '120G'),
(2549, 'GHNM1992', 'BBL BOL ANG', 'MAKANAN', '0', '1500', '0', '1500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2550, 'GHNM1993', 'BBL BOL BG', 'MAKANAN', '0', '1500', '0', '1500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '40G'),
(2551, 'GHNM1994', 'SO NCE AYM', 'MAKANAN', '0', '1000', '0', '1000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10G'),
(2552, 'GHNM1995', 'SO NCE SP', 'MAKANAN', '0', '1000', '0', '1000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '10G'),
(2553, 'GHNM1996', 'PDMAS VN', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2554, 'GHNM1997', 'PDMAS CK', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2555, 'GHNM1998', 'PDMAS KJ', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2556, 'GHNM1999', 'PDMAS SMK', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2557, 'GHNM2000', 'PDMAS PN', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2558, 'GHNM2001', 'PDMAS RPG CK', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2559, 'GHNM2002', 'PDMAS RPG DR', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2560, 'GHNM2003', 'PDMAS RPG PND', 'MAKANAN', '0', '2500', '0', '2500', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '42G'),
(2561, 'GHNM2004', 'HLLPND CP CK', 'MAKANAN', '0', '4000', '0', '4000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2562, 'GHNM2005', 'HLLPND CP STR', 'MAKANAN', '0', '4000', '0', '4000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2563, 'GHNM2006', 'KND JOY GR', 'MAKANAN', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2564, 'GHNM2007', 'KND JOY BOY', 'MAKANAN', '0', '13000', '0', '13000', 'NORMAL', '2022-04-13 00:00:00', 'Admin', '20G'),
(2566, '1319', 'PNSET BG', 'AKSESORIS', '0', '4000', '0', '4000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2567, '1322', 'KUAS BZY', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2568, '1353', 'GT KNC KRKT', 'AKSESORIS', '0', '9500', '0', '9500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2569, '1363', 'GT KNC PLT', 'AKSESORIS', '0', '', '0', '9500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2570, '1611', 'KC AISHU', 'AKSESORIS', '0', '4900', '0', '4900', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2571, '2398', 'SSR MTSW HS', 'AKSESORIS', '0', '20500', '0', '20500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2572, '2235688', 'GT BL RMB', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2573, '2235688', 'GT KNC RMB', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2574, '2335733', 'SSR HK HNY', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2575, '2335734', 'PRDATR KT', 'AKSESORIS', '0', '7000', '0', '7000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2576, '2335735', 'KACA HNY', 'AKSESORIS', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2577, '2335736', 'LSER LGHT', 'AKSESORIS', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2578, '2335737', 'DMP HRLY', 'AKSESORIS', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2579, '2335739', 'PNITI PRM', 'AKSESORIS', '0', '2000', '0', '2000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2580, '2525324', 'MSKR DCKBL', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2581, '2556432', 'JRUM TSUK', 'AKSESORIS', '0', '2500', '0', '2500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2582, '2566554', 'CRT LGHT EAR', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2583, '2633355', 'GT BNEKA', 'AKSESORIS', '0', '13000', '0', '13000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2584, '2774554', 'GLG HRF CK', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2585, '2885855', 'SIRKT ORG', 'AKSESORIS', '0', '7000', '0', '7000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2586, '3356442', 'GT KRBNR', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2587, '3533523', 'GLG HRF', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2588, '4411989', 'GT KNC LNC', 'AKSESORIS', '0', '7000', '0', '7000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2589, '4466987', 'GT RKET', '', '0', '4000', '0', '4000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2590, '4778998', 'EARPCK FLGH', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2591, '5655221', 'MSK BTIK', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2592, '5655424', 'ST TIFA', 'AKSESORIS', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2593, '5655474', 'ST LUPO', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2594, '5655663', 'ST WOOLL', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2595, '5655778', 'MSK EMOTICN', 'AKSESORIS', '0', '7000', '0', '7000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2596, '5655895', 'MSK KAIN', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2597, '5655933', 'ST STRCH GXN', 'AKSESORIS', '0', '9000', '0', '9000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2598, '5663223', 'GT KNC LV', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2599, '5698899', 'SPON BD XY', 'AKSESORIS', '0', '6000', '0', '6000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2600, '6556323', 'PTONG KK KRK', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2601, '6556656', 'GLNG BNG', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2602, '7877858', 'KLG HP', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2603, '7899663', 'GT KNC TMP', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2604, '8556645', 'SSR MRS', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2605, '8779887', 'SRKT CK', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2606, '8788967', 'SSR KCL', 'AKSESORIS', '0', '5000', '0', '5000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2607, '8988566', 'DMP STNK NRT', 'AKSESORIS', '0', '15000', '0', '15000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2608, 'GHNM2008', 'RK APACHE ', 'ROKOK', '0', '16000', '0', '16000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2609, 'GHNM2009', 'RK APACHE ', 'ROKOK', '0', '18000', '0', '18000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2610, 'GHNM2010', 'RK CLSMLD', 'ROKOK', '0', '20000', '0', '20000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2611, 'GHNM2011', 'RK DNHILL FLT', 'ROKOK', '0', '24400', '0', '24400', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2612, 'GHNM2012', 'RK DNHILL MLD', 'ROKOK', '0', '24500', '0', '24500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2613, 'GHNM2013', 'RK CLSMLD LSR', 'ROKOK', '0', '23000', '0', '23000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2614, 'GHNM2014', 'RK CLSMLD LSR', 'ROKOK', '0', '16500', '0', '16500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2615, 'GHNM2015', 'RK PENAMLD', 'ROKOK', '0', '15700', '0', '15700', 'Normal', '2022-08-17 11:01:27', 'admin', '16BTG'),
(2616, 'GHNM2016', 'RK PNDMAS', 'ROKOK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2617, 'GHNM2017', 'RK SRY PRO', 'ROKOK', '0', '21500', '0', '21500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2618, 'GHNM2018', 'RK SRY PRMLD', 'ROKOK', '0', '21000', '0', '21000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2619, 'GHNM2019', 'RK ARMA BLD', 'ROKOK', '0', '12800', '0', '12800', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2620, 'GHNM2020', 'RK DJR SPR', 'ROKOK', '0', '20600', '0', '20600', 'Normal', '2022-08-17 11:04:36', 'admin', '16BTG'),
(2621, 'GHNM2021', 'RK DJR CPP', 'ROKOK', '0', '25000', '0', '25000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2622, 'GHNM2022', 'RK ARM KRT', 'ROKOK', '0', '11000', '0', '11000', 'Normal', '2022-06-28 12:42:46', 'admin', '12BTG'),
(2626, 'GHNM2026', 'RK ZIGA ', 'ROKOK', '0', '13000', '0', '13000', 'Normal', '2022-06-09 12:25:26', 'admin', '12BTG'),
(2627, 'GHNM2027', 'RK 76 DJRM', 'ROKOK', '0', '14000', '0', '14000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2628, 'GHNM2028', 'RK APCHE KRT', 'ROKOK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2629, 'GHNM2029', 'RK CK ', 'ROKOK', '0', '15000', '0', '15000', 'Normal', '2022-06-10 12:25:15', 'admin', '12BTG'),
(2630, 'GHNM2030', 'RK GEO MLD', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-06-16 11:07:48', 'admin', '16BTG'),
(2631, 'GHNM2031', 'RK HERO BLD', 'ROKOK', '0', '14000', '0', '14000', 'Normal', '2022-06-30 09:58:29', 'admin', '12BTG'),
(2632, 'GHNM2032', 'RK NEXT', 'ROKOK', '0', '17500', '0', '17500', 'Normal', '2022-06-09 12:23:46', 'admin', '12BTG'),
(2633, 'GHNM2033', 'RK DJR SPR', 'ROKOK', '0', '20600', '0', '20600', 'Normal', '2022-08-17 11:04:36', 'admin', '12BTG'),
(2634, 'GHNM2034', 'RK HJS', 'ROKOK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '20BTG'),
(2635, 'GHNM2035', 'RK FERRO ', 'ROKOK', '0', '17000', '0', '17000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2636, 'GHNM2036', 'RK WIN ', 'ROKOK', '0', '13000', '0', '13000', 'Normal', '2022-06-28 12:42:23', 'admin', '12BTG'),
(2637, 'GHNM2037', 'RK CHAYA MLD', 'ROKOK', '0', '10500', '0', '10500', 'Normal', '2022-08-23 11:32:35', 'admin', '12BTG'),
(2638, 'GHNM2038', 'RK SMPR AGA', 'ROKOK', '0', '13600', '0', '13600', 'Normal', '2022-08-13 09:35:59', 'admin', '12BTG'),
(2639, 'GHNM2039', 'RK SCRPION ', 'ROKOK', '0', '22000', '0', '22000', 'Normal', '2022-06-10 12:32:00', 'admin', '20BTG'),
(2640, 'GHNM2040', 'RK PNA GLD', 'ROKOK', '0', '16500', '0', '16500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '20BTG'),
(2641, 'GHNM2041', 'RK HERO GNT', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-06-30 09:57:43', 'admin', '16BTG'),
(2642, 'GHNM2042', 'RK MLD BLCK', 'ROKOK', '0', '15700', '0', '15700', 'Normal', '2022-07-20 09:37:36', 'admin', '12BTG'),
(2643, 'GHNM2043', 'RK HERO BR', 'ROKOK', '0', '26000', '0', '26000', 'Normal', '2022-06-30 09:58:55', 'admin', '20BTG'),
(2644, 'GHNM2044', 'RK OEPT SPC', 'ROKOK', '0', '25000', '0', '25000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2645, 'GHNM2045', 'RK GAZE', 'ROKOK', '0', '7000', '0', '7000', 'Normal', '2022-06-09 12:18:45', 'admin', '12BTG'),
(2646, 'GHNM2046', 'RK CHIEF KRK', 'ROKOK', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2647, 'GHNM2047', 'RK 76 GLD', 'ROKOK', '0', '17500', '0', '17500', '', '2022-06-09 12:24:07', 'admin', '12BTG'),
(2648, 'GHNM2048', 'RK OEPT NE', 'ROKOK', '0', '11500', '0', '11500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2649, 'GHNM2049', 'RK MLD PTH', 'ROKOK', '0', '30300', '0', '30300', 'Normal', '2022-07-20 09:38:08', 'admin', '20BTG'),
(2650, 'GHNM2050', 'RK DJR BLCK', 'ROKOK', '0', '25000', '0', '25000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2651, 'GHNM2051', 'RK ESSE PNC', 'ROKOK', '0', '25000', '0', '25000', 'Normal', '2022-05-13 15:31:12', 'admin', '16BTG'),
(2652, 'GHNM2052', 'RK ESSE HNY', 'ROKOK', '0', '27000', '0', '27000', 'Normal', '2022-07-20 09:36:41', 'admin', '16BTG'),
(2653, 'GHNM2053', 'RK MRCPL KNG', 'ROKOK', '0', '21000', '0', '21000', 'Normal', '2022-06-30 09:58:10', 'admin', '20BTG'),
(2654, 'GHNM2054', 'RK ESSE BRRY', 'ROKOK', '0', '26000', '0', '26000', 'Normal', '2022-05-12 16:58:34', 'admin', '16BTG'),
(2655, 'GHNM2055', 'RK ESSE MNT', 'ROKOK', '0', '29000', '0', '29000', 'Normal', '2022-05-12 16:59:44', 'admin', '20BTG'),
(2656, 'GHNM2056', 'RK ESSE JC', 'ROKOK', '0', '23000', '0', '23000', 'Normal', '2022-05-13 15:30:56', 'admin', '16BTG'),
(2657, 'GHNM2057', 'RK DIPLMT ', 'ROKOK', '0', '20000', '0', '20000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2658, 'GHNM2058', 'RK DIPLMT ', 'ROKOK', '0', '25000', '0', '25000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2659, 'GHNM2059', 'RK CHIEF BL', 'ROKOK', '0', '13800', '0', '13800', 'Normal', '2022-08-13 09:38:53', 'admin', '12BTG'),
(2660, 'GHNM2060', 'RK CHYA PRO', 'ROKOK', '0', '11500', '0', '11500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2661, 'GHNM2061', 'RK SURYA', 'ROKOK', '0', '20500', '0', '20500', 'Normal', '2022-06-16 11:07:34', 'admin', '16BTG'),
(2662, 'GHNM2062', 'RK ESSE MLD', 'ROKOK', '0', '28000', '0', '28000', 'Normal', '2022-05-12 17:00:26', 'admin', '20BTG'),
(2663, 'GHNM2063', 'RK SMPR MNT', 'ROKOK', '0', '26600', '0', '26600', 'Normal', '2022-06-28 12:41:37', 'admin', '16BTG'),
(2664, 'GHNM2064', 'RK SMPR MLD', 'ROKOK', '0', '26500', '0', '26500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2665, 'GHNM2065', 'RK SMPR MLD', 'ROKOK', '0', '19000', '0', '19000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2666, 'GHNM2066', 'RK SMPR AVL', 'ROKOK', '0', '32500', '0', '32500', 'Normal', '2022-05-19 13:46:04', 'admin', '20BTG'),
(2667, 'GHNM2067', 'RK GRM DJA', 'ROKOK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2668, 'GHNM2068', 'RK MRCP MLD', 'ROKOK', '0', '16000', '0', '16000', 'Normal', '2022-06-30 09:59:28', 'admin', '16BTG'),
(2669, 'GHNM2069', 'RK LA LGHT', 'ROKOK', '0', '18700', '0', '18700', 'Normal', '2022-08-13 09:39:38', 'admin', '16BTG'),
(2670, 'GHNM2070', 'RK LA MNT', 'ROKOK', '0', '25500', '0', '25500', 'Normal', '2022-08-13 09:39:14', 'admin', '16BTG'),
(2671, 'GHNM2071', 'RK LA LGHT', 'ROKOK', '0', '18700', '0', '18700', 'Normal', '2022-08-13 09:39:38', 'admin', '12BTG'),
(2672, 'GHNM2072', 'RK MLD BLCK', 'ROKOK', '0', '15700', '0', '15700', 'Normal', '2022-07-20 09:37:36', 'admin', '16BTG'),
(2673, 'GHNM2073', 'RK MLBR MRH', 'ROKOK', '0', '32000', '0', '32000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '20BTG'),
(2674, 'GHNM2074', 'RK MLBR LGH', 'ROKOK', '0', '31000', '0', '31000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '20BTG'),
(2675, 'GHNM2075', 'RK SGNTR MLD', 'ROKOK', '0', '21500', '0', '21500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '16BTG'),
(2676, 'GHNM2076', 'RK EVO', 'ROKOK', '0', '18600', '0', '18600', 'Normal', '2022-08-23 11:32:10', 'admin', '16BTG'),
(2677, 'GHNM2077', 'RK  GG INTR', 'ROKOK', '0', '19500', '0', '19500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2678, 'GHNM2078', 'RK 76 MD HTM', 'ROKOK', '0', '13000', '0', '13000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2679, 'GHNM2079', 'RK DSS HTM', 'ROKOK', '0', '20000', '0', '20000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2680, 'GHNM2080', 'RK SMPR AGA', 'ROKOK', '0', '13600', '0', '13600', 'Normal', '2022-08-13 09:35:59', 'admin', '12BTG'),
(2681, 'GHNM2081', 'RK WAVE ', 'ROKOK', '0', '17500', '0', '17500', 'Normal', '2022-06-09 12:22:17', 'admin', '12BTG'),
(2682, 'GHNM2082', 'RK GG MRH', 'ROKOK', '0', '13500', '0', '13500', 'Normal', '2022-08-13 09:40:14', 'admin', '12BTG'),
(2683, 'GHNM2083', 'RK MRLB FB', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-08-13 09:37:46', 'admin', '20BTG'),
(2684, 'GHNM2084', 'RK MRLB FB', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-08-13 09:37:46', 'admin', '16BTG'),
(2685, 'GHNM2085', 'RK MRLB FB', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-08-13 09:37:46', 'admin', '12BTG'),
(2686, 'GHNM2086', 'RK MGN CLS', 'ROKOK', '0', '17500', '0', '17500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2687, 'GHNM2087', 'RK DSS 234', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-05-19 13:47:02', 'admin', '12BTG'),
(2688, 'GHNM2088', 'RK MGN BLCK', 'ROKOK', '0', '19000', '0', '19000', 'Normal', '2022-07-20 09:44:09', 'admin', '12BTG'),
(2689, 'GHNM2089', 'RK GG MLD', 'ROKOK', '0', '22700', '0', '22700', 'Normal', '2022-06-28 12:42:02', 'admin', '16BTG'),
(2690, 'GHNM2090', 'RK MRLB KRK', 'ROKOK', '0', '8500', '0', '8500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2691, 'GHNM2091', 'RK OEPT KRK', 'ROKOK', '0', '6900', '0', '6900', 'Normal', '2022-08-13 09:38:32', 'admin', '10BTG'),
(2692, 'GHNM2092', 'RK PENAMS', 'ROKOK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2693, 'GHNM2093', 'RK ARES KZR', 'ROKOK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2694, 'GHNM2094', 'RK ARES MND', 'ROKOK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12BTG'),
(2695, 'GHNM2095', 'GIV PPY RF', 'PERMANDI', '0', '15000', '0', '15000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '250ML'),
(2696, 'GHNM2096', 'SHZUI KR RF', 'PERMANDI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '200ML'),
(2697, 'GHNM2097', 'SHZUI MYR RF', 'PERMANDI', '0', '13500', '0', '13500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '200ML');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(2698, 'GHNM2098', 'SHZUI KNS RF', 'PERMANDI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '200ML'),
(2699, 'GHNM2099', 'SHZUI HN RF', 'PERMANDI', '0', '12500', '0', '12500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '200ML'),
(2700, 'GHNM2100', 'SHZUI KR RF', 'PERMANDI', '0', '25000', '0', '25000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '420ML'),
(2701, 'GHNM2101', 'GIV PSS RF', 'PERMANDI', '0', '24500', '0', '24500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '450ML'),
(2702, 'GHNM2102', 'GIV LLY RF', 'PERMANDI', '0', '23000', '0', '23000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '450ML'),
(2703, 'GHNM2103', 'GIV RS RF', 'PERMANDI', '0', '24000', '0', '24000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '450ML'),
(2704, 'GHNM2104', 'GIV WHT RF', 'PERMANDI', '0', '14000', '0', '14000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '250ML'),
(2705, 'GHNM2105', 'SHZUI BT MYR', 'PERMANDI', '0', '18500', '0', '18500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '250ML'),
(2706, 'GHNM2106', 'SRIAY PD SPF 15', 'KOSMETIK', '0', '23500', '0', '23500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '15G'),
(2707, 'GHNM2107', 'VIVA PD KL', 'KOSMETIK', '0', '26000', '0', '26000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2708, 'GHNM2108', 'VIVA PD NTR', 'KOSMETIK', '0', '25000', '0', '25000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2709, 'GHNM2109', 'CITR TB SKR', 'KOSMETIK', '0', '42000', '0', '42000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '40G'),
(2710, 'GHNM2110', 'CITR TB PRL', 'KOSMETIK', '0', '43000', '0', '43000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '40G'),
(2711, 'GHNM2111', 'CITR TB GT', 'KOSMETIK', '0', '42000', '0', '42000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '40G'),
(2712, 'GHNM2112', 'WRD PF LGH', 'KOSMETIK', '0', '46500', '0', '46500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2713, 'GHNM2113', 'WRD PF EXC B', 'KOSMETIK', '0', '77000', '0', '77000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2714, 'GHNM2114', 'WRD PF EXC LB', 'KOSMETIK', '0', '76000', '0', '76000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2715, 'GHNM2115', 'WRD MP LGH', 'KOSMETIK', '0', '32000', '0', '32000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '20G'),
(2716, 'GHNM2116', 'WRD PF RF LGH', 'KOSMETIK', '0', '31500', '0', '31500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2717, 'GHNM2117', 'WRD LMN RF', 'KOSMETIK', '0', '32000', '0', '32000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2718, 'GHNM2118', 'WRD EXC RF', 'KOSMETIK', '0', '45000', '0', '45000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2719, 'GHNM2119', 'PIXY PD RF', 'KOSMETIK', '0', '23000', '0', '23000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2720, 'GHNM2120', 'PRBSR MP', 'KOSMETIK', '0', '19500', '0', '19500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2721, 'GHNM2121', 'EMRN CP LV', 'KOSMETIK', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '12G'),
(2722, 'GHNM2122', 'BD MRCK CRM', 'KOSMETIK', '0', '18500', '0', '18500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '40G'),
(2723, 'GHNM2123', 'BD MRCK RS', 'KOSMETIK', '0', '17500', '0', '17500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '40G'),
(2724, 'GHNM2124', 'SRAYU LP KL', 'KOSMETIK', '0', '16900', '0', '16900', 'Normal', '2022-08-24 08:49:47', 'admin', '14G'),
(2725, 'GHNM2125', 'BD MRCK INV', 'KOSMETIK', '0', '18500', '0', '18500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '40G'),
(2726, 'GHNM2126', 'CR NVEA SMT', 'KOSMETIK', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '25ML'),
(2727, 'GHNM2127', 'CR NVEA SFT', 'KOSMETIK', '0', '9000', '0', '9000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '25ML'),
(2728, 'GHNM2128', 'SSR SZYN', 'AKSESORIS', '0', '9000', '0', '9000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2729, 'GHNM2129', 'SSR LMEI ', 'AKSESORIS', '0', '12000', '0', '12000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2730, 'GHNM2130', 'DT BBY HK', 'AKSESORIS', '0', '35000', '0', '35000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2731, 'GHNM2131', 'SSR KCA BND', 'AKSESORIS', '0', '8000', '0', '8000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2732, 'GHNM2132', 'KCA BSR LV Y', 'AKSESORIS', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2733, 'GHNM2133', 'EYLSH CRL', 'AKSESORIS', '0', '10000', '0', '10000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2734, 'GHNM2134', 'DOT NNIO', 'AKSESORIS', '0', '7000', '0', '7000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2735, 'GHNM2135', 'KS KSMT MEI', 'AKSESORIS', '0', '9000', '0', '9000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2736, 'GHNM2136', 'SPON BDK', 'AKSESORIS', '0', '2500', '0', '2500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '1PCS'),
(2737, 'GHNM2137', 'PRENGN MNYS', 'SUSU', '0', '42000', '0', '42000', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '200G'),
(2738, 'GHNM2138', 'SGM 3+ VN', 'SUSU', '0', '76900', '0', '76900', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '900G'),
(2739, 'GHNM2139', 'SGM ANA 6-12', 'SUSU', '0', '58800', '0', '58800', 'Normal', '2022-06-28 12:30:06', 'admin', '600G'),
(2740, 'GHNM2140', 'SGM 3+ VN', 'SUSU', '0', '39500', '0', '39500', 'NORMAL', '2022-04-15 00:00:00', 'Admin', '400G'),
(2741, 'GHNM2141', 'SGM ANA 0-6', 'SUSU', '0', '92000', '0', '92000', 'Normal', '2022-06-03 12:17:08', 'admin', '400G'),
(2743, '1343', 'KK YSL HT', 'SERAGAM', '0', '9000', '0', '9000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2744, '1345', 'KK EXCTV BLC', 'SERAGAM', '0', '10000', '0', '10000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2745, '1346', 'KK BBY ANTSL', 'SERAGAM', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2746, '1364', 'KKBTS HTMSD', 'SERAGAM', '0', '9000', '0', '9000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2747, '1365', 'KKBTS PTHMP', 'SERAGAM', '0', '8500', '0', '8500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2748, '1366', 'KKBTS PTHMA', 'SERAGAM', '0', '10000', '0', '10000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2749, '1178966', 'KK HTM SMA', 'SERAGAM', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2750, '4566823', 'KK OH BBY', 'SERAGAM', '0', '11000', '0', '11000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2751, '5644325', 'KK ANK QISHN', 'SERAGAM', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2752, '5645542', 'KK PTH SMA', 'SERAGAM', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2753, '5655002', 'KT KLI HTM', 'SERAGAM', '0', '6000', '0', '6000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2754, '5655828', 'KT KULI', 'SERAGAM', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2755, '8556587', 'KK HAJI MTF', 'SERAGAM', '0', '13000', '0', '13000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2756, '8556588', 'KK FLTON MTF', 'SERAGAM', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2757, '8556590', 'KK WLLUP CRM', 'SERAGAM', '0', '25000', '0', '25000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2758, '8556591', 'KK IJTHD TQW', 'SERAGAM', '0', '23000', '0', '23000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2759, '8556592', 'KK PTH SD', 'SERAGAM', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2760, '8556593', 'KK VTR HTSMP', 'SERAGAM', '0', '8000', '0', '8000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2761, '8556594', 'KK VTR HTSMA', 'SERAGAM', '0', '10000', '0', '10000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2762, '8556595', 'KK SPRT NKE', 'SERAGAM', '0', '15800', '0', '15800', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2763, '8556596', 'KK HJIE SPR', 'SERAGAM', '0', '13000', '0', '13000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2764, '8556597', 'KK SPRT HAO', 'SERAGAM', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2765, '8556598', 'KT SKNH HT', 'SERAGAM', '0', '12800', '0', '12800', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2766, '8855645', 'KT PLST', 'SERAGAM', '0', '6000', '0', '6000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2767, 'GHNM2142', 'HB LOVLY GLW', 'SKINCARE', '0', '9000', '0', '9000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '200ML'),
(2768, 'GHNM2143', 'HB LOVLY NB', 'SKINCARE', '0', '8000', '0', '8000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '200ML'),
(2769, 'GHNM2144', 'HB LOVLY MB', 'SKINCARE', '0', '8000', '0', '8000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '200ML'),
(2770, 'GHNM2145', 'HB HNSUI MLK', 'SKINCARE', '0', '16500', '0', '16500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '240ML'),
(2771, 'GHNM2146', 'HB NVEA NG BS', 'SKINCARE', '0', '42400', '0', '42400', 'Normal', '2022-06-10 12:41:11', 'admin', '180ML'),
(2772, 'GHNM2147', 'HB SHNZ KR', 'SKINCARE', '0', '21800', '0', '21800', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '210ML'),
(2773, 'GHNM2148', 'HB SHNZ SKR', 'SKINCARE', '0', '21800', '0', '21800', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '210ML'),
(2774, 'GHNM2149', 'FAIR LV FW VITC', 'SKINCARE', '0', '26000', '0', '26000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2775, 'GHNM2150', 'FAIR GL CRM', 'SKINCARE', '0', '31000', '0', '31000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '50G'),
(2776, 'GHNM2151', 'VVA FT MWR', 'SKINCARE', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2777, 'GHNM2152', 'GTSB FW OILC', 'SKINCARE', '0', '23500', '0', '23500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2778, 'GHNM2153', 'LM HRB STR', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2779, 'GHNM2154', 'LM HRB BKG', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2780, 'GHNM2155', 'LM HRB RS', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2781, 'GHNM2156', 'LM HRB GT', 'SKINCARE', '0', '14500', '0', '14500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2782, 'GHNM2157', 'LM HRB MLK', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2783, 'GHNM2158', 'LM HRB CHO', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2784, 'GHNM2159', 'GTSBY SLID BL ', 'SKINCARE', '0', '7500', '0', '7500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '25G'),
(2785, 'GHNM2160', 'GTSBY MSSY', 'SKINCARE', '0', '7500', '0', '7500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '25G'),
(2786, 'GHNM2161', 'GTSBY HYP QF', 'SKINCARE', '0', '7500', '0', '7500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '25G'),
(2787, 'GHNM2162', 'GTSBY TGH SPK', 'SKINCARE', '0', '7500', '0', '7500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '25G'),
(2788, 'GHNM2163', 'PANT CON HL', 'SKINCARE', '0', '24500', '0', '24500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '130ML'),
(2789, 'GHNM2164', 'PANT CON RTK', 'SKINCARE', '0', '14800', '0', '14800', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '75ML'),
(2790, 'GHNM2165', 'PANT CON RSK', 'SKINCARE', '0', '14800', '0', '14800', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '75ML'),
(2791, 'GHNM2166', 'REJC CON RCH', 'SKINCARE', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '70ML'),
(2792, 'GHNM2167', 'PNTEN CON BTN', 'SKINCARE', '0', '16500', '0', '16500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '70ML'),
(2793, 'GHNM2168', 'PNTEN CON COL', 'SKINCARE', '0', '15500', '0', '15500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '70ML'),
(2794, 'GHNM2169', 'ECHAN TRS NL', 'PARFUM', '0', '22000', '0', '22000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2795, 'GHNM2170', 'ECHAN CHR NL', 'PARFUM', '0', '22000', '0', '22000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2796, 'GHNM2171', 'ECHAN MRC NL', 'PARFUM', '0', '22000', '0', '22000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2797, 'GHNM2172', 'ECHAN SNT NL', 'PARFUM', '0', '22000', '0', '22000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2798, 'GHNM2173', 'RMANO MN UN', 'PARFUM', '0', '17500', '0', '17500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2799, 'GHNM2174', 'RMANO MN AMB', 'PARFUM', '0', '17500', '0', '17500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2800, 'GHNM2175', 'RGZZ DEO PRT', 'PARFUM', '0', '19000', '0', '19000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2801, 'GHNM2176', 'RGZZ DEO PSS', 'PARFUM', '0', '19000', '0', '19000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100ML'),
(2802, 'GHNM2177', 'BLGIO EDT VNT', 'PERANAK', '0', '21500', '0', '21500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '50ML'),
(2803, 'GHNM2178', 'BT PGN 240ML', 'PERANAK', '0', '36000', '0', '36000', 'Normal', '2022-04-23 15:39:27', 'admin', '1PCS'),
(2804, 'GHNM2179', 'BT PGN 120ML', 'PERANAK', '0', '34500', '0', '34500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2805, 'GHNM2180', 'BT PGN 50ML', 'PERANAK', '0', '32500', '0', '32500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2806, 'GHNM2181', 'PMP SSU RL', 'PERANAK', '0', '22500', '0', '22500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2807, 'GHNM2182', 'PMP SSU MMI', 'PERANAK', '0', '17500', '0', '17500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2808, 'GHNM2183', 'SKAT NAGYA ', 'PERMANDI', '0', '8500', '0', '8500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2809, 'GHNM2184', 'SKAT CC MD104', 'PERMANDI', '0', '7500', '0', '7500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2810, 'GHNM2185', 'PEPS KDS STR', 'PERMANDI', '0', '6500', '0', '6500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '50G'),
(2811, 'GHNM2186', 'TEH KTK GRTEA', 'MINSERBUK', '0', '13000', '0', '13000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '60G'),
(2812, 'GHNM2187', 'KRFT MELT', 'MINSERBUK', '0', '26500', '0', '26500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '165G'),
(2813, 'GHNM2188', 'AMUNIZER KTK', 'MINSERBUK', '0', '12500', '0', '12500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '45G'),
(2814, 'GHNM2189', 'ETHZ PDS MNG', 'MINSERBUK', '0', '7500', '0', '7500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2815, 'GHNM2190', 'MSTR MYONS', 'MINSERBUK', '0', '8500', '0', '8500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '180G'),
(2816, 'GHNM2191', 'MYVLA COK', 'MINSERBUK', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '63G'),
(2817, 'GHNM2192', 'ENTRSL VN', 'MINSERBUK', '0', '26500', '0', '26500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2818, 'GHNM2193', 'NUTRI KLP MD', 'MINSERBUK', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2819, 'GHNM2194', 'NUTRI MLK ORG', 'MINSERBUK', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2820, 'GHNM2195', 'NUTRI LMN TEA', 'MINSERBUK', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2821, 'GHNM2196', 'NUTRI BLWH', 'MINSERBUK', '0', '11500', '0', '11500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2822, 'GHNM2197', 'NUTRI MD LMN', 'MINSERBUK', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2823, 'GHNM2198', 'NUTRI MNG GND', 'MINSERBUK', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2824, 'GHNM2199', 'HILO AVC CHO', 'MINSERBUK', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2825, 'GHNM2200', 'HILO CHO BNN', 'MINSERBUK', '0', '14000', '0', '14000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2826, 'GHNM2201', 'HILO ES TLR', 'MINSERBUK', '0', '17000', '0', '17000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2827, 'GHNM2202', 'HILO CHO', 'MINSERBUK', '0', '14000', '0', '14000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2828, 'GHNM2203', 'HILO CHO TRO', 'MINSERBUK', '0', '12500', '0', '12500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2829, 'GHNM2204', 'FITRI MGRIN', 'SEMBAKO', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '200G'),
(2830, 'GHNM2205', 'SDAP CP AYMJR', 'SEMBAKO', '0', '4500', '0', '4500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '75G'),
(2831, 'GHNM2206', 'SDAP CP BSBLD', 'SEMBAKO', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '77G'),
(2832, 'GHNM2207', 'ABC CP PDSLM', 'SEMBAKO', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '80G'),
(2833, 'GHNM2208', 'INDM AYM GPR', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-07-18 10:41:27', 'admin', '85G'),
(2834, 'GHNM2209', 'INDM PDS', 'SEMBAKO', '0', '3000', '0', '3000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '79G'),
(2835, 'GHNM2210', 'INDM KLDAYM', 'SEMBAKO', '0', '3000', '0', '3000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '75G'),
(2836, 'GHNM2211', 'INDM BNJR', 'SEMBAKO', '0', '3000', '0', '3000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '75G'),
(2837, 'GHNM2212', 'ABC MI GRG', 'SEMBAKO', '0', '2500', '0', '2500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '70G'),
(2838, 'GHNM2213', 'MI BNCBE LV15', 'SEMBAKO', '0', '6500', '0', '6500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '105G'),
(2839, 'GHNM2214', 'SDAP INS PDG', 'SEMBAKO', '0', '3000', '0', '3000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '86G'),
(2840, 'GHNM2215', 'CHYNT BSRG ', 'MAKANAN', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '80G'),
(2841, 'GHNM2216', 'DP KRP TLS', 'MAKANAN', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2842, 'GHNM2217', 'DP KRP SNK', 'MAKANAN', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2843, 'GHNM2218', 'DP KRP LBILA', 'MAKANAN', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2844, 'GHNM2219', 'DP KRP SNKPD', 'MAKANAN', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '100G'),
(2845, 'GHNM2220', 'HPPYTS MRH', 'MAKANAN', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '160G'),
(2846, 'GHNM2221', 'HPPYTS HJ', 'MAKANAN', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '160G'),
(2847, 'GHNM2222', 'FRNCH F 2000', 'MAKANAN', '0', '13800', '0', '13800', 'Normal', '2022-08-04 10:21:21', 'admin', '62G'),
(2848, 'GHNM2223', 'FRNCH F 2000', 'MAKANAN', '0', '13800', '0', '13800', 'Normal', '2022-08-04 10:21:21', 'admin', '24G'),
(2849, 'GHNM2224', 'FRNCH F 2000', 'MAKANAN', '0', '13800', '0', '13800', 'Normal', '2022-08-04 10:21:21', 'admin', '138G'),
(2850, 'GHNM2225', 'MLK CHO PRT', 'MAKANAN', '0', '5000', '0', '5000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2851, 'GHNM2226', 'TKN SHET SPC', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-07-17 21:32:14', 'admin', '32G'),
(2852, 'GHNM2227', 'TKN SHET CLS', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-07-17 21:31:29', 'admin', '32G'),
(2853, 'GHNM2228', 'TKN SHET JPN', 'MAKANAN', '0', '5500', '0', '5500', 'Normal', '2022-07-17 21:31:51', 'admin', '32G'),
(2854, 'GHNM2229', 'TKN BRLL SPC', 'MAKANAN', '0', '6500', '0', '6500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '36G'),
(2855, 'GHNM2230', 'NTT CHO WFR', 'MAKANAN', '0', '10500', '0', '10500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1RTG'),
(2856, 'GHNM2231', 'KRFT CHEDDR', 'SEMBAKO', '0', '23500', '0', '23500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '160G'),
(2857, 'GHNM2232', 'PRING SET 331', 'PERANAK', '0', '22500', '0', '22500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2858, 'GHNM2233', 'PRING SET 332', 'PERANAK', '0', '20000', '0', '20000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2859, 'GHNM2234', 'PRING SET 353', 'PERANAK', '0', '25000', '0', '25000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2860, 'GHNM2235', 'PRING SET 329', 'PERANAK', '0', '21000', '0', '21000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2861, 'GHNM2236', 'WH KUE PSLJ', 'MAKANAN', '0', '26000', '0', '26000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2862, 'GHNM2237', 'WH KUE KCG', 'MAKANAN', '0', '25500', '0', '25500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2863, 'GHNM2238', 'WH KUE BLCK', 'MAKANAN', '0', '25000', '0', '25000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2864, 'GHNM2239', 'KK ANK PITA', 'SERAGAM', '0', '29000', '0', '29000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '3PCS'),
(2865, 'GHNM2240', 'KK ANK BNK', 'SERAGAM', '0', '26500', '0', '26500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '3PCS'),
(2866, 'GHNM2241', 'KK ANK LPT', 'SERAGAM', '0', '19500', '0', '19500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '3PCS'),
(2867, 'GHNM2242', 'KK KANIK CRM', 'SERAGAM', '0', '15000', '0', '15000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2868, 'GHNM2243', 'KK PLBTY CMF', 'SERAGAM', '0', '14000', '0', '14000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2869, 'GHNM2244', 'KK QISHN 996', 'SERAGAM', '0', '13500', '0', '13500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2870, 'GHNM2245', 'KK SPRT BRG', 'SERAGAM', '0', '18000', '0', '18000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2871, 'GHNM2246', 'KK PLBTY 122', 'SERAGAM', '0', '12000', '0', '12000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2872, 'GHNM2247', 'KK QISHN 525', 'SERAGAM', '0', '13000', '0', '13000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2873, 'GHNM2248', 'KK SOKA CRM', 'SERAGAM', '0', '16900', '0', '16900', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2874, 'GHNM2249', 'KK QSH 8020', 'SERAGAM', '0', '13000', '0', '13000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2875, 'GHNM2250', 'KK NKE K08', 'SERAGAM', '0', '18000', '0', '18000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2876, 'GHNM2251', 'KK GXN 1-4', 'SERAGAM', '0', '7000', '0', '7000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2877, 'GHNM2252', 'RK SURYA', 'ROKOK', '0', '20500', '0', '20500', 'Normal', '2022-06-16 11:07:34', 'admin', '12BTG'),
(2878, 'GHNM2253', 'RK WIN', 'ROKOK', '0', '13000', '0', '13000', 'Normal', '2022-06-28 12:42:23', 'admin', '12BTG'),
(2879, 'GHNM2254', 'RK OE BLD', 'ROKOK', '0', '20500', '0', '20500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '20BTG'),
(2880, 'GHNM2255', 'KSUR LPT BNK', 'PERANAK', '0', '125000', '0', '125000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1PCS'),
(2881, 'GHNM2256', 'ND COCO STR', 'PERANAK', '0', '15000', '0', '15000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '1000G'),
(2882, 'GHNM2257', 'JLLY LCK BLL', 'PERANAK', '0', '9000', '0', '9000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '500G'),
(2883, 'GHNM2258', 'RW SMB HT', 'SEMBAKO', '0', '4500', '0', '4500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '30ML'),
(2884, 'GHNM2259', 'RW SMB UNG', 'SEMBAKO', '0', '4500', '0', '4500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '30ML'),
(2885, 'GHNM2260', 'RW SMB HTM', 'SEMBAKO', '0', '4500', '0', '4500', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '30ML'),
(2886, 'GHNM2261', 'KOEP SMB BR', 'SEMBAKO', '0', '4000', '0', '4000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '30ML'),
(2887, 'GHNM2262', 'KOEP SMB KT', 'SEMBAKO', '0', '4000', '0', '4000', 'NORMAL', '0000-00-00 00:00:00', 'Admin', '30ML'),
(2889, 'GHM2889', 'MG AMGO RF ', 'SEMBAKO', '', '12500', '1500', '11000', 'Promo', '2022-08-23 14:59:00', 'admin', '450ML'),
(2890, 'GHM2890', 'MG ALCO RF', 'SEMBAKO', '', '24000', '2000', '22000', 'Promo', '2022-08-23 15:01:10', 'admin', '1000ML'),
(2891, 'GHM2891', 'MG PERSHBT BT', 'SEMBAKO', '', '26000', '4500', '21500', 'Promo', '2022-08-23 14:58:12', 'admin', '900ML'),
(2892, 'GHM2892', 'MG ALCO BT', 'SEMBAKO', '', '25000', '2500', '22500', 'Promo', '2022-08-23 14:57:13', 'admin', '1L'),
(2893, 'GHM2893', 'KRMER KLG', 'SEMBAKO', '', '12000', '0', '12000', 'Normal', '2022-04-21 20:48:50', 'admin', '500G'),
(2894, 'GHM2894', 'ENAAK KLG', 'SEMBAKO', '', '10000', '0', '10000', 'Normal', '2022-04-21 20:49:09', 'admin', '375G'),
(2895, 'GHM2895', 'MLK SPI KLG', 'SEMBAKO', '', '9000', '0', '9000', 'Normal', '2022-04-21 20:49:34', 'admin', '375G'),
(2896, 'GHM2896', 'DIAMN UHT FC', 'MINUMAN', '', '18500', '0', '18500', 'Normal', '2022-04-21 20:50:02', 'admin', '1L'),
(2897, 'GHM2897', 'ULTRA UHT CK', 'MINUMAN', '', '18500', '0', '18500', 'Normal', '2022-04-21 20:50:35', 'admin', '1000ML'),
(2898, 'GHM2898', 'MAXICRN  BBQ ', 'ROTI/SNACK/Camilan', '0', '5500', '0', '5500', 'Normal', '2022-04-23 14:51:29', 'admin', '55G'),
(2899, 'GHM2899', 'CHITATO OR ASL', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-08-09 12:55:44', 'admin', '68G'),
(2900, 'GHM2900', 'NBATI CHO PAK', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-04-23 14:57:59', 'admin', '120G'),
(2901, 'GHM2901', 'REBO MLK ', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-23 14:59:45', 'admin', '70G'),
(2902, 'GHM2902', 'CHORY STR', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-04-23 15:01:46', 'admin', '200G'),
(2903, 'GHM2903', 'KC KORO PDS', 'ROTI/SNACK/Camilan', '0', '8800', '0', '8800', 'Normal', '2022-04-23 15:03:43', 'admin', '65G'),
(2904, 'GHM2904', 'PIATTOS AY GRG ', 'ACCESSORIES', '0', '9500', '0', '9500', 'Normal', '2022-04-23 15:05:31', 'admin', '75G'),
(2905, 'GHM2905', 'CHIKI NT BBQ', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-04-23 15:06:22', 'admin', '65G'),
(2906, 'GHM2906', 'CHITATO PRT', 'ROTI/SNACK/Camilan', '0', '20000', '0', '20000', 'Normal', '2022-04-23 15:08:55', 'admin', '168G'),
(2908, 'GHM2908', 'LARUTN LM KLG', 'ROTI/SNACK/Camilan', '0', '5500', '0', '5500', 'Normal', '2022-04-23 15:11:18', 'admin', '320ML'),
(2909, 'GHM2909', 'LASEGR JNPS KLG', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-04-23 15:12:13', 'admin', '320ML'),
(2910, 'GHM2910', 'GOLDEN SPR ', 'MINUMAN', '0', '9500', '0', '9500', 'Normal', '2022-04-23 15:13:40', 'admin', '320ML'),
(2911, 'GHM2911', 'INDMLK KD VN', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-04-23 15:14:40', 'admin', '115ML'),
(2912, 'GHM2912', 'INDMLK KD ST', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-04-23 15:15:18', 'admin', '115ML'),
(2913, 'GHM2913', 'INDMLK KD CK', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-04-23 15:15:50', 'admin', '115ML'),
(2914, 'GHM2914', 'CCA COLA ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-04-23 15:16:55', 'admin', '250ML'),
(2915, 'GHM2915', 'GD DAY CPP', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-04-23 15:18:06', 'admin', '250ML'),
(2916, 'GHM2916', 'GD DAY MCA', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-04-23 15:18:46', 'admin', '250ML'),
(2917, 'GHM2917', 'SOYNCE ORI', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-04-23 15:19:54', 'admin', '320ML'),
(2918, 'GHM2918', 'COCOBT KLP', 'MINUMAN', '0', '6000', '', '6000', 'Normal', '2022-04-23 15:20:41', 'admin', '350ML'),
(2919, 'GHM2919', 'PNCHOS PDS', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-04-23 15:24:27', 'admin', '145G'),
(2920, 'GHM2920', 'JPOTA AYM BW', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-23 15:33:34', 'admin', '68G'),
(2921, 'GHM2921', 'QTELA JMB OR', 'ROTI/SNACK/Camilan', '0', '13500', '0', '13500', 'Normal', '2022-04-23 15:35:47', 'admin', '180G'),
(2922, 'GHM2922', 'QTELA JMB BBQ', 'ROTI/SNACK/Camilan', '0', '13500', '0', '13500', 'Normal', '2022-04-23 15:36:45', 'admin', '180G'),
(2923, 'GHM2923', 'VANVIN TBS ', 'POPOK/PERLENGKAPAN ( Bayi', '0', '13500', '0', '13500', 'Normal', '2022-04-23 15:44:51', 'admin', '130'),
(2924, 'GHM2924', 'VANVIN TB', 'POPOK/PERLENGKAPAN ( Bayi', '0', '14000', '0', '14000', 'Normal', '2022-04-23 15:45:50', 'admin', '150'),
(2925, 'GHM2925', 'RK DJS 234', 'ROKOK', '0', '23500', '0', '23500', 'Normal', '2022-05-19 13:47:30', 'admin', '16BTG'),
(2926, 'GHM2926', 'RK MGN  MLD', 'ROKOK', '0', '21500', '0', '21500', 'Normal', '2022-04-23 15:48:14', 'admin', '16BTG'),
(2927, 'GHM2927', 'KOPYA PRS TAC', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '62000', '0', '62000', 'Normal', '2022-04-23 16:26:39', 'admin', '1PCS'),
(2928, 'GHM2928', 'KOPYA PRS AC', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '65000', '0', '65000', 'Normal', '2022-04-23 16:27:16', 'admin', '1PCS'),
(2929, 'GHM2929', 'KOPYA SBR TAC', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '35000', '0', '35000', 'Normal', '2022-04-23 16:27:54', 'admin', '1PCS'),
(2930, 'GHM2930', 'KOPYA SBR AC', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '37000', '0', '37000', 'Normal', '2022-04-23 16:28:24', 'admin', '1PCS'),
(2931, 'GHM2931', 'KOPYA NU EMS', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '40000', '0', '40000', 'Normal', '2022-04-23 19:17:37', 'admin', '1PCS'),
(2932, 'GHM2932', 'MNGK MLN', 'POPOK/PERLENGKAPAN ( Bayi', '0', '10000', '0', '10000', 'Normal', '2022-04-23 19:23:36', 'admin', '1PCS'),
(2933, 'GHM2933', 'INDOMLK BT STR', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-04-23 21:07:04', 'admin', '190ML'),
(2934, 'GHM2934', 'LASEGR JR KLG', 'MINUMAN', '0', '5800', '0', '5800', 'Normal', '2022-04-23 21:12:04', 'admin', '320ML'),
(2935, 'GHM2935', 'PNDA BRD KLG', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-04-23 21:12:40', 'admin', '310ML'),
(2936, 'GHM2936', 'KANZLR SGL HOT ', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:57:08', 'admin', '65G'),
(2937, 'GHM2937', 'KPK LCKY DAY ', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-04-23 21:15:28', 'admin', '180ML'),
(2938, 'GHM2938', 'JEPT MARCELLA', 'ACCESSORIES', '0', '4000', '0', '4000', 'Normal', '2022-04-23 21:16:26', 'admin', '1PCS'),
(2939, 'GHM2939', 'JPET KUPU', 'ACCESSORIES', '0', '5500', '0', '5500', 'Normal', '2022-04-23 21:17:06', 'admin', '1PCS'),
(2940, 'GHM2940', 'JPIT DBL', 'ACCESSORIES', '0', '5000', '0', '5000', 'Normal', '2022-04-23 21:18:23', 'admin', '2PCS'),
(2941, 'GHM2941', 'JPIT BOLA WRN', 'ACCESSORIES', '0', '2000', '0', '2000', 'Normal', '2022-04-23 21:19:00', 'admin', '1PCS'),
(2942, 'GHM2942', 'PROMN BM', 'SUSU BUBUK/SUSU CAIR', '0', '13500', '0', '13500', 'Normal', '2022-04-23 21:48:47', 'admin', '120G'),
(2943, 'GHM2943', 'PROMN DGBRK', 'SUSU BUBUK/SUSU CAIR', '0', '16500', '0', '16500', 'Normal', '2022-04-23 21:49:46', 'admin', '120G'),
(2944, 'GHM2944', 'PROMN AKKPLO', 'SUSU BUBUK/SUSU CAIR', '0', '16000', '0', '16000', 'Normal', '2022-04-23 21:50:55', 'admin', '100G'),
(2945, 'GHM2945', 'MILNA SAW', 'SUSU BUBUK/SUSU CAIR', '0', '17000', '0', '17000', 'Normal', '2022-04-23 21:51:31', 'admin', '120G'),
(2946, 'GHM2946', 'MILNA THAB', 'SUSU BUBUK/SUSU CAIR', '0', '16500', '0', '16500', 'Normal', '2022-04-23 21:52:09', 'admin', '120G'),
(2947, 'GHM2947', 'PRENGN EMS COK ', 'SUSU BUBUK/SUSU CAIR', '0', '42000', '0', '42000', 'Normal', '2022-04-27 13:57:18', 'admin', '200G'),
(2948, 'GHM2948', 'PRENGN EMS VN', 'ACCESSORIES', '0', '45400', '0', '45400', 'Normal', '2022-06-28 12:20:20', 'admin', '200G'),
(2949, 'GHM2949', 'RK PENA GLD', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-04-27 14:59:20', 'admin', '20BTG'),
(2950, 'GHM2950', 'SH KDMO ORG', 'PERLENGKAPAN MANDI', '0', '13500', '0', '13500', 'Normal', '2022-04-27 15:02:59', 'admin', '200ML'),
(2951, 'GHM2951', 'SH KDMO STR', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '13500', '0', '13500', 'Normal', '2022-04-27 15:04:26', 'admin', '200ML'),
(2952, 'GHM2952', 'ESK KDS DNL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '8500', '0', '8500', 'Normal', '2022-04-27 15:07:03', 'admin', '100ML'),
(2953, 'GHM2953', 'ESK KDS MCK', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '8500', '0', '8500', 'Normal', '2022-04-27 15:07:35', 'admin', '100ML'),
(2954, 'GHM2954', 'ESK KDS MNNIE', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '8500', '0', '8500', 'Normal', '2022-04-27 15:08:17', 'admin', '100ML'),
(2955, 'GHM2955', 'FRES HJB DQ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-04-27 15:10:13', 'admin', '100ML'),
(2956, 'GHM2956', 'FRES DSS BRRY', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-04-27 15:10:57', 'admin', '100ML'),
(2957, 'GHM2957', 'FRES HJB MS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-04-27 15:11:23', 'admin', '100ML'),
(2958, 'GHM2958', 'FRES MUSE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-04-27 15:12:00', 'admin', '100ML'),
(2959, 'GHM2959', 'FRES DSS CPCKE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-04-27 15:12:36', 'admin', '100ML'),
(2960, 'GHM2960', 'ESK GL FRD', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9200', '0', '9200', 'Normal', '2022-06-03 19:31:17', 'admin', '50ML'),
(2961, 'GHM2961', 'VITLS HNL ESC', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18000', '0', '18000', 'Normal', '2022-04-27 15:14:51', 'admin', '100ML'),
(2962, 'GHM2962', 'VCTRIA BS ZDA', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '19300', '0', '19300', 'Normal', '2022-04-27 15:15:26', 'admin', '120ML'),
(2963, 'GHM2963', 'PUCLLE BS LC', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20500', '0', '20500', 'Normal', '2022-04-27 15:16:10', 'admin', '150ML'),
(2964, 'GHM2964', 'PUCLLE BS GLT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20500', '0', '20500', 'Normal', '2022-04-27 15:16:48', 'admin', '150ML'),
(2965, 'GHM2965', 'PUCLLE BS DNT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20500', '0', '20500', 'Normal', '2022-04-27 15:17:21', 'admin', '150ML'),
(2966, 'GHM2966', 'FRS FLG CK ', 'SUSU BUBUK/SUSU CAIR', '0', '8000', '0', '8000', 'Normal', '2022-04-27 15:37:41', 'admin', '1RTG'),
(2967, 'GHM2967', 'GERY PST', 'PERMEN/COKLAT', '0', '1500', '0', '1500', 'Normal', '2022-04-27 15:38:35', 'admin', '7G'),
(2968, 'GHM2968', 'CHA PNT', 'PERMEN/COKLAT', '0', '8500', '0', '8500', 'Normal', '2022-04-27 15:39:12', 'admin', '50G'),
(2969, 'GHM2969', 'CHA COK', 'PERMEN/COKLAT', '0', '8500', '0', '8500', 'Normal', '2022-04-27 15:39:53', 'admin', '50G'),
(2970, 'GHM2970', 'INDMIE GR', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-04-27 15:40:44', 'admin', '85G'),
(2971, 'GHM2971', 'SEDAP KRI SPS', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-04-27 15:41:17', 'admin', '76G'),
(2972, 'GHM2972', 'TP MAIZENA', 'SEMBAKO', '0', '7000', '0', '7000', 'Normal', '2022-04-27 15:41:53', 'admin', '300G'),
(2973, 'GHM2973', 'TP SGTIGA BR', 'SEMBAKO', '0', '7300', '0', '7300', 'Normal', '2022-08-13 09:48:25', 'admin', '500G'),
(2974, 'GHM2974', 'SRIGNT COK', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-04-27 15:44:27', 'admin', '6G'),
(2975, 'GHM2975', 'SRIGNT MRH', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-04-27 15:44:59', 'admin', '6G'),
(2976, 'GHM2976', 'SRIGNT HJ', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-04-27 15:45:32', 'admin', '6G'),
(2977, 'GHM2977', 'MLK OLZ PRT', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-04-27 15:47:46', 'admin', '1RTG'),
(2978, 'GHM2978', 'SJIKU IKN GR', 'SEMBAKO', '0', '2800', '0', '2800', 'Normal', '2022-04-27 15:50:14', 'admin', '18G'),
(2979, 'GHM2979', 'SMB FRD CHIC', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-04-27 15:50:47', 'admin', '1RTG'),
(2980, 'GHM2980', 'POCRI SWT', 'MINUMAN', '0', '13500', '0', '13500', 'Normal', '2022-04-27 20:30:42', 'admin', '900ML'),
(2981, 'GHM2981', 'LABINI ', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-04-27 20:31:22', 'admin', '1500ML'),
(2982, 'GHM2982', 'AQUCUI', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-04-27 20:32:59', 'admin', '1500ML'),
(2983, 'GHM2983', 'AIR GH', 'MINUMAN', '0', '2000', '0', '2000', 'Normal', '2022-05-19 15:57:10', 'admin', '600ML'),
(2984, 'GHM2984', 'ULTRA UHT FC', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-04-27 20:34:38', 'admin', '200ML'),
(2985, 'GHM2985', 'CMORY UHT ALM', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-04-27 20:36:25', 'admin', '250ML'),
(2986, 'GHM2986', 'MADU MRN SMB', 'OBAT', '0', '200000', '0', '200000', 'Normal', '2022-04-27 20:37:21', 'admin', '630ML'),
(2987, 'GHM2987', 'PTBEE AYM BKR', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:38:10', 'admin', '68G'),
(2988, 'GHM2988', 'NBATI RICHO 130G', 'ROTI/SNACK/Camilan', '0', '5500', '0', '5500', 'Normal', '2022-04-27 20:51:37', 'admin', '130G'),
(2989, 'GHM2989', 'NUTRI STR', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-04-27 20:52:51', 'admin', '10G'),
(2990, 'GHM2990', 'GREN TEA DJG', 'MINUMAN', '0', '13000', '0', '13000', 'Normal', '2022-04-27 20:53:40', 'admin', '60G'),
(2991, 'GHM2991', 'TEH POCI VN', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-04-27 20:54:11', 'admin', '50G'),
(2992, 'GHM2992', 'GOOD DY MCA', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-04-27 20:54:47', 'admin', '250ML'),
(2993, 'GHM2993', 'GOOD DY ORI', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-04-27 20:55:19', 'admin', '250ML'),
(2994, 'GHM2994', 'KNZLER SNG ORI', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:56:01', 'admin', '65G'),
(2995, 'GHM2995', 'KNZLER SNG KJ', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:56:27', 'admin', '65G'),
(2996, 'GHM2996', 'KNZLER BKS OR', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:57:41', 'admin', '48G'),
(2997, 'GHM2997', 'KANZLER BS KJ', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:58:38', 'admin', '48G'),
(2998, 'GHM2998', 'KNZLER MNI', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-04-27 20:59:39', 'admin', '65G'),
(2999, 'GHM2999', 'GTSBY WG 3', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '11000', '0', '11000', 'Normal', '2022-04-27 21:00:13', 'admin', '100G'),
(3000, 'GHM3000', 'GTSBY WG 2', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '11000', '0', '11000', 'Normal', '2022-04-27 21:00:50', 'admin', '100G'),
(3001, 'GHM3001', 'FRES NTR PNK', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9000', '0', '9000', 'Normal', '2022-04-27 21:02:01', 'admin', '70ML'),
(3002, 'GHM3002', 'MTU WPS', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '10000', '0', '10000', 'Normal', '2022-04-27 21:03:03', 'admin', '50S'),
(3003, 'GHM3003', 'CSSON WPS SS', 'TISU/PEMBALUT', '0', '8500', '0', '8500', 'Normal', '2022-08-17 10:49:03', 'admin', '50S'),
(3004, 'GHM3004', 'CUSSN WPS FN', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-08-17 10:49:31', 'admin', '50S'),
(3005, 'GHM3005', 'CUSSN WPS NTR', 'TISU/PEMBALUT', '0', '8500', '0', '8500', 'Normal', '2022-08-17 10:49:55', 'admin', '50S'),
(3006, 'GHM3006', 'CUSSN WPS PRT', 'TISU/PEMBALUT', '0', '10000', '0', '10000', 'Normal', '2022-08-17 10:50:25', 'admin', '50S'),
(3007, 'GHM3007', 'CASBLNC SPR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13500', '0', '13500', 'Normal', '2022-04-27 21:07:40', 'admin', '100ML'),
(3008, 'GHM3008', 'SCRNCIE JMB', 'ACCESSORIES', '0', '20000', '0', '20000', 'Normal', '2022-04-29 22:36:44', 'admin', '1PCS'),
(3009, 'GHM3009', 'GT KNCI KK BNK', 'ACCESSORIES', '0', '10000', '0', '10000', 'Normal', '2022-04-29 22:37:49', 'admin', '1PCS'),
(3010, 'GHM3010', 'IKT RMB BRND', 'ACCESSORIES', '0', '7500', '0', '7500', 'Normal', '2022-04-29 22:40:19', 'admin', '1PCS'),
(3011, 'GHM3011', 'BNDNA ANK BG', 'ACCESSORIES', '0', '12000', '0', '12000', 'Normal', '2022-04-29 22:41:43', 'admin', '1PCS'),
(3012, 'GHM3012', 'TRBAN ANK', 'ACCESSORIES', '0', '25000', '0', '25000', 'Normal', '2022-04-29 22:44:13', 'admin', '1PCS'),
(3013, 'GHM3013', 'KUAS SBM', 'ACCESSORIES', '0', '7500', '0', '7500', 'Normal', '2022-04-29 22:47:53', 'admin', '1PCS'),
(3014, 'GHM3014', 'SRKUT KT NVO', 'ACCESSORIES', '0', '12000', '0', '12000', 'Normal', '2022-04-29 22:49:42', 'admin', '1PCS'),
(3015, 'GHM3015', 'IKT RMB PLNG', 'ACCESSORIES', '0', '8500', '0', '8500', 'Normal', '2022-04-29 22:51:42', 'admin', '1BND'),
(3016, 'GHM3016', 'IKT RMB GRS', 'ACCESSORIES', '0', '7000', '0', '7000', 'Normal', '2022-04-29 22:53:00', 'admin', '1BND'),
(3017, 'GHM3017', 'TAS POP IT', 'ACCESSORIES', '0', '60000', '0', '60000', 'Normal', '2022-05-01 11:37:33', 'admin', '1PCS'),
(3018, 'GHM3018', 'MSKER U WRN', 'ACCESSORIES', '0', '6000', '0', '6000', 'Normal', '2022-04-29 23:00:06', 'admin', '2PCS'),
(3019, 'GHM3019', 'BNK BOBA XL', 'ACCESSORIES', '0', '62500', '0', '62500', 'Normal', '2022-05-01 11:23:51', 'admin', '1PCS'),
(3020, 'GHM3020', 'BNK BOBA MNI', 'ACCESSORIES', '0', '35000', '0', '35000', 'Normal', '2022-05-01 11:25:19', 'admin', '1PCS'),
(3021, 'GHM3021', 'BNK BOBA PLNG', 'ACCESSORIES', '0', '45000', '0', '45000', 'Normal', '2022-05-01 11:26:42', 'admin', '1PCS'),
(3022, 'GHM3022', 'BNK BOBA RASA', 'ACCESSORIES', '0', '50000', '0', '50000', 'Normal', '2022-05-01 11:27:42', 'admin', '1PCS'),
(3023, 'GHM3023', 'MKE UP SPN TLR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '8000', '0', '8000', 'Normal', '2022-05-01 11:30:52', 'admin', '1PCS'),
(3024, 'GHM3024', 'SPONG QNLS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '8000', '0', '8000', 'Normal', '2022-05-01 11:33:43', 'admin', '2PCS'),
(3025, 'GHM3025', 'SPONG PRO ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '10000', '0', '10000', 'Normal', '2022-05-01 11:34:50', 'admin', '3PCS'),
(3026, 'GHM3026', 'SSR ALS INF', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '7500', '0', '7500', 'Normal', '2022-05-01 11:37:16', 'admin', '2PCS'),
(3027, 'GHM3027', 'MY JELLY 10CP', 'ROTI/SNACK/Camilan', '0', '8000', '0', '8000', 'Normal', '2022-05-07 11:05:02', 'admin', '210G'),
(3028, 'GHM3028', 'MY PDD FRPUR', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-07 11:05:46', 'admin', '168G'),
(3029, 'GHM3029', 'INACO KNNYA MX', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-07 11:06:29', 'admin', '180G'),
(3030, 'GHM3030', 'DONLD YOGU', 'ROTI/SNACK/Camilan', '0', '8000', '0', '8000', 'Normal', '2022-05-07 11:07:11', 'admin', '320G'),
(3031, 'GHM3031', 'JELLY WCC 8C', 'ROTI/SNACK/Camilan', '0', '4500', '', '4500', 'Normal', '2022-05-07 11:07:53', 'admin', '112G'),
(3032, 'GHM3032', 'INACO SR BH', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-05-07 11:08:26', 'admin', '75G'),
(3033, 'GHM3033', 'WCC PDD MG', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-07 11:08:56', 'admin', '120G'),
(3034, 'GHM3034', 'WCC PDD GV', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-07 11:09:59', 'admin', '120G'),
(3035, 'GHM3035', 'GOODY NDC PUD', 'ROTI/SNACK/Camilan', '0', '27500', '0', '27500', 'Normal', '2022-05-07 11:11:02', 'admin', '80G'),
(3036, 'GHM3036', 'PR INCO FRZN', 'PERMEN/COKLAT', '0', '9500', '0', '9500', 'Normal', '2022-05-07 11:12:01', 'admin', '120G'),
(3037, 'GHM3037', 'PR MINTZ DM', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:12:44', 'admin', '1SAK'),
(3038, 'GHM3038', 'PR MINTZ PPM', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-08-09 12:41:53', 'admin', '1SAK'),
(3039, 'GHM3039', 'SNCK IT MRSM KN', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:14:33', 'admin', '30G'),
(3040, 'GHM3040', 'NRYA JLLY SNW', 'PERMEN/COKLAT', '0', '38500', '0', '38500', 'Normal', '2022-05-07 11:17:07', 'admin', '400G'),
(3041, 'GHM3041', 'DIAMND UHT FC ', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-07 11:19:30', 'admin', '200ML'),
(3042, 'GHM3042', 'DIAMND UHT STR', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-07 11:20:21', 'admin', '200ML'),
(3043, 'GHM3043', 'DIAMND UHT COK', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-07 11:23:12', 'admin', '200ML'),
(3044, 'GHM3044', 'ABC SRSK JC ', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-05-07 11:23:51', 'admin', '250ML'),
(3045, 'GHM3045', 'ABC MANG JC ', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-05-07 11:24:23', 'admin', '250ML'),
(3046, 'GHM3046', 'TEH KTK LMN', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-05-07 11:25:02', 'admin', '200ML'),
(3047, 'GHM3047', 'MILO COK', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-05-07 11:25:45', 'admin', '110ML'),
(3048, 'GHM3048', 'MILO ACT KLG', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-05-07 11:26:25', 'admin', '240ML'),
(3049, 'GHM3049', 'KOPKU LCK DY', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-05-07 11:27:53', 'admin', '180ML'),
(3050, 'GHM3050', 'CMORY DRN BLBRY', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:28:45', 'admin', '250ML'),
(3051, 'GHM3051', 'COCA COLA', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-05-07 11:30:10', 'admin', '1L'),
(3052, 'GHM3052', 'PDMAS STR ', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-07 11:31:49', 'admin', '1PAK'),
(3053, 'GHM3053', 'MLK ABON ', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-07 11:39:58', 'admin', '1RTG'),
(3054, 'GHM3054', 'CHIMI KRP JB', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-07 11:40:51', 'admin', '140G'),
(3055, 'GHM3055', 'CHIMI UBI JBKR', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-07 11:48:49', 'admin', '100G'),
(3056, 'GHM3056', 'MKRONI LV10', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-05-07 11:49:56', 'admin', '150G'),
(3057, 'GHM3057', 'GERY MLK CCNT', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:50:31', 'admin', '110G'),
(3058, 'GHM3058', 'GERY MLK MTC', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:51:15', 'admin', '110G'),
(3059, 'GHM3059', 'HTRI MLK CHO', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:52:13', 'admin', '120G'),
(3060, 'GHM3060', 'GERY SLT CHO', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:52:50', 'admin', '105G'),
(3061, 'GHM3061', 'GERY MLK ABN', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 11:53:29', 'admin', '110G'),
(3062, 'GHM3062', 'MN OREO STR', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-07 11:54:11', 'admin', '61G'),
(3063, 'GHM3063', 'MNI OREO VN', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-07 11:55:21', 'admin', '67G'),
(3064, 'GHM3064', 'CHA2 MN SURP', 'ROTI/SNACK/Camilan', '0', '15000', '0', '15000', 'Normal', '2022-05-07 11:56:20', 'admin', '34G'),
(3065, 'GHM3065', 'PRINGLES SCRM', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-07 11:58:45', 'admin', '42G'),
(3066, 'GHM3066', 'BSC BEARDY CK', 'ROTI/SNACK/Camilan', '0', '3500', '0', '3500', 'Normal', '2022-05-07 12:00:02', 'admin', '40G'),
(3067, 'GHM3067', 'POCKY STR', 'ROTI/SNACK/Camilan', '0', '8000', '0', '8000', 'Normal', '2022-05-07 12:00:40', 'admin', '45G'),
(3068, 'GHM3068', 'ZYLUC MN BLK', 'ROTI/SNACK/Camilan', '0', '4000', '0', '4000', 'Normal', '2022-05-07 12:01:49', 'admin', '35G'),
(3069, 'GHM3069', 'TKN BGRL CLS', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 12:03:05', 'admin', '6500'),
(3070, 'GHM3070', 'TKN BGRLL HT', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 12:03:50', 'admin', '3.6G'),
(3071, 'GHM3071', 'UNBIS RNG CHO', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-05-07 12:07:50', 'admin', '120G'),
(3072, 'GHM3072', 'UNBIS BSC BLK', 'ROTI/SNACK/Camilan', '0', '13500', '0', '13500', 'Normal', '2022-05-07 12:08:20', 'admin', '260G'),
(3073, 'GHM3073', 'UNBIS MGRING', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-05-07 12:08:55', 'admin', '260G'),
(3074, 'GHM3074', 'UNBIS RNG ORG', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-05-07 12:10:06', 'admin', '260G'),
(3075, 'GHM3075', 'UNBIS RS CK', 'ROTI/SNACK/Camilan', '0', '7000', '0', '7000', 'Normal', '2022-05-07 12:10:42', 'admin', '208G'),
(3076, 'GHM3076', 'BTTER CRM BSC', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-07 12:11:20', 'admin', '220G'),
(3077, 'GHM3077', 'COCO PFF CK', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-07 12:13:09', 'admin', '240G'),
(3078, 'GHM3078', 'SUKRO KDLE', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-08-04 10:13:30', 'admin', '120G'),
(3079, 'GHM3079', 'GRUDA BWG', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-07 12:14:14', 'admin', '70G'),
(3080, 'GHM3080', 'KC GRUDA 2KL', 'ROTI/SNACK/Camilan', '0', '3000', '0', '3000', 'Normal', '2022-05-07 12:16:26', 'admin', '40G'),
(3081, 'GHM3081', 'KCP SOTO', 'SEMBAKO', '0', '21500', '0', '21500', 'Normal', '2022-05-07 12:17:22', 'admin', '620ML'),
(3082, 'GHM3082', 'CUKA BTET', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-05-07 12:18:51', 'admin', '90ML'),
(3083, 'GHM3083', 'ABC SRDEN TM', 'SEMBAKO', '0', '12000', '0', '12000', 'Normal', '2022-05-07 12:19:43', 'admin', '250G'),
(3084, 'GHM3084', 'ABC SRDEN CHL', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-05-07 12:20:14', 'admin', '250G'),
(3085, 'GHM3085', 'LG FLMBOYN CHO', 'SEMBAKO', '0', '20700', '0', '20700', 'Normal', '2022-07-17 21:36:50', 'admin', '250G'),
(3086, 'GHM3086', 'FLMBOYN WHT', 'ROTI/SNACK/Camilan', '0', '17000', '0', '17000', 'Normal', '2022-05-07 12:22:28', 'admin', '250G'),
(3087, 'GHM3087', 'CK ALFA DRK', 'ROTI/SNACK/Camilan', '0', '27000', '0', '27000', 'Normal', '2022-05-07 12:23:05', 'admin', '500G'),
(3088, 'GHM3088', 'CHOKO DRK CHO', 'SEMBAKO', '0', '13000', '0', '13000', 'Normal', '2022-05-07 12:24:39', 'admin', '250G'),
(3089, 'GHM3089', 'MMSUKA RMP', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-07 12:26:41', 'admin', '4.5G'),
(3090, 'GHM3090', 'MRMILA MRG', 'SEMBAKO', '0', '13000', '0', '13000', 'Normal', '2022-05-07 12:27:13', 'admin', '250G'),
(3091, 'GHM3091', 'KRAFT SGL ', 'SEMBAKO', '0', '12500', '0', '12500', 'Normal', '2022-05-07 12:27:55', 'admin', '83G'),
(3092, 'GHM3092', 'KRAFT SGL 12L', 'SEMBAKO', '0', '21000', '0', '21000', 'Normal', '2022-05-07 12:28:58', 'admin', '200G'),
(3093, 'GHM3093', 'KRAFT MELT KJ', 'SEMBAKO', '0', '26500', '0', '26500', 'Normal', '2022-05-07 12:29:40', 'admin', '175G'),
(3094, 'GHM3094', 'FN ULEG BWG', 'SEMBAKO', '0', '13500', '0', '13500', 'Normal', '2022-08-17 09:56:35', 'admin', '20G'),
(3095, 'GHM3095', 'ULEG SMB IJO', 'SEMBAKO', '0', '14000', '0', '14000', 'Normal', '2022-05-07 12:31:07', 'admin', '20G'),
(3096, 'GHM3096', 'ULEG SMB RWIT', 'SEMBAKO', '0', '13500', '0', '13500', 'Normal', '2022-05-07 12:31:34', 'admin', '1RTG');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(3097, 'GHM3097', 'ULEG SMB TER', 'SEMBAKO', '0', '13500', '0', '13500', 'Normal', '2022-05-07 12:32:07', 'admin', '1RTG'),
(3098, 'GHM3098', 'ABC SMB RND', 'SEMBAKO', '0', '17800', '0', '17800', 'Normal', '2022-05-07 12:32:45', 'admin', '1RTG'),
(3099, 'GHM3099', 'ABC SMB TRS', 'SEMBAKO', '0', '14000', '0', '14000', 'Normal', '2022-05-07 12:33:13', 'admin', '20G'),
(3100, 'GHM3100', 'SJKU CPCAY', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-07 12:33:53', 'admin', '20G'),
(3101, 'GHM3101', 'KRAFT CHD ', 'SEMBAKO', '0', '12000', '0', '12000', 'Normal', '2022-05-07 12:34:20', 'admin', '70G'),
(3102, 'GHM3102', 'ENRGEN JHE', 'MINUMAN', '0', '19000', '0', '19000', 'Normal', '2022-05-07 12:39:31', 'admin', '32G'),
(3103, 'GHM3103', 'LWK WHT ORI', 'MINUMAN', '0', '12700', '0', '12700', 'Normal', '2022-06-03 19:51:53', 'admin', '1RTG'),
(3104, 'GHM3104', 'KOTEK OVN ', 'TISU/PEMBALUT', '0', '17000', '0', '17000', 'Normal', '2022-05-07 12:39:49', 'admin', '14P'),
(3105, 'GHM3105', 'HERS EXMXI', 'TISU/PEMBALUT', '0', '5500', '0', '5500', 'Normal', '2022-05-07 12:41:14', 'admin', '12P'),
(3106, 'GHM3106', 'HERS PRTEX', 'TISU/PEMBALUT', '0', '3000', '0', '3000', 'Normal', '2022-05-07 12:41:46', 'admin', '5P'),
(3107, 'GHM3107', 'KPS NUFACE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '10000', '0', '10000', 'Normal', '2022-05-07 12:42:13', 'admin', '50G'),
(3108, 'GHM3108', 'KPS SLECTION', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '5000', '0', '5000', 'Normal', '2022-05-07 12:43:24', 'admin', '35G'),
(3109, 'GHM3109', 'PUCLLE BS AZR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20500', '0', '20500', 'Normal', '2022-05-07 12:44:36', 'admin', '150ML'),
(3110, 'GHM3110', 'VTALIS BZARE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20000', '0', '20000', 'Normal', '2022-05-07 12:45:11', 'admin', '120ML'),
(3111, 'GHM3111', 'GTSBY CMP SPR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23000', '0', '23000', 'Normal', '2022-05-07 12:45:42', 'admin', '150ML'),
(3112, 'GHM3112', 'GTSBY DPPR SPR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23000', '0', '23000', 'Normal', '2022-05-07 12:46:12', 'admin', '150ML'),
(3113, 'GHM3113', 'VSELIN COCOA', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '44500', '0', '44500', 'Normal', '2022-05-07 12:47:49', 'admin', '200ML'),
(3114, 'GHM3114', 'LAURENT MSK', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '3000', '0', '3000', 'Normal', '2022-05-07 12:48:38', 'admin', '10G'),
(3115, 'GHM3115', 'GOLD MSK HN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '3000', '0', '3000', 'Normal', '2022-05-07 12:49:13', 'admin', '10ML'),
(3116, 'GHM3116', 'MBK SLVER', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '4000', '0', '4000', 'Normal', '2022-05-07 12:49:42', 'admin', '13.6G'),
(3117, 'GHM3117', 'MBK PTH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '3000', '0', '3000', 'Normal', '2022-05-07 12:50:08', 'admin', '13.6G'),
(3118, 'GHM3118', 'STELLA MN MTC', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '53000', '0', '53000', 'Normal', '2022-05-07 12:50:43', 'admin', '1ST'),
(3119, 'GHM3119', 'STELLA FB CB', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '20000', '0', '20000', 'Normal', '2022-05-07 12:51:16', 'admin', '245ML'),
(3120, 'GHM3120', 'STELLA FB PNK', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '20000', '0', '20000', 'Normal', '2022-05-07 12:51:48', 'admin', '245ML'),
(3121, 'GHM3121', 'MLK CLN EMOL', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '6000', '0', '6000', 'Normal', '2022-05-07 12:52:25', 'admin', '100ML'),
(3122, 'GHM3122', 'FF SARIAYU PTH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18500', '0', '18500', 'Normal', '2022-05-07 12:53:05', 'admin', '75G'),
(3123, 'GHM3123', 'BIO CC PRG', 'DETERGENT', '0', '15000', '0', '15000', 'Normal', '2022-05-07 12:53:36', 'admin', '780ML'),
(3124, 'GHM3124', 'SOKLN SFT RSP', 'DETERGENT', '0', '24000', '0', '24000', 'Normal', '2022-05-07 12:54:14', 'admin', '770G'),
(3125, 'GHM3125', 'SOKLN SFT SKR', 'DETERGENT', '0', '24000', '0', '24000', 'Normal', '2022-05-07 12:54:44', 'admin', '770G'),
(3126, 'GHM3126', 'SOKLN SFT FRS', 'DETERGENT', '0', '5000', '0', '5000', 'Normal', '2022-05-07 12:55:16', 'admin', '260G'),
(3127, 'GHM3127', 'INDMLK PT PCH', 'SEMBAKO', '0', '17500', '0', '17500', 'Normal', '2022-05-07 12:55:58', 'admin', '560G'),
(3128, 'GHM3128', 'YUPIQU ', 'PERMEN/COKLAT', '0', '26000', '0', '26000', 'Normal', '2022-05-07 12:56:29', 'admin', '1PK'),
(3129, 'GHM3129', 'STICK CNDY', 'PERMEN/COKLAT', '0', '23000', '0', '23000', 'Normal', '2022-05-07 12:56:55', 'admin', '1PK'),
(3130, 'GHM3130', 'UNBIS PNUT', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-05-07 12:57:24', 'admin', '258G'),
(3131, 'GHM3131', 'CHIL SCH VN ', 'SUSU BUBUK/SUSU CAIR', '0', '72600', '0', '72600', 'Normal', '2022-06-30 09:34:55', 'admin', '400G'),
(3132, 'GHM3132', 'CHIL SCH MD ', 'SUSU BUBUK/SUSU CAIR', '0', '73200', '0', '73200', 'Normal', '2022-06-30 09:34:27', 'admin', '400G'),
(3133, 'GHM3133', 'ROMA MLK ABN', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-05-07 12:58:55', 'admin', '1RTG'),
(3134, 'GHM3134', 'KP NUFACE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '5800', '0', '5800', 'Normal', '2022-05-07 13:04:33', 'admin', '30G'),
(3135, 'GHM3135', 'ALFA DRK CHO', 'PERMEN/COKLAT', '0', '18000', '0', '18000', 'Normal', '2022-05-07 13:08:59', 'admin', '250G'),
(3136, 'GHM3136', 'KOTEK HLT OVN', 'TISU/PEMBALUT', '0', '15500', '0', '15500', 'Normal', '2022-05-07 13:09:37', 'admin', '9P'),
(3137, 'GHM3137', 'CHACHA HAT ', 'ROTI/SNACK/Camilan', '0', '15000', '0', '15000', 'Normal', '2022-05-10 08:33:05', 'admin', '37G'),
(3138, 'GHM3138', 'MALTITOS MLT', 'ROTI/SNACK/Camilan', '0', '7800', '0', '7800', 'Normal', '2022-05-10 08:34:29', 'admin', '45G'),
(3139, 'GHM3139', 'CHICCHIC MNI', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-05-10 08:35:17', 'admin', '20G'),
(3140, 'GHM3140', 'PST CIPTA HRB', 'PERLENGKAPAN MANDI', '0', '13000', '0', '13000', 'Normal', '2022-05-10 08:36:09', 'admin', '190G'),
(3141, 'GHM3141', 'VIVA FT MWAR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '7000', '0', '7000', 'Normal', '2022-05-10 08:37:07', 'admin', '100ML'),
(3142, 'GHM3142', 'LFONTE PSTA', 'SEMBAKO', '0', '18600', '0', '18600', 'Normal', '2022-05-10 08:38:00', 'admin', '315G'),
(3143, 'GHM3143', 'KLNG PRMUKA', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '1000', '0', '1000', 'Normal', '2022-05-13 14:33:42', 'admin', '1PCS'),
(3144, 'GHM3144', 'ROK PRMKA ', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '68000', '0', '68000', 'Normal', '2022-05-13 14:36:39', 'admin', '1PCS'),
(3145, 'GHM3145', 'ROK PRMKA B', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '72000', '0', '72000', 'Normal', '2022-05-13 14:37:06', 'admin', '1PCS'),
(3146, 'GHM3146', 'LMB PRMK JT', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '2000', '0', '2000', 'Normal', '2022-05-13 14:37:36', 'admin', '1PCS'),
(3147, 'GHM3147', 'LMB PRMK PR', 'BUSANA / PERLENGKAPAN SHOLAT/PAKAIN ANAK', '0', '1000', '0', '1000', 'Normal', '2022-05-13 14:38:13', 'admin', '1PCS'),
(3148, 'GHM3148', 'BK TLS KTK', 'ATK/ALAT SEKOLAH/TAS SEKO', '0', '3000', '0', '3000', 'Normal', '2022-05-13 14:38:41', 'admin', '1PCS'),
(3149, 'GHM3149', 'RANI KONE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-05-13 14:39:16', 'admin', '1PCS'),
(3150, 'GHM3150', 'GLCHA BLCK', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '8000', '0', '8000', 'Normal', '2022-05-13 14:40:10', 'admin', '1PCS'),
(3151, 'GHM3151', 'PENGGRS KCL', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '3000', '0', '3000', 'Normal', '2022-05-13 14:40:44', 'admin', '1PCS'),
(3152, 'GHM3152', 'YULI BKERY CK', 'ROTI/SNACK/Camilan', '0', '3500', '0', '3500', 'Normal', '2022-05-13 14:41:17', 'admin', '1PCS'),
(3153, 'GHM3153', 'YULI BKERY KJ ', 'ROTI/SNACK/Camilan', '0', '3500', '0', '3500', 'Normal', '2022-05-13 14:41:43', 'admin', '1PCS'),
(3154, 'GHM3154', 'PRM MENTOS', 'PERMEN/COKLAT', '0', '10500', '0', '10500', 'Normal', '2022-05-13 14:42:09', 'admin', '135G'),
(3155, 'GHM3155', 'CHEW BALL', 'PERMEN/COKLAT', '0', '7500', '0', '7500', 'Normal', '2022-05-13 14:42:36', 'admin', '135G'),
(3156, 'GHM3156', 'KINO MNGO', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-05-13 14:43:08', 'admin', '88G'),
(3157, 'GHM3157', 'PRM ALPEN CRM', 'PERMEN/COKLAT', '0', '8000', '0', '8000', 'Normal', '2022-05-13 14:44:06', 'admin', '125G'),
(3158, 'GHM3158', 'PRM ALPEN STR ', 'PERMEN/COKLAT', '0', '8000', '0', '8000', 'Normal', '2022-05-13 14:44:52', 'admin', '125G'),
(3159, 'GHM3159', 'MLKITA LLIPOP', 'PERMEN/COKLAT', '0', '22500', '0', '22500', 'Normal', '2022-05-13 14:45:26', 'admin', '300G'),
(3160, 'GHM3160', 'MLKITA SCM', 'PERMEN/COKLAT', '0', '9500', '0', '9500', 'Normal', '2022-05-13 14:45:50', 'admin', '120G'),
(3161, 'GHM3161', 'MILKITA MLN', 'PERMEN/COKLAT', '0', '9500', '0', '9500', 'Normal', '2022-05-13 14:46:17', 'admin', '120G'),
(3162, 'GHM3162', 'MILKITA STR', 'PERMEN/COKLAT', '0', '9500', '0', '9500', 'Normal', '2022-05-13 14:46:49', 'admin', '120G'),
(3163, 'GHM3163', 'MILO CHBAR', 'PERMEN/COKLAT', '0', '4500', '0', '4500', 'Normal', '2022-05-13 14:47:19', 'admin', '15G'),
(3164, 'GHM3164', 'MIE GLS SPBT', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-05-13 14:48:06', 'admin', '1RTG'),
(3165, 'GHM3165', 'MIE GLS SOSIS', 'ACCESSORIES', '0', '9500', '0', '9500', 'Normal', '2022-05-13 14:48:43', 'admin', '1RTG'),
(3166, 'GHM3166', 'MIE GLS AYMB', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-05-13 14:49:44', 'admin', '1RTG'),
(3167, 'GHM3167', 'PDIMAS CK ', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-13 14:50:19', 'admin', '1PK'),
(3168, 'GHM3168', 'PDIMAS PD', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-13 14:51:23', 'admin', '1PK'),
(3169, 'GHM3169', 'PDIMAS STR', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-13 14:51:54', 'admin', '1PK'),
(3170, 'GHM3170', 'HTARI MLK CH', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-05-13 14:52:25', 'admin', '120G'),
(3171, 'GHM3171', 'UNBIS TRT CK', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-05-13 14:52:58', 'admin', '120G'),
(3172, 'GHM3172', 'UNBIS MGRING CK', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-05-13 14:54:10', 'admin', '260G'),
(3173, 'GHM3173', 'POTABEE AYMB', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-13 14:54:54', 'admin', '68G'),
(3174, 'GHM3174', 'SUKI AYM', 'ROTI/SNACK/Camilan', '0', '7900', '0', '7900', 'Normal', '2022-05-13 14:55:25', 'admin', '125G'),
(3175, 'GHM3175', 'GRUDA KC TLR', 'ROTI/SNACK/Camilan', '0', '15000', '0', '15000', 'Normal', '2022-05-13 14:56:06', 'admin', '250G'),
(3176, 'GHM3176', 'MARNING JG', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-05-13 14:56:48', 'admin', '120G'),
(3177, 'GHM3177', 'WCC LC CUP', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-05-13 14:57:32', 'admin', '235ML'),
(3178, 'GHM3178', 'VIDORNT UHT CK', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-05-13 14:58:36', 'admin', '175ML'),
(3179, 'GHM3179', 'TEH BTL SOSR', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-05-13 14:59:59', 'admin', '200ML'),
(3180, 'GHM3180', 'FRUITEA FREZE', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-05-13 15:00:49', 'admin', '200ML'),
(3181, 'GHM3181', 'KREK CRIKET', 'ROKOK', '0', '5000', '0', '5000', 'Normal', '2022-05-13 15:26:48', 'admin', '1PCS'),
(3182, 'GHM3182', 'KREK TOKAI', 'ROKOK', '0', '2000', '0', '2000', 'Normal', '2022-05-13 15:27:15', 'admin', '1PCS'),
(3183, 'GHM3183', 'KOREK GAS', 'ROKOK', '0', '4000', '0', '4000', 'Normal', '2022-05-13 15:27:45', 'admin', '1PCS'),
(3184, 'GHM3184', 'RK LUCKY ', 'ROKOK', '0', '27000', '0', '27000', 'Normal', '2022-05-13 15:28:50', 'admin', '16BTG'),
(3185, 'GHM3185', 'SWEETY SLVPNT ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '106000', '0', '106000', 'Normal', '2022-05-15 20:30:39', 'admin', 'L54'),
(3186, 'GHM3186', 'MMYPKO RYLPNT', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '109000', '0', '109000', 'Normal', '2022-05-15 20:31:31', 'admin', 'XL40'),
(3187, 'GHM3187', 'HPPY NPYPNT', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '77500', '0', '77500', 'Normal', '2022-05-15 20:32:20', 'admin', 'XXL36'),
(3188, 'GHM3188', 'SWEETY BRPNT ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '82000', '0', '82000', 'Normal', '2022-05-15 20:35:21', 'admin', 'L52'),
(3189, 'GHM3189', 'MMYPKO PNT', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '83500', '0', '83500', 'Normal', '2022-07-08 10:30:40', 'admin', 'XL38'),
(3190, 'GHM3190', 'MMAMIA PNT', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '45000', '0', '45000', 'Normal', '2022-05-15 20:41:37', 'admin', 'S36'),
(3191, 'GHM3191', 'POPOK ADLT ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '12200', '0', '12200', 'Normal', '2022-05-20 08:43:21', 'admin', 'L2PCS'),
(3192, 'GHM3192', 'MMYPKO PRK', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '37000', '0', '37000', 'Normal', '2022-05-15 20:44:36', 'admin', 'M22'),
(3193, 'GHM3193', 'MMYPKO RYL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '72000', '0', '72000', 'Normal', '2022-05-15 20:45:42', 'admin', 'XL20'),
(3194, 'GHM3194', 'SYANGKU NB', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '40000', '0', '40000', 'Normal', '2022-05-15 20:46:17', 'admin', 'S30'),
(3195, 'GHM3195', 'MARJN SR CPND', 'MINUMAN', '0', '18000', '0', '18000', 'Normal', '2022-05-16 19:39:09', 'admin', '500ML'),
(3196, 'GHM3196', 'MARJN SQH MLN', 'MINUMAN', '0', '12000', '0', '12000', 'Normal', '2022-05-16 19:40:01', 'admin', '450ML'),
(3197, 'GHM3197', 'MARJN SQH LC', 'MINUMAN', '0', '12500', '0', '12500', 'Normal', '2022-05-16 19:41:01', 'admin', '450ML'),
(3198, 'GHM3198', 'MARJN SQH CCP', 'MINUMAN', '0', '13500', '0', '13500', 'Normal', '2022-05-16 19:41:52', 'admin', '450ML'),
(3199, 'GHM3199', 'MARJN SQH ORG', 'MINUMAN', '0', '12000', '0', '12000', 'Normal', '2022-05-16 19:42:33', 'admin', '450ML'),
(3200, 'GHM3200', 'MARJN MLK ML', 'MINUMAN', '0', '20000', '0', '20000', 'Normal', '2022-05-16 19:43:31', 'admin', '460ML'),
(3201, 'GHM3201', 'MARJN MLK ST', 'MINUMAN', '0', '20000', '0', '20000', 'Normal', '2022-05-16 19:44:08', 'admin', '460ML'),
(3202, 'GHM3202', 'ABC SYR ML', 'MINUMAN', '0', '21500', '0', '21500', 'Normal', '2022-05-16 19:44:42', 'admin', '485ML'),
(3203, 'GHM3203', 'INDOF FRS FRBOZ', 'MINUMAN', '0', '17000', '0', '17000', 'Normal', '2022-05-16 19:45:23', 'admin', '500ML'),
(3204, 'GHM3204', 'ABC SQ JF', 'MINUMAN', '0', '13000', '0', '13000', 'Normal', '2022-05-16 19:46:51', 'admin', '525ML'),
(3205, 'GHM3205', 'FF PX DULL', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '27000', '0', '27000', 'Normal', '2022-05-16 19:52:45', 'admin', '100G'),
(3206, 'GHM3206', 'PANT COLL', 'PERLENGKAPAN MANDI', '0', '15500', '0', '15500', 'Normal', '2022-05-16 19:53:36', 'admin', '70ML'),
(3207, 'GHM3207', 'PANT CON BIO', 'PERLENGKAPAN MANDI', '0', '16500', '0', '16500', 'Normal', '2022-05-16 19:54:10', 'admin', '70ML'),
(3208, 'GHM3208', 'REJOIC CND RCH', 'PERLENGKAPAN MANDI', '0', '13500', '0', '13500', 'Normal', '2022-05-16 19:54:44', 'admin', '70ML'),
(3209, 'GHM3209', 'SB DETTL BT', 'PERLENGKAPAN MANDI', '0', '10000', '0', '10000', 'Promo', '2022-06-04 12:49:41', 'admin', '100ML'),
(3210, 'GHM3210', 'SB DETTL CL', 'MINUMAN', '0', '10000', '0', '10000', 'Promo', '2022-06-04 12:49:14', 'admin', '100ML'),
(3211, 'GHM3211', 'SP CLEAR LMN', 'PERLENGKAPAN MANDI', '0', '21000', '0', '21000', 'Normal', '2022-05-16 19:56:33', 'admin', '160ML'),
(3212, 'GHM3212', 'SP PNTEN BLC', 'PERLENGKAPAN MANDI', '0', '15000', '0', '15000', 'Normal', '2022-05-16 19:57:08', 'admin', '70ML'),
(3213, 'GHM3213', 'SP CLEAR MNT', 'PERLENGKAPAN MANDI', '0', '21000', '0', '21000', 'Normal', '2022-05-16 19:57:46', 'admin', '125ML'),
(3214, 'GHM3214', 'KOJIMA BT', 'OBAT', '0', '23500', '0', '23500', 'Normal', '2022-05-16 19:58:52', 'admin', '140ML'),
(3215, 'GHM3215', 'KJIMA BTL', 'OBAT', '0', '18000', '0', '18000', 'Normal', '2022-05-16 19:59:23', 'admin', '100ML'),
(3216, 'GHM3216', 'MADU TJ ES', 'OBAT', '0', '17500', '0', '17500', 'Normal', '2022-05-16 20:00:07', 'admin', '150G'),
(3217, 'GHM3217', 'MADU TJ MRN', 'OBAT', '0', '16000', '0', '16000', 'Normal', '2022-05-16 20:00:40', 'admin', '150G'),
(3218, 'GHM3218', 'MADU TJ ESTR', 'OBAT', '0', '25500', '0', '25500', 'Normal', '2022-05-16 20:01:15', 'admin', '250G'),
(3219, 'GHM3219', 'MADU TJ MRNI', 'OBAT', '0', '45000', '0', '45000', 'Normal', '2022-05-16 20:01:45', 'admin', '500G'),
(3220, 'GHM3220', 'OB JNR HNY', 'OBAT', '0', '18500', '0', '18500', 'Normal', '2022-05-17 07:29:12', 'admin', '60ML'),
(3221, 'GHM3221', 'OB HRB HNY', 'OBAT', '0', '18500', '0', '18500', 'Normal', '2022-05-17 07:30:05', 'admin', '60ML'),
(3222, 'GHM3222', 'OB HRB MDU', 'OBAT', '0', '10000', '0', '10000', 'Normal', '2022-05-17 07:30:38', 'admin', '30ML'),
(3223, 'GHM3223', 'FRMULA 44', 'OBAT', '0', '10500', '0', '10500', 'Normal', '2022-05-17 07:31:19', 'admin', '27ML'),
(3224, 'GHM3224', 'FRMULA 44 ANK', 'OBAT', '0', '20000', '0', '20000', 'Normal', '2022-05-17 07:32:08', 'admin', '54ML'),
(3225, 'GHM3225', 'WOODS ANTHI', 'OBAT', '0', '21000', '0', '21000', 'Normal', '2022-05-17 07:38:29', 'admin', '60ML'),
(3226, 'GHM3226', 'WOODS MCLTYC', 'OBAT', '0', '60ML', '0', 'NaN', 'Normal', '2022-05-17 07:39:35', 'admin', '60ML'),
(3227, 'GHM3227', 'BLSEM LANG', 'OBAT', '0', '10300', '0', '10300', 'Normal', '2022-05-17 07:40:22', 'admin', '20G'),
(3228, 'GHM3228', 'TLAKLINU COOL ', 'OBAT', '0', '11000', '0', '11000', 'Normal', '2022-05-17 07:42:25', 'admin', '10ML'),
(3229, 'GHM3229', 'TLAK ANGIN CR', 'OBAT', '0', '10000', '0', '10000', 'Normal', '2022-05-17 07:43:10', 'admin', '10ML'),
(3230, 'GHM3230', 'FRSHCR SPL FR', 'OBAT', '0', '13000', '0', '13000', 'Normal', '2022-05-17 07:44:02', 'admin', '10ML'),
(3231, 'GHM3231', 'FRSHCR STRNG', 'OBAT', '0', '13000', '0', '13000', 'Normal', '2022-05-17 07:44:42', 'admin', '10ML'),
(3232, 'GHM3232', 'FRSHCR LVN', 'OBAT', '0', '12000', '0', '12000', 'Normal', '2022-05-17 07:45:21', 'admin', '10ML'),
(3233, 'GHM3233', 'FRSHCR SNDL', 'OBAT', '0', '12000', '0', '12000', 'Normal', '2022-05-17 07:46:02', 'admin', '10ML'),
(3234, 'GHM3234', 'FRSHCR GTEA', 'OBAT', '0', '12000', '0', '12000', 'Normal', '2022-05-17 07:46:42', 'admin', '10ML'),
(3235, 'GHM3235', 'MNYAK ANG RL', 'OBAT', '0', '12000', '0', '12000', 'Normal', '2022-05-17 07:48:13', 'admin', '8ML'),
(3236, 'GHM3236', 'FRSHCR MYK ANG', 'OBAT', '0', '13000', '0', '13000', 'Normal', '2022-05-17 07:49:27', 'admin', '10ML'),
(3237, 'GHM3237', 'FRSHCR SPRT', 'OBAT', '0', '13000', '0', '13000', 'Normal', '2022-05-17 07:50:13', 'admin', '10ML'),
(3238, 'GHM3238', 'MYK ANGN 1001', 'OBAT', '0', '12000', '0', '12000', 'Normal', '2022-05-17 07:51:09', 'admin', '8ML'),
(3239, 'GHM3239', 'SAFE CR RLL', 'OBAT', '0', '18000', '0', '18000', 'Normal', '2022-05-17 07:51:46', 'admin', '10ML'),
(3240, 'GHM3240', 'BALSM LANG', 'OBAT', '0', '5500', '0', '5500', 'Normal', '2022-05-17 07:52:38', 'admin', '10ML'),
(3241, 'GHM3241', 'VCKS VPR', 'OBAT', '0', '19800', '0', '19800', 'Normal', '2022-05-17 07:53:09', 'admin', '25G'),
(3242, 'GHM3242', 'VICKS VPR', 'OBAT', '0', '8500', '0', '8500', 'Normal', '2022-05-17 07:53:54', 'admin', '10G'),
(3243, 'GHM3243', 'SALEP 88 ', 'OBAT', '0', '10000', '0', '10000', 'Normal', '2022-05-17 07:54:31', 'admin', '6G'),
(3244, 'GHM3244', 'BLSEM GLIGA', 'OBAT', '0', '10000', '0', '10000', 'Normal', '2022-05-17 07:55:01', 'admin', '20G'),
(3245, 'GHM3245', 'RHEMSON WHT', 'OBAT', '0', '7500', '0', '7500', 'Normal', '2022-05-17 07:55:41', 'admin', '18G'),
(3246, 'GHM3246', 'AITO MTA', 'OBAT', '0', '14500', '0', '14500', 'Normal', '2022-05-17 07:56:15', 'admin', '11ML'),
(3247, 'GHM3247', 'RHTO MTA', 'OBAT', '0', '14500', '0', '14500', 'Normal', '2022-05-17 07:56:45', 'admin', '7ML'),
(3248, 'GHM3248', 'INSTO MTA', 'OBAT', '0', '14000', '0', '14000', 'Normal', '2022-05-17 07:57:13', 'admin', '7.5ML'),
(3249, 'GHM3249', 'SNTADEX', 'OBAT', '0', '16000', '0', '16000', 'Normal', '2022-05-17 07:58:01', 'admin', '20ML'),
(3250, 'GHM3250', 'NTUR E ADV', 'OBAT', '0', '61000', '0', '61000', 'Normal', '2022-05-17 07:58:48', 'admin', '16K'),
(3251, 'GHM3251', 'NATUR E 300', 'OBAT', '0', '45000', '0', '45000', 'Normal', '2022-05-17 07:59:34', 'admin', '16K'),
(3252, 'GHM3252', 'NTUR E100 IU', 'OBAT', '0', '35000', '0', '35000', 'Normal', '2022-05-17 08:00:22', 'admin', '16K'),
(3253, 'GHM3253', 'RDXON JRK', 'OBAT', '0', '51000', '0', '51000', 'Normal', '2022-05-17 08:00:59', 'admin', '10T'),
(3254, 'GHM3254', 'CDR JRK', 'OBAT', '0', '46000', '0', '46000', 'Normal', '2022-05-17 08:01:29', 'admin', '4600MG'),
(3255, 'GHM3255', 'BODRXN PRTM', 'OBAT', '0', '13500', '0', '13500', 'Normal', '2022-05-17 08:02:08', 'admin', '60ML'),
(3256, 'GHM3256', 'ANKNDIN MR', 'OBAT', '0', '8000', '0', '8000', 'Normal', '2022-05-17 08:03:25', 'admin', '30ML'),
(3257, 'GHM3257', 'ANKNDIN HRB', 'OBAT', '0', '9000', '0', '9000', 'Normal', '2022-05-17 08:04:00', 'admin', '30ML'),
(3258, 'GHM3258', 'TRMOREX JRK', 'OBAT', '0', '10000', '0', '10000', 'Normal', '2022-05-17 08:04:36', 'admin', '30ML'),
(3259, 'GHM3259', 'VIPCOL SYR', 'OBAT', '0', '7500', '0', '7500', 'Normal', '2022-05-17 08:05:09', 'admin', '60ML'),
(3260, 'GHM3260', 'CNTREX PRC', 'OBAT', '0', '7500', '0', '7500', 'Normal', '2022-05-17 08:05:50', 'admin', '60ML'),
(3261, 'GHM3261', 'BIOLYSN KDS', 'OBAT', '0', '15500', '0', '15500', 'Normal', '2022-05-17 08:06:23', 'admin', '30T'),
(3262, 'GHM3262', 'VICKS INHL OR', 'OBAT', '0', '16000', '0', '16000', 'Normal', '2022-05-17 08:06:58', 'admin', '0.5ML'),
(3263, 'GHM3263', 'VICKS INHL ', 'OBAT', '0', '10500', '0', '10500', 'Normal', '2022-05-17 08:07:30', 'admin', '0.5ML'),
(3264, 'GHM3264', 'BETDIN ATSP', 'OBAT', '0', '7000', '0', '7000', 'Normal', '2022-05-17 08:08:06', 'admin', '5ML'),
(3265, 'GHM3265', 'MYLNTA SYR', 'OBAT', '0', '14500', '0', '14500', 'Normal', '2022-05-17 08:08:40', 'admin', '50ML'),
(3266, 'GHM3266', 'MYLNTA', 'OBAT', '0', '38500', '0', '38500', 'Normal', '2022-05-17 08:09:10', 'admin', '150ML'),
(3267, 'GHM3267', 'SR KRM SHR', 'OBAT', '0', '25000', '0', '25000', 'Normal', '2022-05-17 08:09:51', 'admin', '330G'),
(3268, 'GHM3268', 'HTINCRM OR', 'OBAT', '0', '22800', '0', '22800', 'Normal', '2022-05-17 08:10:34', 'admin', '120G'),
(3269, 'GHM3269', 'HTINCRM ARM', 'OBAT', '0', '23500', '0', '23500', 'Normal', '2022-05-17 08:11:11', 'admin', '120G'),
(3270, 'GHM3270', 'HTINCRM STR', 'OBAT', '0', '22500', '0', '22500', 'Normal', '2022-05-17 08:11:39', 'admin', '120G'),
(3271, 'GHM3271', 'GPU ', 'OBAT', '0', '9500', '0', '9500', 'Normal', '2022-05-17 08:12:03', 'admin', '30ML'),
(3272, 'GHM3272', 'FRSHCR RLX', 'OBAT', '0', '15000', '0', '15000', 'Normal', '2022-05-17 08:12:33', 'admin', '10ML'),
(3273, 'GHM3273', 'PLSSA ARM', 'OBAT', '0', '12500', '0', '12500', 'Normal', '2022-05-17 08:13:05', 'admin', '8ML'),
(3274, 'GHM3274', 'MYK KPAK', 'OBAT', '0', '33000', '0', '33000', 'Normal', '2022-05-17 08:13:35', 'admin', '28ML'),
(3275, 'GHM3275', 'MNYK KPK', 'OBAT', '0', '22800', '0', '22800', 'Normal', '2022-05-17 08:14:06', 'admin', '14ML'),
(3276, 'GHM3276', 'MYK KAPAK', 'OBAT', '0', '15000', '0', '15000', 'Normal', '2022-05-17 08:14:34', 'admin', '10ML'),
(3277, 'GHM3277', 'MNY KPAK', 'OBAT', '0', '6000', '0', '6000', 'Normal', '2022-05-17 08:15:10', 'admin', '3ML'),
(3278, 'GHM3278', 'FACE TNC ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '7000', '0', '7000', 'Normal', '2022-05-19 12:51:59', 'admin', '100ML'),
(3279, 'GHM3279', 'DEO NVEA INV', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17000', '0', '17000', 'Normal', '2022-05-19 12:53:19', 'admin', '50ML'),
(3280, 'GHM3280', 'DEO NVEA DRY', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '15500', '0', '15500', 'Normal', '2022-05-19 12:53:55', 'admin', '25ML'),
(3281, 'GHM3281', 'DEO NVEA DP', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '14500', '0', '14500', 'Normal', '2022-05-19 12:54:36', 'admin', '25ML'),
(3282, 'GHM3282', 'HB NVEA WHSRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '19800', '0', '19800', 'Normal', '2022-07-19 09:30:25', 'admin', '70ML'),
(3283, 'GHM3283', 'PAUD MG HRF', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '22500', '0', '22500', 'Normal', '2022-05-19 12:56:21', 'admin', '1PCS'),
(3284, 'GHM3284', 'ASYIK BC TL', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '18000', '0', '18000', 'Normal', '2022-05-19 12:57:06', 'admin', '1PCS'),
(3285, 'GHM3285', 'SAMPUL BTK', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '7500', '0', '7500', 'Normal', '2022-05-19 12:58:08', 'admin', '1PK'),
(3286, 'GHM3286', 'SAMPUL KRTUN', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '10500', '0', '10500', 'Normal', '2022-05-19 12:58:56', 'admin', '1PK'),
(3287, 'GHM3287', 'RYAL ARMY', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '16000', '0', '16000', 'Normal', '2022-05-19 12:59:39', 'admin', '0417'),
(3288, 'GHM3288', 'PS GMB LUNA', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '28000', '0', '28000', 'Normal', '2022-05-19 13:01:57', 'admin', '12W'),
(3289, 'GHM3289', 'PS GMB PDK', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '6000', '0', '6000', 'Normal', '2022-05-19 13:02:38', 'admin', '12W'),
(3290, 'GHM3290', 'CRAYN PTR', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '18500', '0', '18500', 'Normal', '2022-05-19 13:03:20', 'admin', '12W'),
(3291, 'GHM3291', 'NACHI TAPE', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '10000', '0', '10000', 'Normal', '2022-05-19 13:03:58', 'admin', '24MM'),
(3292, 'GHM3292', 'DB TAPE ', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '8500', '0', '8500', 'Normal', '2022-05-19 13:04:54', 'admin', '24MM'),
(3293, 'GHM3293', 'DB TAPE NCH', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '6000', '0', '6000', 'Normal', '2022-05-19 13:05:40', 'admin', '12MM'),
(3294, 'GHM3294', 'DB TAPE FM', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '11500', '0', '11500', 'Normal', '2022-05-19 13:06:31', 'admin', '24MM'),
(3295, 'GHM3295', 'LKBAN NC HT', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '9500', '0', '9500', 'Normal', '2022-05-19 13:12:23', 'admin', '1PCS'),
(3296, 'GHM3296', 'NAT VYN TP', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '10000', '0', '10000', 'Normal', '2022-05-19 13:13:52', 'admin', '1PCS'),
(3297, 'GHM3297', 'FBER CSTL', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '26500', '0', '26500', 'Normal', '2022-05-19 13:16:04', 'admin', '12CLS'),
(3298, 'GHM3298', 'ANMUM STR', 'SUSU BUBUK/SUSU CAIR', '0', '44500', '0', '44500', 'Normal', '2022-05-19 13:21:22', 'admin', '200G'),
(3299, 'GHM3299', 'ENTRASL VN', 'SUSU BUBUK/SUSU CAIR', '0', '31500', '0', '31500', 'Normal', '2022-05-19 13:24:04', 'admin', '160G'),
(3300, 'GHM3300', 'PRNGN ESN VN', 'SUSU BUBUK/SUSU CAIR', '0', '36500', '0', '36500', 'Normal', '2022-05-19 13:24:58', 'admin', '180G'),
(3301, 'GHM3301', 'AFIS PASI STR', 'SUSU BUBUK/SUSU CAIR', '0', '37300', '0', '37300', 'Normal', '2022-05-19 13:25:37', 'admin', '200G'),
(3302, 'GHM3302', 'AFIS PASI VN ', 'SUSU BUBUK/SUSU CAIR', '0', '36000', '0', '36000', 'Normal', '2022-05-19 13:26:17', 'admin', '200G'),
(3303, 'GHM3303', 'MLNA BS PSG', 'SUSU BUBUK/SUSU CAIR', '0', '18800', '0', '18800', 'Normal', '2022-05-19 13:27:28', 'admin', '130G'),
(3304, 'GHM3304', 'MILNA BB BM', 'SUSU BUBUK/SUSU CAIR', '0', '16800', '0', '16800', 'Normal', '2022-06-03 11:51:34', 'admin', '130G'),
(3305, 'GHM3305', 'PROMN PSTA', 'SUSU BUBUK/SUSU CAIR', '0', '12500', '0', '12500', 'Normal', '2022-05-19 13:28:42', 'admin', '70G'),
(3306, 'GHM3306', 'PROMN PD STR', 'SUSU BUBUK/SUSU CAIR', '0', '17500', '0', '17500', 'Normal', '2022-05-19 13:29:24', 'admin', '100G'),
(3307, 'GHM3307', 'NST PFF ORG', 'SUSU BUBUK/SUSU CAIR', '0', '9500', '0', '9500', 'Normal', '2022-05-19 13:30:13', 'admin', '25G'),
(3308, 'GHM3308', 'PRMN PFF BBR', 'SUSU BUBUK/SUSU CAIR', '0', '7800', '0', '7800', 'Normal', '2022-05-19 13:32:16', 'admin', '15G'),
(3309, 'GHM3309', 'ANMUM VN', 'SUSU BUBUK/SUSU CAIR', '0', '49000', '0', '49000', 'Normal', '2022-05-19 13:37:08', 'admin', '200G'),
(3310, 'GHM3310', 'MILNA DBROK', 'SUSU BUBUK/SUSU CAIR', '0', '18500', '0', '18500', 'Normal', '2022-05-19 13:38:08', 'admin', '110G'),
(3311, 'GHM3311', 'MLNA KND KJ', 'SUSU BUBUK/SUSU CAIR', '0', '15500', '0', '15500', 'Normal', '2022-05-19 13:38:49', 'admin', '110G'),
(3312, 'GHM3312', 'OAT DLP STR', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-19 13:39:32', 'admin', '100G'),
(3313, 'GHM3313', 'OAT DLP CK', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-19 13:40:03', 'admin', '100G'),
(3314, 'GHM3314', 'PEJOY CKCRM', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-19 13:40:49', 'admin', '37G'),
(3315, 'GHM3315', 'POCKY CCNT', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-19 13:41:16', 'admin', '37G'),
(3316, 'GHM3316', 'PEJOY CKL', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-19 13:41:52', 'admin', '32G'),
(3317, 'GHM3317', 'POCKY CHO', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-19 13:42:35', 'admin', '47G'),
(3318, 'GHM3318', 'INCO ALV', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-05-19 13:43:06', 'admin', '280ML'),
(3319, 'GHM3319', 'MZONE LC', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-05-19 15:58:40', 'admin', '500ML'),
(3320, 'GHM3320', 'ASCK HRB TEA', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-05-19 15:59:27', 'admin', '320ML'),
(3321, 'GHM3321', 'VDORAN UHT CK', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-05-19 16:00:16', 'admin', '175ML'),
(3322, 'GHM3322', 'CMORY UHT BN', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-05-19 16:00:51', 'admin', '250ML'),
(3323, 'GHM3323', 'FLORDN CCNT', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:01:31', 'admin', '350ML'),
(3324, 'GHM3324', 'SEDP AYM TLR', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:02:04', 'admin', '73G'),
(3325, 'GHM3325', 'NSSN CRBN', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-05-19 16:02:37', 'admin', '75G'),
(3326, 'GHM3326', 'MIE NSN KRI', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-05-19 16:03:13', 'admin', '75G'),
(3327, 'GHM3327', 'MIE NSN KDAY', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-05-19 16:03:42', 'admin', '75G'),
(3328, 'GHM3328', 'SEDP SMB GR', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:04:16', 'admin', '88G'),
(3329, 'GHM3329', 'SEDP WHT CRY', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:04:52', 'admin', '81G'),
(3330, 'GHM3330', 'INDMIE SBLK', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:05:24', 'admin', '75G'),
(3331, 'GHM3331', 'CHYTA BSRG', 'ROTI/SNACK/Camilan', '0', '14000', '0', '14000', 'Normal', '2022-05-19 16:06:02', 'admin', '80G'),
(3332, 'GHM3332', 'CHYNT MLDI AK', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-19 16:06:44', 'admin', '55G'),
(3333, 'GHM3333', 'CHYNT MLDI JR', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-05-19 16:07:21', 'admin', '55G'),
(3334, 'GHM3334', 'TRPCN JH', 'MINUMAN', '0', '46500', '0', '46500', 'Normal', '2022-05-19 16:08:05', 'admin', '125G'),
(3335, 'GHM3335', 'TRPCN SLM', 'MINUMAN', '0', '44500', '0', '44500', 'Normal', '2022-05-19 16:08:38', 'admin', '50S'),
(3336, 'GHM3336', 'DIABT SWT', 'MINUMAN', '0', '23500', '0', '23500', 'Normal', '2022-05-19 16:09:09', 'admin', '25S'),
(3337, 'GHM3337', 'KCP SEDP RF', 'SEMBAKO', '0', '23000', '0', '23000', 'Normal', '2022-05-19 16:09:41', 'admin', '750ML'),
(3338, 'GHM3338', 'GOWL VN', 'MINUMAN', '0', '14500', '0', '14500', 'Normal', '2022-05-19 16:10:10', 'admin', '1RTG'),
(3339, 'GHM3339', 'COLTT CHO', 'PERMEN/COKLAT', '0', '34500', '0', '34500', 'Normal', '2022-05-19 16:10:42', 'admin', '220G'),
(3340, 'GHM3340', 'BMBK BWGPT', 'SEMBAKO', '0', '5500', '0', '5500', 'Normal', '2022-05-19 16:11:14', 'admin', '1RTG'),
(3341, 'GHM3341', 'GLTT DRKCHO', 'PERMEN/COKLAT', '0', '16500', '0', '16500', 'Normal', '2022-05-19 16:12:08', 'admin', '250G'),
(3342, 'GHM3342', 'GLTT DRKWHT', 'PERMEN/COKLAT', '', '17000', '0', '17000', 'Normal', '2022-05-19 16:12:37', 'admin', '250G'),
(3343, 'GHM3343', 'SNTAN SASA', 'SEMBAKO', '0', '8500', '0', '8500', 'Normal', '2022-05-19 16:13:11', 'admin', '200ML'),
(3344, 'GHM3344', 'SNTAN SSA', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:13:42', 'admin', '65ML'),
(3345, 'GHM3345', 'SNTAN ACC', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-19 16:14:13', 'admin', '65ML'),
(3346, 'GHM3346', 'SMBA BT KN', 'SEMBAKO', '0', '2000', '0', '2000', 'Normal', '2022-05-19 16:14:49', 'admin', '12ML'),
(3347, 'GHM3347', 'SJIKU AYM GR', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-05-19 16:16:20', 'admin', '25G'),
(3348, 'GHM3348', 'SJIKU ST AYM', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-05-19 16:17:02', 'admin', '25G'),
(3349, 'GHM3349', 'SJIKU NSG KC', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-05-19 16:17:44', 'admin', '25G'),
(3350, 'GHM3350', 'SJIKU SYR AS', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-05-19 16:18:14', 'admin', '25G'),
(3351, 'GHM3351', 'INDF BNGK', 'SEMBAKO', '0', '7700', '0', '7700', 'Normal', '2022-08-09 12:18:32', 'admin', '140ML'),
(3352, 'GHM3352', 'INDF PDSMN', 'SEMBAKO', '0', '6500', '0', '6500', 'Normal', '2022-05-19 16:19:22', 'admin', '135ML'),
(3353, 'GHM3353', 'MG SANIA', 'SEMBAKO', '0', '50000', '0', '50000', 'Normal', '2022-05-19 16:19:45', 'admin', '2L'),
(3354, 'GHM3354', 'MG SBRNA', 'SEMBAKO', '0', '50500', '0', '50500', 'Normal', '2022-05-19 16:20:08', 'admin', '2L'),
(3355, 'GHM3355', 'PULPY ORG', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-06-03 12:09:11', 'admin', '300ML'),
(3356, 'GHM3356', 'ADEM SRI', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-05-19 20:26:39', 'admin', '350ML'),
(3357, 'GHM3357', 'COOLANT', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-19 20:27:04', 'admin', '350ML'),
(3358, 'GHM3358', 'FREST MLT', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-05-19 20:27:38', 'admin', '350ML'),
(3359, 'GHM3359', 'FREST APL', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-05-19 20:28:13', 'admin', '350ML'),
(3360, 'GHM3360', 'FREST MD', 'MINUMAN', '0', '4000', '0', '4000', 'Normal', '2022-05-19 20:28:44', 'admin', '350ML'),
(3361, 'GHM3361', 'NTRIBST JRK', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-07-17 20:28:48', 'admin', '300ML'),
(3362, 'GHM3362', 'COCOBT MG', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-05-19 20:29:56', 'admin', '350ML'),
(3363, 'GHM3363', 'COCOBT LC', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-05-19 20:33:41', 'admin', '350ML'),
(3364, 'GHM3364', 'TEH SSRO BT', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-19 20:35:16', 'admin', '350ML'),
(3365, 'GHM3365', 'LSEGR ANK LC', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-19 20:37:27', 'admin', '238ML'),
(3366, 'GHM3366', 'ULTRMIMI FC', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-05-19 20:39:17', 'admin', '125ML'),
(3367, 'GHM3367', 'NUTRS JRK', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-05-19 20:39:52', 'admin', '200ML'),
(3368, 'GHM3368', 'INDLK UHT BN', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-05-19 20:41:27', 'admin', '180ML'),
(3369, 'GHM3369', 'INDLK UHT CK', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-05-19 20:42:21', 'admin', '180ML'),
(3370, 'GHM3370', 'RK ESSE SHFL', 'ROKOK', '0', '25000', '0', '25000', 'Normal', '2022-05-20 08:00:07', 'admin', '16BTG'),
(3371, 'GHM3371', 'KRP TRPNGLT ', 'ROTI/SNACK/Camilan', '0', '26000', '0', '26000', 'Normal', '2022-05-20 08:01:57', 'admin', '1PCS'),
(3372, 'GHM3372', 'QUAKR OAT ', 'ROTI/SNACK/Camilan', '0', '14500', '0', '14500', 'Normal', '2022-05-20 08:02:56', 'admin', '200G'),
(3373, 'GHM3373', 'MMYPKO PNT 30', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-05-20 08:08:33', 'admin', 'L'),
(3374, 'GHM3374', 'MMYPKO PNT 26', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '62000', '0', '62000', 'Normal', '2022-05-20 08:09:31', 'admin', 'XL'),
(3375, 'GHM3375', 'MMYPKO PNT 58', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '76000', '0', '76000', 'Normal', '2022-05-20 08:10:05', 'admin', 'S'),
(3376, 'GHM3376', 'MMYPKO PNT 50', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '75500', '0', '75500', 'Normal', '2022-07-08 10:34:36', 'admin', 'M'),
(3377, 'GHM3377', 'MMYPKO PNT 40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-05-20 08:11:08', 'admin', 'S'),
(3378, 'GHM3378', 'MMYPKO PNT 20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '38000', '', '38000', 'Normal', '2022-05-20 08:12:07', 'admin', 'M'),
(3379, 'GHM3379', 'MMYPKO PNT 22', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '33000', '0', '33000', 'Normal', '2022-05-20 08:13:13', 'admin', 'S'),
(3380, 'GHM3380', 'MMYPKO RYLPRK 40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '116000', '0', '116000', 'Normal', '2022-05-20 08:14:01', 'admin', 'L'),
(3381, 'GHM3381', 'SWEETY PNT 58 ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '85000', '0', '85000', 'Normal', '2022-05-20 08:16:18', 'admin', 'M'),
(3382, 'GHM3382', 'SWEETY PNT 64', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '77000', '0', '77000', 'Normal', '2022-05-20 08:17:11', 'admin', 'S'),
(3383, 'GHM3383', 'SWEETY PNT  30 2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '53000', '0', '53000', 'Normal', '2022-05-20 08:17:49', 'admin', 'L'),
(3384, 'GHM3384', 'SWEETY PNT24 2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '64000', '0', '64000', 'Normal', '2022-05-20 08:28:59', 'admin', 'XXL'),
(3385, 'GHM3385', 'SWEETY PNT20 2 ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '26500', '0', '26500', 'Normal', '2022-05-20 08:30:06', 'admin', 'S'),
(3386, 'GHM3386', 'SWTY PNT20 2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '37000', '0', '37000', 'Normal', '2022-05-20 08:30:49', 'admin', 'L'),
(3387, 'GHM3387', 'SWEETY PNT XL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '44500', '0', '44500', 'Normal', '2022-05-20 08:31:58', 'admin', '20 2'),
(3388, 'GHM3388', 'SWEETY PNT  M', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '35800', '0', '35800', 'Normal', '2022-07-08 10:15:00', 'admin', '20 2'),
(3389, 'GHM3389', 'SWEETY PNT XXL ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '42000', '0', '42000', 'Normal', '2022-05-20 08:33:06', 'admin', '18 2'),
(3390, 'GHM3390', 'SWEETY PNT 36 2 ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '50000', '0', '50000', 'Normal', '2022-05-20 08:33:42', 'admin', 'S'),
(3391, 'GHM3391', 'SWEETY SLVPNT S', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '50500', '0', '50500', 'Normal', '2022-05-20 08:34:33', 'admin', '32'),
(3392, 'GHM3392', 'SWEETY SLVPNT 38', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '66000', '0', '66000', 'Normal', '2022-05-20 08:35:01', 'admin', 'M'),
(3393, 'GHM3393', 'SWEETY SLVPNT 60', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '110500', '0', '110500', 'Normal', '2022-05-21 16:24:38', 'admin', 'M'),
(3394, 'GHM3394', 'SWEETY SLVPNT 34', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '78000', '0', '78000', 'Normal', '2022-05-20 08:35:56', 'admin', 'XL'),
(3395, 'GHM3395', 'HPPY PNT XXL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '77500', '0', '77500', 'Normal', '2022-05-20 08:39:14', 'admin', '36'),
(3396, 'GHM3396', 'HPPY PNT XL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '75000', '0', '75000', 'Normal', '2022-05-20 08:39:44', 'admin', '44'),
(3397, 'GHM3397', 'HPPY PNT S', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '68200', '0', '68200', 'Normal', '2022-07-08 10:29:33', 'admin', '60'),
(3398, 'GHM3398', 'HPPY PNT M', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '74500', '0', '74500', 'Normal', '2022-05-20 08:40:50', 'admin', '54'),
(3399, 'GHM3399', 'HPPY PNT L', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '74000', '0', '74000', 'Normal', '2022-05-20 08:41:18', 'admin', '48'),
(3400, 'GHM3400', 'MMMIA PNT M', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '51500', '0', '51500', 'Normal', '2022-05-20 08:42:23', 'admin', '32'),
(3401, 'GHM3401', 'POPOK ADLT M', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '11000', '0', '11000', 'Normal', '2022-05-20 08:43:46', 'admin', '2PCS'),
(3402, 'GHM3402', 'SWEETY PNT  18 2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '32500', '0', '32500', 'Normal', '2022-05-21 15:07:18', 'admin', 'M'),
(3403, 'GHM3403', 'FLUFFY PNT 30', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '49900', '0', '49900', 'Normal', '2022-05-21 15:07:54', 'admin', 'L'),
(3404, 'GHM3404', 'FLUFFY PNT 34', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '51500', '0', '51500', 'Normal', '2022-05-21 15:08:49', 'admin', 'M'),
(3405, 'GHM3405', 'FLUFFY PNT 1', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '2500', '0', '2500', 'Normal', '2022-05-21 15:09:19', 'admin', 'L'),
(3406, 'GHM3406', 'TAS ARND GRL', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '75000', '0', '75000', 'Normal', '2022-05-21 15:09:56', 'admin', '1PCS'),
(3407, 'GHM3407', 'MMAMIA PNT 20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '27000', '0', '27000', 'Normal', '2022-05-21 15:10:22', 'admin', 'S'),
(3408, 'GHM3408', 'HPPY PNT 5', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '13000', '0', '13000', 'Normal', '2022-05-21 15:10:55', 'admin', 'XL'),
(3409, 'GHM3409', 'TAS ALTO STR', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '105000', '0', '105000', 'Normal', '2022-05-21 15:11:21', 'admin', '1PCS'),
(3410, 'GHM3410', 'TAS SPDMN ', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '105000', '0', '105000', 'Normal', '2022-05-21 15:11:50', 'admin', '1PCS'),
(3411, 'GHM3411', 'TAS AUTO', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '25000', '0', '25000', 'Normal', '2022-05-21 15:12:31', 'admin', '41377G'),
(3412, 'GHM3412', 'HPPY PRK 20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '29000', '0', '29000', 'Normal', '2022-05-21 15:13:00', 'admin', 'L'),
(3413, 'GHM3413', 'HPPY PRK M', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '26000', '0', '26000', 'Normal', '2022-05-21 15:13:36', 'admin', '20'),
(3414, 'GHM3414', 'TAS XXX 6061', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '77000', '0', '77000', 'Normal', '2022-05-21 15:14:35', 'admin', '1PCS'),
(3415, 'GHM3415', 'TAS UNCRN', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '105000', '0', '105000', 'Normal', '2022-05-21 15:15:09', 'admin', '1PCS'),
(3416, 'GHM3416', 'TAS XXX ', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '89000', '0', '89000', 'Normal', '2022-05-21 15:15:31', 'admin', '1PCS'),
(3417, 'GHM3417', 'HPPY PRK S', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '23000', '0', '23000', 'Normal', '2022-05-21 15:16:03', 'admin', '20'),
(3418, 'GHM3418', 'HPPY PNT 20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '33000', '0', '33000', 'Normal', '2022-05-21 15:18:25', 'admin', 'M'),
(3419, 'GHM3419', 'HPPY PNT XL20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '41000', '0', '41000', 'Normal', '2022-05-21 15:19:51', 'admin', 'P'),
(3420, 'GHM3420', 'HPPY PNT S20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '28500', '0', '28500', 'Normal', '2022-07-08 10:28:47', 'admin', 'P'),
(3421, 'GHM3421', 'HPPY PNT XL26', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '41500', '0', '41500', 'Normal', '2022-05-21 15:20:54', 'admin', 'P'),
(3422, 'GHM3422', 'HPPY PNT L30', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '45000', '0', '45000', 'Normal', '2022-05-21 15:21:23', 'admin', 'P'),
(3423, 'GHM3423', 'HPPY PRK L40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '53000', '0', '53000', 'Normal', '2022-05-21 15:21:50', 'admin', 'P'),
(3424, 'GHM3424', 'HPPY PRK M40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '47000', '0', '47000', 'Normal', '2022-05-21 15:22:17', 'admin', 'P'),
(3425, 'GHM3425', 'MMYPKO PNT XL26', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-05-21 15:22:53', 'admin', 'P'),
(3426, 'GHM3426', 'FLUFFY PRK S40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '40500', '0', '40500', 'Normal', '2022-05-21 15:23:23', 'admin', 'P'),
(3427, 'GHM3427', 'MMYPKO PNT M9', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '17500', '0', '17500', 'Normal', '2022-05-21 15:23:52', 'admin', 'P'),
(3428, 'GHM3428', 'MMYPKO PNT S11', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '19000', '0', '19000', 'Normal', '2022-05-21 15:24:16', 'admin', 'P'),
(3429, 'GHM3429', 'FLUFFY PNT M36', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '48500', '0', '48500', 'Normal', '2022-05-21 15:24:45', 'admin', 'P'),
(3430, 'GHM3430', 'SWEETY BR NB24', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '30500', '0', '30500', 'Normal', '2022-05-21 15:25:17', 'admin', 'P'),
(3431, 'GHM3431', 'SWEETY BRM22', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '', '31500', '0', '31500', 'Normal', '2022-05-21 15:25:44', 'admin', 'P'),
(3432, 'GHM3432', 'SWEETY PNT L20 ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '35500', '0', '35500', 'Normal', '2022-05-21 15:26:17', 'admin', 'P'),
(3433, 'GHM3433', 'POPOKU PNTXL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '23000', '0', '23000', 'Normal', '2022-05-21 15:27:00', 'admin', 'P'),
(3434, 'GHM3434', 'FLUFFY PNT XL14', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '24000', '0', '24000', 'Normal', '2022-05-21 15:27:29', 'admin', 'P'),
(3435, 'GHM3435', 'FLUFFY PRK L16', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '23300', '0', '23300', 'Normal', '2022-05-21 15:28:01', 'admin', 'P'),
(3436, 'GHM3436', 'SWEETY PNT M8', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '17000', '0', '17000', 'Normal', '2022-05-21 15:28:28', 'admin', 'P'),
(3437, 'GHM3437', 'SWEETY PNT S10', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '19000', '0', '19000', 'Normal', '2022-05-21 15:28:55', 'admin', 'P'),
(3438, 'GHM3438', 'FLUFFY PNTM18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '29400', '0', '29400', 'Normal', '2022-07-08 10:10:21', 'admin', 'P'),
(3439, 'GHM3439', 'POPOKU XL10', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '19800', '0', '19800', 'Normal', '2022-05-21 15:29:57', 'admin', 'P'),
(3440, 'GHM3440', 'SWEETY PNTM9', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '19000', '0', '19000', 'Normal', '2022-05-21 15:30:30', 'admin', 'P'),
(3441, 'GHM3441', 'POPOKU L10', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '18900', '0', '18900', 'Normal', '2022-05-21 15:31:00', 'admin', 'P'),
(3442, 'GHM3442', 'POPOKU EXTM20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '30500', '0', '30500', 'Normal', '2022-05-21 15:31:32', 'admin', 'P'),
(3443, 'GHM3443', 'MMYPKO PNTM1', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '2500', '0', '2500', 'Normal', '2022-05-21 15:32:20', 'admin', 'P'),
(3444, 'GHM3444', 'FLFFY PNTM1', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '2500', '0', '2500', 'Normal', '2022-05-21 15:32:56', 'admin', 'P'),
(3445, 'GHM3445', 'MMYPKO PNTL1', 'PULSA/ TOKEN', '0', '2500', '0', '2500', 'Normal', '2022-05-21 15:33:23', 'admin', 'P'),
(3446, 'GHM3446', 'SWETY PNT L18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '37300', '0', '37300', 'Normal', '2022-05-21 15:34:00', 'admin', 'P'),
(3447, 'GHM3447', 'PPOK IDEAL L10', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-05-21 15:34:51', 'admin', 'P'),
(3448, 'GHM3448', 'PPOK SFT L20', 'PULSA/ TOKEN', '0', '30800', '0', '30800', 'Normal', '2022-05-21 15:35:22', 'admin', 'P'),
(3449, 'GHM3449', 'FLUFFY PNT S40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '45500', '0', '45500', 'Normal', '2022-05-21 15:35:50', 'admin', 'P'),
(3450, 'GHM3450', 'MMAMIA SFT L20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '32500', '0', '32500', 'Normal', '2022-05-21 15:36:17', 'admin', 'P'),
(3451, 'GHM3451', 'MMAMIA M20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '33000', '0', '33000', 'Normal', '2022-05-21 15:36:45', 'admin', 'P'),
(3452, 'GHM3452', 'SYANGK PNT L16', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '26500', '0', '26500', 'Normal', '2022-05-21 15:37:13', 'admin', 'P'),
(3453, 'GHM3453', 'SYANGK PNT M18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '27000', '0', '27000', 'Normal', '2022-07-08 10:11:14', 'admin', 'P'),
(3454, 'GHM3454', 'SWETY PRK M40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '56000', '0', '56000', 'Normal', '2022-05-21 15:38:19', 'admin', 'P'),
(3455, 'GHM3455', 'HPPY PNT S40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '43000', '0', '43000', 'Normal', '2022-05-21 15:38:46', 'admin', 'P'),
(3456, 'GHM3456', 'HPPY PNT M34', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '46000', '0', '46000', 'Normal', '2022-05-21 15:39:12', 'admin', 'P'),
(3457, 'GHM3457', 'HPPY PRK S40', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '41500', '0', '41500', 'Normal', '2022-05-21 15:39:38', 'admin', 'P'),
(3458, 'GHM3458', 'SWETY PNT M34 2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '50000', '0', '50000', 'Normal', '2022-05-21 15:40:06', 'admin', 'P'),
(3459, 'GHM3459', 'SWETY SLVPNT L28', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-05-21 15:40:37', 'admin', 'P'),
(3460, 'GHM3460', 'FLFFY PNT M18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '28000', '0', '28000', 'Normal', '2022-05-21 15:41:10', 'admin', 'P'),
(3461, 'GHM3461', 'FLFFY PNT L18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '32000', '0', '32000', 'Normal', '2022-05-21 15:41:42', 'admin', 'P'),
(3462, 'GHM3462', 'FLUFFY PNT S20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '24000', '0', '24000', 'Normal', '2022-05-21 15:42:11', 'admin', 'P'),
(3463, 'GHM3463', 'FLUFFY PNT L7', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '13500', '0', '13500', 'Normal', '2022-05-21 15:42:37', 'admin', 'P'),
(3464, 'GHM3464', 'FLUFFY PNT M8', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '13500', '0', '13500', 'Normal', '2022-05-21 15:43:04', 'admin', 'P'),
(3465, 'GHM3465', 'FLUFFY PNT L18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '32000', '0', '32000', 'Normal', '2022-05-21 15:54:02', 'admin', 'P'),
(3466, 'GHM3466', 'SWEETY SLV L28', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-05-21 15:56:41', 'admin', 'P'),
(3467, 'GHM3467', 'SWEETY PNT M34 2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '50000', '0', '50000', 'Normal', '2022-05-21 15:59:16', 'admin', 'P'),
(3468, 'GHM3468', 'FLUFFY PNT M1', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '2500', '0', '2500', 'Normal', '2022-05-21 16:06:46', 'admin', 'P'),
(3469, 'GHM3469', 'PPOKU EXT M20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '30500', '0', '30500', 'Normal', '2022-05-21 16:08:31', 'admin', 'P'),
(3470, 'GHM3470', 'HPPY PNT L20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '37000', '0', '37000', 'Normal', '2022-05-21 16:20:31', 'admin', 'P'),
(3471, 'GHM3471', 'KKRUNCH DBCHO ', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-31 09:50:00', 'admin', '20G'),
(3472, 'GHM3472', 'MILO KRNCH', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-05-31 10:15:35', 'admin', '32G');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(3473, 'GHM3473', 'BVITA UHT JMB', 'MINUMAN', '0', '28500', '0', '28500', 'Normal', '2022-05-31 10:20:54', 'admin', '1000ML'),
(3474, 'GHM3474', 'HTARI KLP ', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-05-31 10:27:48', 'admin', '1RTG'),
(3475, 'GHM3475', 'MLKIST MRH ', 'ROTI/SNACK/Camilan', '0', '10000', '0', '10000', 'Normal', '2022-05-31 10:32:25', 'admin', '1RTG'),
(3476, 'GHM3476', 'KKRUNCH DUO ', 'ROTI/SNACK/Camilan', '0', '26500', '0', '26500', 'Normal', '2022-05-31 10:35:51', 'admin', '170G'),
(3477, 'GHM3477', 'KOKOKRNCH CHO ', 'ROTI/SNACK/Camilan', '0', '23500', '0', '23500', 'Normal', '2022-05-31 10:37:15', 'admin', '170G'),
(3478, 'GHM3478', 'KOPIKO CLASIC ', 'PERMEN/COKLAT', '0', '9500', '0', '9500', 'Normal', '2022-05-31 10:42:45', 'admin', '150GR'),
(3479, 'GHM3479', 'PRM HRB ANTG ', 'PERMEN/COKLAT', '0', '7500', '0', '7500', 'Normal', '2022-05-31 10:45:13', 'admin', '100G'),
(3480, 'GHM3480', 'ZAE JSMINE ', 'PERMEN/COKLAT', '0', '4000', '0', '4000', 'Normal', '2022-05-31 10:47:54', 'admin', '21G'),
(3481, 'GHM3481', 'SEDAP CP KRN', 'SEMBAKO', '0', '4800', '0', '4800', 'Normal', '2022-05-31 10:53:47', 'admin', '81G'),
(3482, 'GHM3482', 'SARIMI2 AYKCP ', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-05-31 10:55:32', 'admin', '126G'),
(3483, 'GHM3483', 'SARIMI2 AYBW ', 'SEMBAKO', '0', '4000', '0', '4000', 'Normal', '2022-05-31 11:00:52', 'admin', '115G'),
(3484, 'GHM3484', 'SARIMI2 BSO ', 'SEMBAKO', '0', '4000', '0', '4000', 'Promo', '2022-05-31 11:02:49', 'admin', '115G'),
(3485, 'GHM3485', 'BHUNKU KRLKS ', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-05-31 11:04:45', 'admin', '55G'),
(3486, 'GHM3486', 'MG SAHABT ', 'SEMBAKO', '0', '12500', '500', '12000', 'Promo', '2022-08-23 14:58:37', 'admin', '500ML'),
(3487, 'GHM3487', 'GULAKU PRM ', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-05-31 11:52:14', 'admin', '500G'),
(3488, 'GHM3488', 'YUPI BGR ', 'PERMEN/COKLAT', '0', '1000', '0', '1000', 'Normal', '2022-05-31 12:05:20', 'admin', '12G'),
(3489, 'GHM3489', 'YUPI PZZA ', 'PERMEN/COKLAT', '0', '1500', '0', '1500', 'Normal', '2022-05-31 12:07:02', 'admin', '10G'),
(3490, 'GHM3490', 'CRELAC AYSYR ', 'SUSU BUBUK/SUSU CAIR', '0', '17500', '0', '17500', 'Normal', '2022-06-03 08:42:15', 'admin', '120G'),
(3491, 'GHM3491', 'CRELAC BM', 'SUSU BUBUK/SUSU CAIR', '0', '12500', '0', '12500', 'Normal', '2022-06-03 11:46:43', 'admin', '120G'),
(3492, 'GHM3492', 'SUN BBR KH', 'SUSU BUBUK/SUSU CAIR', '0', '9000', '0', '9000', 'Normal', '2022-06-03 11:48:32', 'admin', '120G'),
(3493, 'GHM3493', 'PROMN KH ', 'SUSU BUBUK/SUSU CAIR', '0', '13500', '0', '13500', 'Normal', '2022-06-03 11:50:13', 'admin', '120G'),
(3494, 'GHM3494', 'NURI BT', 'MINUMAN', '0', '2000', '0', '2000', 'Normal', '2022-06-03 11:53:55', 'admin', '600ML'),
(3495, 'GHM3495', 'MIZONE SF ', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-06-03 11:56:03', 'admin', '500ML'),
(3496, 'GHM3496', 'ADEM SRI BT ', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-06-03 11:57:54', 'admin', '350ML'),
(3497, 'GHM3497', 'ABC CHMLT ', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-06-03 11:59:39', 'admin', '200ML'),
(3498, 'GHM3498', 'ADEM SR KLG', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-06-03 12:01:01', 'admin', '320ML'),
(3499, 'GHM3499', 'FBRSHOT 6 ', 'MINUMAN', '0', '8000', '0', '8000', 'Normal', '2022-06-03 12:05:14', 'admin', '100ML'),
(3500, 'GHM3500', 'BNECOL LYC ', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-06-03 12:06:00', 'admin', '100ML'),
(3501, 'GHM3501', 'NTRV FBRSHOT', 'MINUMAN', '0', '8000', '0', '8000', 'Normal', '2022-06-03 12:07:19', 'admin', '100ML'),
(3502, 'GHM3502', 'INDMLK UHT CL', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-06-03 12:10:42', 'admin', ' 190ML'),
(3503, 'GHM3503', 'CIMRY SQZ BBR', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-03 12:12:11', 'admin', '120G'),
(3504, 'GHM3504', 'CIMRY SQZ PSG', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-03 12:13:27', 'admin', '120G'),
(3505, 'GHM3505', 'CMORY SQZ STR', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-03 12:14:01', 'admin', '120G'),
(3506, 'GHM3506', 'CMORY SQZ PCH', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-03 12:14:27', 'admin', '120G'),
(3507, 'GHM3507', 'NEABTY TSU ', 'TISU/PEMBALUT', '0', '9000', '0', '9000', 'Normal', '2022-06-03 16:54:48', 'admin', '200G'),
(3508, 'GHM3508', 'TS PASEO LUX ', 'TISU/PEMBALUT', '0', '21600', '0', '21600', 'Normal', '2022-08-04 11:20:58', 'admin', '280S'),
(3509, 'GHM3509', 'TS TESSA TP-06 ', 'TISU/PEMBALUT', '0', '11000', '0', '11000', 'Normal', '2022-07-19 09:08:22', 'admin', '200S'),
(3510, 'GHM3510', 'TS TESSA TP0 ', 'TISU/PEMBALUT', '0', '18500', '0', '18500', 'Normal', '2022-06-03 17:01:16', 'admin', '150S'),
(3511, 'GHM3511', 'TS GREEN POP ', 'TISU/PEMBALUT', '0', '4500', '0', '4500', 'Normal', '2022-06-03 17:04:48', 'admin', '150S'),
(3512, 'GHM3512', 'TS GREENSFT', 'TISU/PEMBALUT', '0', '8500', '0', '8500', 'Normal', '2022-06-03 17:06:59', 'admin', '200S'),
(3513, 'GHM3513', 'PASEO BWPS KNG ', 'TISU/PEMBALUT', '0', '14400', '0', '14400', 'Normal', '2022-06-03 17:08:11', 'admin', '50S'),
(3514, 'GHM3514', 'PASEO BWPS PNK ', 'TISU/PEMBALUT', '0', '14400', '0', '14400', 'Normal', '2022-06-03 17:10:31', 'admin', '50S'),
(3515, 'GHM3515', 'MMYPKO WPS AM', 'TISU/PEMBALUT', '0', '18600', '0', '18600', 'Normal', '2022-06-03 17:15:24', 'admin', '50S'),
(3516, 'GHM3516', 'MMYPKO BWPS HM ', 'TISU/PEMBALUT', '0', '14000', '0', '14000', 'Normal', '2022-06-03 17:17:34', 'admin', '50S'),
(3517, 'GHM3517', 'MAMYPK WPS ATSP', 'TISU/PEMBALUT', '0', '19400', '0', '19400', 'Normal', '2022-06-03 17:19:04', 'admin', ' 48S'),
(3518, 'GHM3518', 'CS WPS M G ', 'TISU/PEMBALUT', '0', '12000', '0', '12000', 'Normal', '2022-06-03 17:20:52', 'admin', '50S'),
(3519, 'GHM3519', 'CSSON WPS MD', 'TISU/PEMBALUT', '0', '8500', '0', '8500', 'Normal', '2022-08-17 10:48:35', 'admin', '50S'),
(3520, 'GHM3520', 'MYBBY WPS KN', 'TISU/PEMBALUT', '0', '13500', '0', '13500', 'Normal', '2022-06-03 18:31:16', 'admin', '50S'),
(3521, 'GHM3521', 'MYBABY WPS GC ', 'TISU/PEMBALUT', '0', '16800', '0', '16800', 'Normal', '2022-06-03 18:34:59', 'admin', '75S'),
(3522, 'GHM3522', 'MITU WPS BR ', 'TISU/PEMBALUT', '0', '6000', '0', '6000', 'Normal', '2022-06-03 18:37:11', 'admin', '10S'),
(3523, 'GHM3523', 'CS WPS BR', 'TISU/PEMBALUT', '0', '5500', '0', '5500', 'Normal', '2022-06-03 18:39:34', 'admin', '10S'),
(3524, 'GHM3524', 'CS WPS PNK ', 'TISU/PEMBALUT', '0', '5500', '0', '5500', 'Normal', '2022-06-03 18:40:43', 'admin', '10S'),
(3525, 'GHM3525', 'MYBABY WIPES AB ', 'TISU/PEMBALUT', '0', '6000', '0', '6000', 'Normal', '2022-06-03 18:41:24', 'admin', '10S'),
(3526, 'GHM3526', 'LAURIER HS 22 ', 'TISU/PEMBALUT', '0', '13600', '0', '13600', 'Normal', '2022-06-03 19:10:18', 'admin', '9P'),
(3527, 'GHM3527', 'CHARM CLFRS 26W ', 'TISU/PEMBALUT', '0', '18000', '0', '18000', 'Normal', '2022-06-03 19:15:21', 'admin', '14P'),
(3528, 'GHM3528', 'CHARM MWNG 23C', 'TISU/PEMBALUT', '0', '16500', '0', '16500', 'Normal', '2022-06-03 19:16:58', 'admin', '20P'),
(3529, 'GHM3529', 'CHARM MWNG 20P', 'TISU/PEMBALUT', '0', '16500', '0', '16500', 'Normal', '2022-06-03 19:18:11', 'admin', '23CM'),
(3530, 'GHM3530', 'CHARM PNT DFRS ', 'TISU/PEMBALUT', '0', '15700', '0', '15700', 'Normal', '2022-06-03 19:19:52', 'admin', '52P'),
(3531, 'GHM3531', 'SFTX SRH HF 29CM ', 'TISU/PEMBALUT', '0', '16500', '0', '16500', 'Normal', '2022-06-03 19:21:52', 'admin', '8P'),
(3532, 'GHM3532', 'SFTX NCL 36 ', 'TISU/PEMBALUT', '0', '15500', '0', '15500', 'Normal', '2022-06-03 19:24:19', 'admin', '8P'),
(3533, 'GHM3533', 'MASTER SC RW', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '14800', '0', '14800', 'Normal', '2022-06-03 19:39:23', 'admin', ' 100ML'),
(3534, 'GHM3534', 'GTSB SPR RLX ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18000', '0', '18000', 'Normal', '2022-06-03 19:41:49', 'admin', '100ML'),
(3535, 'GHM3535', 'GTSB SPR GME ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17000', '0', '17000', 'Normal', '2022-06-03 19:42:47', 'admin', '100ML'),
(3536, 'GHM3536', 'GTSB SPR SPT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16200', '0', '16200', 'Normal', '2022-06-03 19:44:52', 'admin', ' 100ML'),
(3537, 'GHM3537', 'HRB GL ALOE ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '68400', '0', '68400', 'Normal', '2022-06-03 19:48:28', 'admin', '250G'),
(3538, 'GHM3538', 'SCRLET BSCR PM ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '63600', '0', '63600', 'Normal', '2022-06-03 19:50:28', 'admin', '250ML'),
(3539, 'GHM3539', 'KRP TRIPANG ', 'ROTI/SNACK/Camilan', '0', '26000', '0', '26000', 'Normal', '2022-06-03 19:55:40', 'admin', '1PCS'),
(3540, 'GHM3540', 'DP KRP PSG ', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-06-03 19:58:36', 'admin', '100G'),
(3541, 'GHM3541', 'TARO ITLPZ', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-06-03 20:03:32', 'admin', '36G'),
(3542, 'GHM3542', 'STELA ALT RFIL', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '72400', '0', '72400', 'Normal', '2022-06-04 08:37:01', 'admin', '1PCS'),
(3543, 'GHM3543', 'MAMA G TEA BT ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '15000', '0', '15000', 'Normal', '2022-06-04 08:41:14', 'admin', '400ML'),
(3544, 'GHM3544', 'SOKLN LT LVN ', 'DETERGENT', '0', '8500', '0', '8500', 'Normal', '2022-08-04 10:39:09', 'admin', '400ML'),
(3545, 'GHM3545', 'DAHLIA RF SG ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '32600', '0', '32600', 'Normal', '2022-06-04 08:44:09', 'admin', '225ML'),
(3546, 'GHM3546', 'STELA RF SKRJP ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '35400', '0', '35400', 'Normal', '2022-06-04 08:46:43', 'admin', '225ML'),
(3547, 'GHM3547', 'STELA RF CFFE ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '36700', '0', '36700', 'Normal', '2022-06-04 08:47:49', 'admin', '225ML'),
(3548, 'GHM3548', 'STELA DISLAND ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '35700', '0', '35700', 'Normal', '2022-06-04 08:49:14', 'admin', '225ML'),
(3549, 'GHM3549', 'STELA RF WILD ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '34500', '0', '34500', 'Normal', '2022-06-04 08:50:49', 'admin', '225ML'),
(3550, 'GHM3550', 'BAYGON SPR ORG ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '15900', '0', '15900', 'Normal', '2022-06-04 08:52:11', 'admin', '200ML'),
(3551, 'GHM3551', 'DAHLIA RF CB ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '23600', '0', '23600', 'Normal', '2022-06-04 08:53:12', 'admin', '225ML'),
(3552, 'GHM3552', 'DAHLIA RF LLY ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '31400', '0', '31400', 'Normal', '2022-06-04 08:54:24', 'admin', '225ML'),
(3553, 'GHM3553', 'SOKLN PRF RMT ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '8600', '0', '8600', 'Normal', '2022-06-04 08:56:53', 'admin', '450ML'),
(3554, 'GHM3554', 'SOKLN PWG RMTC', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '17600', '0', '17600', 'Normal', '2022-06-04 08:58:53', 'admin', ' 900ML'),
(3555, 'GHM3555', 'SOFT SKRF TKY ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '18700', '0', '18700', 'Normal', '2022-06-04 09:00:48', 'admin', '900ML'),
(3556, 'GHM3556', 'RYALE SNYD RF ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '25600', '0', '25600', 'Normal', '2022-06-04 09:02:13', 'admin', '800ML'),
(3557, 'GHM3557', 'RYLE PINK STN ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '32400', '0', '32400', 'Normal', '2022-06-04 09:03:46', 'admin', '780ML'),
(3558, 'GHM3558', 'RYALE STRNIGHT ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '30800', '0', '30800', 'Normal', '2022-06-04 09:04:55', 'admin', '780ML'),
(3559, 'GHM3559', 'SOKL PWRF BR ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '8000', '0', '8000', 'Normal', '2022-06-04 09:06:37', 'admin', '450ML'),
(3560, 'GHM3560', 'SKL PWG EXTC ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '7600', '0', '7600', 'Normal', '2022-06-04 09:07:51', 'admin', '450ML'),
(3561, 'GHM3561', 'SHNZI MYRI', 'PERLENGKAPAN MANDI', '0', '29500', '0', '29500', 'Normal', '2022-06-04 09:10:08', 'admin', ' 420ML'),
(3562, 'GHM3562', 'SHZUI MTS RF', 'PERLENGKAPAN MANDI', '0', '29000', '0', '29000', 'Normal', '2022-06-04 09:39:04', 'admin', ' 420ML'),
(3563, 'GHM3563', 'SHZUI RF KR ', 'PERLENGKAPAN MANDI', '0', '28500', '0', '28500', 'Normal', '2022-06-04 09:40:07', 'admin', '420ML'),
(3564, 'GHM3564', 'LIFBY MTCH ', 'PERLENGKAPAN MANDI', '0', '25000', '0', '25000', 'Normal', '2022-06-04 09:42:19', 'admin', '250ML'),
(3565, 'GHM3565', 'LFBY MLD RF ', 'PERLENGKAPAN MANDI', '0', '23500', '0', '23500', 'Normal', '2022-06-04 09:43:41', 'admin', '250ML'),
(3566, 'GHM3566', 'CITRA RF PRL ', 'PERLENGKAPAN MANDI', '0', '19700', '0', '19700', 'Normal', '2022-06-04 09:44:50', 'admin', '220ML'),
(3567, 'GHM3567', 'HIT SPR ORG', 'PERABOTAN RUMAH TANGGA', '0', '17400', '0', '17400', 'Normal', '2022-06-04 10:10:29', 'admin', ' 200ML'),
(3568, 'GHM3568', 'HIT SPR BTEA ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '19500', '0', '19500', 'Normal', '2022-06-04 10:14:35', 'admin', '200ML'),
(3569, 'GHM3569', 'BYGON SPRWTR ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '20500', '0', '20500', 'Normal', '2022-06-04 10:16:31', 'admin', '275ML'),
(3570, 'GHM3570', 'SP CLEAR ICMN ', 'PERLENGKAPAN MANDI', '0', '23500', '0', '23500', 'Normal', '2022-06-04 10:17:53', 'admin', '125ML'),
(3571, 'GHM3571', 'SP PANTENE BLCK', 'PERLENGKAPAN MANDI', '0', '15000', '0', '15000', 'Normal', '2022-06-04 10:24:17', 'admin', ' 70ML'),
(3572, 'GHM3572', 'PANT CND BIOTN ', 'PERLENGKAPAN MANDI', '0', '16500', '0', '16500', 'Normal', '2022-06-04 10:25:31', 'admin', '70ML'),
(3573, 'GHM3573', 'PANT CND CLGEN ', 'PERLENGKAPAN MANDI', '0', '17600', '0', '17600', 'Normal', '2022-06-04 10:27:10', 'admin', '70ML'),
(3574, 'GHM3574', 'RJOICE CND RICH', 'PERLENGKAPAN MANDI', '0', '13500', '0', '13500', 'Normal', '2022-06-04 10:28:42', 'admin', ' 70ML'),
(3575, 'GHM3575', 'MKRIZO HR BCST ', 'PERLENGKAPAN MANDI', '0', '31500', '0', '31500', 'Normal', '2022-06-04 10:30:09', 'admin', '100ML'),
(3576, 'GHM3576', 'PIXY FW WHP ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '19400', '0', '19400', 'Normal', '2022-06-04 10:32:39', 'admin', '60G'),
(3577, 'GHM3577', 'PIXY FW GLW ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '21500', '0', '21500', 'Normal', '2022-06-04 10:33:34', 'admin', '60G'),
(3578, 'GHM3578', 'HNSUI MSK EGG ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17400', '0', '17400', 'Normal', '2022-06-04 10:35:21', 'admin', '80G'),
(3579, 'GHM3579', 'FAIR LVELY 2IN1 ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26500', '0', '26500', 'Normal', '2022-06-04 10:37:02', 'admin', '20G'),
(3580, 'GHM3580', 'FAIR LVELY CRM ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '31000', '0', '31000', 'Normal', '2022-06-04 10:38:13', 'admin', '46G'),
(3581, 'GHM3581', 'FAIR MSK SRMC ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '10000', '0', '10000', 'Normal', '2022-06-04 10:40:36', 'admin', '20G'),
(3582, 'GHM3582', 'FAIR MASK VITA ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '10000', '0', '10000', 'Normal', '2022-06-04 10:42:30', 'admin', '20G'),
(3583, 'GHM3583', 'MIRANDA MC-6 ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13500', '0', '13500', 'Normal', '2022-06-04 10:44:02', 'admin', '30ML'),
(3584, 'GHM3584', 'SP PNTEN DMOIS', 'PERLENGKAPAN MANDI', '0', '27400', '0', '27400', 'Normal', '2022-06-04 10:45:09', 'admin', ' 130ML'),
(3585, 'GHM3585', 'PONDS FW TONE ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '37400', '0', '37400', 'Normal', '2022-06-04 10:46:50', 'admin', '100G'),
(3586, 'GHM3586', 'GAR SKR WHP ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '35500', '0', '35500', 'Normal', '2022-06-04 10:47:59', 'admin', '100ML'),
(3587, 'GHM3587', 'CITRA FF GTEA ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '31500', '0', '31500', 'Normal', '2022-06-04 10:52:06', 'admin', '100G'),
(3588, 'GHM3588', 'WARDAH CDFN ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '19500', '0', '19500', 'Normal', '2022-06-04 10:53:20', 'admin', '60ML'),
(3589, 'GHM3589', 'SB PIXY ACN ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '14600', '0', '14600', 'Normal', '2022-06-04 10:54:22', 'admin', '40G'),
(3590, 'GHM3590', 'PONDS FF BB ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '27000', '0', '27000', 'Normal', '2022-06-04 10:55:43', 'admin', '100G'),
(3591, 'GHM3591', 'BIORE FW ACN ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '27500', '0', '27500', 'Normal', '2022-06-04 10:58:26', 'admin', '100G'),
(3592, 'GHM3592', 'ENCHT RO ALLR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22000', '0', '22000', 'Normal', '2022-06-04 11:54:56', 'admin', ' 40ML'),
(3593, 'GHM3593', 'ENCHT RO RMT ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20500', '0', '20500', 'Normal', '2022-06-04 11:56:37', 'admin', '50ML'),
(3594, 'GHM3594', 'ENCHT RO CHRM ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '21000', '0', '21000', 'Normal', '2022-06-04 11:57:34', 'admin', '40ML'),
(3595, 'GHM3595', 'VITALIS RO BLS ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17000', '0', '17000', 'Normal', '2022-06-04 11:58:41', 'admin', '40ML'),
(3596, 'GHM3596', 'VITALIS RO BZAR ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16500', '0', '16500', 'Normal', '2022-06-04 12:04:02', 'admin', '40ML'),
(3597, 'GHM3597', 'VITALIS RO BRZ ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17600', '0', '17600', 'Normal', '2022-06-04 12:05:17', 'admin', '40ML'),
(3598, 'GHM3598', 'CSBLNC RO AMB ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16800', '0', '16800', 'Normal', '2022-06-04 12:06:49', 'admin', '50ML'),
(3599, 'GHM3599', 'CSBLNC RO RMTC ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16800', '0', '16800', 'Normal', '2022-06-04 12:08:08', 'admin', '50ML'),
(3600, 'GHM3600', 'CSBLNC RO INT ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17500', '0', '17500', 'Normal', '2022-06-04 12:09:04', 'admin', '50ML'),
(3601, 'GHM3601', 'CSBLNC RO ETR ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17500', '0', '17500', 'Normal', '2022-06-04 12:10:09', 'admin', '50ML'),
(3602, 'GHM3602', 'CSBLNC RO DYN ', 'MINUMAN', '0', '17500', '0', '17500', 'Normal', '2022-06-04 12:11:00', 'admin', '50ML'),
(3603, 'GHM3603', 'DEO ALEX GLD ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26600', '0', '26600', 'Normal', '2022-06-04 12:12:15', 'admin', '30G'),
(3604, 'GHM3604', 'DEO ALEX HT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26600', '0', '26600', 'Normal', '2022-06-04 12:20:34', 'admin', ' 30ML'),
(3605, 'GHM3605', 'DEO TLINO KN ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '27500', '0', '27500', 'Normal', '2022-06-04 12:21:31', 'admin', '30ML'),
(3606, 'GHM3606', 'GTSBY UID STN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-06-04 12:22:34', 'admin', ' 34G'),
(3607, 'GHM3607', 'REXONA ULTRCH ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '17800', '0', '17800', 'Normal', '2022-06-04 12:23:33', 'admin', '45ML'),
(3608, 'GHM3608', 'GTSBY RO URB ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18500', '0', '18500', 'Normal', '2022-06-04 12:24:32', 'admin', '50ML'),
(3609, 'GHM3609', 'PEMB OVALE WHT ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '10000', '0', '10000', 'Normal', '2022-06-04 12:33:49', 'admin', '60ML'),
(3610, 'GHM3610', 'PMB OVL ACN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26500', '0', '26500', 'Normal', '2022-06-04 12:34:54', 'admin', ' 200ML'),
(3611, 'GHM3611', 'PMB OVALE LMN ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '27600', '0', '27600', 'Normal', '2022-06-04 12:36:24', 'admin', '200ML'),
(3612, 'GHM3612', 'CSBLNC RO PR ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16800', '0', '16800', 'Normal', '2022-06-04 12:38:50', 'admin', '50ML'),
(3613, 'GHM3613', 'SCRLET HL CHRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '63800', '0', '63800', 'Normal', '2022-06-04 12:41:07', 'admin', ' 300ML'),
(3614, 'GHM3614', 'SCRLET HL RMNS ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '63800', '0', '63800', 'Normal', '2022-06-04 12:42:23', 'admin', '300ML'),
(3615, 'GHM3615', 'SCRLET SH CHR ', 'PERLENGKAPAN MANDI', '0', '64000', '0', '64000', 'Normal', '2022-06-04 12:47:34', 'admin', '300ML'),
(3616, 'GHM3616', 'SB DETTOL SNTV ', 'PERLENGKAPAN MANDI', '0', '10000', '0', '10000', 'Promo', '2022-06-04 12:51:00', 'admin', '100ML'),
(3617, 'GHM3617', 'GRNIER MW PNK ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '30800', '0', '30800', 'Normal', '2022-06-04 12:53:35', 'admin', '125ML'),
(3618, 'GHM3618', 'MIRNDA HM JOB', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9500', '0', '9500', 'Normal', '2022-06-04 12:54:47', 'admin', ' 30G'),
(3619, 'GHM3619', 'ELLIPS HMSK SMT ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12400', '0', '12400', 'Normal', '2022-06-04 12:57:32', 'admin', '18G'),
(3620, 'GHM3620', 'MRNDA HM JOB', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9500', '0', '9500', 'Normal', '2022-06-04 12:56:43', 'admin', ' 30G'),
(3621, 'GHM3621', 'MEI HWA BLUMT ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13000', '0', '13000', 'Normal', '2022-06-04 13:00:01', 'admin', '1PCS'),
(3622, 'GHM3622', 'BULU MTA KRY', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12800', '0', '12800', 'Normal', '2022-06-04 13:01:29', 'admin', ' K07'),
(3623, 'GHM3623', 'RK BLD 16', 'ROKOK', '0', '25500', '0', '25500', 'Normal', '2022-06-09 12:28:13', 'admin', 'BTG'),
(3624, 'GHM3624', 'RK LA BLD 12', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-06-09 12:28:38', 'admin', 'BTG'),
(3625, 'GHM3625', 'LCTOGRW 4', 'SUSU BUBUK/SUSU CAIR', '0', '105000', '0', '105000', 'Normal', '2022-06-10 11:40:29', 'admin', '750G'),
(3626, 'GHM3626', 'DNCOW 3  MD', 'SUSU BUBUK/SUSU CAIR', '0', '50000', '0', '50000', 'Normal', '2022-06-10 11:43:06', 'admin', '400G'),
(3627, 'GHM3627', 'LFBUOY HMT LMN', 'PERLENGKAPAN MANDI', '0', '24200', '0', '24200', 'Normal', '2022-06-10 11:43:59', 'admin', '4PCS'),
(3628, 'GHM3628', 'LFBOUY HMT MRH', 'PERLENGKAPAN MANDI', '0', '25500', '0', '25500', 'Normal', '2022-06-10 11:44:49', 'admin', '4PCS'),
(3629, 'GHM3629', 'LFBOUY HMT BR', 'PERLENGKAPAN MANDI', '0', '23800', '0', '23800', 'Normal', '2022-06-10 11:45:29', 'admin', '4PCS'),
(3630, 'GHM3630', 'CUSSNS SHM AVC', 'POPOK/PERLENGKAPAN ( Bayi', '0', '13500', '0', '13500', 'Normal', '2022-06-10 11:46:59', 'admin', '100ML'),
(3631, 'GHM3631', 'PPYA PQT WHT', 'PERLENGKAPAN MANDI', '0', '13500', '0', '13500', 'Normal', '2022-06-10 11:47:57', 'admin', '135G'),
(3632, 'GHM3632', 'SB JHNSON BLS', 'PERLENGKAPAN MANDI', '0', '5500', '0', '5500', 'Normal', '2022-06-10 11:49:27', 'admin', '100G'),
(3633, 'GHM3633', 'AINIE PPYA', 'PERLENGKAPAN MANDI', '0', '14000', '0', '14000', 'Normal', '2022-06-10 11:50:56', 'admin', '135G'),
(3634, 'GHM3634', 'SB LUX BLUE', 'PERLENGKAPAN MANDI', '0', '4500', '0', '4500', 'Normal', '2022-06-10 11:53:16', 'admin', '20G'),
(3635, 'GHM3635', 'SB HRMONY ORG ', 'PERLENGKAPAN MANDI', '0', '3000', '0', '3000', 'Normal', '2022-06-10 11:54:15', 'admin', '70G'),
(3636, 'GHM3636', 'SB HRMONY MLN', 'PERLENGKAPAN MANDI', '0', '3000', '0', '3000', 'Normal', '2022-06-10 11:54:50', 'admin', '70G'),
(3637, 'GHM3637', 'PST CSSN APL', 'PERLENGKAPAN MANDI', '0', '6000', '0', '6000', 'Normal', '2022-06-10 11:56:59', 'admin', '40G'),
(3638, 'GHM3638', 'PST CSSN BRR', 'PERLENGKAPAN MANDI', '0', '5500', '0', '5500', 'Normal', '2022-06-10 11:57:45', 'admin', '45G'),
(3639, 'GHM3639', 'PST B', '', '', '', '', '', '', '2022-06-10 11:58:31', '', ''),
(3640, 'GHM3640', 'PST DEE GRP', 'PERLENGKAPAN MANDI', '0', '8000', '0', '8000', 'Normal', '2022-06-10 12:00:58', 'admin', '70G'),
(3641, 'GHM3641', 'PST JUNIOR ORG', 'PERLENGKAPAN MANDI', '0', '10000', '0', '10000', 'Normal', '2022-06-10 12:01:34', 'admin', '45G'),
(3642, 'GHM3642', 'PST PIGEON STR', 'PERLENGKAPAN MANDI', '0', '15500', '0', '15500', 'Normal', '2022-06-10 12:02:28', 'admin', '45'),
(3643, 'GHM3643', 'PST PIGEON ORG ', 'PERLENGKAPAN MANDI', '0', '15500', '0', '15500', 'Promo', '2022-06-10 12:03:16', 'admin', '45G'),
(3644, 'GHM3644', 'PST PEPSODNT WHT', 'PERLENGKAPAN MANDI', '0', '9500', '0', '9500', 'Normal', '2022-06-10 12:04:05', 'admin', '75G'),
(3645, 'GHM3645', 'RINSO HJ', 'DETERGENT', '0', '22000', '0', '22000', 'Normal', '2022-06-10 12:05:58', 'admin', '770G'),
(3646, 'GHM3646', 'SOKLN CHEER ', 'DETERGENT', '0', '5000', '0', '5000', 'Normal', '2022-06-10 12:07:20', 'admin', '250G'),
(3647, 'GHM3647', 'SOLKIN PWG EXTC', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '7600', '0', '7600', 'Normal', '2022-06-10 12:08:07', 'admin', '450ML'),
(3648, 'GHM3648', 'SCRLET HB CHRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '63800', '0', '63800', 'Normal', '2022-06-10 12:10:44', 'admin', '300ML'),
(3649, 'GHM3649', 'BD CSSN BRR', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '6500', '0', '6500', 'Normal', '2022-06-10 12:11:35', 'admin', '150G'),
(3650, 'GHM3650', 'SHUNTON ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '15500', '0', '15500', 'Normal', '2022-06-10 12:12:11', 'admin', 'P52'),
(3651, 'GHM3651', 'SEAGULL ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '14700', '0', '14700', 'Normal', '2022-06-10 12:13:01', 'admin', '3PCS'),
(3652, 'GHM3652', 'DAHLIA TBLL', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '15400', '0', '15400', 'Normal', '2022-06-10 12:13:45', 'admin', '3PCS'),
(3653, 'GHM3653', 'DHLIA TBLL LVN', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '15000', '0', '15000', 'Normal', '2022-06-10 12:14:35', 'admin', '3PCS'),
(3654, 'GHM3654', 'BAGUS TBLL', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '24300', '0', '24300', 'Normal', '2022-06-10 12:15:04', 'admin', '4PCS'),
(3655, 'GHM3655', 'DHLIA TBLL ORG', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '21500', '0', '21500', 'Normal', '2022-06-10 12:16:34', 'admin', '5PCS'),
(3656, 'GHM3656', 'CHOCHO CP CSTR', 'ROTI/SNACK/Camilan', '0', '7000', '0', '7000', 'Normal', '2022-06-10 12:17:41', 'admin', '1CP'),
(3657, 'GHM3657', 'CHOCHO CP RCRIS', 'ROTI/SNACK/Camilan', '0', '7000', '0', '7000', 'Normal', '2022-06-10 12:19:06', 'admin', '1CP'),
(3658, 'GHM3658', 'YUPI ICE', 'ROTI/SNACK/Camilan', '0', '1000', '0', '1000', 'Normal', '2022-06-10 12:21:21', 'admin', '1PCS'),
(3659, 'GHM3659', 'YUPI CRLETTO', 'PERMEN/COKLAT', '0', '1000', '0', '1000', 'Normal', '2022-06-10 12:22:26', 'admin', '1PCS'),
(3660, 'GHM3660', 'YUPI BRGER', 'PERMEN/COKLAT', '0', '1000', '0', '1000', 'Normal', '2022-06-10 12:23:03', 'admin', '1PCS'),
(3661, 'GHM3661', 'YUPI BBY BEAR', 'PERMEN/COKLAT', '0', '1000', '0', '1000', 'Normal', '2022-06-10 12:23:33', 'admin', '1PCS'),
(3662, 'GHM3662', 'RK CLSMILD RM', 'ROKOK', '0', '20000', '0', '20000', 'Normal', '2022-06-10 12:27:28', 'admin', '12BTG'),
(3663, 'GHM3663', 'RK OE BOLD', 'ROKOK', '0', '13000', '0', '13000', 'Normal', '2022-06-10 12:28:21', 'admin', '12BTG'),
(3664, 'GHM3664', 'RK GG KING', 'ROKOK', '0', '18500', '0', '18500', 'Normal', '2022-06-10 12:29:23', 'admin', '16BTG'),
(3665, 'GHM3665', 'RK GG SIGNT BLCK', 'ROKOK', '0', '19000', '0', '19000', 'Normal', '2022-07-20 09:39:00', 'admin', '12BTG'),
(3666, 'GHM3666', 'RK ESSE SHPOP', 'ROKOK', '0', '25000', '0', '25000', 'Normal', '2022-06-10 12:31:00', 'admin', '16BTG'),
(3667, 'GHM3667', 'RK GG MERH', 'ROKOK', '0', '11500', '0', '11500', 'Normal', '2022-06-10 12:32:55', 'admin', '10BTG'),
(3668, 'GHM3668', 'RK HALIM', 'ROKOK', '0', '19500', '0', '19500', 'Normal', '2022-06-10 12:33:28', 'admin', '12BTG'),
(3669, 'GHM3669', 'RK GG MNS', 'ROKOK', '7500', '7500', '0', '7500', 'Normal', '2022-06-10 12:34:17', 'admin', '6BTG'),
(3670, 'GHM3670', 'RK SURYA KLG', 'ROKOK', '0', '75500', '0', '75500', 'Normal', '2022-08-23 11:32:59', 'admin', '50BTG'),
(3671, 'GHM3671', 'MFURA MRSMLW', 'PERMEN/COKLAT', '0', '10000', '0', '10000', 'Normal', '2022-06-10 12:36:02', 'admin', '20BTG'),
(3672, 'GHM3672', 'PAMERLO MRSMLW', 'PERMEN/COKLAT', '0', '10000', '0', '10000', 'Normal', '2022-06-10 12:36:45', 'admin', '20S'),
(3673, 'GHM3673', 'RK GG INTER', 'ROKOK', '0', '21000', '0', '21000', 'Normal', '2022-06-10 12:37:15', 'admin', '12BTG'),
(3674, 'GHM3674', 'SB DETTOL ENRG', 'PERLENGKAPAN MANDI', '0', '5700', '0', '5700', 'Normal', '2022-06-10 12:38:04', 'admin', '1PCS'),
(3675, 'GHM3675', 'SB DETTOL ORI', 'PERLENGKAPAN MANDI', '0', '5700', '0', '5700', 'Normal', '2022-06-10 12:38:43', 'admin', '1PCS'),
(3676, 'GHM3676', 'BD ENCH ALLR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22500', '0', '22500', 'Normal', '2022-06-10 12:39:18', 'admin', '100G'),
(3677, 'GHM3677', 'BD ENCH RMTC', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22500', '0', '22500', 'Normal', '2022-06-10 12:40:04', 'admin', '100G'),
(3678, 'GHM3678', 'BD ENCH CHRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22500', '0', '22500', 'Normal', '2022-06-10 12:40:38', 'admin', '100G'),
(3679, 'GHM3679', 'HB LOVELY JJ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9000', '0', '9000', 'Normal', '2022-06-10 12:43:02', 'admin', '200ML'),
(3680, 'GHM3680', 'HB MARINA KKDU', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9900', '0', '9900', 'Normal', '2022-08-09 11:43:07', 'admin', '200ML'),
(3681, 'GHM3681', 'HB ENCH RMN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '15400', '0', '15400', 'Normal', '2022-06-10 12:46:55', 'admin', '100ML'),
(3682, 'GHM3682', 'HB ENCH ALLR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '15400', '0', '15400', 'Normal', '2022-06-10 12:47:24', 'admin', '100ML'),
(3683, 'GHM3683', 'HB ENCH CHRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16500', '0', '16500', 'Normal', '2022-06-10 12:47:55', 'admin', '100ML'),
(3684, 'GHM3684', 'DANCOW 3  VN', 'SUSU BUBUK/SUSU CAIR', '0', '50000', '0', '50000', 'Normal', '2022-06-10 14:22:45', 'admin', '400G'),
(3685, 'GHM3685', 'SB LFBOUY HMT LMN', 'PERLENGKAPAN MANDI', '0', '24200', '0', '24200', 'Normal', '2022-06-10 14:24:32', 'admin', '4PCS'),
(3686, 'GHM3686', 'SH CSSON AVCDO', 'POPOK/PERLENGKAPAN ( Bayi', '0', '13500', '0', '13500', 'Normal', '2022-06-10 14:26:24', 'admin', '100ML'),
(3687, 'GHM3687', 'HB VSLINE STRNGT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26300', '0', '26300', 'Normal', '2022-06-10 14:41:03', 'admin', '100ML'),
(3688, 'GHM3688', 'RK DJRUM76 FGLD', 'ROKOK', '0', '19500', '0', '19500', 'Normal', '2022-06-16 07:26:07', 'admin', '12BTG'),
(3689, 'GHM3689', 'RK DJRUM SPR 12', 'ROKOK', '0', '20000', '0', '20000', 'Normal', '2022-06-16 07:27:54', 'admin', 'BTG'),
(3690, 'GHM3690', 'RK GG MRH 16', 'ROKOK', '0', '17000', '0', '17000', 'Normal', '2022-06-16 07:29:54', 'admin', 'BTG'),
(3691, 'GHM3691', 'RK DUNHILL MLD', 'ROKOK', '0', '32500', '0', '32500', 'Normal', '2022-06-16 07:33:08', 'admin', '20BTG'),
(3692, 'GHM3692', 'CHO2 AST STR ', 'ROTI/SNACK/Camilan', '0', '17000', '0', '17000', 'Normal', '2022-06-16 08:46:35', 'admin', '260G'),
(3693, 'GHM3693', 'CHO2  AST COK ', 'ROTI/SNACK/Camilan', '0', '18500', '0', '18500', 'Normal', '2022-06-16 08:47:23', 'admin', '260G'),
(3694, 'GHM3694', 'PADIMAS VN ', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-06-16 08:48:34', 'admin', '1PK'),
(3695, 'GHM3695', 'ROMA KLP CREAM ', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-06-16 08:49:45', 'admin', '180G'),
(3696, 'GHM3696', 'GERY KPYOR', 'SEMBAKO', '0', '8600', '0', '8600', 'Normal', '2022-06-16 08:51:01', 'admin', ' 340G'),
(3697, 'GHM3697', 'GENJI ORIGINAL ', 'ROTI/SNACK/Camilan', '0', '10500', '0', '10500', 'Normal', '2022-06-16 08:52:13', 'admin', '70G'),
(3698, 'GHM3698', 'TANGO WFR CHO ', 'SEMBAKO', '0', '12000', '0', '12000', 'Normal', '2022-06-16 08:53:25', 'admin', '176G'),
(3699, 'GHM3699', 'TANGO WFR STR', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-06-16 08:53:57', 'admin', '176G'),
(3700, 'GHM3700', 'TANGO WFR VN', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-06-16 08:54:22', 'admin', ' 176G'),
(3701, 'GHM3701', 'SUPERCO LMN ', 'ROTI/SNACK/Camilan', '0', '7800', '0', '7800', 'Normal', '2022-06-16 08:55:46', 'admin', '138G'),
(3702, 'GHM3702', 'BETTER FB VAN ', 'ROTI/SNACK/Camilan', '0', '9400', '0', '9400', 'Normal', '2022-06-16 08:57:22', 'admin', '120G'),
(3703, 'GHM3703', 'MNIPUD FRUITPUR ', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-06-16 09:05:20', 'admin', '168G'),
(3704, 'GHM3704', 'INCO KONYKU', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-06-16 09:06:51', 'admin', ' 180G'),
(3705, 'GHM3705', 'PUDDING MNI ', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-06-16 09:08:24', 'admin', '10CP'),
(3706, 'GHM3706', 'CHRRY BGJEL', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-06-16 09:10:11', 'admin', ' 10S'),
(3707, 'GHM3707', 'MINI JELLY', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-16 09:11:41', 'admin', ' 5CP'),
(3708, 'GHM3708', 'GOODY PUD 3C', 'ROTI/SNACK/Camilan', '0', '15600', '0', '15600', 'Normal', '2022-06-16 09:13:01', 'admin', '80G'),
(3709, 'GHM3709', 'INACO PUD YGRT', 'ROTI/SNACK/Camilan', '0', '6000', '0', '6000', 'Normal', '2022-06-16 09:15:27', 'admin', ' 120G'),
(3710, 'GHM3710', 'GENJI LEMON PIE ', 'ROTI/SNACK/Camilan', '0', '12400', '0', '12400', 'Normal', '2022-06-16 09:17:07', 'admin', '85G'),
(3711, 'GHM3711', 'GENJI RAISN PIE ', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-06-16 09:18:23', 'admin', '85G'),
(3712, 'GHM3712', 'ROMA CRM ', 'ROTI/SNACK/Camilan', '0', '6400', '0', '6400', 'Normal', '2022-06-16 09:19:38', 'admin', '135G'),
(3713, 'GHM3713', 'HAPPYTOS MRH ', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-06-16 09:22:23', 'admin', '160G'),
(3714, 'GHM3714', 'MKARONI LV15', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-06-16 09:25:13', 'admin', '150G'),
(3715, 'GHM3715', 'OISHI SPG MCH ', 'ROTI/SNACK/Camilan', '0', '13600', '0', '13600', 'Normal', '2022-06-16 09:27:36', 'admin', '120G'),
(3716, 'GHM3716', 'OISH POCRN CRM ', 'ROTI/SNACK/Camilan', '0', '14800', '0', '14800', 'Normal', '2022-06-16 09:29:25', 'admin', '100G'),
(3717, 'GHM3717', 'KALPA SHR IT', 'ROTI/SNACK/Camilan', '0', '11500', '0', '11500', 'Normal', '2022-06-16 09:30:40', 'admin', ' 90G'),
(3718, 'GHM3718', 'NRAYA FISH COK', 'ROTI/SNACK/Camilan', '0', '15500', '0', '15500', 'Normal', '2022-06-16 10:58:27', 'admin', ' 90G'),
(3719, 'GHM3719', 'NARAYA FISH COK', 'ROTI/SNACK/Camilan', '0', '15500', '0', '15500', 'Normal', '2022-06-16 11:00:07', 'admin', ' 90G'),
(3720, 'GHM3720', 'KG CHOCHO IMT ', 'ROTI/SNACK/Camilan', '0', '7800', '0', '7800', 'Normal', '2022-06-16 11:01:54', 'admin', '55G'),
(3721, 'GHM3721', 'POCKY MINI CK', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-06-16 11:03:04', 'admin', ' 22G'),
(3722, 'GHM3722', 'POCKY MN CK', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-16 11:04:10', 'admin', ' 12G'),
(3723, 'GHM3723', 'POCKY MN STR', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-16 11:04:59', 'admin', '12G'),
(3724, 'GHM3724', 'MKADO SP PG ', 'ROTI/SNACK/Camilan', '0', '6600', '0', '6600', 'Normal', '2022-06-16 11:38:16', 'admin', '65G'),
(3725, 'GHM3725', 'MKADO TMT', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-04 10:20:47', 'admin', ' 70G'),
(3726, 'GHM3726', 'KRISBEE JG ', 'ROTI/SNACK/Camilan', '0', '6800', '0', '6800', 'Normal', '2022-06-16 11:40:01', 'admin', '75G'),
(3727, 'GHM3727', 'KRISBEE KNTANG ', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-06-16 11:40:36', 'admin', '68G'),
(3728, 'GHM3728', 'INACO CP STR', 'ROTI/SNACK/Camilan', '0', '7400', '0', '7400', 'Normal', '2022-06-16 11:41:18', 'admin', ' 200ML'),
(3729, 'GHM3729', 'SELMAT DBCHO ', 'ROTI/SNACK/Camilan', '0', '13800', '0', '13800', 'Normal', '2022-06-25 11:21:22', 'admin', '198G'),
(3730, 'GHM3730', 'MONDE EGRL', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-06-25 11:22:45', 'admin', '60G'),
(3731, 'GHM3731', 'SELMAT VN', 'ROTI/SNACK/Camilan', '0', '14500', '0', '14500', 'Normal', '2022-06-25 11:24:46', 'admin', '198G'),
(3732, 'GHM3732', 'POPMIE KR', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-06-25 11:27:29', 'admin', '75G'),
(3733, 'GHM3733', 'SEDAP ST MDR', 'ROTI/SNACK/Camilan', '0', '3000', '0', '3000', 'Normal', '2022-06-25 11:36:30', 'admin', '62G'),
(3734, 'GHM3734', 'CMORY YG BTSTR', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-06-25 11:38:01', 'admin', '100ML'),
(3735, 'GHM3735', 'CMORY YG BTLYC', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-06-25 11:39:08', 'admin', '100ML'),
(3736, 'GHM3736', 'CMORY YG BTRG', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-06-25 11:40:10', 'admin', '100ML'),
(3737, 'GHM3737', 'CMORY YG BTMB', 'MINUMAN', '0', '8900', '0', '8900', 'Normal', '2022-06-25 11:41:48', 'admin', '100ML'),
(3738, 'GHM3738', 'CMORY YG BTMF', 'ROTI/SNACK/Camilan', '0', '8900', '0', '8900', 'Normal', '2022-06-25 11:42:55', 'admin', '100ML'),
(3739, 'GHM3739', 'CMORY BT STR', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-25 11:43:56', 'admin', '1SLP'),
(3740, 'GHM3740', 'CMORY BT BBR', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-25 11:45:12', 'admin', '1SLP'),
(3741, 'GHM3741', 'LASEGAR  JMB', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-06-25 11:47:16', 'admin', '320ML'),
(3742, 'GHM3742', 'KCC KLP CP', 'MINUMAN', '0', '4500', '0', '4500', 'Normal', '2022-06-25 11:47:56', 'admin', '120G'),
(3743, 'GHM3743', 'INACO ALV ', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-06-25 11:48:55', 'admin', '200G'),
(3744, 'GHM3744', 'INACO LYC CP', 'ROTI/SNACK/Camilan', '0', '7400', '0', '7400', 'Normal', '2022-06-25 11:50:11', 'admin', '200G'),
(3745, 'GHM3745', 'SRI GNDM RLL', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-06-25 11:50:53', 'admin', '120G'),
(3746, 'GHM3746', 'DP KRP SKN ', 'ROTI/SNACK/Camilan', '0', '5000', '', '5000', 'Normal', '2022-06-25 11:52:06', 'admin', '100G'),
(3747, 'GHM3747', 'DP KRP SNK PM', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-06-25 12:01:57', 'admin', '100G'),
(3748, 'GHM3748', 'DP KRP SNK OR', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-06-25 12:02:29', 'admin', '100G'),
(3749, 'GHM3749', 'DP KRP TL UG', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-06-25 12:03:08', 'admin', '100G'),
(3750, 'GHM3750', 'NRAYA ORG CNDY', 'PERMEN/COKLAT', '0', '16700', '0', '16700', 'Normal', '2022-06-25 12:04:47', 'admin', '200G'),
(3751, 'GHM3751', 'BG BBOL BH', 'PERMEN/COKLAT', '0', '9000', '0', '9000', 'Normal', '2022-06-25 12:06:57', 'admin', '132G'),
(3752, 'GHM3752', 'ROMA MR SSU', 'ROTI/SNACK/Camilan', '0', '7800', '0', '7800', 'Normal', '2022-06-25 12:08:13', 'admin', '140G'),
(3753, 'GHM3753', 'KCP SATE', 'SEMBAKO', '0', '19500', '0', '19500', 'Normal', '2022-06-25 12:12:26', 'admin', '525ML'),
(3754, 'GHM3754', 'JWARA HOT', 'SEMBAKO', '0', '13400', '0', '13400', 'Normal', '2022-06-25 12:14:55', 'admin', '250ML'),
(3755, 'GHM3755', 'LLIPOP CHO', 'PERMEN/COKLAT', '0', '1500', '0', '1500', 'Normal', '2022-06-25 13:50:35', 'admin', '10G'),
(3756, 'GHM3756', 'RCIK TMP ', 'SEMBAKO', '0', '2000', '0', '2000', 'Normal', '2022-06-25 13:53:20', 'admin', '20G'),
(3757, 'GHM3757', 'SJKU AYM GR', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-06-25 13:55:11', 'admin', '20G'),
(3758, 'GHM3758', 'NTUR E PNK PML', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16400', '0', '16400', 'Normal', '2022-06-25 13:57:55', 'admin', '100ML'),
(3759, 'GHM3759', 'HB SHNZ MT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-06-25 13:59:58', 'admin', '100ML'),
(3760, 'GHM3760', 'HB CITRA GLD', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13800', '0', '13800', 'Normal', '2022-06-25 14:02:06', 'admin', '120ML'),
(3761, 'GHM3761', 'AIZHI ALG', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '28500', '0', '28500', 'Normal', '2022-06-25 14:04:16', 'admin', '150ML'),
(3762, 'GHM3762', 'NINIO CP ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '17000', '0', '17000', 'Normal', '2022-06-25 14:05:01', 'admin', '1PCS'),
(3763, 'GHM3763', 'BT SUMO', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '15000', '0', '15000', 'Normal', '2022-06-25 14:06:00', 'admin', '140ML'),
(3764, 'GHM3764', 'BT HUKI', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '25500', '0', '25500', 'Normal', '2022-06-25 14:07:56', 'admin', '60ML'),
(3765, 'GHM3765', 'SK CCMD104', 'PERLENGKAPAN MANDI', '0', '7500', '0', '7500', 'Normal', '2022-06-25 14:09:05', 'admin', '1PCS'),
(3766, 'GHM3766', 'AIZ ALG KC', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '16500', '0', '16500', 'Normal', '2022-06-25 14:09:39', 'admin', '1PCS'),
(3767, 'GHM3767', 'SWTY LQ PCH', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '25000', '0', '25000', 'Normal', '2022-06-25 14:11:57', 'admin', '450ML'),
(3768, 'GHM3768', 'SB GIV VN', 'PERLENGKAPAN MANDI', '0', '3000', '0', '3000', 'Normal', '2022-06-25 14:13:14', 'admin', '26G'),
(3769, 'GHM3769', 'SB SHNZ HN', 'PERLENGKAPAN MANDI', '0', '4000', '0', '4000', 'Normal', '2022-06-25 14:14:22', 'admin', '58G'),
(3770, 'GHM3770', 'BD CSS SSMT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '8200', '0', '8200', 'Normal', '2022-06-25 14:15:48', 'admin', '150G'),
(3771, 'GHM3771', 'BD CSS SMT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '4800', '0', '4800', 'Normal', '2022-06-25 14:16:50', 'admin', '75G'),
(3772, 'GHM3772', 'SHOWR GL MLK', 'PERLENGKAPAN MANDI', '0', '25400', '0', '25400', 'Normal', '2022-06-25 14:18:45', 'admin', '250ML'),
(3773, 'GHM3773', 'HB HRBRST ZTN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18600', '0', '18600', 'Normal', '2022-06-25 14:20:02', 'admin', '145ML'),
(3774, 'GHM3774', 'GRN CLR MRH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16000', '0', '16000', 'Normal', '2022-06-25 14:22:11', 'admin', '1PCS'),
(3775, 'GHM3775', 'GRN CLR BLN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16400', '0', '16400', 'Normal', '2022-06-25 14:35:49', 'admin', '1PCS'),
(3776, 'GHM3776', 'GRN CLR BRG', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '14500', '0', '14500', 'Normal', '2022-06-25 14:36:50', 'admin', '1PCS'),
(3777, 'GHM3777', 'GRN CLR KRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '15600', '0', '15600', 'Normal', '2022-06-25 14:37:23', 'admin', '1PCS'),
(3778, 'GHM3778', 'SB DTTL LFRS', 'PERLENGKAPAN MANDI', '0', '3500', '0', '3500', 'Normal', '2022-06-25 14:38:28', 'admin', '50G'),
(3779, 'GHM3779', 'SB LUX JSM', 'PERLENGKAPAN MANDI', '0', '4500', '0', '4500', 'Normal', '2022-06-25 14:39:13', 'admin', '50G'),
(3780, 'GHM3780', 'SB LUX LILY', 'PERLENGKAPAN MANDI', '0', '4500', '0', '4500', 'Normal', '2022-06-25 14:39:55', 'admin', '50G'),
(3781, 'GHM3781', 'PONDS SRM CRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '48500', '0', '48500', 'Normal', '2022-06-25 14:41:59', 'admin', '100G'),
(3782, 'GHM3782', 'ZWT ZNC CRM', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '18000', '0', '18000', 'Normal', '2022-06-25 14:44:09', 'admin', '50ML'),
(3783, 'GHM3783', 'BD KDMO RFS', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '3000', '0', '3000', 'Normal', '2022-06-25 14:45:01', 'admin', '50G'),
(3784, 'GHM3784', 'M FORA KMR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9000', '0', '9000', 'Normal', '2022-06-25 14:45:53', 'admin', '50ML'),
(3785, 'GHM3785', 'TAS MND PLS', 'ACCESSORIES', '0', '13000', '0', '13000', 'Normal', '2022-06-25 14:46:34', 'admin', '1PCS'),
(3786, 'GHM3786', 'TAS MND CPG', 'ACCESSORIES', '0', '14500', '0', '14500', 'Normal', '2022-06-25 14:47:12', 'admin', '1PCS'),
(3787, 'GHM3787', 'IMPL NL WND', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13000', '0', '13000', 'Normal', '2022-06-25 14:48:02', 'admin', '8ML'),
(3788, 'GHM3788', 'NTUR E ADVN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '19500', '0', '19500', 'Normal', '2022-06-25 14:57:43', 'admin', '100ML'),
(3789, 'GHM3789', 'HB SHNZ KRI', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-06-25 14:59:11', 'admin', '100ML'),
(3790, 'GHM3790', 'CRELAC SPSG ', 'SUSU BUBUK/SUSU CAIR', '0', '17000', '0', '17000', 'Normal', '2022-06-28 12:17:38', 'admin', '120G'),
(3791, 'GHM3791', 'CRELAC AJP', 'SUSU BUBUK/SUSU CAIR', '0', '16800', '0', '16800', 'Normal', '2022-06-28 12:18:43', 'admin', '120G'),
(3792, 'GHM3792', 'MILNA DKP', 'SUSU BUBUK/SUSU CAIR', '0', '120G', '0', 'NaN', 'Normal', '2022-06-28 12:19:27', 'admin', '120G'),
(3793, 'GHM3793', 'SH WRDAH HF', 'PERLENGKAPAN MANDI', '0', '21500', '0', '21500', 'Normal', '2022-06-28 12:23:38', 'admin', '170ML'),
(3794, 'GHM3794', 'SH SRSOFT AK', 'PERLENGKAPAN MANDI', '0', '17800', '0', '17800', 'Normal', '2022-06-28 12:26:02', 'admin', '170ML'),
(3795, 'GHM3795', 'SGM 1  MAD ', 'SUSU BUBUK/SUSU CAIR', '0', '62500', '0', '62500', 'Normal', '2022-06-28 12:31:21', 'admin', '600G'),
(3796, 'GHM3796', 'KCP SEDAP BT', 'SEMBAKO', '0', '35600', '0', '35600', 'Normal', '2022-06-28 12:32:38', 'admin', '100ML'),
(3797, 'GHM3797', 'TP LNCN MRH', 'SUSU BUBUK/SUSU CAIR', '0', '11200', '0', '11200', 'Normal', '2022-06-28 12:34:21', 'admin', '1KG'),
(3798, 'GHM3798', 'TP SGT BR ', 'SEMBAKO', '0', '12200', '0', '12200', 'Normal', '2022-06-28 12:35:42', 'admin', '1KG'),
(3799, 'GHM3799', 'BHUN PNEN ', 'SEMBAKO', '0', '8000', '0', '8000', 'Normal', '2022-06-28 12:36:12', 'admin', '350G'),
(3800, 'GHM3800', 'BHUN JG PDMU', 'SEMBAKO', '0', '2000', '0', '2000', 'Normal', '2022-06-28 12:36:40', 'admin', '60G'),
(3801, 'GHM3801', 'RMEN HT SPCY', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-06-28 12:37:33', 'admin', '37G'),
(3802, 'GHM3802', 'KCP BNGO BT', 'SEMBAKO', '0', '9400', '0', '9400', 'Normal', '2022-06-28 12:38:09', 'admin', '100ML'),
(3803, 'GHM3803', 'BSC STCK DIP', 'ROTI/SNACK/Camilan', '0', '3500', '0', '3500', 'Normal', '2022-06-28 12:38:40', 'admin', '35G'),
(3804, 'GHM3804', 'RK MRLB ARM', 'ROKOK', '0', '7000', '0', '7000', 'Normal', '2022-06-28 12:39:31', 'admin', '12BTG'),
(3805, 'GHM3805', 'RK MRLB SLCT', 'ROKOK', '0', '9000', '0', '9000', 'Normal', '2022-06-28 12:40:02', 'admin', '12BTG'),
(3806, 'GHM3806', 'RK MRLB GLD', 'ROKOK', '0', '33500', '0', '33500', 'Normal', '2022-06-28 12:40:29', 'admin', '20BTG'),
(3807, 'GHM3807', 'RK MRLB FL ', 'ROKOK', '0', '30700', '0', '30700', 'Normal', '2022-08-13 09:36:35', 'admin', '20BTG'),
(3808, 'GHM3808', 'RK SMP A10 ', 'ROKOK', '0', '13800', '0', '13800', 'Normal', '2022-06-28 12:43:45', 'admin', '12BTG'),
(3809, 'GHM3809', 'INDMLK PTH ', 'SUSU BUBUK/SUSU CAIR', '0', '7500', '0', '7500', 'Normal', '2022-06-28 12:44:56', 'admin', '1RTG'),
(3810, 'GHM3810', 'DAIRY RT', 'SEMBAKO', '0', '7000', '0', '7000', 'Normal', '2022-06-28 12:46:02', 'admin', '1RTG'),
(3811, 'GHM3811', 'DIABTSOL VN ', 'SUSU BUBUK/SUSU CAIR', '0', '48600', '0', '48600', 'Normal', '2022-06-30 09:36:00', 'admin', '180G'),
(3812, 'GHM3812', 'SGM AND 0-6', 'SUSU BUBUK/SUSU CAIR', '0', '56800', '0', '56800', 'Normal', '2022-06-30 09:37:01', 'admin', '600G'),
(3813, 'GHM3813', 'CHILG 3  MD', 'SUSU BUBUK/SUSU CAIR', '0', '69500', '0', '69500', 'Normal', '2022-06-30 09:38:27', 'admin', '700G'),
(3814, 'GHM3814', 'PRENGN HM STR', 'SUSU BUBUK/SUSU CAIR', '0', '43600', '0', '43600', 'Normal', '2022-06-30 09:40:09', 'admin', '200G'),
(3815, 'GHM3815', 'SUKY SHRM', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-06-30 09:42:21', 'admin', '60G'),
(3816, 'GHM3816', 'OISHI UDG', 'ROTI/SNACK/Camilan', '', '6600', '0', '6600', 'Normal', '2022-06-30 09:43:09', 'admin', '60G'),
(3817, 'GHM3817', 'PRM TRVL JH', 'PERMEN/COKLAT', '0', '7200', '0', '7200', 'Normal', '2022-06-30 09:43:55', 'admin', '150G'),
(3818, 'GHM3818', 'YUPI STR', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-08-09 12:22:43', 'admin', '120G'),
(3819, 'GHM3819', 'POPMIE RWT', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-06-30 09:45:31', 'admin', '65G'),
(3820, 'GHM3820', 'FRS PCH PT', 'SEMBAKO', '0', '19800', '0', '19800', 'Normal', '2022-06-30 09:47:28', 'admin', '545G'),
(3821, 'GHM3821', 'WFRFL STR', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-06-30 09:48:29', 'admin', '140G'),
(3822, 'GHM3822', 'HTMNS STR', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-30 09:49:43', 'admin', '94G'),
(3823, 'GHM3823', 'HTMNS WC', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-30 09:50:18', 'admin', '94G'),
(3824, 'GHM3824', 'HTMNS MLN', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-30 09:50:48', 'admin', '94G'),
(3825, 'GHM3825', 'HTMNS CK', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-06-30 09:51:15', 'admin', '94G'),
(3826, 'GHM3826', 'SINOM JGSRI', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-06-30 09:52:09', 'admin', '100ML'),
(3827, 'GHM3827', 'CMORY UHT CHS', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-06-30 09:53:06', 'admin', '250ML'),
(3828, 'GHM3828', 'NTRIBST STR', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-06-30 09:53:58', 'admin', '300ML'),
(3829, 'GHM3829', 'CMORY BBR', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-30 09:54:57', 'admin', '1SLP'),
(3830, 'GHM3830', 'CMORY BT LF', 'MINUMAN', '0', '8500', '', '8500', 'Normal', '2022-06-30 09:55:59', 'admin', '240ML'),
(3831, 'GHM3831', 'YUC1000 MG', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-30 09:57:11', 'admin', '140ML'),
(3832, 'GHM3832', 'YC1000 MG', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-06-30 10:07:16', 'admin', '120ML'),
(3833, 'GHM3833', 'SYANGKU PNT S', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '27000', '0', '27000', 'Normal', '2022-07-08 10:06:44', 'admin', '20'),
(3834, 'GHM3834', 'FLUFFY PNT XL26', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '49000', '0', '49000', 'Normal', '2022-07-08 10:09:11', 'admin', 'P'),
(3835, 'GHM3835', 'MMYPKO PNT L8', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '18500', '0', '18500', 'Normal', '2022-07-08 10:12:55', 'admin', 'P'),
(3836, 'GHM3836', 'FLUFFY PRK M18', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '23000', '0', '23000', 'Normal', '2022-07-08 10:16:14', 'admin', 'P'),
(3837, 'GHM3837', 'SWTY SLPNT L28', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '55000', '0', '55000', 'Normal', '2022-07-08 10:21:29', 'admin', 'P'),
(3838, 'GHM3838', 'POPOKU PRK XL20', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '35000', '0', '35000', 'Normal', '2022-07-08 10:22:28', 'admin', 'P');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(3839, 'GHM3839', 'PPOK IDEAL XL', 'PULSA/ TOKEN', '0', '57000', '0', '57000', 'Normal', '2022-07-08 10:23:38', 'admin', '10'),
(3840, 'GHM3840', 'POPOKU ADL L10', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '54000', '0', '54000', 'Normal', '2022-07-08 10:27:17', 'admin', 'P'),
(3841, 'GHM3841', 'POPOKU ADL M10', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '48000', '0', '48000', 'Normal', '2022-07-08 10:27:58', 'admin', 'P'),
(3842, 'GHM3842', 'MMYPOKO PNT M34', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '53200', '0', '53200', 'Normal', '2022-07-08 10:32:05', 'admin', 'P'),
(3843, 'GHM3843', 'MMYPOKO PNT L44', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '83000', '0', '83000', 'Normal', '2022-07-08 10:33:14', 'admin', 'P'),
(3844, 'GHM3844', 'PPOKU ADL XL2', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '13500', '0', '13500', 'Normal', '2022-07-08 10:35:40', 'admin', 'P'),
(3845, 'GHM3845', 'FRSIAN UHT KTN ', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-07-17 20:25:17', 'admin', '225ML'),
(3846, 'GHM3846', 'JVCAFE LTE ', 'MINUMAN', '0', '10500', '0', '10500', 'Normal', '2022-07-17 20:26:26', 'admin', '240ML'),
(3847, 'GHM3847', 'NESCF KLG BLC', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-07-17 20:27:14', 'admin', '220ML'),
(3848, 'GHM3848', 'LSEGAR JMB ', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-07-17 20:28:17', 'admin', '320L'),
(3849, 'GHM3849', 'JVCAFE MC', 'MINUMAN', '0', '10500', '0', '10500', 'Normal', '2022-07-17 20:31:39', 'admin', '240ML'),
(3850, 'GHM3850', 'FRSIAN UHT SWT', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-07-17 20:32:23', 'admin', '225ML'),
(3851, 'GHM3851', 'FRSIAN UHT FV', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-07-17 20:32:58', 'admin', '225ML'),
(3852, 'GHM3852', 'FRSIAN JNR STR', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-07-17 20:34:57', 'admin', '110ML'),
(3853, 'GHM3853', 'FRSIAN JNR CK', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-07-17 20:35:32', 'admin', '110ML'),
(3854, 'GHM3854', 'FRSIAN JNR FC', 'MINUMAN', '0', '3500', '0', '3500', 'Normal', '2022-07-17 20:36:50', 'admin', '110ML'),
(3855, 'GHM3855', 'KNYIT ASM BL', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-07-17 20:37:49', 'admin', '150ML'),
(3856, 'GHM3856', 'SDMC VITC', 'MINUMAN', '0', '8700', '', '8700', 'Normal', '2022-07-17 20:38:20', 'admin', '150ML'),
(3857, 'GHM3857', 'SDMC TEJMU ', 'MINUMAN', '0', '8200', '0', '8200', 'Normal', '2022-07-17 20:39:25', 'admin', '150ML'),
(3858, 'GHM3858', 'SDMC BRS', 'MINUMAN', '0', '7800', '0', '7800', 'Normal', '2022-07-17 20:39:54', 'admin', '150ML'),
(3859, 'GHM3859', 'HTARI MRG', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-07-17 20:40:52', 'admin', '260G'),
(3860, 'GHM3860', 'TOP WF CK', 'ROTI/SNACK/Camilan', '0', '12400', '0', '12400', 'Normal', '2022-07-17 20:51:38', 'admin', '300G'),
(3861, 'GHM3861', 'KANGRU SQR', 'ROTI/SNACK/Camilan', '0', '14200', '0', '14200', 'Normal', '2022-07-17 21:13:43', 'admin', '380G'),
(3862, 'GHM3862', 'UBM GBIN ASN', 'ROTI/SNACK/Camilan', '0', '9000', '0', '9000', 'Normal', '2022-07-17 21:14:16', 'admin', '280G'),
(3863, 'GHM3863', 'BTTER SND', 'ROTI/SNACK/Camilan', '0', '14200', '0', '14200', 'Normal', '2022-07-17 21:14:49', 'admin', '1RTG'),
(3864, 'GHM3864', 'PDIMAS PND ', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-07-17 21:15:47', 'admin', '1PK'),
(3865, 'GHM3865', 'GRY SLUT MTCH', 'ROTI/SNACK/Camilan', '0', '9700', '0', '9700', 'Normal', '2022-07-17 21:16:31', 'admin', '1RTG'),
(3866, 'GHM3866', 'GRY SLUT CK', 'ROTI/SNACK/Camilan', '0', '9700', '0', '9700', 'Normal', '2022-07-17 21:17:03', 'admin', '1RTG'),
(3867, 'GHM3867', 'GRY SLUT ABN', 'ROTI/SNACK/Camilan', '0', '9600', '0', '9600', 'Normal', '2022-07-17 21:17:33', 'admin', '1RTG'),
(3868, 'GHM3868', 'MLKIST ABN', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-07-17 21:18:02', 'admin', '1RTG'),
(3869, 'GHM3869', 'CMBOCIS KJ', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-07-17 21:18:58', 'admin', '1RTG'),
(3870, 'GHM3870', 'KKIS KLP', 'ROTI/SNACK/Camilan', '0', '2800', '0', '2800', 'Normal', '2022-07-17 21:22:15', 'admin', '56G'),
(3871, 'GHM3871', 'TICTIC BWG ', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-07-17 21:25:21', 'admin', '25G'),
(3872, 'GHM3872', 'MSTER FRNCH', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-07-17 21:26:31', 'admin', '17G'),
(3873, 'GHM3873', 'BEBETO KTG', 'ROTI/SNACK/Camilan', '0', '1000', '0', '1000', 'Normal', '2022-07-17 21:27:10', 'admin', '9G'),
(3874, 'GHM3874', 'WFRFL VN', 'ROTI/SNACK/Camilan', '', '6500', '0', '6500', 'Normal', '2022-07-17 21:27:42', 'admin', '140G'),
(3875, 'GHM3875', 'CHOCLTOS CK', 'ROTI/SNACK/Camilan', '0', '11000', '', '11000', 'Normal', '2022-07-17 21:28:46', 'admin', '9G'),
(3876, 'GHM3876', 'LCKY STC CF', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-07-17 21:29:18', 'admin', '38G'),
(3877, 'GHM3877', 'LCKY STC CK', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-07-17 21:29:51', 'admin', '38G'),
(3878, 'GHM3878', 'LCKY STC STR', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-07-17 21:30:21', 'admin', '38G'),
(3879, 'GHM3879', 'POCKY STR MN', 'ROTI/SNACK/Camilan', '0', '4500', '0', '4500', 'Normal', '2022-07-17 21:31:05', 'admin', '24G'),
(3880, 'GHM3880', 'CMPD CHOKO ', 'ROTI/SNACK/Camilan', '0', '20800', '0', '20800', 'Normal', '2022-07-17 21:33:21', 'admin', '500G'),
(3881, 'GHM3881', 'CMPD RM DRK', 'PERMEN/COKLAT', '0', '19700', '0', '19700', 'Normal', '2022-07-17 21:33:58', 'admin', '500G'),
(3882, 'GHM3882', 'ALFA CMPD DRK', 'PERMEN/COKLAT', '0', '27000', '0', '27000', 'Normal', '2022-07-17 21:34:37', 'admin', '500G'),
(3883, 'GHM3883', 'TULIP DRK CMPD', 'PERMEN/COKLAT', '0', '26500', '0', '26500', 'Normal', '2022-07-17 21:35:12', 'admin', '250G'),
(3884, 'GHM3884', 'LG FLMBY MLK', 'PERMEN/COKLAT', '0', '20700', '0', '20700', 'Normal', '2022-07-17 21:35:43', 'admin', '250G'),
(3885, 'GHM3885', 'LG FLMBY VN', 'PERMEN/COKLAT', '0', '20700', '0', '20700', 'Normal', '2022-07-17 21:36:23', 'admin', '250G'),
(3886, 'GHM3886', 'LG FLMBY WHT', 'PERMEN/COKLAT', '0', '18700', '0', '18700', 'Normal', '2022-07-17 21:37:28', 'admin', '250G'),
(3887, 'GHM3887', 'KOEPOE BK PWD', 'SEMBAKO', '0', '6700', '0', '6700', 'Normal', '2022-07-17 21:38:48', 'admin', '45G'),
(3888, 'GHM3888', 'KOEPOE SD KUE', 'SEMBAKO', '0', '5800', '0', '5800', 'Normal', '2022-07-17 21:39:25', 'admin', '81G'),
(3889, 'GHM3889', 'PRONAS SP ORI', 'SEMBAKO', '0', '35400', '0', '35400', 'Normal', '2022-07-17 21:40:29', 'admin', '110G'),
(3890, 'GHM3890', 'PRONAS SP PDS', 'SEMBAKO', '0', '36500', '0', '36500', 'Normal', '2022-07-17 21:41:46', 'admin', '110G'),
(3891, 'GHM3891', 'SAMBL IND EXPD', 'SEMBAKO', '0', '16200', '0', '16200', 'Normal', '2022-07-17 21:45:21', 'admin', '335ML'),
(3892, 'GHM3892', 'SAMBL IND PMNS', 'SEMBAKO', '0', '15600', '0', '15600', 'Normal', '2022-07-17 21:46:09', 'admin', '335ML'),
(3893, 'GHM3893', 'SAMBL IND PDS', 'SEMBAKO', '0', '11600', '0', '11600', 'Normal', '2022-07-17 21:46:42', 'admin', '275ML'),
(3894, 'GHM3894', 'E SEN FRMB', 'SEMBAKO', '0', '3800', '0', '3800', 'Normal', '2022-07-17 21:47:27', 'admin', '30ML'),
(3895, 'GHM3895', 'RW SMB CBE', 'SEMBAKO', '', '4800', '0', '4800', 'Normal', '2022-07-17 21:48:00', 'admin', '30ML'),
(3896, 'GHM3896', 'RW SMBA MRS', 'SEMBAKO', '0', '4800', '0', '4800', 'Normal', '2022-07-17 21:48:39', 'admin', '30ML'),
(3897, 'GHM3897', 'NUTRIJL MG', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:49:23', 'admin', '10G'),
(3898, 'GHM3898', 'NUTRIJL MLN', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:50:36', 'admin', '10G'),
(3899, 'GHM3899', 'NUTRIJL JMB', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:51:04', 'admin', '10G'),
(3900, 'GHM3900', 'NUTRIJL KRIM', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:51:37', 'admin', '10G'),
(3901, 'GHM3901', 'NUTRIJL BBR', 'SEMBAKO', '0', '2000', '0', '2000', 'Normal', '2022-07-17 21:52:15', 'admin', '10G'),
(3902, 'GHM3902', 'NUTRIJL KLP', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:52:56', 'admin', '10G'),
(3903, 'GHM3903', 'NUTRIJL ANG', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:53:25', 'admin', '10G'),
(3904, 'GHM3904', 'NUTRIJL LC', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-07-17 21:53:55', 'admin', '10G'),
(3905, 'GHM3905', 'NUTRIJL PLN', 'ROTI/SNACK/Camilan', '0', '5000', '0', '5000', 'Normal', '2022-07-17 21:54:27', 'admin', '15G'),
(3906, 'GHM3906', 'NUTRIJL CNC', 'SEMBAKO', '0', '5500', '0', '5500', 'Normal', '2022-07-17 21:55:01', 'admin', '15G'),
(3907, 'GHM3907', 'CNCAU JLLY', 'SEMBAKO', '0', '4500', '0', '4500', 'Normal', '2022-07-17 21:55:31', 'admin', '700ML'),
(3908, 'GHM3908', 'MMSUKA NORI', 'SEMBAKO', '0', '11400', '0', '11400', 'Normal', '2022-07-17 21:56:01', 'admin', '1RTG'),
(3909, 'GHM3909', 'SARI MRNI', 'MINUMAN', '0', '7500', '0', '7500', 'Normal', '2022-07-17 21:57:15', 'admin', '5G'),
(3910, 'GHM3910', 'SARIWANGI TB', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-07-17 21:57:56', 'admin', '85G'),
(3911, 'GHM3911', 'KKBIMA SS SD', 'MINUMAN', '0', '9800', '0', '9800', 'Normal', '2022-07-17 21:59:37', 'admin', '6.6G'),
(3912, 'GHM3912', 'KKBIMA MNG', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-07-17 22:00:22', 'admin', '6.6G'),
(3913, 'GHM3913', 'KNYIT SRH PK', 'MINUMAN', '0', '9200', '0', '9200', 'Normal', '2022-07-17 22:00:58', 'admin', '25G'),
(3914, 'GHM3914', 'KNYIT ASM PK', 'MINUMAN', '0', '8400', '0', '8400', 'Normal', '2022-07-17 22:01:33', 'admin', '25G'),
(3915, 'GHM3915', 'MENTOS BH', 'PERMEN/COKLAT', '0', '7500', '0', '7500', 'Normal', '2022-07-18 10:26:55', 'admin', '135G'),
(3916, 'GHM3916', 'GOLDEN CTY', 'PERMEN/COKLAT', '0', '5000', '0', '5000', 'Normal', '2022-07-18 10:27:37', 'admin', '50G'),
(3917, 'GHM3917', 'GULA DNT RW', 'SEMBAKO', '0', '10800', '0', '10800', 'Normal', '2022-07-18 10:28:43', 'admin', '500G'),
(3918, 'GHM3918', 'MAIZENA RW', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-07-18 10:30:05', 'admin', '150G'),
(3919, 'GHM3919', 'MAIZENA HWI', 'SUSU BUBUK/SUSU CAIR', '0', '5000', '0', '5000', 'Normal', '2022-07-18 10:30:42', 'admin', '200G'),
(3920, 'GHM3920', 'PUTRI JG', 'SEMBAKO', '0', '9400', '0', '9400', 'Normal', '2022-07-18 10:33:01', 'admin', '335G'),
(3921, 'GHM3921', 'MIE AYM2TLR', 'SEMBAKO', '0', '6900', '0', '6900', 'Normal', '2022-07-18 10:33:39', 'admin', '200G'),
(3922, 'GHM3922', 'MIE SPRIOR ', 'SEMBAKO', '0', '3700', '0', '3700', 'Normal', '2022-07-18 10:34:31', 'admin', '120G'),
(3923, 'GHM3923', 'NUTRISR JRK', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-07-18 10:52:13', 'admin', '200ML'),
(3924, 'GHM3924', 'LAURIER SMX ', 'TISU/PEMBALUT', '0', '17400', '0', '17400', 'Normal', '2022-07-18 21:33:13', 'admin', '30S'),
(3925, 'GHM3925', 'LAURIER NGH 35', 'TISU/PEMBALUT', '0', '18700', '0', '18700', 'Normal', '2022-07-18 21:33:59', 'admin', '12P'),
(3926, 'GHM3926', 'LAURIER NGH 30', 'TISU/PEMBALUT', '0', '17600', '0', '17600', 'Normal', '2022-07-18 21:34:29', 'admin', '16P'),
(3927, 'GHM3927', 'LAURIER CLNGH 35', 'TISU/PEMBALUT', '0', '20700', '0', '20700', 'Normal', '2022-07-18 21:35:16', 'admin', '12P'),
(3928, 'GHM3928', 'LAURIER XTRA W', 'TISU/PEMBALUT', '0', '15600', '0', '15600', 'Normal', '2022-07-18 21:35:48', 'admin', '20P'),
(3929, 'GHM3929', 'LAURIER NGH 8P', 'TISU/PEMBALUT', '0', '11200', '0', '11200', 'Normal', '2022-07-18 21:36:31', 'admin', '30'),
(3930, 'GHM3930', 'LAURIER N CLN 25', 'TISU/PEMBALUT', '0', '17400', '0', '17400', 'Normal', '2022-07-18 21:38:14', 'admin', '16P'),
(3931, 'GHM3931', 'LAURIER NTCLN 20', 'TISU/PEMBALUT', '0', '18000', '0', '18000', 'Normal', '2022-07-18 21:39:45', 'admin', 'P'),
(3932, 'GHM3932', 'LAURIER EXT W', 'TISU/PEMBALUT', '0', '21400', '0', '21400', 'Normal', '2022-07-18 21:40:34', 'admin', '30P'),
(3933, 'GHM3933', 'LAURIER MX 20', 'TISU/PEMBALUT', '0', '14500', '0', '14500', 'Normal', '2022-07-18 21:41:27', 'admin', 'P'),
(3934, 'GHM3934', 'LAURIER MX 10', 'TISU/PEMBALUT', '0', '10500', '0', '10500', 'Normal', '2022-07-18 21:42:10', 'admin', 'P'),
(3935, 'GHM3935', 'LAURIER MX 8', 'TISU/PEMBALUT', '0', '8200', '0', '8200', 'Normal', '2022-07-18 21:42:51', 'admin', 'P'),
(3936, 'GHM3936', 'LAURIER EXT W5', 'TISU/PEMBALUT', '0', '5600', '0', '5600', 'Normal', '2022-07-18 21:45:52', 'admin', 'P'),
(3937, 'GHM3937', 'CHARM EXT W18', 'TISU/PEMBALUT', '0', '16000', '0', '16000', 'Normal', '2022-07-18 21:46:41', 'admin', 'P'),
(3938, 'GHM3938', 'HERS PRT MX', 'TISU/PEMBALUT', '0', '12000', '0', '12000', 'Normal', '2022-07-18 21:47:28', 'admin', '24P'),
(3939, 'GHM3939', 'PUCL ED VCTRS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '20800', '0', '20800', 'Normal', '2022-07-18 21:48:28', 'admin', '150ML'),
(3940, 'GHM3940', 'VIVELLE EDT BL', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23600', '0', '23600', 'Normal', '2022-07-18 21:49:41', 'admin', '100ML'),
(3941, 'GHM3941', 'VIVELLE EDT RS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23600', '0', '23600', 'Normal', '2022-07-18 21:50:52', 'admin', '100ML'),
(3942, 'GHM3942', 'VIVELLE EDT FLCT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23600', '0', '23600', 'Normal', '2022-07-18 21:52:30', 'admin', '100ML'),
(3943, 'GHM3943', 'REGAZZA PRT ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '30200', '0', '30200', 'Normal', '2022-07-18 21:53:57', 'admin', '50ML'),
(3944, 'GHM3944', 'BIORE PCK CTR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13700', '0', '13700', 'Normal', '2022-07-18 21:55:46', 'admin', '4L'),
(3945, 'GHM3945', 'POSH MEN GR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23400', '0', '23400', 'Normal', '2022-07-18 21:57:15', 'admin', '150ML'),
(3946, 'GHM3946', 'POSH MEN BL', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22500', '0', '22500', 'Normal', '2022-07-18 22:00:20', 'admin', '150ML'),
(3947, 'GHM3947', 'POSH MEN BRW', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22800', '0', '22800', 'Normal', '2022-07-18 22:01:11', 'admin', '150ML'),
(3948, 'GHM3948', 'VTALIS SPT BRZ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22000', '0', '22000', 'Normal', '2022-07-19 09:05:56', 'admin', '120ML'),
(3949, 'GHM3949', 'VTALIS SPR BLL', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '21800', '0', '21800', 'Normal', '2022-07-19 09:06:50', 'admin', '120ML'),
(3950, 'GHM3950', 'ESK RMTC ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '9200', '0', '9200', 'Normal', '2022-07-19 09:07:32', 'admin', '50ML'),
(3951, 'GHM3951', 'TS NBTY ', 'TISU/PEMBALUT', '0', '8600', '0', '8600', 'Normal', '2022-07-19 09:09:40', 'admin', '180S'),
(3952, 'GHM3952', 'TS TESSA RF ', 'TISU/PEMBALUT', '0', '18400', '0', '18400', 'Normal', '2022-07-19 09:11:35', 'admin', 'TP01'),
(3953, 'GHM3953', 'TS TESSA TP22', 'TISU/PEMBALUT', '0', '12400', '0', '12400', 'Normal', '2022-07-19 09:12:54', 'admin', '250S'),
(3954, 'GHM3954', 'TS SFT TRV', 'TISU/PEMBALUT', '0', '5800', '0', '5800', 'Normal', '2022-07-19 09:14:05', 'admin', 'PK'),
(3955, 'GHM3955', 'TS PASEO 50S', 'TISU/PEMBALUT', '', '6000', '0', '6000', 'Normal', '2022-07-19 09:14:57', 'admin', '1PCS'),
(3956, 'GHM3956', 'TS PASEO BBY', 'TISU/PEMBALUT', '0', '9000', '0', '9000', 'Normal', '2022-07-19 09:15:39', 'admin', '50S'),
(3957, 'GHM3957', 'SOFTX DSRH', 'TISU/PEMBALUT', '0', '8800', '0', '8800', 'Normal', '2022-07-19 09:16:17', 'admin', '20P'),
(3958, 'GHM3958', 'KOTEX MX 10', 'TISU/PEMBALUT', '0', '8000', '0', '8000', 'Normal', '2022-07-19 09:17:08', 'admin', 'P'),
(3959, 'GHM3959', 'ATTCK ESY SB', 'DETERGENT', '0', '20600', '0', '20600', 'Normal', '2022-07-19 09:17:45', 'admin', '700G'),
(3960, 'GHM3960', 'ATTCK ESY SG', 'DETERGENT', '0', '20600', '0', '20600', 'Normal', '2022-07-19 09:18:22', 'admin', '700G'),
(3961, 'GHM3961', 'ATTCK SFT', 'DETERGENT', '0', '13400', '0', '13400', 'Normal', '2022-07-19 09:19:33', 'admin', '450G'),
(3962, 'GHM3962', 'DAHLIA FRS LVN', 'PEWANGI RUANGAN/PEMBASMI', '0', '29000', '', '29000', 'Normal', '2022-07-19 09:21:34', 'admin', '225ML'),
(3963, 'GHM3963', 'M TLN MYBBY ', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '37700', '0', '37700', 'Normal', '2022-07-19 09:22:37', 'admin', '150ML'),
(3964, 'GHM3964', 'M TLN MYBBY LVD', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '34500', '0', '34500', 'Normal', '2022-07-19 09:23:49', 'admin', '150ML'),
(3965, 'GHM3965', 'MYBBY TLN 12J', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '19400', '0', '19400', 'Normal', '2022-07-19 09:24:34', 'admin', '60ML'),
(3966, 'GHM3966', 'SB DTTL LST', 'PERLENGKAPAN MANDI', '0', '5700', '0', '5700', 'Normal', '2022-07-19 09:26:55', 'admin', '100G'),
(3967, 'GHM3967', 'EKSLN SHM DNL', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '3800', '0', '3800', 'Normal', '2022-07-19 09:29:27', 'admin', '50ML'),
(3968, 'GHM3968', 'HB CITRA AVC', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26200', '0', '26200', 'Normal', '2022-07-19 09:32:09', 'admin', '230ML'),
(3969, 'GHM3969', 'HB MARN GLW', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '14200', '0', '14200', 'Normal', '2022-07-19 09:33:04', 'admin', '355ML'),
(3970, 'GHM3970', 'HB MARN MOIST', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '13800', '0', '13800', 'Normal', '2022-07-19 09:34:04', 'admin', '335ML'),
(3971, 'GHM3971', 'SH ZWTS NRL', 'POPOK/PERLENGKAPAN ( Bayi', '0', '18200', '0', '18200', 'Normal', '2022-07-19 09:34:57', 'admin', '180ML'),
(3972, 'GHM3972', 'BD CSSON BBR', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '18500', '0', '18500', 'Normal', '2022-07-19 09:35:55', 'admin', '350G'),
(3973, 'GHM3973', 'HB SHNZ BT HN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '43800', '0', '43800', 'Normal', '2022-07-19 09:36:43', 'admin', '500ML'),
(3974, 'GHM3974', 'HB SHNZ BT KR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '43200', '0', '43200', 'Normal', '2022-07-19 09:37:55', 'admin', '500ML'),
(3975, 'GHM3975', 'HB SHNZ BT MYR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '44200', '0', '44200', 'Normal', '2022-07-19 09:38:43', 'admin', '500ML'),
(3976, 'GHM3976', 'BIORE RF ENRG', 'PERLENGKAPAN MANDI', '0', '17500', '0', '17500', 'Normal', '2022-07-19 09:39:20', 'admin', '250ML'),
(3977, 'GHM3977', 'BIORE RF POME', 'PERLENGKAPAN MANDI', '0', '17200', '0', '17200', 'Normal', '2022-07-19 09:40:15', 'admin', '250ML'),
(3978, 'GHM3978', 'BIORE REF FLR', 'PERLENGKAPAN MANDI', '0', '17200', '', '17200', 'Normal', '2022-07-19 09:40:55', 'admin', '250ML'),
(3979, 'GHM3979', 'BIORE RF MTC', 'PERLENGKAPAN MANDI', '0', '17800', '0', '17800', 'Normal', '2022-07-19 09:41:54', 'admin', '220ML'),
(3980, 'GHM3980', 'BIORE RF SKR', 'PERLENGKAPAN MANDI', '0', '17800', '0', '17800', 'Normal', '2022-07-19 09:42:45', 'admin', '250ML'),
(3981, 'GHM3981', 'LFBY MLDC RF', 'PERLENGKAPAN MANDI', '0', '28500', '0', '28500', 'Normal', '2022-07-19 09:43:54', 'admin', '450ML'),
(3982, 'GHM3982', 'LFBY LMN RF', 'PERLENGKAPAN MANDI', '0', '23300', '0', '23300', 'Normal', '2022-07-19 09:45:04', 'admin', '250ML'),
(3983, 'GHM3983', 'LAURIER XTR W10', 'TISU/PEMBALUT', '0', '9200', '0', '9200', 'Normal', '2022-07-19 09:56:48', 'admin', 'P'),
(3984, 'GHM3984', 'SB DTTL SNTV', 'PERLENGKAPAN MANDI', '0', '5700', '0', '5700', 'Normal', '2022-07-19 18:54:37', 'admin', '110G'),
(3985, 'GHM3985', 'RK CLSMILD SLV', 'ROKOK', '0', '21000', '0', '21000', 'Normal', '2022-07-20 09:40:17', 'admin', '16B'),
(3986, 'GHM3986', 'RK DJRM NEXT', 'ROKOK', '0', '17700', '0', '17700', 'Normal', '2022-07-20 09:43:44', 'admin', '12B'),
(3987, 'GHM3987', 'RK MRLB MRH', 'ROKOK', '0', '33500', '0', '33500', 'Normal', '2022-07-20 09:45:05', 'admin', '20B'),
(3988, 'GHM3988', 'RK BANI BBR', 'ROKOK', '0', '17800', '0', '17800', 'Normal', '2022-07-20 09:47:35', 'admin', '16B'),
(3989, 'GHM3989', 'RK BANI STR', 'ROKOK', '0', '17800', '0', '17800', 'Normal', '2022-07-20 09:54:02', 'admin', '16B'),
(3990, 'GHM3990', 'RK BANI MLD', 'ROKOK', '0', '15500', '0', '15500', 'Normal', '2022-07-20 09:55:32', 'admin', '16B'),
(3991, 'GHM3991', 'FRSIAN UHT CK', 'MINUMAN', '0', '6500', '0', '6500', 'Normal', '2022-07-20 11:02:44', 'admin', '225ML'),
(3992, 'GHM3992', 'FRSIAN UHT FLCR', 'MINUMAN', '', '6500', '0', '6500', 'Normal', '2022-07-20 09:57:09', 'admin', '225ML'),
(3993, 'GHM3993', 'PDMAS CK PK', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-07-20 09:58:18', 'admin', '21G'),
(3994, 'GHM3994', 'WFER CRM ', 'ROTI/SNACK/Camilan', '0', '5500', '0', '5500', 'Normal', '2022-07-20 09:58:49', 'admin', '125G'),
(3995, 'GHM3995', 'ABC CP STAYM', 'SEMBAKO', '0', '6000', '0', '6000', 'Normal', '2022-07-20 10:01:44', 'admin', '60G'),
(3996, 'GHM3996', 'ABC CP GLAI', 'SEMBAKO', '0', '6700', '0', '6700', 'Normal', '2022-07-20 10:02:34', 'admin', '60G'),
(3997, 'GHM3997', 'SEDAAP BSO', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-07-20 10:03:31', 'admin', '77G'),
(3998, 'GHM3998', 'SEDAAP KRAYM', 'SEMBAKO', '0', '3000', '0', '3000', 'Normal', '2022-07-20 10:05:20', 'admin', '72G'),
(3999, 'GHM3999', 'SEDAAP AYMSPS', 'SEMBAKO', '0', '2800', '0', '2800', 'Normal', '2022-07-20 10:06:11', 'admin', '69G'),
(4000, 'GHM4000', 'CRELAC TM SYR', 'SUSU BUBUK/SUSU CAIR', '0', '21500', '0', '21500', 'Normal', '2022-07-20 10:07:20', 'admin', '100G'),
(4001, 'GHM4001', 'CRELAC TM AYWR', 'ROKOK', '0', '21500', '0', '21500', 'Normal', '2022-07-20 10:08:15', 'admin', '100G'),
(4002, 'GHM4002', 'CRELAC WBL', 'SUSU BUBUK/SUSU CAIR', '0', '18000', '0', '18000', 'Normal', '2022-07-20 10:10:28', 'admin', '120G'),
(4003, 'GHM4003', 'CRELAC SS BM', 'SUSU BUBUK/SUSU CAIR', '0', '17200', '0', '17200', 'Normal', '2022-07-20 10:11:12', 'admin', '120G'),
(4004, 'GHM4004', 'CRELAC AYBW', 'SUSU BUBUK/SUSU CAIR', '0', '17600', '0', '17600', 'Normal', '2022-07-20 10:12:56', 'admin', '120G'),
(4005, 'GHM4005', 'CRELAC SS AYSYR', 'SUSU BUBUK/SUSU CAIR', '0', '17500', '0', '17500', 'Normal', '2022-07-20 10:14:01', 'admin', '120G'),
(4006, 'GHM4006', 'ANDRA KRP TMP', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-07-20 10:14:51', 'admin', '150G'),
(4007, 'GHM4007', 'WIWID MRN ', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-07-20 10:15:25', 'admin', '1PCS'),
(4008, 'GHM4008', 'WIWID USUS', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-07-20 10:15:54', 'admin', '1PCS'),
(4009, 'GHM4009', 'BK PPL KWR', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '10800', '0', '10800', 'Normal', '2022-07-20 10:16:23', 'admin', '100L'),
(4010, 'GHM4010', 'BK KIKY KWR', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '11500', '0', '11500', 'Normal', '2022-07-20 10:17:01', 'admin', '100L'),
(4011, 'GHM4011', 'SOK SFT PRPL', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '15700', '0', '15700', 'Normal', '2022-07-20 10:18:15', 'admin', '800G'),
(4012, 'GHM4012', 'SOK SFT PRP', 'PEWANGI RUANGAN/PEMBASMI', '0', '10000', '0', '10000', 'Normal', '2022-07-20 10:19:37', 'admin', '600G'),
(4013, 'GHM4013', 'SOK SFT PNK', 'DETERGENT', '0', '10000', '0', '10000', 'Normal', '2022-07-20 10:21:00', 'admin', '490G'),
(4014, 'GHM4014', 'HB NIVEA SPF33', 'PERLENGKAPAN MANDI', '0', '31200', '0', '31200', 'Normal', '2022-07-20 10:23:36', 'admin', '180ML'),
(4015, 'GHM4015', 'TIP EX KNKO', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '6200', '0', '6200', 'Normal', '2022-07-20 10:25:10', 'admin', '1PCS'),
(4016, 'GHM4016', 'TIP EX ARTLN', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '6800', '0', '6800', 'Normal', '2022-07-20 10:26:29', 'admin', '7ML'),
(4017, 'GHM4017', 'PITA VIS', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '5000', '0', '5000', 'Normal', '2022-07-20 10:27:50', 'admin', '309'),
(4018, 'GHM4018', 'ISOLSI NCH KCL', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '1000', '0', '1000', 'Normal', '2022-07-20 10:29:38', 'admin', '1PCS'),
(4019, 'GHM4019', 'JRUM PNT AKRT', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '', '8500', '0', '8500', 'Promo', '2022-07-20 10:31:26', 'admin', '1PK'),
(4020, 'GHM4020', 'HRBL RED ', 'OBAT', '0', '7500', '0', '7500', 'Normal', '2022-07-20 10:32:10', 'admin', '10G'),
(4021, 'GHM4021', 'RK MRLBRO FLT', 'ROKOK', '0', '24000', '0', '24000', 'Normal', '2022-07-20 11:00:41', 'admin', '16B'),
(4022, 'GHM4022', 'SEDAAP SGPR ', 'SEMBAKO', '0', '2800', '0', '2800', 'Normal', '2022-07-20 11:06:07', 'admin', '83G'),
(4023, 'GHM4023', 'DHLIA FRSGO LV', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '29000', '0', '29000', 'Normal', '2022-07-20 11:10:26', 'admin', '225ML'),
(4024, 'GHM4024', 'RAJA STIK ', 'ROTI/SNACK/Camilan', '0', '12000', '0', '12000', 'Normal', '2022-08-04 10:14:55', 'admin', '160G'),
(4025, 'GHM4025', 'KORO ORI', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-08-04 10:19:04', 'admin', '65G'),
(4026, 'GHM4026', 'KORO PDS', 'SEMBAKO', '0', '9300', '0', '9300', 'Normal', '2022-08-04 10:19:41', 'admin', '65G'),
(4027, 'GHM4027', 'SUKRO BBQ', 'ROTI/SNACK/Camilan', '0', '8900', '0', '8900', 'Normal', '2022-08-04 10:20:20', 'admin', '140G'),
(4028, 'GHM4028', 'SB NUVO PNK', 'PERLENGKAPAN MANDI', '0', '3000', '0', '3000', 'Normal', '2022-08-04 10:22:20', 'admin', '80G'),
(4029, 'GHM4029', 'TSK SATE ALM', 'PERABOTAN RUMAH TANGGA', '0', '5000', '0', '5000', 'Normal', '2022-08-04 10:33:31', 'admin', '1PK'),
(4030, 'GHM4030', 'TSK GIGI RJW', 'PERABOTAN RUMAH TANGGA', '', '3000', '0', '3000', 'Normal', '2022-08-04 10:35:02', 'admin', '1PK'),
(4031, 'GHM4031', 'CHOLTOS MN 33', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-08-04 10:37:31', 'admin', '1PK'),
(4032, 'GHM4032', 'CHOLTOS MN SWT', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-08-04 10:38:12', 'admin', '1PK'),
(4033, 'GHM4033', 'SOKLN LT RS', 'PERABOTAN RUMAH TANGGA', '0', '8500', '0', '8500', 'Normal', '2022-08-04 10:40:11', 'admin', '450ML'),
(4034, 'GHM4034', 'VANISH BT PNK', 'PERABOTAN RUMAH TANGGA', '0', '34200', '0', '34200', 'Normal', '2022-08-04 10:41:39', 'admin', '500ML'),
(4035, 'GHM4035', 'BAYCLIN REG ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '3700', '0', '3700', 'Normal', '2022-08-04 10:42:29', 'admin', '100ML'),
(4036, 'GHM4036', 'BAYCLIN RG', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '5200', '0', '5200', 'Normal', '2022-08-04 10:44:00', 'admin', '200ML'),
(4037, 'GHM4037', 'SOKLN PRP', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '5000', '0', '5000', 'Normal', '2022-08-04 10:45:21', 'admin', '275G'),
(4038, 'GHM4038', 'SOKLN SFT CML', 'PERABOTAN RUMAH TANGGA', '0', '5000', '0', '5000', 'Normal', '2022-08-04 10:47:07', 'admin', '265G'),
(4039, 'GHM4039', 'NACHI DBTP', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '3500', '0', '3500', 'Normal', '2022-08-04 10:50:43', 'admin', '12MM'),
(4040, 'GHM4040', 'VANISH PNK 60', 'DETERGENT', '0', '4800', '0', '4800', 'Normal', '2022-08-04 10:54:31', 'admin', '1RTG'),
(4041, 'GHM4041', 'SP LFBOUY KN', 'PERLENGKAPAN MANDI', '0', '6000', '0', '6000', 'Normal', '2022-08-04 10:56:11', 'admin', '1RTG'),
(4042, 'GHM4042', 'GLTTE BLUE', 'PERLENGKAPAN MANDI', '0', '26400', '0', '26400', 'Normal', '2022-08-04 10:57:44', 'admin', '3 1PCS'),
(4043, 'GHM4043', 'VANISH WHT 60', 'PERLENGKAPAN MANDI', '0', '4800', '0', '4800', 'Normal', '2022-08-04 10:59:19', 'admin', '1RTG'),
(4044, 'GHM4044', 'LKBAN HT 23', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '7700', '0', '7700', 'Normal', '2022-08-04 11:01:57', 'admin', 'MM'),
(4045, 'GHM4045', 'LKBAN HT 35', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '', '11300', '0', '11300', 'Normal', '2022-08-04 11:01:32', 'admin', 'MM'),
(4046, 'GHM4046', 'LKBAN HT 46', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '14800', '0', '14800', 'Normal', '2022-08-04 11:03:02', 'admin', 'MM'),
(4047, 'GHM4047', 'GOLDTP LKB ', 'ATK/ALAT SEKOLAH/TAS SEKO', '0', '13000', '0', '13000', 'Normal', '2022-08-04 11:03:39', 'admin', '1RL'),
(4048, 'GHM4048', 'STUDY SET', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '15400', '0', '15400', 'Normal', '2022-08-04 11:05:45', 'admin', 'XD9549'),
(4049, 'GHM4049', 'TMP PNSL KLG', 'BUSANA / PERLENGKAPAN SHO', '0', '12800', '0', '12800', 'Normal', '2022-08-04 11:08:31', 'admin', 'B652'),
(4050, 'GHM4050', 'PITA GL 19', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '6600', '0', '6600', 'Normal', '2022-08-04 11:12:00', 'admin', 'MM'),
(4051, 'GHM4051', 'PITA GL 25', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '8600', '0', '8600', 'Normal', '2022-08-04 11:11:01', 'admin', 'MM'),
(4052, 'GHM4052', 'CRAPE BLT', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '2700', '0', '2700', 'Normal', '2022-08-04 11:12:35', 'admin', '55M'),
(4053, 'GHM4053', 'CRAPE PJG ', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '1500', '0', '1500', 'Normal', '2022-08-04 11:13:03', 'admin', '1PK'),
(4054, 'GHM4054', 'ENERGN JG 30', 'MINUMAN', '0', '18600', '0', '18600', 'Normal', '2022-08-04 11:14:08', 'admin', '1RTG'),
(4055, 'GHM4055', 'TOP CAPP 25', 'MINUMAN', '0', '15700', '0', '15700', 'Normal', '2022-08-04 11:14:42', 'admin', '1RTG'),
(4056, 'GHM4056', 'LWAK WH CF', 'MINUMAN', '0', '12800', '0', '12800', 'Normal', '2022-08-04 11:15:19', 'admin', '1RTG'),
(4057, 'GHM4057', 'SLT GOAL BL', 'PERLENGKAPAN MANDI', '0', '5800', '0', '5800', 'Normal', '2022-08-04 11:15:51', 'admin', '1PCS'),
(4058, 'GHM4058', 'CSSON SET TG', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '', '42900', '0', '42900', 'Normal', '2022-08-04 11:16:28', 'admin', '1SLP'),
(4059, 'GHM4059', 'BK SIDU 58', 'BUSANA / PERLENGKAPAN SHO', '0', '43400', '0', '43400', 'Normal', '2022-08-04 11:17:29', 'admin', '1PK'),
(4060, 'GHM4060', 'BK HLS ', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '4000', '0', '4000', 'Normal', '2022-08-04 11:18:34', 'admin', '38L'),
(4061, 'GHM4061', 'NOTA PPR', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '3900', '0', '3900', 'Normal', '2022-08-04 11:19:10', 'admin', '25'),
(4062, 'GHM4062', 'TORA SSU 31', 'MINUMAN', '0', '12800', '0', '12800', 'Normal', '2022-08-04 11:19:49', 'admin', '1RTG'),
(4063, 'GHM4063', 'TOP SSU 31', 'MINUMAN', '0', '11300', '0', '11300', 'Normal', '2022-08-04 11:20:32', 'admin', '1RTG'),
(4064, 'GHM4064', 'SILET GL KN', 'PERLENGKAPAN MANDI', '0', '13900', '0', '13900', 'Normal', '2022-08-04 11:21:29', 'admin', '2PCS'),
(4065, 'GHM4065', 'VIS LKBAN CK', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '11300', '0', '11300', 'Normal', '2022-08-04 11:22:06', 'admin', '1RL'),
(4066, 'GHM4066', 'PONDS SRCRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '42200', '0', '42200', 'Normal', '2022-08-04 11:23:04', 'admin', '40G'),
(4067, 'GHM4067', 'PST PEPSD WH', 'PERLENGKAPAN MANDI', '0', '9300', '0', '9300', 'Normal', '2022-08-04 11:25:22', 'admin', '120G'),
(4068, 'GHM4068', 'SPRTUS BT UG', 'OBAT', '0', '3300', '0', '3300', 'Normal', '2022-08-04 11:26:02', 'admin', '1PCS'),
(4069, 'GHM4069', 'INDCF MX 3IN1', 'MINUMAN', '0', '14400', '0', '14400', 'Normal', '2022-08-04 11:27:08', 'admin', '1RTG'),
(4070, 'GHM4070', 'BVITA ORG ', 'MINUMAN', '0', '4200', '0', '4200', 'Normal', '2022-08-04 11:29:51', 'admin', '125ML'),
(4071, 'GHM4071', 'DB TAPE NC 48', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '12200', '0', '12200', 'Normal', '2022-08-04 11:36:10', 'admin', 'MM'),
(4072, 'GHM4072', 'TMP PNSL 9549', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '12800', '0', '12800', 'Normal', '2022-08-04 11:39:14', 'admin', 'XD'),
(4073, 'GHM4073', 'JPOTA HNY', 'ROTI/SNACK/Camilan', '0', '6900', '0', '6900', 'Normal', '2022-08-09 11:02:40', 'admin', '35G'),
(4074, 'GHM4074', 'PNCHOS SP', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-08-09 11:03:19', 'admin', '160G'),
(4075, 'GHM4075', 'CHITATO SLM', 'ROTI/SNACK/Camilan', '0', '9900', '0', '9900', 'Normal', '2022-08-09 11:05:21', 'admin', '68G'),
(4076, 'GHM4076', 'OKEBIS CK', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-08-09 11:06:28', 'admin', '300G'),
(4077, 'GHM4077', 'MLKIST ABN 18', 'ROTI/SNACK/Camilan', '0', '9600', '0', '9600', 'Normal', '2022-08-09 11:14:09', 'admin', '1RTG'),
(4078, 'GHM4078', 'PNCHOS JG', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-08-09 11:14:53', 'admin', '160G'),
(4079, 'GHM4079', 'PLONGKU ORI', 'ROTI/SNACK/Camilan', '0', '9300', '0', '9300', 'Normal', '2022-08-09 11:16:34', 'admin', '70G'),
(4080, 'GHM4080', 'MXCRON RST', 'ROTI/SNACK/Camilan', '0', '5300', '0', '5300', 'Normal', '2022-08-09 11:33:41', 'admin', '55G'),
(4081, 'GHM4081', 'MD EGG DRP', 'ROTI/SNACK/Camilan', '0', '8200', '0', '8200', 'Normal', '2022-08-09 11:34:32', 'admin', '110G'),
(4082, 'GHM4082', 'OREO RL VN', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-08-09 11:35:53', 'admin', '127G'),
(4083, 'GHM4083', 'OREO RL DS', 'ROTI/SNACK/Camilan', '', '8500', '0', '8500', 'Normal', '2022-08-09 11:36:37', 'admin', '157G'),
(4084, 'GHM4084', 'OREO RL BRTD', 'ROTI/SNACK/Camilan', '0', '8000', '0', '8000', 'Normal', '2022-08-09 11:38:00', 'admin', '123G'),
(4085, 'GHM4085', 'OREO RL ORI', 'ROTI/SNACK/Camilan', '0', '5500', '0', '5500', 'Normal', '2022-08-09 11:41:28', 'admin', '68G'),
(4086, 'GHM4086', 'OREO WF CHO', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-08-09 11:42:00', 'admin', '140G'),
(4087, 'GHM4087', 'CHITATO KJ', 'ROTI/SNACK/Camilan', '0', '9900', '0', '9900', 'Normal', '2022-08-09 11:42:33', 'admin', '68G'),
(4088, 'GHM4088', 'NVEA SFT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '14500', '0', '14500', 'Normal', '2022-08-09 11:44:18', 'admin', '50ML'),
(4089, 'GHM4089', 'NVEA SMT', 'ROTI/SNACK/Camilan', '0', '18500', '0', '18500', 'Normal', '2022-08-09 11:44:51', 'admin', '50ML'),
(4090, 'GHM4090', 'GODNS FC', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-08-09 12:19:36', 'admin', '180ML'),
(4091, 'GHM4091', 'BVITA JMB', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-08-09 12:21:14', 'admin', '250ML'),
(4092, 'GHM4092', 'BVITA LC', 'MINUMAN', '0', '8500', '0', '8500', 'Normal', '2022-08-09 12:21:48', 'admin', '250ML'),
(4093, 'GHM4093', 'YUPI GL STK', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-08-09 12:23:29', 'admin', '45G'),
(4094, 'GHM4094', 'YUPI BEAR', 'PERMEN/COKLAT', '0', '6500', '0', '6500', 'Normal', '2022-08-09 12:23:59', 'admin', '45G'),
(4095, 'GHM4095', 'CHOMP2 TWS', 'PERMEN/COKLAT', '0', '11500', '0', '11500', 'Normal', '2022-08-09 12:30:46', 'admin', '60G'),
(4096, 'GHM4096', 'MILO NGET', 'PERMEN/COKLAT', '0', '11500', '0', '11500', 'Normal', '2022-08-09 12:31:16', 'admin', '30G'),
(4097, 'GHM4097', 'DLOP CHS', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-08-09 12:32:03', 'admin', '100G'),
(4098, 'GHM4098', 'DLOP KH', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-08-09 12:33:15', 'admin', '100G'),
(4099, 'GHM4099', 'VRTOP CHO', 'ROTI/SNACK/Camilan', '0', '6000', '0', '6000', 'Normal', '2022-08-09 12:34:12', 'admin', '100G'),
(4100, 'GHM4100', 'CHOMP2 STR', 'PERMEN/COKLAT', '0', '10700', '0', '10700', 'Normal', '2022-08-09 12:35:56', 'admin', '60G'),
(4101, 'GHM4101', 'CHOMP2 ICE', 'PERMEN/COKLAT', '0', '11500', '0', '11500', 'Normal', '2022-08-09 12:39:13', 'admin', '60G'),
(4102, 'GHM4102', 'CHOMP2 WTRML', 'PERMEN/COKLAT', '0', '10700', '0', '10700', 'Normal', '2022-08-09 12:39:46', 'admin', '60G'),
(4103, 'GHM4103', 'CHOMP2 DCK', 'PERMEN/COKLAT', '0', '12000', '0', '12000', 'Normal', '2022-08-09 12:40:16', 'admin', '60G'),
(4104, 'GHM4104', 'GODNS KRM', 'MINUMAN', '0', '5800', '0', '5800', 'Normal', '2022-08-09 12:41:24', 'admin', '180ML'),
(4105, 'GHM4105', 'SARI GND CK', 'ROTI/SNACK/Camilan', '0', '7800', '0', '7800', 'Normal', '2022-08-09 12:54:03', 'admin', '115G'),
(4106, 'GHM4106', 'SARI GND NUT', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-08-09 12:55:06', 'admin', '115G'),
(4107, 'GHM4107', 'CHITATO SP', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-08-09 12:56:46', 'admin', '68G'),
(4108, 'GHM4108', 'SB CLDIA HJ', 'PERLENGKAPAN MANDI', '0', '2000', '0', '2000', 'Normal', '2022-08-09 12:58:21', 'admin', '70G'),
(4109, 'GHM4109', 'SB PPYA RN', 'PERLENGKAPAN MANDI', '0', '7900', '0', '7900', 'Normal', '2022-08-09 13:03:09', 'admin', '50G'),
(4110, 'GHM4110', 'SB PNTENE SS', 'PERLENGKAPAN MANDI', '0', '15300', '0', '15300', 'Normal', '2022-08-09 13:04:40', 'admin', '70ML'),
(4111, 'GHM4111', 'ESKLN GL DRM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '15900', '0', '15900', 'Normal', '2022-08-09 13:06:49', 'admin', '100ML'),
(4112, 'GHM4112', 'ESKLN GL THRS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16400', '0', '16400', 'Normal', '2022-08-09 13:07:40', 'admin', '100ML'),
(4113, 'GHM4113', 'VTALIS EDT MH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '46200', '0', '46200', 'Normal', '2022-08-09 13:09:17', 'admin', '100ML'),
(4114, 'GHM4114', 'VTALIS SPR MH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '32500', '0', '32500', 'Normal', '2022-08-09 13:09:48', 'admin', '100ML'),
(4115, 'GHM4115', 'AULIA AUR ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23800', '0', '23800', 'Normal', '2022-08-09 13:10:23', 'admin', '150ML'),
(4116, 'GHM4116', 'AULIA MST STR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '23800', '0', '23800', 'Normal', '2022-08-09 13:11:33', 'admin', '150ML'),
(4117, 'GHM4117', 'MRINA SPR LT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '21500', '0', '21500', 'Normal', '2022-08-09 13:12:45', 'admin', '150ML'),
(4118, 'GHM4118', 'MRINA SPR TC', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '21500', '0', '21500', 'Normal', '2022-08-09 13:13:38', 'admin', '150ML'),
(4119, 'GHM4119', 'MRINA SPR FR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '21500', '0', '21500', 'Normal', '2022-08-09 13:14:29', 'admin', '150ML'),
(4120, 'GHM4120', 'SB NUVO UG', 'PERLENGKAPAN MANDI', '', '3500', '0', '3500', 'Normal', '2022-08-09 13:15:23', 'admin', '80G'),
(4121, 'GHM4121', 'MSKITA TP ', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '6300', '0', '6300', 'Normal', '2022-08-09 13:16:32', 'admin', '24MM'),
(4122, 'GHM4122', 'SP LFBOUY SS', 'PERLENGKAPAN MANDI', '0', '24800', '0', '24800', 'Normal', '2022-08-09 13:18:13', 'admin', '170ML'),
(4123, 'GHM4123', 'RXONA INV DRY', 'PAKAIAN DALAM WANITA/PAKAIN DALAM COWOK', '0', '19900', '0', '19900', 'Normal', '2022-08-09 13:24:49', 'admin', '50ML'),
(4124, 'GHM4124', 'SB DETTOL FRS', 'PERLENGKAPAN MANDI', '0', '4500', '0', '4500', 'Normal', '2022-08-09 13:26:06', 'admin', '60G'),
(4125, 'GHM4125', 'SB DETTOL CL', 'PERLENGKAPAN MANDI', '0', '4500', '0', '4500', 'Normal', '2022-08-09 13:27:03', 'admin', '60G'),
(4126, 'GHM4126', 'INDMILK CK 37', 'SEMBAKO', '0', '8600', '0', '8600', 'Normal', '2022-08-09 13:29:01', 'admin', '1RTG'),
(4127, 'GHM4127', 'SB DETTOL INV', 'PERLENGKAPAN MANDI', '0', '22900', '0', '22900', 'Normal', '2022-08-09 13:30:03', 'admin', '1BND'),
(4128, 'GHM4128', 'SB DETTOL COL', 'PERLENGKAPAN MANDI', '0', '21600', '0', '21600', 'Normal', '2022-08-09 13:30:58', 'admin', '1BND'),
(4129, 'GHM4129', 'BK VISION 32', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '26200', '0', '26200', 'Normal', '2022-08-09 13:31:38', 'admin', '1PK'),
(4130, 'GHM4130', 'SP PNTENE S S', 'PERLENGKAPAN MANDI', '', '15300', '0', '15300', 'Normal', '2022-08-09 13:41:07', 'admin', '70ML'),
(4131, 'GHM4131', 'NCHI DBTP FM', 'ATK/ALAT SEKOLAH/TAS SEKOLAH', '0', '11500', '0', '11500', 'Normal', '2022-08-09 15:23:48', 'admin', '24M'),
(4132, 'GHM4132', 'RLXA BRLY', 'PERMEN/COKLAT', '0', '7500', '0', '7500', 'Normal', '2022-08-09 15:27:46', 'admin', '125G'),
(4133, 'GHM4133', 'TEA PC VN', 'MINUMAN', '0', '6000', '0', '6000', 'Normal', '2022-08-09 15:30:27', 'admin', '50G'),
(4134, 'GHM4134', 'BELLA TRM', 'PERMEN/COKLAT', '0', '25700', '0', '25700', 'Normal', '2022-08-09 15:33:10', 'admin', '330G'),
(4135, 'GHM4135', 'BELLA CHO', 'PERMEN/COKLAT', '0', '25700', '0', '25700', 'Normal', '2022-08-09 15:33:45', 'admin', '330G'),
(4136, 'GHM4136', 'GTSBY WG SFT', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-08-09 15:36:11', 'admin', '75G'),
(4137, 'GHM4137', 'GTSBY WTR UH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-08-09 15:37:33', 'admin', '75G'),
(4138, 'GHM4138', 'GTSBY WG SH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-08-09 15:38:07', 'admin', '75G'),
(4139, 'GHM4139', 'GTSBY WG HRD', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-08-09 15:38:53', 'admin', '75G'),
(4140, 'GHM4140', 'GTSBU WG HS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12500', '0', '12500', 'Normal', '2022-08-09 15:39:39', 'admin', '75G'),
(4141, 'GHM4141', 'VTLIS BSC WND', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18700', '0', '18700', 'Normal', '2022-08-09 15:40:17', 'admin', '100ML'),
(4142, 'GHM4142', 'VTLIS BSC BLS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22300', '0', '22300', 'Normal', '2022-08-09 15:41:33', 'admin', '100ML'),
(4143, 'GHM4143', 'VTLIS BSC BLES', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22300', '0', '22300', 'Normal', '2022-08-09 15:42:19', 'admin', '120ML'),
(4144, 'GHM4144', 'VTLIS BSC SCF', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18700', '0', '18700', 'Normal', '2022-08-09 15:42:55', 'admin', '100ML'),
(4145, 'GHM4145', 'VTLIS BSC SRP', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '19400', '0', '19400', 'Normal', '2022-08-09 15:43:55', 'admin', '100ML'),
(4146, 'GHM4146', 'REGZA PSS', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '22000', '0', '22000', 'Normal', '2022-08-09 15:44:54', 'admin', '50ML'),
(4147, 'GHM4147', 'SOKLN KRN', 'DETERGENT', '0', '25500', '0', '25500', 'Normal', '2022-08-09 15:45:29', 'admin', '770G'),
(4148, 'GHM4148', 'SRPUT ARN', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-08-09 16:01:45', 'admin', '200ML'),
(4149, 'GHM4149', 'SRPUT TLN', 'MINUMAN', '0', '3000', '0', '3000', 'Normal', '2022-08-09 16:02:32', 'admin', '200ML'),
(4150, 'GHM4150', 'RK DJISM PRM ', 'ROKOK', '0', '19400', '0', '19400', 'Normal', '2022-08-13 09:35:26', 'admin', '12BTG'),
(4151, 'GHM4151', 'RK ESSE CHG ', 'ROKOK', '0', '24500', '0', '24500', 'Normal', '2022-08-13 09:40:54', 'admin', '16BTG'),
(4152, 'GHM4152', 'RK ESSE BRY', 'ROKOK', '0', '24000', '0', '24000', 'Normal', '2022-08-13 09:41:29', 'admin', '12BTG'),
(4153, 'GHM4153', 'RK SGNTR CK', 'ROKOK', '0', '19000', '0', '19000', 'Normal', '2022-08-13 09:42:08', 'admin', '16BTG'),
(4154, 'GHM4154', 'RK HALIM CK', 'ROKOK', '0', '19500', '0', '19500', 'Normal', '2022-08-13 09:42:51', 'admin', '20BTG'),
(4155, 'GHM4155', 'RK RAPTOR', 'ROKOK', '0', '12700', '0', '12700', 'Normal', '2022-08-13 09:43:19', 'admin', '12BTG'),
(4156, 'GHM4156', 'RK MRLBOR FB ', 'ROKOK', '0', '23900', '0', '23900', 'Normal', '2022-08-13 09:46:08', 'admin', '16BTG'),
(4157, 'GHM4157', 'SRYTLP PRF ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '10000', '0', '10000', 'Normal', '2022-08-13 09:49:30', 'admin', '10ML'),
(4158, 'GHM4158', 'SRYA TLP ', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '15000', '0', '15000', 'Normal', '2022-08-13 09:51:51', 'admin', '15ML'),
(4159, 'GHM4159', 'SURYA TLP', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '25000', '0', '25000', 'Normal', '2022-08-13 09:52:20', 'admin', '30ML'),
(4160, 'GHM4160', 'SPONGE CK ', 'ROTI/SNACK/Camilan', '0', '11000', '0', '11000', 'Normal', '2022-08-17 09:41:11', 'admin', '120G'),
(4161, 'GHM4161', 'SPONGE STR ', 'ROTI/SNACK/Camilan', '0', '11600', '0', '11600', 'Normal', '2022-08-17 09:42:55', 'admin', '120G'),
(4162, 'GHM4162', 'SPONGE MCH', 'ROTI/SNACK/Camilan', '0', '11900', '0', '11900', 'Normal', '2022-08-17 09:43:28', 'admin', '120G'),
(4163, 'GHM4163', 'PLLOW CK', 'ROTI/SNACK/Camilan', '0', '9800', '0', '9800', 'Normal', '2022-08-17 09:44:03', 'admin', '130G'),
(4164, 'GHM4164', 'NBATI CK', 'ROTI/SNACK/Camilan', '0', '1000', '0', '1000', 'Normal', '2022-08-17 09:45:14', 'admin', '24G'),
(4165, 'GHM4165', 'SDMNC SUJHE', 'ROTI/SNACK/Camilan', '0', '13000', '0', '13000', 'Normal', '2022-08-17 09:46:42', 'admin', '1RTG'),
(4166, 'GHM4166', 'SDMNC JHSPR', 'MINUMAN', '0', '18000', '0', '18000', 'Normal', '2022-08-17 09:47:17', 'admin', '1RTG'),
(4167, 'GHM4167', 'TBRUK GJH', 'MINUMAN', '0', '10500', '0', '10500', 'Normal', '2022-08-17 09:48:03', 'admin', '1RTG'),
(4168, 'GHM4168', 'PDIMAS STRW', 'ROTI/SNACK/Camilan', '0', '9500', '0', '9500', 'Normal', '2022-08-17 09:48:56', 'admin', '1PK'),
(4169, 'GHM4169', 'TORAJA MRN', 'MINUMAN', '0', '5000', '0', '5000', 'Normal', '2022-08-17 09:49:28', 'admin', '1RTG'),
(4170, 'GHM4170', 'NSCAFE ORI', 'MINUMAN', '0', '12200', '0', '12200', 'Normal', '2022-08-17 09:50:32', 'admin', '1RTG'),
(4171, 'GHM4171', 'MILO ACTV', 'MINUMAN', '0', '19500', '0', '19500', 'Normal', '2022-08-17 09:51:14', 'admin', '1RTG'),
(4172, 'GHM4172', 'ENRGEN KRM', 'MINUMAN', '0', '18800', '0', '18800', 'Normal', '2022-08-17 09:51:49', 'admin', '1RTG'),
(4173, 'GHM4173', 'MAMA LM RF', 'PERABOTAN RUMAH TANGGA', '0', '2000', '0', '2000', 'Normal', '2022-08-17 09:52:29', 'admin', '130ML'),
(4174, 'GHM4174', 'SASA VTSIN', 'SEMBAKO', '0', '5000', '0', '5000', 'Normal', '2022-08-17 09:53:33', 'admin', '150G'),
(4175, 'GHM4175', 'SJIKU CRSPY', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-08-17 09:54:47', 'admin', '80G'),
(4176, 'GHM4176', 'SJIKU CRSP PDS', 'SEMBAKO', '0', '2500', '0', '2500', 'Normal', '2022-08-17 09:55:20', 'admin', '80G'),
(4177, 'GHM4177', 'FRES BHM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '12000', '0', '12000', 'Normal', '2022-08-17 10:01:42', 'admin', '100ML'),
(4178, 'GHM4178', 'FRES SMMR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '11900', '0', '11900', 'Normal', '2022-08-17 10:02:45', 'admin', '100ML'),
(4179, 'GHM4179', 'FRES SPR PC', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '11900', '0', '11900', 'Normal', '2022-08-17 10:03:22', 'admin', '100ML'),
(4180, 'GHM4180', 'FRES SPR BM', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '11900', '0', '11900', 'Normal', '2022-08-17 10:03:52', 'admin', '100ML'),
(4181, 'GHM4181', 'HB LOVELY JJU', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '16900', '0', '16900', 'Normal', '2022-08-17 10:05:01', 'admin', '500G'),
(4182, 'GHM4182', 'SP CSSON AVC', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '7500', '0', '7500', 'Normal', '2022-08-17 10:05:50', 'admin', '50ML'),
(4183, 'GHM4183', 'ZWTSAL OIL ALV', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '22000', '0', '22000', 'Normal', '2022-08-17 10:06:46', 'admin', '100ML'),
(4184, 'GHM4184', 'SP CSSON CND', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '14800', '0', '14800', 'Normal', '2022-08-17 10:07:41', 'admin', '100ML'),
(4185, 'GHM4185', 'DEO AXE ICE', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '35300', '0', '35300', 'Normal', '2022-08-17 10:20:33', 'admin', '135ML'),
(4186, 'GHM4186', 'DEO AXE DRK', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '33400', '0', '33400', 'Normal', '2022-08-17 10:23:37', 'admin', '135ML'),
(4187, 'GHM4187', 'GTSBY PMD Q V', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '28500', '0', '28500', 'Normal', '2022-08-17 10:24:46', 'admin', '150ML'),
(4188, 'GHM4188', 'GTSBY PMD Q G', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '26500', '0', '26500', 'Normal', '2022-08-17 10:25:37', 'admin', '150ML'),
(4189, 'GHM4189', 'DEO AXE APL', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '31800', '0', '31800', 'Normal', '2022-08-17 10:26:19', 'admin', '150ML'),
(4190, 'GHM4190', 'HRBORIST FW ZTN', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '18800', '0', '18800', 'Normal', '2022-08-17 10:29:21', 'admin', '80G'),
(4191, 'GHM4191', 'SP CSSON ALM', 'POPOK/PERLENGKAPAN ( Bayi/Anak2 )', '0', '7700', '0', '7700', 'Normal', '2022-08-17 10:30:03', 'admin', '50ML'),
(4192, 'GHM4192', 'CLING RF LVN', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '4500', '0', '4500', 'Normal', '2022-08-17 10:32:18', 'admin', '425ML'),
(4193, 'GHM4193', 'CLING RF OC', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '4800', '0', '4800', 'Normal', '2022-08-17 10:32:53', 'admin', '425ML'),
(4194, 'GHM4194', 'SPR PELL BLS', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '17500', '0', '17500', 'Normal', '2022-08-17 10:33:34', 'admin', '770ML'),
(4195, 'GHM4195', 'SPR PELL RF APL', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '17800', '0', '17800', 'Normal', '2022-08-17 10:34:08', 'admin', '770ML'),
(4196, 'GHM4196', 'SPR PELL CHRY', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '18300', '0', '18300', 'Normal', '2022-08-17 10:34:38', 'admin', '770ML'),
(4197, 'GHM4197', 'HIT MS ELC', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '17800', '0', '17800', 'Normal', '2022-08-17 10:35:08', 'admin', '1ST'),
(4198, 'GHM4198', 'BYGON ELC MT', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '11900', '0', '11900', 'Normal', '2022-08-17 10:35:53', 'admin', '1ST'),
(4199, 'GHM4199', 'AUTAN KDS HJ', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '9500', '0', '9500', 'Normal', '2022-08-17 10:37:15', 'admin', '50G'),
(4200, 'GHM4200', 'SOFFEL PNK', 'PEWANGI RUANGAN/PEMBASMI NYAMUK/PEMBERSIH LANTAI', '0', '10200', '0', '10200', 'Normal', '2022-08-17 10:37:49', 'admin', '50G'),
(4201, 'GHM4201', 'RK SURYA PRF', 'ROKOK', '0', '23700', '0', '23700', 'Normal', '2022-08-17 11:02:32', 'admin', '16BTG'),
(4202, 'GHM4202', 'RK ESSE JCY', 'ROKOK', '0', '31300', '0', '31300', 'Normal', '2022-08-17 11:03:12', 'admin', '20BTG'),
(4203, 'GHM4203', 'RK ESSE DBL', 'ROKOK', '0', '31300', '0', '31300', 'Normal', '2022-08-17 11:04:00', 'admin', '20BTG'),
(4204, 'GHM4204', 'SASA VITSN', 'SEMBAKO', '0', '10000', '0', '10000', 'Normal', '2022-08-17 11:10:59', 'admin', '250G'),
(4205, 'GHM4205', 'SGM 3  VAN ', 'SUSU BUBUK/SUSU CAIR', '', '83500', '0', '83500', 'Normal', '2022-08-17 11:16:26', 'admin', '900G'),
(4206, 'GHM4206', 'SGM 3  VNL', 'SUSU BUBUK/SUSU CAIR', '0', '83500', '0', '83500', 'Normal', '2022-08-17 11:17:30', 'admin', '900G'),
(4207, 'GHM4207', 'SGM 3 VNL', 'SUSU BUBUK/SUSU CAIR', '', '83500', '0', '83500', 'Normal', '2022-08-17 11:19:37', 'admin', '900G'),
(4208, 'GHM4208', 'GERY SREAL', 'ROTI/SNACK/Camilan', '0', '2000', '0', '2000', 'Normal', '2022-08-23 11:08:05', 'admin', '30G'),
(4209, 'GHM4209', 'GRD O CRN', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-08-23 11:08:37', 'admin', '21G'),
(4210, 'GHM4210', 'OYTSU KC ATM', 'ROTI/SNACK/Camilan', '0', '2500', '0', '2500', 'Normal', '2022-08-23 11:09:26', 'admin', '110G'),
(4211, 'GHM4211', 'OYTSU KC KRK', 'ROTI/SNACK/Camilan', '0', '6500', '0', '6500', 'Normal', '2022-08-23 11:09:59', 'admin', '100G'),
(4212, 'GHM4212', 'HATARI BNCHO', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:10:38', 'admin', '200G'),
(4213, 'GHM4213', 'HATARI CHO', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:11:07', 'admin', '200G');
INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`, `satuan`) VALUES
(4214, 'GHM4214', 'HATARI CPF CFE', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:12:03', 'admin', '200G'),
(4215, 'GHM4215', 'HATARI PNPLE', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:12:43', 'admin', '200G'),
(4216, 'GHM4216', 'HATARI CRM', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:14:35', 'admin', '200G'),
(4217, 'GHM4217', 'HATARI ORG', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:15:19', 'admin', '200G'),
(4218, 'GHM4218', 'HATARI DR', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:15:50', 'admin', '200G'),
(4219, 'GHM4219', 'HATARI LTE', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:16:44', 'admin', '200G'),
(4220, 'GHM4220', 'ROMA SND KC', 'ROTI/SNACK/Camilan', '0', '7500', '0', '7500', 'Normal', '2022-08-23 11:18:49', 'admin', '189G'),
(4221, 'GHM4221', 'ROMA SND CK', 'ROTI/SNACK/Camilan', '0', '7800', '0', '7800', 'Normal', '2022-08-23 11:19:31', 'admin', '216G'),
(4222, 'GHM4222', 'HATARI BNN', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:20:01', 'admin', '200G'),
(4223, 'GHM4223', 'HATARI CHOPIN', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:20:44', 'admin', '190G'),
(4224, 'GHM4224', 'HATARI BBR', 'ROTI/SNACK/Camilan', '0', '6200', '0', '6200', 'Normal', '2022-08-23 11:21:13', 'admin', '200G'),
(4225, 'GHM4225', 'BISKUAT ORI', 'ROTI/SNACK/Camilan', '0', '8500', '0', '8500', 'Normal', '2022-08-23 11:22:49', 'admin', '140G'),
(4226, 'GHM4226', 'PRM TOLK ANG', 'PERMEN/COKLAT', '0', '18000', '0', '18000', 'Normal', '2022-08-23 11:23:39', 'admin', '100G'),
(4227, 'GHM4227', 'SUKRO KRB ', 'ROTI/SNACK/Camilan', '0', '8800', '0', '8800', 'Normal', '2022-08-23 11:24:10', 'admin', '140G'),
(4228, 'GHM4228', 'SUKRO PLONG', 'ROTI/SNACK/Camilan', '0', '8800', '0', '8800', 'Normal', '2022-08-23 11:24:41', 'admin', '14G'),
(4229, 'GHM4229', 'PRM TRVLA JH', 'PERMEN/COKLAT', '0', '7200', '0', '7200', 'Normal', '2022-08-23 11:25:30', 'admin', '31G'),
(4230, 'GHM4230', 'POP ICE AVC ', 'MINUMAN', '0', '11500', '0', '11500', 'Normal', '2022-08-23 11:26:36', 'admin', '1RTG'),
(4231, 'GHM4231', 'POP ICE STR', 'MINUMAN', '0', '10000', '0', '10000', 'Normal', '2022-08-23 11:27:36', 'admin', '1RTG'),
(4232, 'GHM4232', 'RICHESE MIE GR', 'SEMBAKO', '0', '3500', '0', '3500', 'Normal', '2022-08-23 11:31:31', 'admin', '72G'),
(4233, 'GHM4233', 'RK PENA BLU', 'ROKOK', '0', '16000', '0', '16000', 'Normal', '2022-08-23 11:34:06', 'admin', '16BTG'),
(4234, 'GHM4234', 'KPAL API SPC', 'MINUMAN', '0', '5800', '0', '5800', 'Normal', '2022-08-23 11:38:59', 'admin', '1RTG'),
(4235, 'GHM4235', 'KRIMER MNS', 'SUSU BUBUK/SUSU CAIR', '0', '7500', '0', '7500', 'Normal', '2022-08-23 14:54:09', 'admin', '1RTG'),
(4236, 'GHM4236', 'PRSTINE WTR', 'MINUMAN', '0', '7000', '0', '7000', 'Normal', '2022-08-23 14:54:55', 'admin', '600ML'),
(4237, 'GHM4237', 'LRTAN KLG ORG', 'MINUMAN', '0', '5500', '0', '5500', 'Normal', '2022-08-23 14:55:41', 'admin', '320ML'),
(4238, 'GHM4238', 'ADEM SR CHG', 'MINUMAN', '0', '6800', '0', '6800', 'Normal', '2022-08-23 14:56:27', 'admin', '320ML'),
(4239, 'GHM4239', 'CHILGO 3 MDU', 'SUSU BUBUK/SUSU CAIR', '0', '30500', '0', '30500', 'Normal', '2022-08-24 08:43:19', 'admin', '300G'),
(4240, 'GHM4240', 'WRD LIQFND 02', 'ROTI/SNACK/Camilan', '0', '42600', '0', '42600', 'Normal', '2022-08-24 08:48:24', 'admin', '25ML'),
(4241, 'GHM4241', 'WRD LIQFND 04', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '43600', '0', '43600', 'Normal', '2022-08-24 08:49:08', 'admin', '25ML'),
(4242, 'GHM4242', 'WARDAH BB LGH', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '29400', '0', '29400', 'Normal', '2022-08-24 08:50:28', 'admin', '15ML'),
(4243, 'GHM4243', 'WARDAH BB NTR', 'KOSMETIK/PARFUM/ SABUN MUKA/ REXONA', '0', '29400', '0', '29400', 'Normal', '2022-08-24 08:51:01', 'admin', '15ML'),
(4244, 'GHM4244', 'ZUMAIKA PSLJ ', 'ROTI/SNACK/Camilan', '0', '23000', '0', '23000', 'Normal', '2022-08-24 08:55:22', 'admin', '350G');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mp_banks`
--
ALTER TABLE `mp_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_bank_opening`
--
ALTER TABLE `mp_bank_opening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `mp_bank_transaction`
--
ALTER TABLE `mp_bank_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `bank_id` (`bank_id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_barcode`
--
ALTER TABLE `mp_barcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_brand`
--
ALTER TABLE `mp_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_brand_sector`
--
ALTER TABLE `mp_brand_sector`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_buy`
--
ALTER TABLE `mp_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `mp_category`
--
ALTER TABLE `mp_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `mp_contactabout`
--
ALTER TABLE `mp_contactabout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_customer_payments`
--
ALTER TABLE `mp_customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `mp_drivers`
--
ALTER TABLE `mp_drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_expense`
--
ALTER TABLE `mp_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `head_id` (`head_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_generalentry`
--
ALTER TABLE `mp_generalentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_head`
--
ALTER TABLE `mp_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `mp_label`
--
ALTER TABLE `mp_label`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_langingpage`
--
ALTER TABLE `mp_langingpage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_menu`
--
ALTER TABLE `mp_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_menulist`
--
ALTER TABLE `mp_menulist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_Id` (`menu_Id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_payee`
--
ALTER TABLE `mp_payee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_printer`
--
ALTER TABLE `mp_printer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_productslist`
--
ALTER TABLE `mp_productslist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `brand_sector_id` (`brand_sector_id`),
  ADD KEY `unit_type` (`unit_type`);

--
-- Indexes for table `mp_productslist_resturn`
--
ALTER TABLE `mp_productslist_resturn`
  ADD PRIMARY KEY (`id_produk`) USING BTREE;

--
-- Indexes for table `mp_purchase`
--
ALTER TABLE `mp_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `mp_region`
--
ALTER TABLE `mp_region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_return`
--
ALTER TABLE `mp_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `mp_return_list`
--
ALTER TABLE `mp_return_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`return_id`),
  ADD KEY `medicine_id` (`product_id`);

--
-- Indexes for table `mp_sales`
--
ALTER TABLE `mp_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `mp_sessions`
--
ALTER TABLE `mp_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `mp_stock`
--
ALTER TABLE `mp_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `mp_stores`
--
ALTER TABLE `mp_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_sub_entry`
--
ALTER TABLE `mp_sub_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`parent_id`),
  ADD KEY `accounthead` (`accounthead`),
  ADD KEY `amount` (`amount`);

--
-- Indexes for table `mp_supplier_payments`
--
ALTER TABLE `mp_supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `mp_supply`
--
ALTER TABLE `mp_supply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `mp_temp_barcoder_invoice`
--
ALTER TABLE `mp_temp_barcoder_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_temp_barcoder_purchase`
--
ALTER TABLE `mp_temp_barcoder_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_temp_record_purc`
--
ALTER TABLE `mp_temp_record_purc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_todolist`
--
ALTER TABLE `mp_todolist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addedby` (`addedby`);

--
-- Indexes for table `mp_town`
--
ALTER TABLE `mp_town`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_units`
--
ALTER TABLE `mp_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `symbol` (`symbol`);

--
-- Indexes for table `mp_users`
--
ALTER TABLE `mp_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `user_name_2` (`user_name`);

--
-- Indexes for table `mp_vehicle`
--
ALTER TABLE `mp_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mp_banks`
--
ALTER TABLE `mp_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_bank_opening`
--
ALTER TABLE `mp_bank_opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_bank_transaction`
--
ALTER TABLE `mp_bank_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mp_barcode`
--
ALTER TABLE `mp_barcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mp_brand`
--
ALTER TABLE `mp_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mp_brand_sector`
--
ALTER TABLE `mp_brand_sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mp_buy`
--
ALTER TABLE `mp_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mp_category`
--
ALTER TABLE `mp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `mp_contactabout`
--
ALTER TABLE `mp_contactabout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_customer_payments`
--
ALTER TABLE `mp_customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_drivers`
--
ALTER TABLE `mp_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_expense`
--
ALTER TABLE `mp_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mp_generalentry`
--
ALTER TABLE `mp_generalentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;
--
-- AUTO_INCREMENT for table `mp_head`
--
ALTER TABLE `mp_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mp_label`
--
ALTER TABLE `mp_label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mp_langingpage`
--
ALTER TABLE `mp_langingpage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_menu`
--
ALTER TABLE `mp_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `mp_menulist`
--
ALTER TABLE `mp_menulist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
--
-- AUTO_INCREMENT for table `mp_payee`
--
ALTER TABLE `mp_payee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `mp_printer`
--
ALTER TABLE `mp_printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mp_productslist`
--
ALTER TABLE `mp_productslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1421;
--
-- AUTO_INCREMENT for table `mp_purchase`
--
ALTER TABLE `mp_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `mp_region`
--
ALTER TABLE `mp_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_return`
--
ALTER TABLE `mp_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mp_return_list`
--
ALTER TABLE `mp_return_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mp_sales`
--
ALTER TABLE `mp_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mp_stock`
--
ALTER TABLE `mp_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_stores`
--
ALTER TABLE `mp_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_sub_entry`
--
ALTER TABLE `mp_sub_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `mp_supplier_payments`
--
ALTER TABLE `mp_supplier_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_supply`
--
ALTER TABLE `mp_supply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_temp_barcoder_invoice`
--
ALTER TABLE `mp_temp_barcoder_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_temp_barcoder_purchase`
--
ALTER TABLE `mp_temp_barcoder_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mp_temp_record_purc`
--
ALTER TABLE `mp_temp_record_purc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mp_todolist`
--
ALTER TABLE `mp_todolist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_town`
--
ALTER TABLE `mp_town`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_units`
--
ALTER TABLE `mp_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mp_users`
--
ALTER TABLE `mp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_vehicle`
--
ALTER TABLE `mp_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4245;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mp_bank_opening`
--
ALTER TABLE `mp_bank_opening`
  ADD CONSTRAINT `bank_opening_transac` FOREIGN KEY (`bank_id`) REFERENCES `mp_banks` (`id`);

--
-- Constraints for table `mp_bank_transaction`
--
ALTER TABLE `mp_bank_transaction`
  ADD CONSTRAINT `bankid_bank_fk` FOREIGN KEY (`bank_id`) REFERENCES `mp_banks` (`id`),
  ADD CONSTRAINT `payee_bank_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`),
  ADD CONSTRAINT `transaction_general_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_customer_payments`
--
ALTER TABLE `mp_customer_payments`
  ADD CONSTRAINT `customer_trans_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`),
  ADD CONSTRAINT `payee_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_expense`
--
ALTER TABLE `mp_expense`
  ADD CONSTRAINT `general_expense_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`),
  ADD CONSTRAINT `head_expense_fk` FOREIGN KEY (`head_id`) REFERENCES `mp_head` (`id`),
  ADD CONSTRAINT `payee_expense_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  ADD CONSTRAINT `invoice_payee_fk` FOREIGN KEY (`cus_id`) REFERENCES `mp_payee` (`id`),
  ADD CONSTRAINT `invoice_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  ADD CONSTRAINT `roles_agentid_fk` FOREIGN KEY (`agentid`) REFERENCES `mp_users` (`id`),
  ADD CONSTRAINT `roles_menuid_fk` FOREIGN KEY (`menu_Id`) REFERENCES `mp_menu` (`id`),
  ADD CONSTRAINT `roles_user_fk` FOREIGN KEY (`user_id`) REFERENCES `mp_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
