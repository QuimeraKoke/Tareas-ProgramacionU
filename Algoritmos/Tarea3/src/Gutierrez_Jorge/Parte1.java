package Gutierrez_Jorge;
public class Parte1 {
	public static final String abc = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,;:?!-/’";
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		comprimir("aaabbbbcccc");
	}
	public static TextoComprimido comprimir(String texto){
		TextoComprimido respuesta = new TextoComprimido();
		Object[] lista = new Object[2*texto.length()];
		int pos = 0;
		String text = texto;
		char temp='a';
		while (text.compareTo("")!=0){
			temp=text.charAt(0);
			lista[pos]=String.valueOf(temp);
			lista[pos+1]=count(text, temp);
			text=text.replaceAll(String.valueOf(temp) ,"");
			System.out.println(text);
			pos+=2;
		}
		System.out.println(""+lista[0]+" "+lista[1]);
		return respuesta;
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
}
