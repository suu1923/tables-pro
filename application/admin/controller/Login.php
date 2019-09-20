<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/20
 * Time: 16:16
 */

namespace app\admin\controller;


use think\Controller;

class Login extends Controller
{

    public function index(){
        return $this->fetch("login");
    }

}