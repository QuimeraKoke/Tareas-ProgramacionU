package Gutierrez_Jorge;

public class Nodo {
	String content;
	Nodo izq = null;
	Nodo der = null;
	
	Nodo(Nodo izquierdo, Nodo derecho, String contenido){
		izq = izquierdo;
		der = derecho;
		content = contenido;
	}
	public void print(){ 
		System.out.print(this.content);
		if (this.izq != null){
			this.izq.print();
			this.der.print();
		}
	}
}
