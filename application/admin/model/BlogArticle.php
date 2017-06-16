<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/25
 * Time: 下午3:15
 */

namespace app\admin\model;
use think\Model;

class BlogArticle extends Model
{
    protected $name = 'blog_article';
    protected $autoWriteTimestamp = true;
    protected function blog(){
        return $this->belongsTo("BlogTag","tag_id","id");
    }
    protected function getCreateTimeAttr($time){
        return date("Y-m-d H:i:s",$time);
    }
    public function imgs(){
        return $this->belongsTo('BlogArticleImg','img_id','id');
    }
}