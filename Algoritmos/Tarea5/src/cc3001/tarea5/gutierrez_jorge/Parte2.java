package cc3001.tarea5.gutierrez_jorge;
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
			output+=""+SCORE_HASH(input.split("\\|")[0],input.split("\\|")[1])+"\n";
		}
		System.out.print(output);
		System.out.flush();
		in.close();
	}
	public static int SCORE_HASH(String D, String T){
		int contador =0;
		String[] temp= D.split("\\s+");
		String[] list = new String[temp.length];
		for (String s:temp){
			list=insert(list,s);
		}
		for (String s: T.split("\\s+")) {
			if(indexOf(list,s)!=-1) contador++;
		}
		return contador;
	}
	private static int doHash(String str, int len) {
        int hash = 0;
        for (int i = 0; i < str.length(); i++) hash +=  str.charAt(i);
        return hash%len;
    }
	public static int indexOf(String[] a, String value) {
		int key=doHash(value,a.length);
		for(int i=key;i<a.length;i++){
			if(a[i].equals(value)) return i;
		}
		for(int i=0;i<key;i++){
			if(a[i].equals(value)) return i;
		}
        return -1;
    }
	public static String[] insert (String[] list, String value){
		
		
		int key =doHash(value,list.length);
		for(int i=key;i<list.length;i++){
			if(list[i]==null || list[i].equals(value)) {
				list[i]=value;
				return list;
			}
		}
		for(int i=0;i<key;i++){
			if(list[i]==null || list[i].equals(value)) {
				list[i]=value;
				return list;
			}
		}
		return list;
	}
	public static void show(String[] a){
		for (String s:a) System.out.println(s);
	}
}
