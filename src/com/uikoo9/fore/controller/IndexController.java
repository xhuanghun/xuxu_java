package com.uikoo9.fore.controller;

import com.jfinal.core.Controller;
import com.uikoo9.util.core.annotation.QControllerUrl;

/**
 * 用户中心-首页controller
 * @author uikoo9
 */
@QControllerUrl("/")
public class IndexController extends Controller{
	
	/**
	 * 跳转到首页 
	 */
	public void index(){
		render("/WEB-INF/view/fore/home/home-index.html");
	}
	
}
