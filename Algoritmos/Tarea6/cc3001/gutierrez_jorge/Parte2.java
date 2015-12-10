package cc3001.tarea6.gutierrez_jorge;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Parte2 {
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
			radixSort(data);
			}
		System.out.print(output);
		System.out.flush ();
		in.close ();
	}
	public static long[] radixSort(long[] lista){
		LongList positive=new LongList();
		LongList negative=new LongList();
		long temp= 0;
		int indexn = 0,indexp = 0;
		for (long i: lista){
			if(i<0){
				negative.add(-1*i);
				indexn++;
			}
			else{
				positive.add(i);
				indexp++;
			}
		}
		return Inversemerge(Sort(negative.get()),Sort(positive.get()));
	}
	
	public static long[] Sort(long[] a){
		long compare = 0;
		RadixList list = new RadixList();
		for(int i=0;i<21;i++){
			compare=(long) Math.pow(10, i);
			for (long j:a){
				list.add((int)((j/compare)%10), j);
			}
			a=list.get();
			list= new RadixList();
		}
		return a;
	}
	public static long[] Inversemerge(long[] negative, long[] positive) {
		int l1 =negative.length;
		int l2 =positive.length;
		long[] resp = new long[l1+l2];
		for (int i = 0;i<l1;i++){
			resp[i]=-1*negative[l1-1-i];
		}
		for (int i = 0;i<l2;i++){
			resp[l1+i]=positive[i];
		}
		return resp;
	}
	public static void show(long[] a){
		for (long s:a) System.out.print(""+s+" ");
	}
}
