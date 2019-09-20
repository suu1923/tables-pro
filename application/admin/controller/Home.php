<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/20
 * Time: 14:12
 */

namespace app\admin\controller;

use think\Controller;

class Home extends Controller
{

    public function index(){
        return $this->fetch("index");
    }

}