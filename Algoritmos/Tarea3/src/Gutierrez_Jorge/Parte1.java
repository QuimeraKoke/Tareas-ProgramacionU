package Gutierrez_Jorge;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Parte1 {
	public static final String abc = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,;:?!-/’";
	public static void main(String[] args) throws IOException 
	{
		BufferedReader in=new BufferedReader(new InputStreamReader(System.in));
		String input;
		String output ="" ;
		
		while ( (input=in.readLine () )!=null)
			if(input.trim().length() == 0)
				output += "\n";
			else
				output += comprimir(input)+ "\n";

		System.out.print(output);
		System.out.flush ();
		in.close ();
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
					
				}
			}
			else{
				Nodo temphead=new Nodo(tempEst.count,tempEst.letra);
				while(temphead.peso<headNodo.peso){
					index=min(lista);
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
		resp.comprimido=headNodo.print();
		resp.arbol=Preorden(headNodo);
		System.out.println(resp.comprimido);
		System.out.println(resp.arbol);
		System.out.println();
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
//	public String print(Nodo nodo){ 
//		String a = nodo.content;
//		System.out.print(nodo.content);
//		if (nodo.izq != null){
//			a.concat(this.izq.print());
//			a.concat(this.der.print());
//		}
//		System.out.println(a);
//		return a;
//	}
	private static String Preorden(Nodo nodo)
    {
		String a=""; 
		if (nodo.izq != null){
			a=a+"0";     //mostrar datos del nodo
			a+=Preorden(nodo.izq);//recorre subarbol izquierdo
			a+="1";
			a+=Preorden(nodo.der);     //recorre subarbol derecho
    }
		return a;
    }
}
