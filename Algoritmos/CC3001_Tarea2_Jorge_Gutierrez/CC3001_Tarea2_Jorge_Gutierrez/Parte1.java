package CC3001_Tarea2_Jorge_Gutierrez;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte1 { 
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String input;
		String output="";
		while ((input=in.readLine())!= null) {
			output+=""+hanoi(Integer.parseInt(input))+"\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	public static String hanoi(int n){
		return Hanoi(n ,1,2,3);
	}
	
	static String Hanoi( int n, int a, int b, int c ){
		String resp ="";
	if (n>0) {
		resp=resp.concat(Hanoi( n-1, a, c, b ));
		resp=resp.concat(hanoiParser(a,c));
		resp=resp.concat(Hanoi( n-1, b, a, c ));}
		return resp;
	}
	
	static String hanoiParser (int from,int to ){
		if (from == 1){
			if (to ==2) return "a";
			if (to==3) return "c";
		}
		else if (from ==2){
			if (to == 1) return "f";
			if (to==3) return "b";
		}
		else {
			if (to==1) return "e";
			if (to==2) return "d";
		}
		return "";
	}
}
