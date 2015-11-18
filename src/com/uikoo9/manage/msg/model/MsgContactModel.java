package com.uikoo9.manage.msg.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.uikoo9.util.core.annotation.QTable;
import com.uikoo9.util.core.data.QStringUtil;

/**
 * MsgContactModel<br>
 * id	id<br>
 * msg_contact_to	接收者id<br>
 * msg_contact_uname	接收者姓名<br>
 * msg_contact_cid	消息内容id<br>
 * cdate	创建时间<br>
 * cuser_id	创建人id<br>
 * cuser_name	创建人姓名<br>
 * @author qiaowenbin
 */
@QTable("t_msg_contact")
@SuppressWarnings("serial")
public class MsgContactModel extends Model<MsgContactModel>{
	
	public static final MsgContactModel dao = new MsgContactModel();
	
	/**
	 * find all
	 * @return
	 */
	public List<MsgContactModel> findAll(){
		return findAll(null);
	}
	
	/**
	 * find all by order
	 * @param order
	 * @return
	 */
	public List<MsgContactModel> findAll(String order){
		StringBuilder sb = new StringBuilder("select * from t_msg_contact ");
		if(QStringUtil.isEmpty(order)){
			return dao.find(sb.append("order by id desc").toString());
		}else{
			return dao.find(sb.append(order).toString());
		}
	}
	
}
