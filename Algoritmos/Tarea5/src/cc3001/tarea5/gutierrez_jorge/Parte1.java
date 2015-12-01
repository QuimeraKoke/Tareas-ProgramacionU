package cc3001.tarea5.gutierrez_jorge;
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
			output+=""+SCORE_ARREGLO(input.split("\\|")[0],input.split("\\|")[1])+"\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	public static int SCORE_ARREGLO(String D , String T){
		int contador =0;
		String[] list = sort(D.split("\\s+"));
		for (String s: T.split("\\s+")) {
			if(indexOf(list,s)!=-1){
				contador+=1;
			}
		}
		return contador;
	}
	public static String[] sort(String[] Array){
		String tempArray[]=Array;
	    String  temp; 
	    for(int j=0; j<tempArray.length-1;j++){
	        for (int i=j+1 ; i<tempArray.length; i++){
	            if(tempArray[i].compareTo(tempArray[j])<0) {
	                temp= tempArray[j];
	                tempArray[j]= tempArray[i]; 
	                tempArray[i]=temp;
	            }
	        }

	     }
//	    System.out.println(tempArray[0]);
	    return tempArray;
	}
	public static int indexOf(String[] a, String key) {
        int lo = 0;
        int hi = a.length - 1;
        while (lo <= hi) {
            // Key is in a[lo..hi] or not present.
            int mid = lo + (hi - lo) / 2;
            if(compareLess(key,a[mid])) hi = mid - 1;
            else if (compareMore(key,a[mid])) lo = mid + 1;
            else return mid;
        }
        return -1;
    }
	public static boolean compareLess(String a, String b){
		if(a.length()<b.length()){
			for (int i=0;i<a.length();i++){
				if(a.charAt(i)<b.charAt(i)){
					return true;
				}
				else if(a.charAt(i)>b.charAt(i)){
					return false;
				}
			}
		}
		else{
			for (int i=0;i<b.length();i++){
				if(a.charAt(i)<b.charAt(i)){
					return true;
				}
				else if(a.charAt(i)>b.charAt(i)){
					return false;
				}
			}
		}
		return false;
	}
	public static boolean compareMore(String a, String b){
		if(a.length()<b.length()){
			for (int i=0;i<a.length();i++){
				if(a.charAt(i)<b.charAt(i)){
					return false;
				}
				else if(a.charAt(i)>b.charAt(i)){
					return true;
				}
			}
		}
		else{
			for (int i=0;i<b.length();i++){
				if(a.charAt(i)<b.charAt(i)){
					return false;
				}
				else if(a.charAt(i)>b.charAt(i)){
					return true;
				}
			}
		}
		return false;
	}


}
