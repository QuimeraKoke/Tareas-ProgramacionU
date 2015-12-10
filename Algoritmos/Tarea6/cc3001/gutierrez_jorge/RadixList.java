package cc3001.tarea6.gutierrez_jorge;

public class RadixList {
	private LongList[] rList=new LongList[10];
	public int size=0;
	
	public RadixList(){
		for(int i=0;i<10;i++){
			this.rList[i]= new LongList();
			}
	}
	
	public void add(int i,long element){
		this.rList[i].add(element);
		size+=1;
	} 
	
	public long[] get(){
		LongList list = new LongList();
		int cont=0;
		for(int i=0;i<10;i++){
			for(long j:rList[i].get()){
				list.add(j);
			}
		}
		return list.get();
	}
}
