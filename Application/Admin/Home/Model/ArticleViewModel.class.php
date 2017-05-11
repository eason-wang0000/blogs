<?php
namespace Home\Model;
use Think\Model\ViewModel;
class ArticleViewModel extends ViewModel {
      public $viewFields = array(
      	'Article'=>array('id','title','cateid','_type'=>'LEFT','pic'),
      	'Cate'=>array('catename','_on'=>'Article.cateid=Cate.id'),
    );
}