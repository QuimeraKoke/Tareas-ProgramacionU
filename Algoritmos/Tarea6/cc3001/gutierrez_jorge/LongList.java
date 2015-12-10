package cc3001.tarea6.gutierrez_jorge;

public class LongList {
	private long[] list;
	
	public LongList(){
		this.list = new long[0];
	}
	public void add(long element){
		int length = list.length;
		long[] nList =new long[length+1];
		for(int i = 0;i<length;i++) nList[i] = list[i];
		nList[length] = element; 
		this.list = nList;
	}
	public int size(){
		return list.length;
	}
	
	public long[] get(){
		return list;
	}
}
