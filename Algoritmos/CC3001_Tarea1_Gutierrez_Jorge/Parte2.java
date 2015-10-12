//Jorge Andres Gutierrez Tapia
package CC3001_Tarea1_Gutierrez_Jorge;
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
			output+=""+SCORE(input.split("\\|")[0],input.split("\\|")[1])+"\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	public static int SCORE(String D , String T){
		int contador =0;
		for (String s: T.split("\\s+")) {
			if(D.indexOf(s)!=-1){
				contador+=1;
			}
		}
		return contador;
	}
}