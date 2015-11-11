package Gutierrez_Jorge;
public class Parte1 {
	public static final String abc = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,;:?!-/’";
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		comprimir("Hola");
	}

	public static TextoComprimido comprimir(String texto){
		TextoComprimido resp = new TextoComprimido();
		Object[] lista = new Object[texto.length()];
		int pos = 0;
		int len = texto.length();
		String text = texto;
		Estructura temp = new Estructura();
		while (text.compareTo("")!=0){
			temp.letra=String.valueOf(text.charAt(0));
			temp.count =count(text, temp.letra.charAt(0));
			lista[pos]=temp;
			text=text.replaceAll(temp.letra ,"");
			temp = new Estructura();
			pos++;
		}
		for (int i =0;i<len;i++){
			if(lista[i]!=null){
			System.out.println(((Estructura)lista[i]).count+"---"+((Estructura)lista[i]).letra);
			}
		}
		System.out.println();
		pos--;
		boolean state = true;
		Nodo headNodo = new Nodo(0,""),tempNodo=new Nodo(0,"");
		int index=0;
		Estructura tempEst;
		while (state){
			index=min(lista);
			tempEst = (Estructura)lista[index];
			lista[index]=null;
			System.out.println(index);
			for (int i =0;i<len;i++){
				if(lista[i]!=null){
				System.out.println(((Estructura)lista[i]).count+"---"+((Estructura)lista[i]).letra);
				}
			}
			if(tempEst.count>=headNodo.peso){
				if(headNodo.peso==0){
					headNodo.peso=tempEst.count;
					headNodo.content=tempEst.letra;
				}
				else{
					tempNodo=headNodo;
					headNodo=new Nodo(headNodo.peso+tempEst.count,"*");
					headNodo.izq = tempNodo;
					tempNodo = new Nodo(tempEst.count,tempEst.letra);
					headNodo.der=tempNodo;
					tempNodo = null;
					System.out.println(headNodo.content + " - "+headNodo.peso);
					System.out.println(headNodo.izq.content + " - "+headNodo.izq.peso);
					System.out.println(headNodo.der.content + " - "+headNodo.der.peso);
				}
			}
			else{
				Nodo temphead=new Nodo(tempEst.count,tempEst.letra);
				while(temphead.peso<headNodo.peso){
					index=min(lista);
					System.out.println(index);
					tempEst = (Estructura)lista[index];
					lista[index]=null;
					if(tempEst.count>=temphead.peso){
						tempNodo=temphead;
						temphead=new Nodo(temphead.peso+tempEst.count,"*");
						temphead.izq = tempNodo;
						tempNodo = new Nodo(tempEst.count,tempEst.letra);
						temphead.der=tempNodo;	
					}
				}
				tempNodo=headNodo;
				headNodo=new Nodo(headNodo.peso+temphead.peso,"*");
				headNodo.izq = tempNodo;
				headNodo.der=temphead;
			}
			state=check(lista);
		}
		print(headNodo);
		System.out.println(print(headNodo););
		Preorden(headNodo);
		return resp;
	}
	private static int count(String text, char compare){
		int counter = 0;
		for( int i=0; i<text.length(); i++ ) {
			if( text.charAt(i) == compare ) {
				counter++;
			} 
		}
		return counter;
	}
	private static boolean check(Object[] lista){
		for (int i = 0 ;i<lista.length;i++){
			if (lista[i]!= null){
				return true;
			}
		}
		return false;
		
	}
	private static int min (Object[] lista){
		int min=lista.length*1000000,resp=0;
		Estructura temp;
		for(int i = 0 ; i<lista.length;i++){
			if(lista[i]!=null){
			temp=(Estructura)lista[i];
			if(temp.count <min){
				min=temp.count;
				resp=i;
			}
			}
		}
		return resp;
	}
	public static String print(Nodo nodo){ 
		String a = nodo.content;
		System.out.print(nodo.content);
		if (nodo.izq != null){
			a.concat(nodo.izq.print());
			a.concat(nodo.der.print());
		}
		System.out.println(a);
		return a;
	}
	private static void Preorden(Nodo nodo)
    {
        if(nodo == null)
            return;
         
        System.out.print(0);     //mostrar datos del nodo
        Preorden(nodo.izq);//recorre subarbol izquierdo
        System.out.print(1);
        Preorden(nodo.der);     //recorre subarbol derecho
    }
}
