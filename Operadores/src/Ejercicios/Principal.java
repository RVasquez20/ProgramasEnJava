package Ejercicios;



import javax.sound.midi.Soundbank;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.function.DoubleFunction;

public class Principal {
    static ArrayList<Poligono> poligono=new ArrayList<Poligono>();
    static Scanner Entrada=new Scanner(System.in);
    public static void main(String[] args) {
    //Llenado de poligono
    llenarPoligono();
    mostrarAreas();

    }
    public static void llenarPoligono() {
        int opc;
        char resp;
    do{
        do {
            System.out.println("Digite que poligono desea");
            System.out.println("1.Triangulo");
            System.out.println("2.Rectangulo");
            System.out.println("Opcion: ");
            opc = Entrada.nextInt();
        } while (opc<1||opc>2);
        switch (opc){
            case 1://Llenar Triangulo
                LlenarTriangulo();
                break;
            case 2://Llenar rectangulo
                llenarRectangulo();
                break;
        }
        System.out.println("Desea Introducir otro poligono? S/N");
        resp=Entrada.next().charAt(0);
    }while(resp=='S'||resp=='s');
    }
    public static void LlenarTriangulo(){
        double l1,l2,l3;
        System.out.println("Digite el lado 1 ");
        l1=Entrada.nextDouble();
        System.out.println("Digite el lado 2 ");
        l2=Entrada.nextDouble();
        System.out.println("Digite el lado 3 ");
        l3=Entrada.nextDouble();
        Triangulo triangulo=new Triangulo(l1,l2,l3);
        //Se guarda el triangulo dentro del arraylist de poligonos ya que una clase madre puede almacenar objetos de su clase hija
        poligono.add(triangulo);
    }
    public static void llenarRectangulo(){
        double l1,l2;
        System.out.println("Digite el lado 1 ");
        l1=Entrada.nextDouble();
        System.out.println("Digite el lado 2 ");
        l2=Entrada.nextDouble();
        Rectangulo rectangulo=new Rectangulo(l1,l2);
        //Se guarda el triangulo dentro del arraylist de poligonos ya que una clase madre puede almacenar objetos de su clase hija
        poligono.add(rectangulo);
    }
    public static void mostrarAreas(){
    for(Poligono i:poligono){
        System.out.println(i.toString());
        System.out.println("Area: "+i.area());
        System.out.println("-----------------------------");
    }

    }


}
