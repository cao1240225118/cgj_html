<?php
namespace app\index\controller;
use app\admin\model\BlogTag as taginfoModel;
use app\index\model\Pub as articleIndex;
use think\Db;

class Index extends Pub
{
    public function index()
    {
        $res = Db::table("cgj_blog_article")->alias("a")->join("cgj_blog_article_img b","a.img_id=b.id")->field("a.id,title,a.create_time,blog_desc,b.src")->select();
        $this->assign('res',$res);
        return $this->fetch();
    }
    public function blog_info(){
        $id = input('get.id');
        $blog = new  articleIndex;
        $res = $blog->where('id',$id)->find();
        $this->assign('data',$res);
        return $this->fetch();
    }

    public function tag(){
        $name = $this->request->param('name');
        $time = $this->request->param('time');
        $data = new articleIndex;
        if($name){
            $ids = $data -> where('id',$name)->find();
            $res = Db::table("cgj_blog_article")
                ->where('tag_id',$ids['id'])
                ->alias('a')
                ->join('cgj_blog_article_img b','a.img_id = b.id')
                ->field("a.id,title,a.create_time,blog_desc,b.src")
                ->select();
            $this->assign('res',$res);
        }else if($time){
            $data = Db::query("SELECT a.id,title,a.create_time,blog_desc,b.src FROM cgj_blog_article a INNER JOIN cgj_blog_article_img b ON a.img_id= b.id WHERE FROM_UNIXTIME(a.create_time,'%Y%m')=$time");
            $this->assign('res',$data);
        }else{
            $this->redirect('/cgj_html/public/404.html',404);
        }
        return $this->fetch();
    }
    public function search(){
        $res = input('post.search');
        $title['a.title'] = ['like','%'.$res.'%'];
        $title['a.blog_desc'] = ['like','%'.$res.'%'];
        $title['a.content'] = ['like','%'.$res.'%'];
        $data =  Db::table("cgj_blog_article")
            ->alias('a')
            ->whereOr($title)
            ->join('cgj_blog_article_img b','a.img_id = b.id')
            ->field("a.id,title,a.create_time,blog_desc,b.src")
            ->select();
        if($data){
            $this->assign('res',$data);
        }else{
            $this->assign('res',0);//当没有接受数据的时候，返回数据0；
        }
        return $this->fetch();
    }
}
