<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/23
 * Time: 下午2:12
 */

namespace app\admin\controller;

use think\Controller;
use think\Session;

class Base extends Controller
{
    //_initialize全局变量，检查是否登录
    public function _initialize()
    {
        parent::_initialize(); //
        ////判断是否登录
        if(!Session::has("user_name")){
            $this->error("你还没有登录，请先登录",'admin/login/index',"","2");
        }else{
            $ip = Session::get('last_login_ip');
            $time = Session::get('last_login_time');
            $user = Session::get('user_name');
            $realname = Session::get('real_name');
            $this->assign('ip',$ip);
            $this->assign('time',date('Y-m-d H:i:s',$time));
            $this->assign('username',$user);
            $this->assign('realname',$realname);
        }
    }
    //退出登录
    public function delSession(){
        Session::clear();
        if(!Session::has("user_name")){
            $this->success('退出登录成功','admin/login/index');
        }
    }
}