package com.hrms.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;

public class EncryptUtil {

	/************************************** base64加密解密 **************************************/

	private static final char[] SIXTY_FOUR_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
			.toCharArray();
	private static final int[] REVERSE_MAPPING = new int[123];

	static {
		for (int i = 0; i < SIXTY_FOUR_CHARS.length; i++)
			REVERSE_MAPPING[SIXTY_FOUR_CHARS[i]] = i + 1;
	}

	/**
	 * 使用base64对字节数组进行加密，加密成一个字符串
	 * 
	 * @param input
	 *            待加密的字节数组
	 * @return 加密后的字符串
	 */
	public static String encryptByteBYBase64(byte[] input) {
		StringBuffer result = new StringBuffer();
		int outputCharCount = 0;
		for (int i = 0; i < input.length; i += 3) {
			int remaining = Math.min(3, input.length - i);
			int oneBigNumber = (input[i] & 0xff) << 16
					| (remaining <= 1 ? 0 : input[i + 1] & 0xff) << 8
					| (remaining <= 2 ? 0 : input[i + 2] & 0xff);
			for (int j = 0; j < 4; j++)
				result
						.append(remaining + 1 > j ? SIXTY_FOUR_CHARS[0x3f & oneBigNumber >> 6 * (3 - j)]
								: '=');
			if ((outputCharCount += 4) % 76 == 0)
				result.append('\n');
		}
		return result.toString();
	}

	/**
	 * 用base64对字符串进行加密，解密成一个字节数组
	 * 
	 * @param input
	 *            待解密的字符串
	 * @return 解密后的字节数组
	 */
	public static byte[] dencryptStringBYBase64(String input) {
		try {
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			StringReader in = new StringReader(input);
			for (int i = 0; i < input.length(); i += 4) {
				int a[] = { mapCharToInt(in), mapCharToInt(in),
						mapCharToInt(in), mapCharToInt(in) };
				int oneBigNumber = (a[0] & 0x3f) << 18 | (a[1] & 0x3f) << 12
						| (a[2] & 0x3f) << 6 | (a[3] & 0x3f);
				for (int j = 0; j < 3; j++)
					if (a[j + 1] >= 0)
						out.write(0xff & oneBigNumber >> 8 * (2 - j));
			}
			return out.toByteArray();
		} catch (IOException e) {
			throw new Error(e + ": " + e.getMessage());
		}
	}

	private static int mapCharToInt(Reader input) throws IOException {
		int c;
		while ((c = input.read()) != -1) {
			int result = REVERSE_MAPPING[c];
			if (result != 0)
				return result - 1;
			if (c == '=')
				return -1;
		}
		return -1;
	}

	/*************************************** MD5加密 ***************************************/

	/**
	 * 使用MD5算法对字符串进行加密
	 * 
	 * @param target
	 *            要进行加密的字符串
	 * @return 加密后的字符串
	 */
	public static String encryptStringByMD5(String target) {
		byte[] source = target.getBytes();
		String s = null;
		// 用来将字节转换成 16 进制表示的字符
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		try {
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");
			md.update(source);
			byte tmp[] = md.digest(); // MD5 的计算结果是一个 128 位的长整数，
			// 用字节表示就是 16 个字节
			char str[] = new char[16 * 2]; // 每个字节用 16 进制表示的话，使用两个字符，
			// 所以表示成 16 进制需要 32 个字符
			int k = 0; // 表示转换结果中对应的字符位置
			for (int i = 0; i < 16; i++) { // 从第一个字节开始，对 MD5 的每一个字节
				// 转换成 16 进制字符的转换
				byte byte0 = tmp[i]; // 取第 i 个字节
				str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换,
				// >>> 为逻辑右移，将符号位一起右移
				str[k++] = hexDigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
			}
			s = new String(str); // 换后的结果转换为字符串

		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	/************************************ DES加密解密 ************************************/

	static Key key;
	public static final String defaultKey = "daijj";

	/**
	 * 根据参数生成KEY
	 * 
	 * @param strKey
	 */
	private static void getKey(String strKey) {
		try {
			KeyGenerator kg = KeyGenerator.getInstance("DES");
			kg.init(new SecureRandom(strKey.getBytes()));
			key = kg.generateKey();
			kg = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 使用DES算法对字符串进行加密，返回加密后的字符串
	 * 
	 * @param strMing
	 *            待加密的字符串
	 * @param strKey
	 *            加密密钥
	 * @return 加密后的字符串
	 */
	public static String encryptStringByDES(String strMing, String strKey) {
		getKey(strKey);
		byte[] byteMi = null;
		byte[] byteMing = null;
		String strMi = "";
		try {
			byteMing = strMing.getBytes("UTF8");
			byteMi = encryptByteByDES(byteMing, strKey);
			strMi = encryptByteBYBase64(byteMi);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			byteMing = null;
			byteMi = null;
		}
		return strMi;
	}

	/**
	 * 使用DES算法对字符串进行解密，返回解密后的字符串
	 * 
	 * @param strMi
	 *            待解密的字符串
	 * @param strKey
	 *            解密密钥
	 * @return 解密后的字符串
	 */
	public static String dencryptStringByDES(String strMi, String strKey) {
		getKey(strKey);
		byte[] byteMing = null;
		byte[] byteMi = null;
		String strMing = "";
		try {
			byteMi = dencryptStringBYBase64(strMi);
			byteMing = dencryptByteByDES(byteMi, strKey);
			strMing = new String(byteMing, "UTF8");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			byteMing = null;
			byteMi = null;
		}
		return strMing;
	}

	/**
	 * 使用DES算法对字节数组进行加密，返回加密后的字节数组
	 * 
	 * @param byteS
	 *            待加密的字节数组
	 * @param strKey
	 *            加密密钥
	 * @return 加密后的字节数组
	 */
	private static byte[] encryptByteByDES(byte[] byteS, String strKey) {
		getKey(strKey);
		Cipher cipher;
		byte[] byteFina = null;
		try {
			cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byteFina = cipher.doFinal(byteS);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cipher = null;
		}
		return byteFina;
	}

	/**
	 * 使用DES算法对字节数组进行解密，返回解密后的字节数组
	 * 
	 * @param byteD
	 *            待解密的字节数组
	 * @param strKey
	 *            解密密钥
	 * 
	 * @return 解密后的字节数组
	 */
	private static byte[] dencryptByteByDES(byte[] byteD, String strKey) {
		getKey(strKey);
		Cipher cipher;
		byte[] byteFina = null;
		try {
			cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.DECRYPT_MODE, key);
			byteFina = cipher.doFinal(byteD);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cipher = null;
		}
		return byteFina;
	}

	public static void main(String[] args) {
		String ming = "dreajay";
		String mi = EncryptUtil.encryptStringByDES(ming, defaultKey);
		System.out.println(mi);
		 System.out.println(mi.length());
	}
}
