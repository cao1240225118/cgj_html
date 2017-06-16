<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/22
 * Time: 下午2:41
 */

namespace app\admin\controller;
use think\Controller;
use app\admin\model\AdminUser as AdminUserModel;
use think\Session;

class AdminUser extends Base{
    public function index(){
        $user = AdminUserModel::all();
        $num = count($user);
        $this->assign('count',$num);
        $this->assign('admin',$user);
        return $this->fetch();
    }



    public function admin_user_add(){
        return $this-> fetch();
    }
    public function admin_user_insert(){
        $id = input('param.id');
        $user = AdminUserModel::get($id);
        $this->assign('info',$user);
        return $this-> fetch();
    }
    public function insert(){
        $param = request()->param();
        $id= $param['id'];
        $res = AdminUserModel::get($id);
        $res['account'] = $param['adminName'];
        $res['realname'] = $param['adminRole'];
        $res['password'] = $param['password'];
        $res['status'] = $param['status'];
        $res['last_login_time'] = $this->request->time();
        $res['last_login_ip'] = $this->request->server('REMOTE_ADDR');
        if($res->save()){
            $this->success("success",'admin/AdminUser/index');
        }else{
            $this->error('管理添加失败');
        }
    }
    public function add(){
        $user = new AdminUserModel;
        $param = request()->param();
        $user['account'] = $param['adminName'];
        $user['realname'] = $param['adminRole'];
        $user['password'] = $param['password'];
        $user['status'] = $param['status'];
        $user['last_login_time'] = $this->request->time();
        $user['last_login_ip'] = $this->request->server('REMOTE_ADDR');
        if($user->save()){
            $this->success("success",'admin/AdminUser/index');
        }else{
            $this->error('管理添加失败');
        }
    }
    public function update(){
        $user = new AdminUserModel;
        $param = request()->param();
        $res = $user -> where('id',$param['id'])->find();
        if($res['status'] == '1'){
            $res['status'] = 0;
            if($res->save()){
                $this->success('success','','0');
            }else{
                $this->error("fail");
            }
        }else if($res['status'] == '0'){
            $res['status'] = 1;
            if($res->save()){
                $this->success('success','','1');
            }else{
                $this->error("fail");
            }
        }

    }
    public function delete(){
        $param = request()->param();
        $id= $param['id'];
        $res = AdminUserModel::get($id);
        if($res->delete()){
            $this->success("success");
        }else{
            $this->error('false');
        }
    }
    public function delete_all(){
        $param = request()->param('id');
        $res = AdminUserModel::destroy($param);
        if($res){
            $this->success("批量删除成功！");
        }else{
            $this->error('false');
        }
    }

}