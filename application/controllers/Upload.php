<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 *
 * @author wzx
 * @property CI_Loader $load
 * @property CI_Smarty $smarty
 * @property CI_Input $input
*/
class Upload extends APP_Controller {
	
	private $error = array();
	private $form_name = 'Filedata';
	private $save_path;
	public function __construct(){
		parent::__construct();
	}
	public function save(){
		//mkdir
		$this->getSavePath();
		//check file
		if($this->check()){
			$filename = $this->getFileName();
			if(is_file($filename)){
				@move_uploaded_file($_FILES[$this->form_name]['tmp_name'],$filename);
			}
			echo json_encode(array("url"=>$filename));
			exit;
		}
		//file name
		//save file
		//save file info 
	}
	private function getSavePath(){
		$this->save_path = FILE_PATH;
		if(is_dir($this->save_path )){
			return true;
		}
		@mkdir($this->save_path,0777);
		if(is_dir($this->save_path )){
			return true;
		}
		return false;
	}
	private function check(){
		return true;
	}
	private function getFileName(){
		$file_ext = pathinfo($_FILES[$this->form_name]['name'], PATHINFO_EXTENSION);
		return $this->save_path.sha1(file_get_contents($_FILES[$this->form_name]['tmp_name'])). "." .$file_ext;
	}
	
	
}