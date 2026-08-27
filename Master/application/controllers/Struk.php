<?php
/*

*/
defined('BASEPATH') OR exit('No direct script access allowed');
class Struk extends CI_Controller
{

  public function index()
	{
		// DEFINES PAGE TITLE
		$data['title'] = 'Struk Baru';

		// DEFINES WHICH PAGE TO RENDER
		$data['main_view'] = 'struk';

		
		// DEFINES GO TO MAIN FOLDER FOND INDEX.PHP  AND PASS THE ARRAY OF DATA TO THIS PAGE
		$this->load->view('main/index.php', $data);
	}


}