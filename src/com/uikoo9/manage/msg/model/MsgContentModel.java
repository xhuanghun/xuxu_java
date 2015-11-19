package com.uikoo9.manage.msg.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.uikoo9.util.core.annotation.QTable;
import com.uikoo9.util.core.data.QStringUtil;

/**
 * MsgContentModel<br>
 * id	id<br>
 * msg_content_type	消息类型<br>
 * msg_content_txt	消息文本内容<br>
 * msg_content_media	消息多媒体内容<br>
 * msg_content_del	消息撤回标志<br>
 * cdate	创建时间<br>
 * cuser_id	创建人id<br>
 * cuser_name	创建人姓名<br>
 * @author qiaowenbin
 */
@QTable("t_msg_content")
@SuppressWarnings("serial")
public class MsgContentModel extends Model<MsgContentModel>{
	
	public static final MsgContentModel dao = new MsgContentModel();
	
	/**
	 * find all
	 * @return
	 */
	public List<MsgContentModel> findAll(){
		return findAll(null);
	}
	
	/**
	 * find all by order
	 * @param order
	 * @return
	 */
	public List<MsgContentModel> findAll(String order){
		StringBuilder sb = new StringBuilder("select * from t_msg_content ");
		if(QStringUtil.isEmpty(order)){
			return dao.find(sb.append("order by id desc").toString());
		}else{
			return dao.find(sb.append(order).toString());
		}
	}
	
}
