package cc3001.tarea6.gutierrez_jorge;

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
			else{
				String[] a = input.split("\\s+");
				long[] data = new  long[Integer.valueOf(a[0])];
			for (int i = 1; i < Integer.valueOf(a[0])+1; i++) {
			  data[i-1] = Long.valueOf(a[i]);
			}
			COMPARA(data,Integer.valueOf(a[0]));
			}
		System.out.print(output);
		System.out.flush ();
		in.close ();
	}
	public static void COMPARA(long[] D,int n){
		long init;
		long finish=0;
		long tiempo1 = 0;
		long tiempo2=0;
		long[] temp;
		for (int j=1;j<n+1;j++){
			temp = new long[j];
		for (int i=0;i<j;i++){
			temp[i]=D[i];
		}
		init=System.nanoTime();
		Parte1.mergeSort(temp, 0, temp.length-1);
		finish=System.nanoTime();
		tiempo1=finish-init;
		init=System.nanoTime();
		Parte2.radixSort(temp);
		finish=System.nanoTime();
		tiempo2=finish-init;
		System.out.println(""+j+"\t"+tiempo1+"\t"+tiempo2);
		}
	}
}