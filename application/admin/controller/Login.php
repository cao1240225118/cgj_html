<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/23
 * Time: 下午5:13
 */

namespace app\admin\controller;
use app\admin\model\AdminUser as AdminUserModel;
use think\Session;
use think\Controller;

class Login extends Controller
{
    public function index(){
        return $this->fetch();
    }
    public function check(){
        $param = request()->param();
        if(captcha_check($param['captcha'])){
            $user = new AdminUserModel;
            $admin = $param['account'];
            $pwd = md5($param['password']);
            $res = $user -> where(['account'=>$admin,'password'=>$pwd])->find();
            //更新登录的ip地址
            $res['last_login_time'] = $this->request->time();
            $res['last_login_ip'] = $this->request->server('REMOTE_ADDR');
            if($res && $res->save()){
                //生成session信息
                Session::set("last_login_time",$this->request->time());
                Session::set("last_login_ip",$this->request->server('REMOTE_ADDR'));
                Session::set("user_name",$admin);
                Session::set("real_name",$res['realname']);
                $this->success('success','admin/index/index');
            }else{
                $this->error('fail');
            }
        }else{
            $this->error("验证码错误");
        }
    }
}