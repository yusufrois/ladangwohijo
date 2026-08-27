<?php
/*

*/
defined('BASEPATH') OR exit('No direct script access allowed');
class Purchase extends CI_Controller
{
	// Purchase
	public function index()
	{

		// DEFINES PAGE TITLE
		$data['title'] = 'Daftar Pembelian';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'DAFTAR PEMBELIAN :';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'purchase';

		
		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'ID Transaksi ',
			'No Bill',
			'Tanggal',
			'Supplier',
			'Total',
			'Total Dibayar',
			'Sisa',
			'Metode',
			'Tanggal Pembayaran',
			'Status',
			'Aksi'
		);

		//FETCHING DATES FROM TEXT FIELDS 
		$date1 = html_escape($this->input->post('date1'));
		$date2 = html_escape($this->input->post('date2'));	

		if($date1 == NULL AND $date2 == NULL)
		{
			//ASSIGNING DEFAULT DATES 
			$date1 = date('Y-m').'-1';
			$date2 = date('Y-m').'-31';
		}

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_record_purchased(0,$date1,$date2);
		$data['purchase_list'] = $result;


		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}	

	//USED TO LIST THE PURCHASE RETURN
	//Purchase/return_list
	public function return_list()
	{

		// DEFINES PAGE TITLE
		$data['title'] = 'Retur Pembelian';

		// DEFINES NAME OF TABLE HEADING
		$data['table_name'] = 'DAFTAR RETUR PEMBELIAN :';


		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'purchase_return';

		// DEFINES THE TABLE HEAD
		$data['table_heading_names_of_coloums'] = array(
			'ID Transaksi ',
			'No Bill',
			'Tanggal',
			'Supplier',
			'Total',
			'Total Diterima',
			'Penerimaan',
			'Metode',
			'Tanggal Pembayaran',
			'Status',
			'Aksi'
		);

		//FETCHING DATES FROM TEXT FIELDS 
		$date1 = html_escape($this->input->post('date1'));
		$date2 = html_escape($this->input->post('date2'));	

		if($date1 == NULL AND $date2 == NULL)
		{
			//ASSIGNING DEFAULT DATES 
			$date1 = date('Y-m').'-1';
			$date2 = date('Y-m').'-31';
		}

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
//		$result = $this->Crud_model->fetch_record_purchased(1,$date1,$date2);
		$result = $this->Crud_model->fetch_record_return(1,$date1,$date2);
		$data['purchase_list'] = $result;

		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//USED TO SHOW PURCHASE RETURN 
	function return_purchase()
	{
		// DEFINES PAGE TITLE
		$data['title'] = 'Retur Pembelian';

		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_payee_record('supplier','status');
		$data['supplier_list'] = $result;

		$result = $this->Crud_model->fetch_record('mp_stores', NULL);
		$data['store_list'] = $result;

		//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
		$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

		//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
		$result = $this->Crud_model->fetch_record('mp_head','pembayaran');
		$data['akun_list'] = $result;

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'return_purchase';

		
		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}
	//USED TO CREATE Purchase
	//Purchase/create_purchase
	function create_purchase()
	{
		// DEFINES PAGE TITLE
		$data['title'] = 'Tambah Pembelian';
		$user_name = $this->session->userdata('user_id');
		// DEFINES TO LOAD THE CATEGORY LIST FROM DATABSE TABLE mp_Categoty
		$this->load->model('Crud_model');
		$result = $this->Crud_model->fetch_payee_record('supplier','status');
		$data['supplier_list'] = $result;

		$result = $this->Crud_model->fetch_record('mp_stores', NULL);
		$data['store_list'] = $result;

		//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
		$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

		//DEFINES TO LOAD BANK AKUN OR COA MP_HEAD
		$result = $this->Crud_model->fetch_record('mp_head','pembayaran');
		$data['akun_list'] = $result;
		
		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'create_purchase';

		// load purchase template 
		//LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
		$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);
		$data['temp_view'] = 'purchase_template';
		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}

	//USED TO ADD PURCHASE INTO DATAABASE
	//	Purchase/add_purchase
	public function add_purchase()
	{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
		
		// var_dump(count($this->input->post('supply_jual')));
		/*for($i=0; $i<count($this->input->post('supply_jual')); $i++){
				
				$nama = html_escape($this->input->post('supply_nama['.$i.']'));
				var_dump($nama);
			}*/
			
			//var_dump($user_name);
			$this->load->model('Crud_model');
			$this->load->model('Transaction_model');

		// DEFINES READ MEDICINE details FORM MEDICINE FORM
			$pur_supplier 	 = html_escape($this->input->post('pur_supplier'));
			$pur_store 		 = html_escape($this->input->post('pur_store'));
			$pur_invoice 	 = html_escape($this->input->post('pur_invoice'));
			$pur_total 		 = html_escape($this->input->post('pur_total'));
			$pur_method 	 = html_escape($this->input->post('pur_method'));
			$pur_date 		 = html_escape($this->input->post('pur_date'));
			$total_paid 		 = html_escape($this->input->post('pur_paid'));
			$pur_description = html_escape($this->input->post('pur_description'));
			$bank_id = html_escape($this->input->post('bank_id'));
			$ref_no = html_escape($this->input->post('ref_no'));
			$save_available_balance = html_escape($this->input->post('save_available_balance'));
			$picture = $this->Crud_model->do_upload_picture("pur_picture", "./uploads/purchase/");
			$status = html_escape($this->input->post('status'));


		//USED TO REDIRECT TO LOCATION DEFINED
			if($status == 0)
			{
				$redirect = 'purchase';
			}
			else
			{
				$redirect = 'purchase/return_list';
			}

			if(($save_available_balance-$total_paid) <= 0 AND $pur_method == 'Cheque' AND $status == 0)
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Saldo tidak mencukupi ',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
			// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY
				$args = array(
					'date' => date('Y-m-d'),
					'supplier_id' => $pur_supplier,
					'store' => $pur_store,
					'invoice_id' => $pur_invoice,
					'total_amount' => $pur_total,
					'payment_type_id' => $pur_method,
					'payment_date' => $pur_date,
					'cash' => $total_paid,
					'description' => $pur_description,
					'cus_picture' => $picture,
					'status' => $status,
					'bank_id' => $bank_id,
				//'credithead' => ($pur_method == 'Cash' ? '2' : '16'),
					'credithead' => $pur_method,
					'ref_no' => $ref_no
				);

			// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
				$result = $this->Transaction_model->purchase_transaction($args);

				if($status == 0)
				{
					for($i=0; $i<count($this->input->post('supply_jual')); $i++){
						$expire = html_escape($this->input->post('supply_tgl['.$i.']'));
						$qty = html_escape($this->input->post('supply_total['.$i.']'));
						$purc = html_escape($this->input->post('supply_satuan['.$i.']'));
						$retail = html_escape($this->input->post('supply_jual['.$i.']'));
						$disc = html_escape($this->input->post('supply_dis['.$i.']'));
						$nama = html_escape($this->input->post('supply_nama['.$i.']'));
						$this->Transaction_model->update_stock($expire,$qty,$purc,$retail,$disc, $pur_store,$nama);
						$this->Transaction_model->kadaluarsa($pur_invoice,$nama,$qty,$expire,$purc,$nama);
						//$this->Transaction_model->insert_buy($product_id,$product_no,$pur_invoice,$nama,$pur_supplier,$retail,$purc,$qty,0);
					}
					$user_name = $this->session->userdata('user_id')['id'];
					$this->Transaction_model->insert_buy($pur_supplier,$pur_invoice,$user_name);
					$this->Transaction_model->insert_label($pur_supplier,$pur_invoice,$user_name);
					$this->Transaction_model->insert_label_barcode($pur_supplier,$pur_invoice,$user_name);
					$this->Transaction_model->delete_tmp_barcode($user_name);
				}
				if ($result != NULL)
				{
					$array_msg = array(
						'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Added successfully',
						'alert' => 'info'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
				else
				{
					$array_msg = array(
						'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error cannot be added',
						'alert' => 'danger'
					);
					$this->session->set_flashdata('status', $array_msg);
				}
			}	

			redirect($redirect);
		}

	// Customer/Delete
		function delete($args)
		{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS

			$this->load->model('Crud_model');

		// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID

			$this->Crud_model->delete_image('./uploads/customers/', $args, 'mp_customer');

		// DEFINES TO DELETE THE ROW FROM TABLE AGAINST ID

			$result = $this->Crud_model->delete_record('mp_customer', $args);
			if ($result == 1)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-trash-o" aria-hidden="true"></i> Customer record removed',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Customer record cannot be changed',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}

			redirect('customers');
		}

	// Customers/Edit
		function edit()
		{

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');

		// RETRIEVING UPDATED VALUES FROM FORM MEDICINE FORM
			$edit_customer_id = html_escape($this->input->post('edit_customer_id'));
			$edit_customer_name = html_escape($this->input->post('edit_customer_name'));
			$edit_customer_email = html_escape($this->input->post('edit_customer_email'));
			$edit_customer_address = html_escape($this->input->post('edit_customer_address'));
			$edit_customer_contatc1 = html_escape($this->input->post('edit_customer_contatc1'));
			$edit_customer_contact_two = html_escape($this->input->post('edit_customer_contact_two'));
			$edit_customer_company = html_escape($this->input->post('edit_customer_company'));
			$edit_customer_city = html_escape($this->input->post('edit_customer_city'));
			$edit_customer_country = html_escape($this->input->post('edit_customer_country'));
			$edit_customer_description = html_escape($this->input->post('edit_customer_description'));
			$edit_picture = $this->Crud_model->do_upload_picture("edit_customer_picture_name", "./customers/");

		// TABLENAME AND ID FOR DATABASE Actions
			$args = array(
				'table_name' => 'mp_customer',
				'id' => $edit_customer_id
			);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
		// DEFINES IF NO IMAGES IS SELECTED SO PRIVIOUS PICTURE REMAINS SAME
			if ($edit_picture == "default.jpg")
			{
				$data = array(
					'customer_name' => $edit_customer_name,
					'cus_email' => $edit_customer_email,
					'cus_address' => $edit_customer_address,
					'cus_contact_1' => $edit_customer_contatc1,
					'cus_contact_2' => $edit_customer_contact_two,
					'cus_company' => $edit_customer_company,
					'cus_city' => $edit_customer_city,
					'cus_country' => $edit_customer_country,
					'cus_description' => $edit_customer_description
				);
			}
			else
			{

			// DEFINES IF  IMAGES IS SELECTED SO UPDATE PRIVIOUS PICTURE
				$data = array(
					'customer_name' => $edit_customer_name,
					'cus_email' => $edit_customer_email,
					'cus_address' => $edit_customer_address,
					'cus_contact_1' => $edit_customer_contatc1,
					'cus_contact_2' => $edit_customer_contact_two,
					'cus_company' => $edit_customer_company,
					'cus_description' => $edit_customer_description,
					'cus_picture' => $edit_picture
				);

			// DEFINES TO DELETE IMAGE FROM FOLDER PARAMETER REQIURES ARRAY OF IMAGE PATH AND ID
				$this->Crud_model->delete_image('./uploads/customers/', $edit_customer_id, 'mp_customer');
			}

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);
			if ($result == 1)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-pencil-square-o" aria-hidden="true"></i> Customer Editted',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Customer Category cannot be Editted',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			redirect('customers');
		}

	//Customer/popup
	//DEFINES A POPUP MODEL OG GIVEN PARAMETER
		function popup($page_name = '',$param = '')
		{
			$this->load->model('Crud_model');

			if($page_name  == 'view_purchase_detail')
			{
				$data['single_purchase'] = $this->Crud_model->fetch_record_by_id('mp_purchase',$param);
			//model name available in admin models folder
				$this->load->view( 'admin_models/view_purchase_detail.php',$data);
			}
			else if($page_name  == 'add_customer_payment_pos_model')
			{
				$this->load->model('Accounts_model');

				$data['previous_amt'] = $this->Accounts_model->previous_balance($param);

				$data['cus_id'] = $param;

				$data['customer_list'] = $this->Crud_model->fetch_payee_record('customer',NULL);
			//DEFINES TO FETCH THE LIST OF BANK ACCOUNTS 
				$data['bank_list'] = $this->Crud_model->fetch_record('mp_banks','status');

				$this->load->view( 'admin_models/add_models/add_customer_payment_pos_model.php',$data);
			}		
		}

	// Customer/change_status/id/status
		function change_status($id, $status)
		{
		// TABLENAME AND ID FOR DATABASE Actions
			$args = array(
				'table_name' => 'mp_customer',
				'id' => $id
			);

		// DATA ARRAY FOR UPDATE QUERY array('abc'=>abc)
			$data = array(
				'cus_status' => $status
			);

		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$result = $this->Crud_model->edit_record_id($args, $data);
			if ($result == 1)
			{
				$array_msg = array(
					'msg' => '<i style="color:#fff" class="fa fa-check-circle-o" aria-hidden="true"></i> Status changed Successfully!',
					'alert' => 'info'
				);
				$this->session->set_flashdata('status', $array_msg);
			}
			else
			{
				$array_msg = array(
					'msg' => '<i style="color:#c00" class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error Status cannot be changed',
					'alert' => 'danger'
				);
				$this->session->set_flashdata('status', $array_msg);
			}

			redirect('customers');
		}


	//purchase/add_barcode_item
	//USED TO ADD ITEM INTO TEMP INVOICE TABLE USING BARCODE
		function add_barcode_item($barcode)
		{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');

			$user_name = $this->session->userdata('user_id');

			$result = $this->Crud_model->fetch_attr_record_by_id('mp_productslist','barcode',$barcode);
			if($result != NULL)
			{

				$check_item_in_temp = $this->Crud_model->fetch_attr_record_by_userid_source('mp_temp_barcoder_purchase','barcode',$barcode,$user_name['id'],'pos');

				if($result[0]->quantity > 0)
				{
					$stockargs   = array(
						'table_name' =>'mp_productslist', 
						'id' =>$result[0]->id, 
					);

					$stockdata = array(
						'quantity' => $result[0]->quantity
					);

					$this->Crud_model->edit_record_id($stockargs, $stockdata);

					if($check_item_in_temp != NULL)
					{
						$qty = '';

						$qty = $check_item_in_temp[0]->qty+1;

						$args = array(
							'table_name' => 'mp_temp_barcoder_purchase',
							'id' => $check_item_in_temp[0]->id
						);

						$data = array(
							'qty' => $qty
						);

						$this->Crud_model->edit_record_id($args, $data);
					}
					else
					{
						$tax_amount = ($result[0]->tax/100)*$result[0]->retail;

					// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY FOR EVERY ITERATION
						$temp_data = array(
							'barcode' => $result[0]->barcode,
							'product_no' => $result[0]->sku,
							'product_id' => $result[0]->id,
							'product_name' => $result[0]->product_name,
							'mg' => $result[0]->mg,
							'price' => $result[0]->retail,
							'purchase' => $result[0]->purchase,
							'qty' => 1,
							'tax' => $tax_amount,
							'agentid' => $user_name['id'],
							'source' => 'pos',
							'pack' => $result[0]->packsize,
							'disc' => $result[0]->disc,
							'date_ex' => $result[0]->expire
						);

					// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
						$result = $this->Crud_model->insert_data('mp_temp_barcoder_purchase', $temp_data);
					}
				}
			}
		//LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}


	//Purchase/clear_temp_invoice
	//USED TO CLEAR TEMP INVOICE
		function clear_temp_invoice()
		{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');

		//GET THE CURRENT USER
			$user_name = $this->session->userdata('user_id');

		//FETCH THE ITEM FROM DATABSE TABLE TO ADD AGAIN TO STOCK
			$result = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			if($result  != NULL)
			{

				foreach ($result as $single_item) 
				{
				//FETCH THE ITEM FROM STOCK TABLE 
					$result_stock = $this->Crud_model->fetch_record_by_id('mp_productslist',$single_item->product_id);

				// TABLENAME AND ID FOR DATABASE Actions
					$args = array(
						'table_name' => 'mp_productslist',
						'id' => $single_item->product_id
					);


					$data = array(
					//'quantity' => $result_stock[0]->quantity+$single_item->qty
						'quantity' => $result_stock[0]->quantity
					);

				// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
					$this->Crud_model->edit_record_id($args, $data);

				}

				$this->Crud_model->delete_record_by_userid('mp_temp_barcoder_purchase','pos',$user_name['id']);
			}

			//LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}


	//Purchase/search_result_manual
	//USED TO SEARCH MANUAL ITEMS
		function search_result_manual($search_result)
		{
			if($search_result != NULL)
			{
			// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
				$this->load->model('Crud_model');

				$result = $this->Crud_model->search_items_stock($search_result);
			//LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
				$data['search_result'] = $result;
				$this->load->view('search_list.php',$data);
			}
		}


	//Purchase/add_selected_item
	//USED TO ADD ITEM INTO TEMP INVOICE TABLE USING BARCODE
		function add_selected_item($id)
		{
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');
			$user_name = $this->session->userdata('user_id');

			if($id != '')
			{
				$result = $this->Crud_model->fetch_record_by_id('mp_productslist',$id);

				$check_item_in_temp = $this->Crud_model->fetch_attr_record_by_userid_source('mp_temp_barcoder_purchase','product_id',$id,$user_name['id'],'pos');


				if($result[0]->quantity >= 0)
				{
					$stockargs   = array(
						'table_name' =>'mp_productslist', 
						'id' =>$result[0]->id, 
					);

					$stockdata = array(
						'quantity' => $result[0]->quantity
					);

					$this->Crud_model->edit_record_id($stockargs, $stockdata);

					if($check_item_in_temp != NULL)
					{
						$qty = $check_item_in_temp[0]->qty+1;

						$args = array(
							'table_name' => 'mp_temp_barcoder_purchase',
							'id' => $check_item_in_temp[0]->id
						);

						$data = array(
							'qty' => $qty
						);

						$this->Crud_model->edit_record_id($args, $data);
					}
					else
					{
						if($result != NULL)
						{
							$tax_amount = ($result[0]->tax/100)*$result[0]->retail;

							// ASSIGN THE VALUES OF TEXTBOX TO ASSOCIATIVE ARRAY FOR EVERY ITERATION
							$args = array(
								'barcode' => $result[0]->barcode,
								'product_no' => $result[0]->sku,
								'product_id' => $result[0]->id,
								'product_name' => $result[0]->product_name,
								'mg' => $result[0]->mg,
								'price' => $result[0]->retail,
								'purchase' => $result[0]->purchase,
								'qty' => 1,
								'tax' => $tax_amount,
								'agentid' => $user_name['id'],
								'source' => 'pos',
								'pack' => $result[0]->packsize,
								'disc' => $result[0]->disc,
								'date_ex' => $result[0]->expire
							);
								// DEFINES CALL THE FUNCTION OF insert_data FORM Crud_model CLASS
							$result = $this->Crud_model->insert_data('mp_temp_barcoder_purchase', $args);
						}
					}

				}
				//LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
				$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

				$this->load->view('purchase_template.php',$data);
			}
		}


	// Purchase/manage
		public function manage()
		{

		// DEFINES PAGE TITLE
			$data['title'] = 'Pembelian';

			$collection = array();

		// DEFINES TO LOAD THE MODEL
			$this->load->model('Accounts_model');
			$first_date = html_escape($this->input->post('date1'));
			$second_date = html_escape($this->input->post('date2'));
			$invoice_no = html_escape($this->input->post('invoice_no'));
			if ($invoice_no != NULL)
			{
				$this->load->model('Crud_model');
				$result_invoices = $this->Crud_model->fetch_record_by_id('mp_invoices', $invoice_no);
			}
			else
			{

				if ($first_date == NULL OR $second_date == NULL)
				{
					$first_date = date('Y-m-d');
					$second_date = date('Y-m-d');

				// FETCH SALES RECORD FROM invoices TABLE
					$result_invoices = $this->Accounts_model->fetch_record_date('mp_invoices', $first_date, $second_date);
				}
				else
				{

				// FETCH SALES RECORD FROM invoices TABLE
					$result_invoices = $this->Accounts_model->fetch_record_date('mp_invoices', $first_date, $second_date);
				}
			}

			if ($result_invoices != NULL)
			{
				$count = 0;
			// print "<pre>";
			// print_r($result_invoices);
				foreach($result_invoices as $obj_result_invoices)
				{

				// FETCH SALES RECORD FROM SALES TABLE
					$result_sales = $this->Accounts_model->fetch_record_sales('mp_sales', 'order_id', $obj_result_invoices->id);
					if ($result_sales != NULL)
					{
						$collection[$count] = $result_sales;
						$count++;
					}
				}
			// print "<pre>";
			// print_r($collection);
			// ASSIGNED THE FETCHED RECORD TO DATA ARRAY TO VIEW
				$data['Sales_Record'] = $collection;
				$data['Model_Title'] = "Edit invoice";
				$data['Model_Button_Title'] = "Update invoices";
				$data['invoices_Record'] = $result_invoices;

			// DEFINES WHICH PAGE TO RENDER
				$data['main_view'] = 'sales_invoices';

			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
				$this->load->view('main/index.php', $data);
			}
			else
			{
			// DEFINES WHICH PAGE TO RENDER
				$data['main_view'] = 'main/error_invoices.php';
				$data['actionresult'] = "invoice/manage";
				$data['heading1'] = "Tidak ada faktur yang tersedia. ";
				$data['heading2'] = "Ups! Maaf tidak ada catatan faktur yang tersedia di detail yang diberikan";
				$data['details'] = "Kami akan segera memperbaikinya. Sementara itu, Anda dapat kembali atau mencoba menggunakan formulir pencarian.";
			// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
				$this->load->view('main/index.php', $data);
			}
		}


	//USED TO SEARCH CUSTOMERS PRIVIOUS BALANCE 
	//Purchase/search_previous_cus_balance
		function search_previous_cus_balance($cus_id)
		{
			$this->load->model('Accounts_model');
			$result = $this->Accounts_model->previous_balance($cus_id);
			echo $result;
		}


	//USED TO UPDATE QUANTITY 
    //Purchase/update_qty
		function update_qty($val = '' , $id = '', $customprice = null)
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			$val = intval($val);

			if($val != '' AND $id != '' AND  $val > -1)
			{

				$result = $this->Crud_model->fetch_attr_record_by_userid_source('mp_temp_barcoder_purchase','id',$id,$user_name['id'],'pos');

				$result_stk = $this->Crud_model->fetch_record_by_id('mp_productslist',$result['0']->product_id);

				$bal = 0;
				$new_qty = 0;

				if($result[0]->qty > $val)
				{

					$bal = $result[0]->qty-$val;
					$new_qty = $result_stk[0]->quantity+$bal;
				}
				else if($result[0]->qty < $val)
				{
					$bal = $val-$result[0]->qty;
					$new_qty = $result_stk[0]->quantity-$bal;

				}

				if($result[0]->qty != $val AND $new_qty >= 0)
				{
					$new_args = '';

					$new_data = '';

					$temp_args = array(
						'table_name' => 'mp_temp_barcoder_purchase',
						'id' => $id
					);


					$temp_data = array(
						'qty' => $val
					);	



					$this->Pos_transaction_model->general_beli_transaction($new_args, $new_data ,$temp_args ,$temp_data);
				}

			}
        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}

		function update_total_qty($val = '' , $id = '', $customprice = null)
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			$val = intval($val);

			$this->Pos_transaction_model->update_qty($id,$val);


        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}

		function update_total_beli($val = '' , $id = '', $customprice = null)
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			$val = intval($val);

			$this->Pos_transaction_model->update_beli($id,$val);


        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}


		function update_harga_jual($val = '' , $id = '', $customprice = null)
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			$val = intval($val);

			$this->Pos_transaction_model->update_jual($id,$val);


        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}

		function update_harga_satuan($val = '' , $id = '', $customprice = null)
		{	

			//print($val);
			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			//$val = intval($val);
			$val = $val;
			//print($val);
			$this->Pos_transaction_model->update_satuan($id,$val);


        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}

		function update_disc($val = '' , $id = '', $customprice = null)
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			$val = intval($val);

			$this->Pos_transaction_model->update_disc($id,$val);


        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}

		function date_ex($val = '' , $id = '', $customprice = null)
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
      //$val = intval($val);
      //var_dump($id);
			$this->Pos_transaction_model->date_ex($val, $id);


        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}

	//USED TO UPDATE QUANTITY 
    //Purchase/update_qty
		function update_price($val = '', $id = '')
		{	

			$this->load->model('Crud_model'); 
			$this->load->model('Pos_transaction_model'); 
			$user_name = $this->session->userdata('user_id');
			$val = intval($val);

			if($val != '' AND $id != '' AND  $val > -1)
			{

				$result = $this->Crud_model->fetch_attr_record_by_userid_source('mp_temp_barcoder_purchase','id',$id,$user_name['id'],'pos');

				$result_stk = $this->Crud_model->fetch_record_by_id('mp_productslist',$result['0']->product_id);

				$bal = 0;
				$new_qty = 0;

				if($result[0]->qty > $val)
				{

					$bal = $result[0]->qty-$val;
					$new_qty = $result_stk[0]->quantity+$bal;
				}
				else if($result[0]->qty < $val)
				{
					$bal = $val-$result[0]->qty;
					$new_qty = $result_stk[0]->quantity-$bal;

				}

				if($result[0]->qty != $val AND $new_qty >= 0)
				{
					$new_args = array(
						'table_name' => 'mp_productslist',
						'id' => $result['0']->product_id
					);

					$new_data = array(
						'quantity' => $new_qty
					);

					$temp_args = array(
						'table_name' => 'mp_temp_barcoder_purchase',
						'id' => $id
					);

					$temp_data = array(
						'price'=>$val
					);


					$this->Pos_transaction_model->general_pos_transaction($new_args, $new_data ,$temp_args ,$temp_data);
				}

			}
        //LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}


	//purchase/delete_item_temporary
	//USED TO DELETE AN ITEM FROM TEMPORARY TABLE OF BARCODE ITEMS
		function delete_item_temporary_purc($item_id)
		{	
		// DEFINES LOAD CRUDS_MODEL FORM MODELS FOLDERS
			$this->load->model('Crud_model');

		//FETCH THE ITEM FROM DATABSE TABLE TO ADD AGAIN TO STOCK
			$result = $this->Crud_model->fetch_record_by_id('mp_temp_barcoder_purchase',$item_id);		

		//FETCH THE ITEM FROM STOCK TABLE 
			$result_stock = $this->Crud_model->fetch_record_by_id('mp_productslist',$result[0]->product_id);

		// TABLENAME AND ID FOR DATABASE Actions
			$args = array(
				'table_name' => 'mp_productslist',
				'id' => $result[0]->product_id
			);

			$data = array(
				'quantity' => $result_stock[0]->quantity
			///'quantity' => $result_stock[0]->quantity+$result[0]->qty
			);

		// CALL THE METHOD FROM Crud_model CLASS FIRST ARG CONTAINES TABLENAME AND OTHER CONTAINS DATA
			$this->Crud_model->edit_record_id($args, $data);

		// DEFINES TO DELETE THE ROW FROM TABLE AGAINST ID
			$this->Crud_model->delete_record('mp_temp_barcoder_purchase', $item_id);

		//USER ID
			$user_name = $this->session->userdata('user_id');

		//LOAD FRESH CONTENT AVAILABLE IN TEMP TABLE
			$data['temp_data'] = $this->Crud_model->fetch_userid_source_purchase('mp_temp_barcoder_purchase','pos',$user_name['id']);

			$this->load->view('purchase_template.php',$data);
		}
	}