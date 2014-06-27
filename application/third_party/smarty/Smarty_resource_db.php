<?php
defined('BASEPATH') || exit('No direct script access allowed');
/**
 * Description of Smarty_resource_db
 *
 */

require_once( APPPATH . 'third_party/smarty/sysplugins/smarty_resource_custom.php' );
class Smarty_resource_db extends Smarty_Resource_Custom {
    
    private static $_templateinfo=array();
    /**
     * 初始化模板内容
     * @param string $tpl_name  模板名称
     */
    private static function _init($tpl_name) {
        if(!isset(self::$_templateinfo[$tpl_name])){
            $CI = & get_instance();//获取CI的操作句柄
            if(!isset($CI->template_model)){
                $CI->load->model('template_model');
            }
            //获取模板的内容与最后修改时间
            self::$_templateinfo[$tpl_name]=$CI->template_model->get(array('temp_filename'=>$tpl_name),'temp_content,uptime');
        }
    }
    
    /**
     * 初始化模板内容与最后修改时间
     * @param string $tpl_name  模板名称
     * @param string $source    模板内容
     * @param integer $mtime    模板最后修改时间
     */
    function fetch($tpl_name, &$source, &$mtime) {
        self::_init($tpl_name);
        if(isset(self::$_templateinfo[$tpl_name]['temp_content'])){
            $source = self::$_templateinfo[$tpl_name]['temp_content'];
            $mtime = self::$_templateinfo[$tpl_name]['uptime'];
        }else{
            $source=null;
            $mtime=null;
        }
    }
    
    /**
     * 初始化模板的最后修改时间
     * @param string $tpl_name  模板名称
     * @return null || integer
     */
    function fetchTimestamp($tpl_name) {
        self::_init($tpl_name);
        if(isset(self::$_templateinfo[$tpl_name]['uptime'])){
            return self::$_templateinfo[$tpl_name]['uptime'];
        }else{
            return null;
        }
    }
}
