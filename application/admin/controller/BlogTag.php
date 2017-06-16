<?php
/**
 * Created by PhpStorm.
 * User: it
 * Date: 2017/5/24
 * Time: 上午11:55
 */

namespace app\admin\controller;
use app\admin\model\BlogTag as blogModel;
use app\admin\model\BlogArticle as articleModel;
use app\admin\model\BlogArticleImg as imgModel;
use think\Request;
use think\Session;
use think\Db;
class BlogTag extends Base
{
    public function index(){
        $tag = blogModel::all();
        $count = count($tag);
        $this->assign('count',$count);
        $this->assign("tag",$tag);
        return $this->fetch();
    }
    public function add(){
        $tag = input("param.tag");
        $result = new blogModel;
        $result['name'] = $tag;
        if($result->save()){
            $this->success("success",'admin/blog_tag/index');
        }else{
            $this->error("fail");
        }
    }
    public function insert(){
        $param = $this->request->param();
        $res = blogModel::get($param['id']);
        $res['name'] = $param['val'];
        if($res->save()){
            $this->success("success",'',$param['val']);
        }else{
            $this->error("fail");
        }
    }
    public function delete(){
        $id = input("post.id");
        $res = blogModel::destroy($id);
        if($res){
            $this->success("success");
        }else{
            $this->error("fail");
        }
    }

    public function delete_all(){
        $id = input("post.id");
        $res = blogModel::destroy($id);
        if($res){
            $this->success("批量删除成功！");
        }else{
            $this->error("fail");
        }
    }

    public function blog_write(){
        $blog = blogModel::all();
        $this->assign("tags",$blog);
        return $this->fetch();
    }
    public function img_add(){
        $file = request()->file('files');
        $info = $file->move(ROOT_PATH.'public'.DS.'uploads');
        if($info){
            $db = new imgModel;
            $db['src'] = $info->getSaveName();
            if($db->save()){
                $this->success('success','',$db['id']);
            }else{
                $this->error('保存图片失败');
            }
        }else{
            $this->error('上传失败！');
        }
    }
    public function write_add(){
        $param = input('post.');
        $blog = new articleModel();
        $blog['title'] = $param['title'];
        $blog['tag_id'] = $param["_tag"];
        $blog['content'] = $param['ueditor'];
        $blog['is_secrecy'] = $param['_secrecy'];
        $blog['img_id'] = $param['imgid'];
        $blog['blog_desc'] = $param['desc'];
        $blog['create_user'] = Session::get("user_name");
//        exit;
        if($blog->save()){
            $this->success("success",'admin/blog_tag/blog_info');
        }else{
            $this->error("fail");
        }
    }
    public function blog_info(){
        $res = Db::table("cgj_blog_article")->alias("a")->join("cgj_blog_tag b","a.tag_id=b.id")->field('a.id,title,is_secrecy,create_user,a.create_time,b.name')->select();
        $num = count($res);
        $this->assign("count",$num);
        $this->assign("blog",$res);
        return $this->fetch();
    }
    public function blog_infopage(){
        $id = $this->request->param('id');
        $blog = Db::name('blog_article')->where('id',$id)->field('id,title,content')->find();
        $this->assign('result',$blog);
        return $this->fetch();
    }
    public function info_update(){
        $id = input("post.id");
        $result = articleModel::get($id);
        if($result['is_secrecy']=='是'){
            $result['is_secrecy']='否';
            if($result->save()){
               $this->success('success');
            }else{
                $this->error('fail');
            }
        }else{
            $result['is_secrecy']='是';
            if($result->save()){
                $this->success('success');
            }else{
                $this->error('fail');
            }
        }
    }
    public function info_del(){
        $id = input("post.id");
        $res = articleModel::destroy($id);
        if($res){
            $this->success('success');
        }else{
            $this->error('fail');
        }
    }
    public function blog_delete_all(){
        $id = input("post.id");
        $res = articleModel::destroy($id);
        if($res){
            $this->success('批量删除成功！');
        }else{
            $this->error('fail');
        }
    }

    public function blog_insert(){
        $id = input("get.id");
        $blog= new articleModel;
        $res = $blog->where('id',$id)->field('id,title,content,create_user,is_secrecy,img_id,blog_desc')->find();
        $tag = blogModel::all();
        $this->assign('tag',$tag);
        $this->assign('result',$res);
        return $this->fetch();
    }
    public function confirmUpload(){
        $param = $this->request->param();
        $old_data = articleModel::get($param['id']);
//        $a = $old_data->imgs()->where('id',$param['imgid'])->field('id,src')->find();
        if($old_data['img_id'] == $param['imgid']){
            $old_data['title'] = $param['title'];
            $old_data['content'] = $param['ueditor'];
            $old_data['is_secrecy'] = $param['_secrecy'];
            $old_data['tag_id'] = $param['_tag'];
            $old_data['blog_desc'] = $param['desc'];
            $old_data['create_user'] = Session::get('user_name');
            if($old_data->save()){
                $this->success('success','admin/blog_tag/blog_info');
            }else{
                $this->error('fail');
            }
        }else {
            $res = $old_data->imgs()->where('id',$old_data['img_id'])->delete();
            if($res){
                $old_data['title'] = $param['title'];
                $old_data['content'] = $param['ueditor'];
                $old_data['is_secrecy'] = $param['_secrecy'];
                $old_data['tag_id'] = $param['_tag'];
                $old_data['img_id'] = $param['imgid'];
                $old_data['blog_desc'] = $param['desc'];
                $old_data['create_user'] = Session::get('user_name');
                if ($old_data->save()) {
                    $this->success('success', 'admin/blog_tag/blog_info');
                } else {
                    $this->error('fail');
                }
            }else{
                $this->error('提交失败！图片的id值为空');
            }
        }
    }
}












//
//public function write_add(){
//    $param = $this->request->param();
//    $blog = new articleModel();
//    $blog['title'] = $param['title'];
//    $blog['tag_id'] = $param["_tag"];
//    $blog['content'] = $param['ueditor'];
//    $blog['is_secrecy'] = $param['_secrecy'];
//    $blog['create_user'] = Session::get("user_name");
//    if($blog->save()){
//        $this->success("success",'admin/blog_tag/blog_info');
//    }else{
//        $this->error("fail");
//    }
//}











