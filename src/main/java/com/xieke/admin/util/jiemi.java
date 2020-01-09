package com.xieke.admin.util;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.lang.StringUtils;
import sun.misc.BASE64Decoder;

public class jiemi {
	
	//密钥 (需要前端和后端保持一致)十六位作为密钥
	private static final String KEY = "ihaierForTodoKey";

	//密钥偏移量 (需要前端和后端保持一致)十六位作为密钥偏移量
	private static final String IV = "ihaierForTodo_Iv";
	
	//算法
	private static final String ALGORITHMSTR = "AES/CBC/PKCS5Padding";
	
	//SSO的TOKEN
	private static final String token = "4AaWABnPB5/1Z2EIEXwSfigudpiM4kzLkmIrKQPmS9w=";
	/** 
	 * base 64 decode 
	 * @param base64Code 待解码的base 64 code 
	 * @return 解码后的byte[] 
	 * @throws Exception 
	 */
	public static byte[] base64Decode(String base64Code) throws Exception{
		return StringUtils.isEmpty(base64Code) ? null : new BASE64Decoder().decodeBuffer(base64Code);
	}
	
	/** 
	 * AES解密 
	 * @param encryptBytes 待解密的byte[] 
	 * @return 解密后的String 
	 * @throws Exception 
	 */  
	public static String aesDecryptByBytes(byte[] encryptBytes) throws Exception {

		Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
		
		byte[] temp = IV.getBytes("UTF-8");
		IvParameterSpec iv = new IvParameterSpec(temp);
		
		cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(KEY.getBytes(), "AES"), iv);
		byte[] decryptBytes = cipher.doFinal(encryptBytes);
		
		System.out.print(new String(decryptBytes));
		return new String(decryptBytes);
	}

	/** 
	 * 将base 64 code AES解密 
	 * @param encryptStr 待解密的base 64 code
	 * @return 解密后的string
	 * @throws Exception
	 */ 
	public static String aesDecrypt(String encryptStr) throws Exception {  
		return StringUtils.isEmpty(encryptStr) ? null : aesDecryptByBytes(base64Decode(encryptStr));  
	}

	public static void main(String[] args) throws Exception {
		aesDecrypt("f0h97QdYFGZsp/Qqo7kCiw==");
	}
}

