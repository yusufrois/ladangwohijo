-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2022 at 08:33 AM
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
(1, 256, 6, '25000', '25000', '2022-07-18', 'Supper Admin', 'Cash', 'bayar lunas', 9);

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
(273, 0, '2022-08-19', 'Transaksi dilakukan dari Retur Pembelian12444', 'purchases_return');

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
(25, '[101.4] Bank CIMB', 'Assets', 'Lancar', 0, '-');

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
(3, 260, '2022-07-28', '0.00', 0, '', 'Supper Admin', 1, '', '', '', '0000-00-00', '', '0.00', 0, 0, 0, 0, 0, '4500.00', '4500.00', 0);

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
(29, 'Karyawan', 'fa fa-user');

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
(75, 29, 'Daftar Karyawan', 'karyawan');

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
(1375, 4, 'NEO RHEUMACYL 20 TABLET', '1', 60, '0.00', '4000.00', '0000-00-00', '2019-07-09', 'No Effects', 'here', '8999908000101', 10, 0, 0, '10', '', 'Toko Kelontong', '0.00', 'Finished Products', 'cf7dfe436d8da53ed901cd0077f037ed.jpg', 1, 2, 'Pcs', '', '3900.00', '0', '0000-00-00'),
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
(1391, 1, 'CLAUDIA BEAUTY HIJAU 80G', '1', 142, '2000.00', '3000.00', '2025-05-18', '2019-04-03', 'No Effects', 'here', '8999908009203', 10, 0, 0, '1', '', 'Ware House', '0.00', 'Finished Products', '3831f1aaf282e02c009945212facd022.png', 1, 3, 'Pcs', '1', '2500.00', '0', '0000-00-00'),
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
(1417, 1, 'criping', '11', 238, '0.00', '2500.00', '2022-08-11', '2022-08-10', 'no', '                  bbbbb              ', '1980', 20, 0, 10, '12', '1980', 'Toko Kelontong', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'Pcs', '11', '2400.00', '100', '2022-08-20'),
(1418, 1, 'tape', '10', 109, '4500.00', '5500.00', '2022-08-20', '2022-08-20', 'tidak ada', 'olahan ketan', '999999', 10, 0, 0, '10', '123456', 'Gudang', '0.00', 'Finished Products', 'default.jpg', 1, 1, 'Pcs', '100', '55000.00', '200', '2022-08-25');

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
(1, 11),
(2, 10),
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
(13, 273, '2022-08-19', 4, 1, 12444, 'cek ret', '100000.00', '22', '2022-08-19', '100000.00', 'default.jpg', 1);

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
(4, 1376, '', 3, 'BODREX TAB LAPIS DUA 20 TABLET', 1, '4500.00', '3000.00', 1, '0.00');

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
('0n30scmuvhagp4ctg6ahadsfc6cugd0t', '::1', 1660223016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232333031363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('147102j0fp0ird0b68nqmrig6phuldgp', '::1', 1660232271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233323237313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39353a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e2043726561746564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('1i2votvdch0lak40b6k1he7qa230h4ge', '::1', 1660912329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931323332393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('1lkgjdkdislt68llpote3fc1sn7lnn9o', '::1', 1660929328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393332383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('2frjkgo0kql0m22ij8jfe2qttcsfq37s', '::1', 1660228616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232383631363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('2vm0rd2htdjulraslc6i7gvmig3hdcpe', '::1', 1660915445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931353434353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('3eob9ql1i4hk0rg9pr3594vjmijfmuq1', '::1', 1660227594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232373539343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('3g4oh9crhfqvo4t9nghepq96rnvho9oe', '::1', 1660928174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932383137343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('4eeu077jb2gdp3jbo7lg2udvb1e4amck', '::1', 1660919461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931393436313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('4um93gm40m19mu965f06j7sl77b7u3q8', '::1', 1660234511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233343334383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('5skquih4kurdjt75eb12fouisg9kjif4', '::1', 1660146775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134363737353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('6ph87bgj51a52jf21egv0hp6plvp176s', '::1', 1660929024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393032343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('7lsq3kut8lddtos01c9rfidq6gg1skgl', '::1', 1660931710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933313731303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a38333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565222f3e2053746f636b206164646564223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('9jelkgmt6dgo97degfghst11pplq7tri', '::1', 1660229463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232393436333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9o8i36jkudfekr16ljvrmmeocchgqp3o', '::1', 1660926440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932363434303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9rinke1d53nvaljh3ikonqh12l27be3f', '::1', 1660929657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393635373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('9u4265nebm0qecvkpuh214c2lj4a7q5m', '::1', 1660911591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931313539313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('abahjga7q80tl47068st85i4869mku8m', '::1', 1660146255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134363235353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('b4ljva3gq6qlnkb5gclvbpu8hbb94av2', '::1', 1660917808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931373830383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('c12t3vro5cei02imdiv510nsqddjlsg4', '::1', 1660926838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932363833383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('css61j84cdad1jnlf5c1vdj463dmog1a', '::1', 1660145749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134353734393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('dgo6i90n63vfmvg1kk85195jjtm9iqa4', '::1', 1660223327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232333332373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('dv0motb78a2cg37d95j9f9q2ap6lgg56', '::1', 1660932446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933323337353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('e8jol1dbtedq7dae3ls1c5am3cpk08hq', '::1', 1660910464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931303436343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('eadae5nku5godibkhkg5koq1btqd6sj1', '::1', 1660234348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233343334383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ec1ma39m68pitg62t6p0r3qspan9vj6q', '::1', 1660932015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933323031353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('el1mrbgdco7gd75agcarl3gvnh0ll01e', '::1', 1660918730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931383733303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('f8atrdlehdi8s631pi37t7hjk0sgh8fr', '::1', 1660910066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931303036363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('g6n88475ajsl2u4hqbl6oq03lh4lj7oe', '::1', 1660916092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931363039323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('g7rnn0vrvlonip3v1nvd4mtf2kerf9uq', '::1', 1660932375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933323337353b),
('gat5nu3rhovvmf6tpgpcavgjpj7lh4j6', '::1', 1660229793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232393739333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('gq1d2k46dfpholsublsv1pe765j5edg8', '::1', 1660930392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933303339323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('hota7ve19o75bk29nb8h0da6mtf9olme', '::1', 1660144550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134343535303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ht85962ngr9gte5qvmscg61dogpcqqvk', '::1', 1660143888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134333838383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('j0ac6rmst54gai10e2dtlim1pen7q972', '::1', 1660230256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233303235363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('j6cpq1b9m1a219nb4ulh8o922dqlrbhq', '::1', 1660909363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303930393336333b),
('korg45u3hltd2ujvcql95f8e91ql1c6m', '::1', 1660144240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134343234303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ks6iqrr5q33gi2pj3svm5pv2eav158ik', '::1', 1660231541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233313534313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('l7dn0ot52nicvjgrrgeb44d3fqq1kti6', '::1', 1660914236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931343233363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('m40cj3853lmk1k9uff3ttr2o26scimgv', '::1', 1660914948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931343934383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('mai97n0d6l7gq42ajgnbqhudeq2ap38a', '::1', 1660909761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303930393736313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('n5fg8a3n9ovhp8hg3e72moaid5fktoaq', '::1', 1660928518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932383531383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('nhc1f2p1k8mgphvlki6o2p4cmj3l8fo0', '::1', 1660145433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134353433333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('nll1ecopqhcul6m13coapcvra3o36r4u', '::1', 1660227932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232373933323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('o7efngvvcabqk444f0j0593kf0m2tmnu', '::1', 1660927285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932373238353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('phb3sg6n3ph23rs1leh44egotirgjbba', '::1', 1660231862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233313836323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ppuc8h92lqlh4fdilov7rh8edqgbfgv3', '::1', 1660223680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232333638303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130323a223c69207374796c653d22636f6c6f723a236330302220636c6173733d2266612066612d6578636c616d6174696f6e2d747269616e676c652220617269612d68696464656e3d2274727565223e3c2f693e204572726f722063616e6e6f74206265206164646564223b733a353a22616c657274223b733a363a2264616e676572223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('pt7gk71b5usjn0406crhlnra5mv3oudd', '::1', 1660231233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303233313233333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('pvhp8e19ni6m5b3f0femamspb8bkeirr', '::1', 1660222568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232323536383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qhnsi8qjur4porq9brko84c3p5p62c66', '::1', 1660931029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303933313032393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qiej2p5f57sa845h3pjn7opoh13etesj', '::1', 1660909056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303930393035363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qovls3jspi25uuoss0f91sp2q8mhhbnm', '::1', 1660912648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931323634383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('qsogasiboqnhimfvuobf7tr6m577k202', '::1', 1660927677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932373637373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('tajdnjl9hst7juscip1d3aqkbkglg7t9', '::1', 1660914606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931343630363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('tfvqqah3t79ptc8e85nq8scjhi32oa42', '::1', 1660926044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932363034343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('tg3msn18ve78418gb4k43sp4hlfum1ov', '::1', 1660912953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931323935333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('u61b2pmmn9cm7ns234hmddf7upqqg2p3', '::1', 1660144900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134343930303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('ug82ducjq4ej4ub1tjusrpj8qpgu1vtb', '::1', 1660929961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303932393936313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('uhj316f4htporl4jt402orkoaum8h612', '::1', 1660229016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232393031363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('vjfbjcqufpvt01e7aua1bllei3sosd9f', '::1', 1660915759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931353735393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3130333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20537461747573206368616e676564205375636365737366756c6c7921223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226e6577223b7d),
('vliqkh1p8ql091hd2nkai7s9o305ua7t', '::1', 1660911282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303931313238323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d),
('voqtdmj6qqb3q6eudlnl043dpqcog7bo', '::1', 1660228303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303232383330333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a31323a225375707065722041646d696e223b7d);

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
(82, 273, 21, '100000.00', 1);

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
  `pack` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mp_temp_barcoder_invoice`
--

INSERT INTO `mp_temp_barcoder_invoice` (`id`, `barcode`, `product_no`, `product_id`, `product_name`, `mg`, `price`, `purchase`, `qty`, `tax`, `agentid`, `source`, `pack`) VALUES
(3, '1980', '1980', 1417, 'criping', '11', '2500.00', '0.00', 2, 0.00, 1, 'pos', 0),
(4, '999999', '123456', 1418, 'tape', '10', '5500.00', '4500.00', 1, 0.00, 1, 'pos', 0);

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

--
-- Dumping data for table `mp_temp_barcoder_purchase`
--

INSERT INTO `mp_temp_barcoder_purchase` (`id`, `barcode`, `product_no`, `product_id`, `product_name`, `mg`, `price`, `purchase`, `qty`, `tax`, `agentid`, `source`, `pack`, `sales`, `disc`, `date_ex`) VALUES
(2, '8999908000200', '', 1376, 'BODREX TAB LAPIS DUA 20 TABLET', '1', '4500.00', '3000.00', 1, 0.00, 1, 'pos', 1, '0', '0', '2022-02-09');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_drivers`
--
ALTER TABLE `mp_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_expense`
--
ALTER TABLE `mp_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_generalentry`
--
ALTER TABLE `mp_generalentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;
--
-- AUTO_INCREMENT for table `mp_head`
--
ALTER TABLE `mp_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mp_langingpage`
--
ALTER TABLE `mp_langingpage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mp_menu`
--
ALTER TABLE `mp_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `mp_menulist`
--
ALTER TABLE `mp_menulist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1419;
--
-- AUTO_INCREMENT for table `mp_purchase`
--
ALTER TABLE `mp_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `mp_region`
--
ALTER TABLE `mp_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mp_return`
--
ALTER TABLE `mp_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_return_list`
--
ALTER TABLE `mp_return_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_sales`
--
ALTER TABLE `mp_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `mp_supplier_payments`
--
ALTER TABLE `mp_supplier_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_supply`
--
ALTER TABLE `mp_supply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mp_temp_barcoder_invoice`
--
ALTER TABLE `mp_temp_barcoder_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mp_temp_barcoder_purchase`
--
ALTER TABLE `mp_temp_barcoder_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
