<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/22
 * Time: 下午3:51
 */

namespace app\admin\model;
use think\Model;

class AdminUser extends Model
{
    protected $name = 'admin_user';
    protected $autoWriteTimestamp = true;
    protected function setPasswordAttr($val){
        return md5($val);
    }
    protected  function getRealnameAttr($role){
        if($role==1){
            return $role='游客';
        }else{
            return $role='超级管理员';
        }
    }
}