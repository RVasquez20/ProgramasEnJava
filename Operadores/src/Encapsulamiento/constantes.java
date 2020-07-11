package Encapsulamiento;

public class constantes {
    //Constante

    private final String Nombre;
    private int edad;

    public constantes(String nombre, int edad) {
        Nombre = nombre;
        this.edad = edad;
    }
    public void mostrar(){
        System.out.println("El nombre es "+Nombre+" Y su edad es de :"+edad);
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }


}
