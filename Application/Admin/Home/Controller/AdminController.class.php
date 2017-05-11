<?php
namespace Home\Controller;
use Think\Controller;
class AdminController extends CommonController {
    public function lst(){
        $admin=D('admin');
        $count=$admin->count();
        $Page=new\Think\Page($count,1);
        $show=$Page->show();
        $list=$admin->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);
        $this->assign('page',$show);
        $this->display();
    }

    public function add(){
        $admin=D('admin');
        if (IS_POST) {
            $data['username']=I('username');
            $data['password']=md5(I('password'));
           if ($admin->create($data)) {
               if ($admin->add()) {
                   $this->success("添加管理员成功！",U('lst'));
               }else{
                    $this->error("添加管理员失败！");
               }
           }else{
                $this->error($admin->getError());
           }
            return;
        }
    	 $this->display();
    }
    public function edit(){
        $admin=D('admin');  
        if (IS_POST) {
            $date['id']=I('id');
            $date['username']=I('username');
            $admins=$admin->find($date['id']);
            $password=$admins['password'];
            if(I('password')){
                $date['password']=md5(I('password'));
            }else{
                $date['password']=$password;
            }
            if ($admin->create($date)) {
                if ($admin->save()) {
                    $this->success('修改管理员成功',U('lst'));
                }else{
                    $this->error("修改管理员失败");
                }
            }else{
            $this->error($admin->getError());
            }
            return;
        }
         $adminr=$admin->find(I('id'));
         $this->assign('adminr',$adminr);
    	 $this->display();
    }

    public function del(){
    	$admin = D('admin');
        $id=I('id');
        if($id==1){
            $this->error('本管理员不可删除！');
        }else{
            if ($admin->delete(I('id'))) {
            $this->success("删除管理员成功！",U('lst'));
        }else{
            $this->error("删除管理员失败！");
            }
         }
        }
       
    public function loginout(){
        session(null);
        $this->success('退出成功...',U('Login/index'));
    }
}