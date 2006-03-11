package org.alt60m.util;

import javax.crypto.*;
import com.sun.crypto.provider.*;
import java.security.*;
import javax.crypto.spec.*;
import java.io.*;
import java.util.*;

public class Encryptor 
{
	Cipher _pbeCipher;
	SecretKey _pbeKey;
	PBEParameterSpec _pbeParamSpec;

	public Encryptor(String password) throws EncryptorException
	{
		try {
			Provider sunJce = new com.sun.crypto.provider.SunJCE();
			Security.addProvider(sunJce);

			PBEKeySpec pbeKeySpec;
			SecretKeyFactory keyFac;

			// Salt
			byte[] salt = {
			  (byte)0xc7, (byte)0x73, (byte)0x21, (byte)0x8c,
			  (byte)0x7e, (byte)0xc8, (byte)0xee, (byte)0x99
			};

			// Iteration count
			int count = 20;

			// Create PBE parameter set
			_pbeParamSpec = new PBEParameterSpec(salt, count);

			pbeKeySpec = new PBEKeySpec(password.toCharArray());

			keyFac = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
			_pbeKey = keyFac.generateSecret(pbeKeySpec);

			// Create PBE Cipher
			_pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
		} catch (Exception e) {
			throw new EncryptorException(e.getMessage());
		}
	}

	public String encrypt(String cleartext) throws EncryptorException { 
		
		try {
			// Initialize PBE Cipher with key and parameters
			_pbeCipher.init(Cipher.ENCRYPT_MODE, _pbeKey, _pbeParamSpec);

			// Encrypt the cleartext
			byte[] ciphertext = _pbeCipher.doFinal(cleartext.getBytes());
			
			
			return new String(Base64.encode(ciphertext));
		} catch (Exception e) {
			throw new EncryptorException(e.getMessage());
		}
	}

	public String decrypt(String ciphertext) throws EncryptorException  {

		try {
			// Initialize PBE Cipher with key and parameters
			_pbeCipher.init(Cipher.DECRYPT_MODE, _pbeKey, _pbeParamSpec);

			// Decrypt the ciphertext
			byte[] cleartext = _pbeCipher.doFinal(Base64.decode(ciphertext.toCharArray()));

			return new String((cleartext));
		} catch (Exception e) {
			throw new EncryptorException(e.getMessage());
		}
	}

	public static void main(String[] args) {
		
		try {
			Encryptor encrypt = new Encryptor(args[0]);


			Date start = new Date();
			for(int cnt=0;cnt<1000;cnt++) {			
				if (!encrypt.decrypt(encrypt.encrypt(args[1])).equals(args[1]))
					System.out.println("FAILED!");
			}
			System.out.println("Took " + (new Date().getTime() - start.getTime())/(1000.0) + " ms per encrypt/decrypt pair");


			String ciphertext = encrypt.encrypt(args[1]);
			System.out.println("ciphertext: " + ciphertext);

			String cleartext = encrypt.decrypt(ciphertext);
			System.out.println("cleartext: " + cleartext);

			if (!cleartext.equals(args[1]))
				System.out.println("FAILED!");
			else 
				System.out.println("PASSED");



	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}