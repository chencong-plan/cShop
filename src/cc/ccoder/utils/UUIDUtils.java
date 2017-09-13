package cc.ccoder.utils;

import java.util.UUID;

public class UUIDUtils {


	/**
	 * 获得随机uuid字符串
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}

}
