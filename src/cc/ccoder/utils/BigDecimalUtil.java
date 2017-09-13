package cc.ccoder.utils;

import java.math.BigDecimal;

/**
 * ��װbigDecimal���㷽��
 * @author chencong
 *
 */
public class BigDecimalUtil {

	private BigDecimalUtil() {
	}

	/**
	 * �ӷ����㣬����Ϊdouble
	 *
	 * @param v1
	 *            ����
	 * @param v2
	 *            ������
	 * @return ���� v1 + v2
	 */
	public static BigDecimal add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2);
	}

	/**
	 * �������㣬����double
	 *
	 * @param v1
	 *            ������
	 * @param v2
	 *            ����
	 * @return ���� v1 - v2
	 */
	public static BigDecimal sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2);
	}

	/**
	 * �˷�����,����double
	 *
	 * @param v1
	 *            ����
	 * @param v2
	 *            ������
	 * @return v1 * v2
	 */
	public static BigDecimal mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2);
	}

	/**
	 * ��������,����double
	 * <p>
	 * ��������ʱ���������룬������λС��
	 * </p>
	 *
	 * @param v1
	 *            ����
	 * @param v2
	 *            ������
	 * @return v1/v2
	 */
	public static BigDecimal div(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, 2, BigDecimal.ROUND_HALF_UP); // �������룬������λС��
	}
}