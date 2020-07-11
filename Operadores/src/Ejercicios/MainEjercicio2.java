package Ejercicios;

import java.io.ObjectOutputStream;
import java.util.Scanner;
import java.util.function.DoubleFunction;
import java.util.prefs.PreferenceChangeEvent;

public class MainEjercicio2 {
    public static int indiceCocheBarato(Ejercicio2 coches[]){
    float precio;
    int indice=0;
    precio=coches[0].getPrecio();
        for (int i = 1; i <coches.length ; i++) {
            if(coches[i].getPrecio()<precio){
                precio=coches[i].getPrecio();
                indice=i;
            }
        }
    return indice;
    }
    public static void main(String[] args) {
        Scanner Datos=new Scanner(System.in);
        String marca,modelo;
        float precio;
        int barato;
        int CantidadVehiculos;
        System.out.println("Digite la cantidad de vehiculos ");
        CantidadVehiculos=Datos.nextInt();
        Ejercicio2 Carro[]=new Ejercicio2[CantidadVehiculos];
        for (int i=0;i<CantidadVehiculos;i++){
            Datos.nextLine();
            System.out.println("Digite las caracteristicas del vehiculo "+(i+1));
            System.out.println("Ingrese la marca del vehicuo: ");
            marca=Datos.nextLine();
            System.out.println("Ingrese el modelo del vehicuo: ");
            modelo=Datos.nextLine();
            System.out.println("Ingrese el precio del vehicuo: ");
            precio=Datos.nextFloat();
            Carro[i]=new Ejercicio2(marca,modelo,precio);
        }
        barato=indiceCocheBarato(Carro);
        System.out.println("\n El coche mas barato es ");
        System.out.println(Carro[barato].mostrarDatos());
    }
}
