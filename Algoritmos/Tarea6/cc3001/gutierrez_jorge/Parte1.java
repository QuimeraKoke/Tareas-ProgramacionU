package cc3001.tarea6.gutierrez_jorge;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte1 {
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
			mergeSort(data,0,Integer.valueOf(a[0]));
			}
		System.out.print(output);
		System.out.flush ();
		in.close ();
	}
	public static long[] mergeSort(long[] lista, int izq, int der) {
        int lenght = der - izq;         
        if (lenght <= 1) 
            return lista; 
        int mid = izq + lenght/2; 
        mergeSort(lista, izq, mid); 
        mergeSort(lista, mid, der); 
        long[] temp = new long[lenght];
        int i = izq, m = mid;
        for (int j = 0; j < lenght; j++) 
        {
            if (i == mid)  
                temp[j] = lista[m++];
            else if (m == der) 
                temp[j] = lista[i++];
            else if (lista[m]<lista[i]) 
                temp[j] = lista[m++];
            else 
                temp[j] = lista[i++];
        }    
        for (int j = 0; j < lenght; j++) 
            lista [izq + j] = temp[j];  
        return lista;       
    }
}
