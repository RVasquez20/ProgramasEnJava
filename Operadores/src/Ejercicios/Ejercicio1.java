package Ejercicios;

public class Ejercicio1 {
    //Atributos
    private float lado1,lado2;
    //Metodos
    //Constructor 1 (cuadrilatero!=cuadrado)
    public Ejercicio1(float lado1, float lado2) {
        this.lado1 = lado1;
        this.lado2 = lado2;
    }
    //Metodo constructor 2 para cuadrados only
    public Ejercicio1(float lado1) {
        this.lado1 = this.lado2=lado1;
    }
    public float getPerimetro(){
        float perimetro=(2*lado1)+(2*lado2);
        return perimetro;
    }

    public float getArea(){
        float area=(lado1*lado2);
        return area;
    }
}
