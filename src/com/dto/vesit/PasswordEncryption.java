package com.dto.vesit;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryption {

	public String passwordEncrypt(String password) throws NoSuchAlgorithmException{
		String hashPassword = null;
		MessageDigest digest= MessageDigest.getInstance("sha");
		digest.update(password.getBytes());
		byte[] hashValue = digest.digest();
		StringBuilder stringBuilder = new StringBuilder();
		
		
		for (int i = 0; i < hashValue.length; i++) {
			stringBuilder.append(String.format("%02x", hashValue[i]));
		}
		hashPassword = stringBuilder.toString();
		return hashPassword;
	}
}
