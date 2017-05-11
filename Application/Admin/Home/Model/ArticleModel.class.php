<?php
namespace Home\Model;
use Think\Model;
class ArticleModel extends Model {
      protected $_validate = array(
      array('title','require','文章标题不能为空！',1,'regex',3),
      array('cateid','require','文章栏目不能为空！',1,'regex',3),
      array('content','require','文章内容不能为空！',1,'regex',3),
     
   );
}