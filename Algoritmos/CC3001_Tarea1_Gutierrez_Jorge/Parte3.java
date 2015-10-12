//Jorge Andres Gutierrez Tapia
package CC3001_Tarea1_Gutierrez_Jorge;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte3 {
	public static final String min = "abcdefghijklmnopqrstuvwxyz";
	public static final String may = min.toUpperCase();
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub		
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String input;
		String output="";
		while ((input=in.readLine())!= null) {
			output+=fromObjectToString(CRIPTOANALISIS(input.split("\\|")[0],input.split("\\|")[1])) +"\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	public static Object[] CRIPTOANALISIS(String D, String T){
		Object[] resp = new Object[2];
		int n=0;
		String[] w =T.split("\\s+");
		String[] dict =D.split("\\s+");
		int i = w[0].length();
		for (int r=0;r<dict.length;r++){
			if(dict[r].length()==i && dict.length-r>=w.length ){
				if(may.indexOf(w[0].charAt(0))==-1 && may.indexOf(dict[r].charAt(0))==-1 ){
					int flt =min.indexOf(w[0].charAt(0));
					int fld =min.indexOf(dict[r].charAt(0));
					n=fld-flt;
					String a=(D.substring(D.indexOf(dict[r]),D.indexOf(dict[r])+T.length()));
				}
				else if(min.indexOf(w[0].charAt(0))==-1 && min.indexOf(dict[r].charAt(0))==-1 ){
					int flt =may.indexOf(w[0].charAt(0));
					int fld =may.indexOf(dict[r].charAt(0));
					n=fld-flt;
					resp[0]=""+Math.abs(n);
					String a=(D.substring(D.indexOf(dict[r]),D.indexOf(dict[r])+T.length()));
				}
				else if(w[0].charAt(0)==dict[0].charAt(0)){
					String a=(D.substring(D.indexOf(dict[r]),D.indexOf(dict[r])+T.length()));
					try{
						int flt =may.indexOf(w[0].charAt(1));
						int fld =may.indexOf(dict[r].charAt(1));
						n=fld-flt;
						resp[0]=Math.abs(n);
					}
					 catch(Exception excepcion){
						 resp[0]=""+0;
						 resp[1]=T;
						 return resp;
					 }
				}
				String a=(D.substring(D.indexOf(dict[r]),D.indexOf(dict[r])+T.length()));
				if (a.equals(Parte1.ROT(n, T))){
					resp[1]=Parte1.ROT(n, T);
					return resp;
				}
			}
		}
		resp[0]=""+0;
		resp[1]=T;
		return resp;
	}
	public static String fromObjectToString(Object[] a){
		String resp=""+a[0]+" "+a[1];
		return resp;
		
	}
}