package MMC.utility;

import java.util.Date;
import java.util.Properties;
import java.util.Random;


public class verify {
	
	
	public String genCode(){
		  final String alphabet = "0a1b2c3d4e5f6g7h8i9jAkBlCmDnEoFpGqHrIsJtKuLvMwNxOyPzQRSTUVWXYZ";
		    final int N = alphabet.length();
		    String result = "";
		    Random r = new Random();

		    for (int i = 0; i < 8; i++) {
		        result += (alphabet.charAt(r.nextInt(N)));
		    }
			System.out.println(result);
			return result;
	}
	
	public static void main(String args[]){
		
	
	}
}
