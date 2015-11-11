package Gutierrez_Jorge;

public class Nodo {
	String content;
	int peso = 0;
	Nodo izq = null;
	Nodo der = null;
	
	Nodo(int peso,String palabra){
		this.peso=peso;
		this.content=palabra;
	}
	public String print(){ 
		String a=this.content;
		if (this.izq != null){
			a=a+this.izq.print();
			a=a+this.der.print();
		}
		return a;
	}
	public void show(){
		if (this.izq != null){
			System.out.print("0");
			this.izq.show();
			System.out.print("1");
			this.der.show();
		}
	}
	
}
