package cc.ccoder.utils;

import java.math.BigDecimal;

/**
 * 封装bigDecimal计算方法
 * @author chencong
 *
 */
public class BigDecimalUtil {

	private BigDecimalUtil() {
	}

	/**
	 * 加法运算，参数为double
	 *
	 * @param v1
	 *            加数
	 * @param v2
	 *            被加数
	 * @return 返回 v1 + v2
	 */
	public static BigDecimal add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2);
	}

	/**
	 * 减法运算，参数double
	 *
	 * @param v1
	 *            被减数
	 * @param v2
	 *            减数
	 * @return 返回 v1 - v2
	 */
	public static BigDecimal sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2);
	}

	/**
	 * 乘法运算,参数double
	 *
	 * @param v1
	 *            乘数
	 * @param v2
	 *            被乘数
	 * @return v1 * v2
	 */
	public static BigDecimal mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2);
	}

	/**
	 * 除法运算,参数double
	 * <p>
	 * 除不尽的时候四舍五入，保留两位小数
	 * </p>
	 *
	 * @param v1
	 *            除数
	 * @param v2
	 *            被除数
	 * @return v1/v2
	 */
	public static BigDecimal div(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, 2, BigDecimal.ROUND_HALF_UP); // 四舍五入，保留两位小数
	}
}