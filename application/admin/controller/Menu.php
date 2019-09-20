<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/19
 * Time: 16:19
 */
namespace app\admin\controller;

use think\Controller;

class Menu extends Controller
{

    public function index(){

        return $this->fetch("home/homepage1");

    }
}
