//Jorge Andres Gutierrez Tapia
package CC3001_Tarea1_Gutierrez_Jorge;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte1 {
	public static final String min = "abcdefghijklmnopqrstuvwxyz";
	public static final String may = min.toUpperCase();
	public static void main(String[] args) throws IOException {
		System.out.println(Parte1.ROT(13,"Jérémy"));
		// TODO Auto-generated method stub
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String input;
		String output="";
		while ((input=in.readLine())!= null) {
			output+=Parte1.ROT(Integer.parseInt(input.split(" ",2)[0]),input.split(" ",2)[1])+"\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	public static String ROT(int n,String N){
	    String re= "";
	    int s =0;
	    if (n==0){
	    	return N;
	    }
	    else if (n<0){
	    	s=26+n;
	    }
	    else{
	    	s=n;
	    }
	    for (int i=0;i<N.length();i++){
	    	if (min.indexOf(N.charAt(i))!=-1){
	    		re=re.concat(""+ min.charAt((min.indexOf(N.charAt(i))+s)%26));
	        }
	    	else if (may.indexOf(N.charAt(i))!=-1){
	        	re=re.concat(""+ may.charAt((may.indexOf(N.charAt(i))+s)%26));
	        }
	    	else{
	    		re=re.concat(""+N.charAt(i));
	    	}
	   }
	         return re;
	}
}
