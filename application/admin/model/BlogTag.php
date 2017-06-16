<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/24
 * Time: 下午2:51
 */

namespace app\admin\model;
use think\Model;

class BlogTag extends Model
{
    protected $name = 'blog_tag';
    protected $autoWriteTimestamp = true;
}