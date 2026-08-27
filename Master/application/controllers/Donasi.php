<?php
/*

*/
defined('BASEPATH') OR exit('No direct script access allowed');
class Donasi extends CI_Controller
{
	// Homepage
	public function index()
	{
		// DEFINES TO LOAD THE CATEGORY RECORD FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$this->load->model('Statement_model');
		$this->load->model('Accounts_model');

		// DEFINES PAGE TITLE
		$data['title'] = 'Donasi';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'product Category List :';

		// DEFINES BUTTON NAME ON THE TOP OF THE TABLE
		$data['page_add_button_name'] = 'Add New Category';

		// DEFINES THE TITLE NAME OF THE POPUP
		$data['page_title_model'] = 'Add New Category';

		// DEFINES THE NAME OF THE BUTTON OF POPUP MODEL
		$data['page_title_model_button_save'] = 'Save Category Name';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'donasi';

		// DIFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'No',
			'Category Name',
			'description',
			'Date',
			'Added By',
			'Status',
			'Actions'
		);




		//CASH IN HAND pakai
		$data['cash_in_hand'] = $this->Statement_model->donasi('Tambah');		
		//PAYABLES pakai
		$data['payables'] = $this->Statement_model->donasi('Kurang');	
		$data['hariini'] = $this->Statement_model->donasi_now('Tambah',Date('Y-m-d'));
		//var_dump($this->Statement_model->donasi_now('Tambah',Date('Y-m-d')));
		//ACCOUNT RECEIVABLE pakai
		$data['account_recieveble'] = $data['cash_in_hand'] - $data['payables'];		

				

		//CURRENCY 
		$data['currency'] = '( '.$this->Crud_model->fetch_record_by_id('mp_langingpage',1)[0]->currency.' )';




		// DEFINES TO LOAD THE MODEL Accounts_model
		$this->load->model('Accounts_model');

		// FETCHING THE EXPENSE AND REVENUE FOR GRAPH
		$result_sales_this_year_and_total_profit = $this->Accounts_model->statistics_sales_this_year();
		$data['result_sales_arr'] = json_encode($result_sales_this_year_and_total_profit[0]);
		
		$data['result_profit_this_year'] = json_encode($result_sales_this_year_and_total_profit[1]);
		$data['result_expense_this_year'] = json_encode($result_sales_this_year_and_total_profit[2]);

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	function popup($page_name = '',$param = '')
	{
		if($page_name  == 'add_donasi')
		{
       //USED TO REDIRECT LINK
			$data['link'] = 'Donasi/chart_of_account';

       //model name available in admin models folder
			$this->load->view( 'admin_models/add_models/add_donasi.php',$data);
		}
	}

	
	public function chart_of_account()
     {

      // DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
      $this->load->model('Transaction_model');

      // DEFINES READ MEDICINE details FORM MEDICINE FORM
      $name = html_escape($this->input->post('name'));
      $keterangan = html_escape($this->input->post('keterangan'));

      // ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
      $data12  = array('jumlah' => $name, 
				'invoice' => '0', 
				'status' => 'Kurang', 
				'keterangan' => $keterangan
			);

      // CHECK WEATHER EMAIL ADLREADY EXISTS OR NOT IN THE TABLE
     $this->Transaction_model->donasi($data12); 
     
            $array_msg = array(
             'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Added Successfully',
             'alert' => 'info'
            );
            $this->session->set_flashdata('status', $array_msg);
         
     
      redirect('donasi');
     }

	// Homepage/sign_out
	public function sign_out()
	{
		$this->session->unset_userdata('user_id');
		redirect('/Login');
	}
}