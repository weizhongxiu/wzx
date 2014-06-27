<?php
/**
 * 
 * @author wzx
 * @property CI_Loader $load
 * @property CI_Smarty $smarty
 * @property CI_Config $config
 *	
 */

class APP_Controller extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->database();
		$this->load->library("smarty");
		$this->smarty->assign("css_url",$this->config->config['css_url']);
		$this->smarty->assign("js_url",$this->config->config['js_url']);
		$this->smarty->assign("img_url",$this->config->config['img_url']);
	}
}

?>