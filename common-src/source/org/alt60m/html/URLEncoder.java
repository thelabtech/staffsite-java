package org.alt60m.html;

public class URLEncoder implements java.io.Serializable {

	public static String encode(String textToEncode) {
		return encode(textToEncode, false);
	}

	public static String encode(String textToEncode, boolean encodeEverything) {
		
		StringBuffer result = new StringBuffer();

		if (encodeEverything == true)
		{
			for(int i=0;i<textToEncode.length();i++) 
				result.append("%"+ charToHex(textToEncode.charAt(i)) );
		
		} else {
				result.append(java.net.URLEncoder.encode(textToEncode));
		}

		return result.toString();
	}


   private static String byteToHex(byte b) {
      // Returns hex String representation of byte b
      char hexDigit[] = {
         '0', '1', '2', '3', '4', '5', '6', '7',
         '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'
      };
      char[] array = { hexDigit[(b >> 4) & 0x0f], hexDigit[b & 0x0f] };
      return new String(array);
   }

   private static String charToHex(char c) {
      // Returns hex String representation of char c
      //byte hi = (byte) (c >>> 8);
      byte lo = (byte) (c & 0xff);
      return byteToHex(lo); //+ byteToHex(lo);
   }
}
