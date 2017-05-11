<?php
namespace Home\Controller;
use Think\Controller;
class LinkController extends CommonController {
    public function lst(){
        $link=D('link');
        $count=$link->count();
        $Page=new\Think\Page($count,3);
        $show=$Page->show();
        $list=$link->order('sort desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);
        $this->assign('page',$show);
        $this->display();
    }
    public function add(){
        $link=D('link');
        if (IS_POST) {
            $data['title']=I('title');
            $data['url']=I('url');
            $data['desc']=I('desc');
           if ($link->create($data)) {
               if ($link->add()) {
                   $this->success("添加链接成功！",U('lst'));
               }else{
                    $this->error("添加链接失败！");
               }
           }else{
                $this->error($link->getError());
           }
            return;
        }
    	 $this->display();
    }
    public function edit(){
        $link=D('link');
        $linkr=$link->find(I('id'));
        $this->assign('linkr',$linkr);
        if (IS_POST) {
            $date['id']=I('id');
            $date['title']=I('title');
            $date['url']=I('url');
            $date['desc']=I('desc');
            if ($link->create($date)) {
                if ($link->save()) {
                    $this->success('修改链接成功',U('lst'));
                }else{
                    $this->error("修改链接失败");
                }
            }else{
            $this->error($link->getError());
            }
            return;
        }
    	 $this->display();
    }
    public function del(){
    	$link = D('link');
        if ($link->delete(I('id'))) {
            $this->success("删除链接成功！",U('lst'));
        }else{
            $this->error("删除链接失败！");
        }
    }
    public function sort(){
        $link=D('link');
        foreach ($_POST as $id => $sort) {
            $link->where(array('id'=>$id))->setField('sort',$sort);
        }
        $this->success("排序成功！",U('lst'));
    }
}