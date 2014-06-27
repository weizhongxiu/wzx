<?php
defined('BASEPATH') || exit('No direct script access allowed');

/**
 * Smarty Class
 */
require_once( APPPATH . 'third_party/smarty/Smarty.class.php' );

class CI_Smarty extends Smarty {
    
    private static $_hand=null; //自定义模板的操作句柄
    
    function __construct() {
        parent::__construct();
        $this->setTemplateDir(APPPATH . DIRECTORY_SEPARATOR . 'views' . DIRECTORY_SEPARATOR . 'templates'); //模版文件夹位置
        $this->setCompileDir(APPPATH . DIRECTORY_SEPARATOR . 'views' . DIRECTORY_SEPARATOR . 'templates_c'); //编译后的文件放哪
        $this->setCacheDir(APPPATH . DIRECTORY_SEPARATOR . 'cache');//设置模板缓存目录
        $this->left_delimiter = '<{'; //变量的左分隔符
        $this->right_delimiter = '}>'; //变量的右分隔符
        $this->debugging=true;
        $this->cache_lifetime=3600;
        log_message('debug', "Smarty Class Initialized");
    }
    
    /**
     * 初始化自定义模板内容句柄
     * @param string $type  模板类型
     */
    private static function _initHand($type){
        if(!isset(self::$_hand[$type]) && $type==='db'){
            require_once( APPPATH . 'third_party/smarty/Smarty_resource_db.php' );
            self::$_hand[$type]=new Smarty_resource_db();
        }
    }
    
    
    /**
     * 显示一个模板或者返回一个模板的内容
     * @param string $template          唯一的模板文件路径
     * @param array $data               模板用的变量，key=>value模式
     * @param string $template_type     模板内容类型，file：文件；db：数据库
     * @param boolrean $return          是否返回内容，内容返回时不输出
     * @return mixed
     */
    function view($template, $data = array(), $template_type='file', $return = FALSE) {
        $CI = & get_instance();//获取CI的操作句柄
        
        if($data && is_array($data)){//变量注册到smarty模板
            foreach ($data as $key => $value) {
                $this->assign($key, $value);
            }
        }
        switch ($template_type) {
            case 'db':
                //$this->registerResource('db', array('db_get_template','db_get_timestamp','db_get_secure','db_get_trusted'));
                self::_initHand('db');
                $this->registerResource('db', self::$_hand['db']);
                $template='db:'.$template;
                break;
        }
        
        if ($return === \FALSE) {
            if (method_exists($CI->output, 'set_output')) {
                $CI->output->set_output($this->fetch($template));
            } else {
                $CI->output->final_output = $this->fetch($template);
            }
            return;
        } else {
            return $this->fetch($template);
        }
    }

}