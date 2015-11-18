package com.uikoo9.z.my;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.uikoo9.util.plugin.json.QJsonUtil;

/**
 * 自定义拦截器，区别于jar中的QInterceptor
 * @author qiaowenbin
 */
public class MyInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation ai) {
		String res = checkAuth(ai);
		if (res == null){
			ai.invoke();
		}else{
			ai.getController().renderJson(QJsonUtil.error(res));
		}
	}

	private String checkAuth(Invocation ai) {
		String url = ai.getActionKey();

		if ((url.contains("other/menu/del")) || (url.endsWith("other/menu/save"))) {
			return "禁止操作菜单，需要体验可以下载jfinalQ源码！";
		}

		return null;
	}
	
}
