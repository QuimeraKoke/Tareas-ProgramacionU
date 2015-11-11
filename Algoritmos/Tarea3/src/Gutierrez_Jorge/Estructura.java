package Gutierrez_Jorge;

public class Estructura {
	String letra;
	int count;
	@Override
	public Estructura clone()  {
	    try {
			return (Estructura)super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return this;
	}
}
