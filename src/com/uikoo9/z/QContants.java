package com.uikoo9.z;

/**
 * 常量
 * @author uikoo9
 */
public class QContants {
	
	// 是，否
	public static final String YESNO_YES		= "000101";
	public static final String YESNO_NO			= "000102";
	public static final String[] YESNO			= new String[]{YESNO_YES,YESNO_NO};
	
	// 用户类型
	public static final String USER_TYPE_ADMIN		= "010101";
	public static final String USER_TYPE_PRIVATE	= "010102";
	public static final String[] USER_TYPE 			= new String[]{USER_TYPE_ADMIN,USER_TYPE_PRIVATE};

	// 消息内容类型
	public static final String MSG_CONTENT_TYPE_TXT		= "020101";
	public static final String MSG_CONTENT_TYPE_MEDIA	= "020102";
	public static final String[] MSG_CONTENT_TYPE 		= new String[]{MSG_CONTENT_TYPE_TXT,MSG_CONTENT_TYPE_MEDIA};
	
}
