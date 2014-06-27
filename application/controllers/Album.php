<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 *
 * @author wzx
 * @property CI_Loader $load
 * @property CI_Smarty $smarty
 */
class Album extends APP_Controller {
	public function __construct() {
		parent::__construct ();
	}
	public function add() {
		$this->smarty->view ( "album/add.tpl" );
	}
	public function index() {
		$ci = &  get_instance ();
		$cd = 2;
		$cd ++;
		$this->smarty->assign ( "names", array (
				"rtrt",
				"23" 
		) );
		$this->smarty->assign ( "re", $cd );
		$this->smarty->view ( "test/test.tpl" );
	}
}

?>