<?php
/*

*/
defined('BASEPATH') OR exit('No direct script access allowed');
class Expense extends CI_Controller
{
	// Expense
	function index($date1 = '', $date2 = '')
	{
		$date1 = date('Y-m').'-1';

		$date2 = date('Y-m').'-31';

		// DEFINES PAGE TITLE
		$data['title'] = 'Daftar Expense';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'Laporan Expense dari '.$date1.' sampai '.$date2;

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Tambah Expense';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Tambah Expense';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_master'] = 'Tambah Master';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_master'] = 'Tambah Master';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_pupuk'] = 'Expanse Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_pupuk'] = 'Expanse Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_pupuk'] = 'Report Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_pupuk'] = 'Report Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_penjualan'] = 'Report Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_penjualan'] = 'Report Penjualan';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_benih'] = 'Tambah Benih';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_laba'] = 'Tambah Benih';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_penjualan'] = 'Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_penjualan'] = 'Penjualan';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Simpan Expense';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'expenselist';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Expense',
			'Penerima Pembayaran',
			'Metode',
			'Tanggal',
			'Pengguna',
			'Keterangan',
			'Harga',
			'jumlah',
			'Total Tagihan',
			'Total Dibayar'
		);

		// PARAMETER 0 MEANS ONLY FETCH THAT RECORD WHICH IS VISIBLE 1 MEANS FETCH ALL
		$this->load->model('Crud_model');
		$data['expense_record_list'] = $this->Crud_model->fetch_record_expense($date1,$date2);

		$data['payee_list'] = $this->Crud_model->fetch_record('mp_payee',NULL);

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	function generate_expense()
	{
		$date1 = html_escape($this->input->post('date1'));
		$date2 = html_escape($this->input->post('date2'));

		// DEFINES PAGE TITLE
		$data['title'] = 'Daftar Expense';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'Laporan Expense dari '.$date1.' sampai '.$date2;

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Tambah Expense';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Tambah Expense';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_master'] = 'Tambah Master';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_master'] = 'Tambah Master';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_pupuk'] = 'Expanse Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_pupuk'] = 'Expanse Pupuk';


		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_pupuk'] = 'Report Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_pupuk'] = 'Report Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_benih'] = 'Tambah Benih';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_laba'] = 'Tambah Benih';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_penjualan'] = 'Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_penjualan'] = 'Penjualan';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Simpan Expense';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_penjualan'] = 'Report Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_penjualan'] = 'Report Penjualan';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'expenselist';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Akun',
			'Penerima Pembayaran',
			'Metode',
			'Tanggal',
			'Pengguna',
			'Keterangan',
			'Harga',
			'jumlah',
			'Total Tagihan',
			'Total Dibayar'
		);

		// PARAMETER 0 MEANS ONLY FETCH THAT RECORD WHICH IS VISIBLE 1 MEANS FETCH ALL
		$this->load->model('Crud_model');
		$expense_record = $this->Crud_model->fetch_record_expense($date1,$date2);
		$data['expense_record_list'] = $expense_record;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}


	function generate_pupuk()
	{
		$date1 = date('Y-m').'-1';

		$date2 = date('Y-m').'-31';
		$jurnal = html_escape($this->input->post('account_head'));
		

		// DEFINES PAGE TITLE
		$data['title'] = 'Daftar Expense';

		

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Tambah Expense';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Tambah Expense';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_master'] = 'Tambah Master';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_master'] = 'Tambah Master';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_pupuk'] = 'Expanse Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_pupuk'] = 'Expanse Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_pupuk'] = 'Report Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_pupuk'] = 'Report Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_benih'] = 'Tambah Benih';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_Benih'] = 'Tambah Benih';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_penjualan'] = 'Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_penjualan'] = 'Penjualan';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_penjualan'] = 'Report Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_penjualan'] = 'Report Penjualan';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Simpan Expense';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'pupuk';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Akun',
			'Nama Pupuk',
			'Jenis',
			'Jumlah',
			'Harga',
			'Total',
			'Keterangan',
			'Toko',
			'Tanggal'
		);

		// PARAMETER 0 MEANS ONLY FETCH THAT RECORD WHICH IS VISIBLE 1 MEANS FETCH ALL
		$this->load->model('Crud_model');
		$data['heads_record'] = $this->Crud_model->fetch_record('mp_head','Expense');
		$data['tahun'] = $this->Crud_model->tahun_aktif();
		$data['head_list'] = $this->Crud_model->fetch_record('mp_head_pupuk',NULL);
		$expense_record = $this->Crud_model->fetch_record_pupuk($jurnal,$date2);
		$data['AIR'] = $this->Crud_model->fetch_record_hpp($jurnal,'AIR');
		$data['BBM'] = $this->Crud_model->fetch_record_hpp($jurnal,'BBM');
		$data['Benih'] = $this->Crud_model->fetch_record_hpp($jurnal,'Benih');
		$data['Listrik'] = $this->Crud_model->fetch_record_hpp($jurnal,'Listrik');
		$data['Pegawai'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pegawai');
		$data['Peralatan'] = $this->Crud_model->fetch_record_hpp($jurnal,'Peralatan');
		$data['Polinasi'] = $this->Crud_model->fetch_record_hpp($jurnal,'Polinasi');
		$data['Dasar'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pupuk Dasar');
		$data['Kocor'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pupuk Kocor');
		$data['Spray'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pupuk Spray');
		$data['benih'] = $this->Crud_model->fetch_record_benih($jurnal,'mp_tanam');
		$data['penjualan'] = $this->Crud_model->fetch_record_penjualanmelon($jurnal,'mp_penjualanmelon');
		$data['tonase_a'] = $this->Crud_model->fetch_record_tonase($jurnal,'A');
		$data['tonase_b'] = $this->Crud_model->fetch_record_tonase($jurnal,'B');
		$data['tonase_c'] = $this->Crud_model->fetch_record_tonase($jurnal,'C');
		$data['tonase_r'] = $this->Crud_model->fetch_record_tonase($jurnal,'R');
		$data['expense_record_list'] = $expense_record;
        // DEFINES NAME OF TABLE HEADING
		$nama_akun = $this->Crud_model->nama_akun('mp_head',$jurnal);

        $nama = $nama_akun ? $nama_akun->name : '-';

        $data['table_name'] = 'Laporan Expense dari '.$date1.' sampai '.$date2;
        $data['judul'] = $nama;
		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}
	
	function generate_penjualan()
	{
		$date1 = date('Y-m').'-1';

		$date2 = date('Y-m').'-31';
		$jurnal = html_escape($this->input->post('account_head'));

		// DEFINES PAGE TITLE
		$data['title'] = 'Daftar Penjualan';

		// DEFINES NAME OF TABLE HEADING
		//$data['table_name'] = 'Laporan Penjualan dari '.$date1.' sampai '.$date2;

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Tambah Expense';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Tambah Expense';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_master'] = 'Tambah Master';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_master'] = 'Tambah Master';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name_pupuk'] = 'Expanse Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model_pupuk'] = 'Expanse Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_report_pupuk'] = 'Report Pupuk';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_report_pupuk'] = 'Report Pupuk';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_benih'] = 'Tambah Benih';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_Benih'] = 'Tambah Benih';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_penjualan'] = 'Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_penjualan'] = 'Penjualan';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
//		$data['page_add_button_report_penjualan'] = 'Report Penjualan';

		// DEFINES THE TITLE NAME OF THE POPUP
		//$data['page_title_report_penjualan'] = 'Report Penjualan';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Simpan Expense';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'penjualanmelon';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Akun',
			'Grade',
			'Harga',
			'Tonase',
			'Total',
			'Pembeli',
			'Keterangan',
			'Tanggal'
		);

		// PARAMETER 0 MEANS ONLY FETCH THAT RECORD WHICH IS VISIBLE 1 MEANS FETCH ALL
		$this->load->model('Crud_model');
		$data['heads_record'] = $this->Crud_model->fetch_record('mp_head','Expense');
		$data['tahun'] = $this->Crud_model->tahun_aktif();
		$data['head_list'] = $this->Crud_model->fetch_record('mp_head_pupuk',NULL);
		$expense_record = $this->Crud_model->fetch_report_penjualanmelon($jurnal,$date2);
		$data['AIR'] = $this->Crud_model->fetch_record_hpp($jurnal,'AIR');
		$data['BBM'] = $this->Crud_model->fetch_record_hpp($jurnal,'BBM');
		$data['Benih'] = $this->Crud_model->fetch_record_hpp($jurnal,'Benih');
		$data['Listrik'] = $this->Crud_model->fetch_record_hpp($jurnal,'Listrik');
		$data['Pegawai'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pegawai');
		$data['Peralatan'] = $this->Crud_model->fetch_record_hpp($jurnal,'Peralatan');
		$data['Polinasi'] = $this->Crud_model->fetch_record_hpp($jurnal,'Polinasi');
		$data['Dasar'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pupuk Dasar');
		$data['Kocor'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pupuk Kocor');
		$data['Spray'] = $this->Crud_model->fetch_record_hpp($jurnal,'Pupuk Spray');
		$data['benih'] = $this->Crud_model->fetch_record_benih($jurnal,'mp_tanam');
		$data['penjualan'] = $this->Crud_model->fetch_record_penjualanmelon($jurnal,'mp_penjualanmelon');
		$data['tonase_a'] = $this->Crud_model->fetch_record_tonase($jurnal,'A');
		$data['tonase_b'] = $this->Crud_model->fetch_record_tonase($jurnal,'B');
		$data['tonase_c'] = $this->Crud_model->fetch_record_tonase($jurnal,'C');
		$data['tonase_r'] = $this->Crud_model->fetch_record_tonase($jurnal,'R');
		$data['expense_record_list'] = $expense_record;
        // DEFINES NAME OF TABLE HEADING
		//$data['table_name'] = 'Laporan Expense dari '.$date1.' sampai '.$date2.' Pada Jurnal '.$nama_akun[0]->name;
		$nama_akun = $this->Crud_model->nama_akun('mp_head',$jurnal);

        $nama = $nama_akun ? $nama_akun->name : '-';

        $data['table_name'] = 'Laporan Expense dari '.$date1.' sampai '.$date2;
        $data['judul'] =$nama;
		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//Expense/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
	function popup($page_name = '',$param = '')
	{
		$this->load->model('Crud_model');

		if($page_name  == 'add_expense_model')
		{
			 
			//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
			$result = $this->Crud_model->fetch_record('mp_head','pembayaran');
			$data['akun_list'] = $result;

			// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_supplier
			$data['head_list'] = $this->Crud_model->fetch_attr_record_by_id('mp_head','nature','Expense');
			//DEFINE TO FETCH THE LIST OF SUPPLIER
			$data['payee_list'] = $this->Crud_model->fetch_record('mp_payee',NULL);

			//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
			$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

			//model name available in admin models folder
			$this->load->view('admin_models/add_models/add_expense_model.php',$data);
		}elseif ($page_name  == 'add_expense_model_master') {
			// code...
			//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
			//$result = $this->Crud_model->fetch_record('mp_head','pembayaran');
			//$data['akun_list'] = $result;

			// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_supplier
			//$data['head_list'] = $this->Crud_model->fetch_attr_record_by_id('mp_head','nature','Expense');
			//DEFINE TO FETCH THE LIST OF SUPPLIER
			$data['payee_list'] = $this->Crud_model->fetch_record('mp_head_pupuk',NULL);

			//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
			//$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

			//model name available in admin models folder
			$this->load->view('admin_models/add_models/add_expense_model_master.php',$data);
		}elseif($page_name  == 'add_expense_model_pupuk')
		{
			 
			//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
			$result = $this->Crud_model->fetch_record('mp_head','37');
			$data['akun_list'] = $result;

			// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_supplier
			$data['head_list'] = $this->Crud_model->fetch_attr_record_by_id('mp_head','nature','Expense');
			//DEFINE TO FETCH THE LIST OF SUPPLIER
			$data['payee_list'] = $this->Crud_model->fetch_record('mp_payee',NULL);
			//$data['pupuk_list'] = $this->Crud_model->fetch_record('mp_head_pupuk',NULL);
			$data['nama_list'] = $this->Crud_model->fetch_record('mp_masterpupuk',NULL);

			//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
			$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

			//model name available in admin models folder
			$this->load->view('admin_models/add_models/add_expense_model_pupuk.php',$data);
		}elseif($page_name  == 'add_expense_benih')
		{
			 
			//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
			$result = $this->Crud_model->fetch_record('mp_head','37');
			$data['akun_list'] = $result;

			// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_supplier
			$data['head_list'] = $this->Crud_model->fetch_attr_record_by_id('mp_head','nature','Expense');
			//DEFINE TO FETCH THE LIST OF SUPPLIER
			$data['payee_list'] = $this->Crud_model->fetch_record('mp_payee',NULL);
			//$data['pupuk_list'] = $this->Crud_model->fetch_record('mp_head_pupuk',NULL);
			$data['nama_list'] = $this->Crud_model->fetch_record('mp_masterpupuk',NULL);

			//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
			$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

			//model name available in admin models folder
			$this->load->view('admin_models/add_models/add_expense_benih.php',$data);
		}
		elseif($page_name  == 'add_expense_penjualan')
		{
			 
			//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
			$result = $this->Crud_model->fetch_record('mp_head','pembayaran');
			$data['akun_list'] = $result;

			// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_supplier
			$data['head_list'] = $this->Crud_model->fetch_attr_record_by_id('mp_head','nature','Expense');
			//DEFINE TO FETCH THE LIST OF SUPPLIER
			$data['payee_list'] = $this->Crud_model->fetch_record('mp_payee',NULL);
			//$data['pupuk_list'] = $this->Crud_model->fetch_record('mp_head_pupuk',NULL);
			$data['nama_list'] = $this->Crud_model->fetch_record('mp_masterpupuk',NULL);

			//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
			$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

			//model name available in admin models folder
			$this->load->view('admin_models/add_models/add_expense_penjualan.php',$data);
		}	
	}

	//Expense/add_expense
	function add_expense()
	{	

		$credithead = 0;
		$user_name = $this->session->userdata('user_id');
		$added_by = $user_name['name'];

		// DEFINES READ medicine details FORM medicine FORM
		$head_id = html_escape($this->input->post('head_id'));
		$method_id = html_escape($this->input->post('payment_id'));
		$total_bill = html_escape($this->input->post('bill_total'));
		$total_satuan = html_escape($this->input->post('bill_satuan'));
		$total_jumlah = html_escape($this->input->post('bill_jumlah'));
		$total_paid = html_escape($this->input->post('bill_paid'));
		$date = html_escape($this->input->post('date'));
		$description = html_escape($this->input->post('description'));
		$bank_id = html_escape($this->input->post('bank_id'));
		$payee_id = html_escape($this->input->post('payee_id'));
		$ref_no = html_escape($this->input->post('ref_no'));
		$save_available_balance = html_escape($this->input->post('save_available_balance'));

		if(($save_available_balance-$total_paid) <= 0 AND $method_id == 'Cheque' )
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Saldo tidak mencukupi ',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			// $picture = html_escape($this->input->post('picture'));
			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Transaction_model');

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$args = array(
				'head_id' => $head_id,
				'method' => $method_id,
				'total_bill' => $total_bill,
				'total_paid' => $total_paid,
				'date' => $date,
				'description' => $description,
				'user' => $added_by,
				'payee_id' => $payee_id,
				'bank_id' => $bank_id,
				// 'credithead' => ($method_id == 'Cash' ? '2' : '16'),
				'credithead' => $method_id,
				'harga_satuan' => $total_satuan,
				'jumlah' => $total_jumlah,
				'ref_no' => $ref_no
			);

			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
			$result = $this->Transaction_model->add_expense_transaction($args);
			if ($result != NULL)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Expense added Successfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error expense cannot be added',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}

		redirect('expense');
	}

	

	function add_pupuk()
	{	

		$credithead = 0;
		$user_name = $this->session->userdata('user_id');
		$added_by = $user_name['name'];

		// DEFINES READ medicine details FORM medicine FORM
		$head_id = html_escape($this->input->post('head_id'));
		$method_id = html_escape($this->input->post('payment_id'));
		$total_bill = html_escape($this->input->post('bill_total'));
		$total_satuan = html_escape($this->input->post('bill_satuan'));
		$total_jumlah = html_escape($this->input->post('bill_jumlah'));
		//$total_paid = html_escape($this->input->post('bill_paid'));
		$date = html_escape($this->input->post('date'));
		$description = html_escape($this->input->post('description'));
		$bank_id = html_escape($this->input->post('bank_id'));
		$payee_id = html_escape($this->input->post('payee_id'));
		$ref_no = html_escape($this->input->post('ref_no'));
		$nama_pupuk = html_escape($this->input->post('nama_pupuk'));
		$toko = html_escape($this->input->post('toko'));
		$save_available_balance = html_escape($this->input->post('save_available_balance'));

		if(($save_available_balance-$total_paid) <= 0 AND $method_id == 'Cheque' )
		{
			$array_msg = array(
				'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Saldo tidak mencukupi ',
				'alert' => 'danger'
			);
			$this->session->set_flashdata('status', $array_msg);
		}
		else
		{
			// $picture = html_escape($this->input->post('picture'));
			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Transaction_model');

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$args = array(
				'head_id' => $head_id,
				'method' => $method_id,
				'total_bill' => $total_bill,
				'total_paid' => $total_bill,
				'date' => $date,
				'description' => $description,
				'user' => $added_by,
				'payee_id' => $payee_id,
				'bank_id' => $bank_id,
				// 'credithead' => ($method_id == 'Cash' ? '2' : '16'),
				'credithead' => $method_id,
				'harga_satuan' => $total_satuan,
				'jumlah' => $total_jumlah,
				'nama_pupuk' => $nama_pupuk,
				'toko' => $toko,
				'ref_no' => $ref_no
			);

			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
			$result = $this->Transaction_model->add_expense_pupuk($args);
			if ($result != NULL)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Expense added Successfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error expense cannot be added',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		}

		redirect('expense');
	}


	function add_benih()
	{	

		$credithead = 0;
		$user_name = $this->session->userdata('user_id');
		$added_by = $user_name['name'];

		// DEFINES READ medicine details FORM medicine FORM
		$head_id = html_escape($this->input->post('head_id'));
		$benih = html_escape($this->input->post('nama_pupuk'));
		$jumlah = html_escape($this->input->post('jumlah'));

		
			// $picture = html_escape($this->input->post('picture'));
			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Transaction_model');

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$args = array(
				'periode' => $head_id,
				'jenis_melon' => $benih,
				'jumlah' => $jumlah
			);

			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
			$result = $this->Transaction_model->add_expense_benih($args);
			if ($result != NULL)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Expense added Successfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error expense cannot be added',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		

		redirect('expense');
	}


	function add_penjualan()
	{	

		$credithead = 0;
		$user_name = $this->session->userdata('user_id');
		$added_by = $user_name['name'];

		// DEFINES READ medicine details FORM medicine FORM
		$head_id = html_escape($this->input->post('head_id'));
		$pembayaran = html_escape($this->input->post('payment_id'));
		$grade = html_escape($this->input->post('grade'));
		$harga = html_escape($this->input->post('harga'));
		$tonase = html_escape($this->input->post('tonase'));
		$pembeli = html_escape($this->input->post('pembeli'));
		$keterangan = html_escape($this->input->post('keterangan'));
		$tanggal = html_escape($this->input->post('tanggal'));
		$satuan = html_escape($this->input->post('satuan'));

		
			// $picture = html_escape($this->input->post('picture'));
			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Transaction_model');

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$args = array(
				'head' => $head_id,
				'pembayaran'=>$pembayaran,
				'grade'=>$grade,
				'harga'=>$harga,
				'tonase'=>$tonase,
				'pembeli'=>$pembeli,
				'keterangan'=>$keterangan,
				'tanggal'=>$tanggal,
				'satuan'=>$satuan,
				'method'=>3
			);

			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
			$result = $this->Transaction_model->add_expense_penjualan($args);
			if ($result != NULL)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Expense added Successfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error expense cannot be added',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
		

		redirect('expense');
	}


	function add_master()
	{	

		$credithead = 0;
		$user_name = $this->session->userdata('user_id');
		$added_by = $user_name['name'];

		// DEFINES READ medicine details FORM medicine FORM
		$jenis = html_escape($this->input->post('jenis'));
		$nama_pupuk = html_escape($this->input->post('nama_pupuk'));

		
		
			// $picture = html_escape($this->input->post('picture'));
			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Transaction_model');

			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
			$args = array(
				'jenis' => $jenis,
				'nama_pupuk' => $nama_pupuk
			);
			var_dump($args);
			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
			$result = $this->Transaction_model->add_master($args);
			if ($result != NULL)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Master added Successfully',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Master cannot be added',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}

		redirect('expense');
	}
}