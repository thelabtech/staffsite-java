package org.alt60m.util;

import java.util.*;

public class ByteArray 
{
	byte[] _buf;

	public ByteArray() {
		_buf = new byte[0] ;
	}

	public void append(byte[] bytes, int numBytes) {
		byte[] newBuf = new byte[numBytes+_buf.length];
		
		java.lang.System.arraycopy(_buf, 0, newBuf, 0, _buf.length);
		java.lang.System.arraycopy(bytes, 0, newBuf, _buf.length, numBytes);
		_buf = newBuf;
	}

	public void append(byte[] bytes) {
		append(bytes, bytes.length);
	}

	public void clear() {
		_buf = new byte[0];
	}
	public int length() {
		return _buf.length;
	}

	public byte[] getBytes() {
		return _buf;
	}


	public static void main(String[] args) 
	{
		ByteArray arr = new ByteArray();
		byte[] a = new byte[3];

		a[0] = 1;
		a[1] = 2;
		a[2] = 3;
		
		arr.append(a);
		System.out.println("length: " + arr.length());

		a[0] = 4;
		a[1] = 5;
		a[2] = 6;
		
		arr.append(a);
		System.out.println("length: " + arr.length());

		a[0] = 7;
		a[1] = 8;
		a[2] = 9;

		arr.append(a);
		System.out.println("length: " + arr.length());
		
		byte[] arr2 = arr.getBytes();
		for(int i =0;i<arr2.length;i++) {
			System.out.print(arr2[i] + ", ");
		}
	}
}
