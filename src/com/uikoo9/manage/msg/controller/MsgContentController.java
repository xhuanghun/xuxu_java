package com.uikoo9.manage.msg.controller;

import com.uikoo9.manage.msg.model.MsgContentModel;
import com.uikoo9.util.core.annotation.QControllerUrl;
import com.uikoo9.util.plugin.json.QJsonUtil;
import com.uikoo9.z.jfinal.QController;

/**
 * MsgContentController
 * @author qiaowenbin
 */
@QControllerUrl("/msg/content")
public class MsgContentController extends QController{
	
	/**
	 * 跳转到首页 
	 */
	public void index(){
		setAttr("qpage", list(MsgContentModel.class));
		render("/WEB-INF/view/manage/msg/msg-content-index.html");
	}
	
	/**
	 * 跳转到搜索页 
	 */
	public void search(){
		render("/WEB-INF/view/manage/msg/msg-content-search.html");
	}
	
	/**
	 * 跳转到保存修改页 
	 */
	public void savep(){
		setAttr("row", getRow(MsgContentModel.class));
		render("/WEB-INF/view/manage/msg/msg-content-input.html");
	}
	
	/**
	 * 保存或修改
	 */
	public void save(){
		String validate = validate();
		if(validate == null){
			renderJson(save(MsgContentModel.class));
		}else{
			renderJson(QJsonUtil.error(validate));
		}
	}
	
	/**
	 * 删除一条或多条
	 */
	public void del(){
		renderJson(del(MsgContentModel.class));
	}
	
}
