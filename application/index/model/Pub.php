<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/6/7
 * Time: 下午2:46
 */
namespace app\index\model;
use think\model;
class Pub extends Model{
    protected $name = 'blog_article';
    protected function getCreateTimeAttr($time){
        return date('Y年m月',$time);
    }
}