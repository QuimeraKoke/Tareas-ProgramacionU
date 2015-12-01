package cc3001.tarea5.gutierrez_jorge;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte3 {
	public static void main(String[] args) throws IOException {
		BufferedReader in=new BufferedReader(new InputStreamReader(System.in));
		String input;
		String output = "";
		while ( (input=in.readLine () )!=null)
			if(input.trim().length() == 0)
				output += "\n";
			else
				 COMPARA(input.split("\\|")[0],input.split("\\|")[1]);
		System.out.print(output);
		System.out.flush ();
		in.close ();
	}
	public static void COMPARA(String D,String T){
		long init=System.currentTimeMillis();
		long finish=0;
		long tiempo1 = 0;
		long tiempo2=0;
		String[] temp=D.split("\\s+");
		String compare="";
		for (String s:temp){
			compare=compare+s+" ";
			Parte1.SCORE_ARREGLO(D, T);
			finish=System.currentTimeMillis();
			tiempo1=finish-init;
			init=System.currentTimeMillis();
			Parte2.SCORE_HASH(D, T);
			finish=System.currentTimeMillis();
			tiempo2=finish-init;
			System.out.println(""+compare.split("\\s+").length+"\t"+tiempo1+"\t"+tiempo2);
		}
	}
}
