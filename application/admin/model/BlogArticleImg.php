<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/6/5
 * Time: 下午3:47
 */

namespace app\admin\model;
use think\Model;

class BlogArticleImg extends Model
{
    protected $name = 'blog_article_img';
    protected $autoWriteTimestamp = true;
    public function img(){
        return $this->belongsTo('BlogArticle','img_id','id');
    }
}