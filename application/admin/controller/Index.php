<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/19
 * Time: 上午11:34
 */
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Session;

class Index extends Base{
    public function index(){
        $server = Request::instance()->server();

        return $this->fetch();
    }
}