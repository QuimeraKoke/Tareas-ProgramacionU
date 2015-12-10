package CC3001_Tarea2_Jorge_Gutierrez;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte2 {	
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String input;
		String output="";
		while ((input=in.readLine())!= null) {
			output+=platos(generate(input))+ "\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	
	
	public static String platos(int[] a){
		int n =a.length;
		return Hanoi(n,1,2,3,a);
	}
	public static String Hanoi( int n, int a, int b, int c, int[] platos ){
		String resp ="";
	if (n>0) {
		resp=resp.concat(Hanoi( n-1, a, c, b, platos ));
		resp=resp.concat(concatStrings(Parte1.hanoiParser(a,c),platos[n-1]));
		resp=resp.concat(Hanoi( n-1, b, a, c, platos ));}
		return resp;
	}
	public static String concatStrings(String a, int n){ 
	String resp="";
	for (int i=0;i<n;i++){
		resp=resp.concat(a);
		}
	return resp;
	}
	public static int[] generate(String a){
		int[] resp = new int[a.length()];
		for (int i=0;i<a.length();i++){
			resp[i]=(int)Character.getNumericValue(a.charAt(i));
		}
		return resp;
	}
}
