<?php
namespace Home\Controller;
use Think\Controller;
class LoginController extends Controller {
    /*public function index(){      
        $this->display('login');
    }

    public function login(){
        $admin=D('admin');
        $info['username']=I('post.username');
        $info['password']=I('post.password');
        $admin->create($_POST,4);
        $data=$admin->where("username='$info[username]'")->find();
        if(md5($info['password'])==$data['password']){
           $admin->where("username='$info[username]'")->save();
           $this->success('登陆成功！',U('Index/index'));
        }else{
          $this->error($admin->getError());
        }

    }*/

   /* public function verify(){
        $Verify =     new \Think\Verify();
        $Verify->fontSize = 60;
        $Verify->length   = 4;
        $Verify->useNoise = false;
        $Verify->entry();
    }*/
    public function index(){
        $admin=D('admin');
        if(IS_POST){

            if($admin->create($_POST,4)){

                if ($admin->login()) {
                    $this->success('登陆成功！',U('Index/index'));
                }else{
                    $this->error('您的用户名或密码错误！');
                }
            }
            else{
                $this->error($admin->getError());
            }
            return;
        }
        //判断重复登录
        if(session('id')){
            $this->error('你已经登陆过了！',U('Index/index'));
        }else{
             $this->display('login');
        }
    }

    public function verify(){
        $Verify= new \Think\Verify();
        $Verify->fontsize= 60;
        $Verify->length = 4;
        $Verify->useNoise = false;
        $Verify->entry();
    }
}