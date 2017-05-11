<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function index(){
    	$article=D('article');
    	$count=$article->count();
    	$Page=new \Think\Page($count,4);
    	$show=$Page->show();
    	$list=$article->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
    	$this->assign('list',$list);
    	$this->assign('Page',$show);
        $this->display();
    }
}