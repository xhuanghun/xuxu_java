package com.uikoo9.manage.msg.controller;

import com.uikoo9.manage.msg.model.MsgContactModel;
import com.uikoo9.util.core.annotation.QControllerUrl;
import com.uikoo9.util.plugin.json.QJsonUtil;
import com.uikoo9.z.jfinal.QController;

/**
 * MsgContactController
 * @author qiaowenbin
 */
@QControllerUrl("/msg/contact")
public class MsgContactController extends QController{
	
	/**
	 * 跳转到首页 
	 */
	public void index(){
		setAttr("qpage", list(MsgContactModel.class));
		render("/WEB-INF/view/manage/msg/msg-contact-index.html");
	}
	
	/**
	 * 跳转到搜索页 
	 */
	public void search(){
		render("/WEB-INF/view/manage/msg/msg-contact-search.html");
	}
	
	/**
	 * 跳转到保存修改页 
	 */
	public void savep(){
		setAttr("row", getRow(MsgContactModel.class));
		render("/WEB-INF/view/manage/msg/msg-contact-input.html");
	}
	
	/**
	 * 保存或修改
	 */
	public void save(){
		String validate = validate();
		if(validate == null){
			renderJson(save(MsgContactModel.class));
		}else{
			renderJson(QJsonUtil.error(validate));
		}
	}
	
	/**
	 * 删除一条或多条
	 */
	public void del(){
		renderJson(del(MsgContactModel.class));
	}
	
}
