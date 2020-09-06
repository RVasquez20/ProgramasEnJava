package Herencia;

import java.util.Scanner;

public class mainEj1 {
    public static void main(String[] args) {
        Scanner scr=new Scanner(System.in);
        System.out.println("Ingrese El nombre del estudainte");
        String name=scr.nextLine();
        System.out.println("Ingrese El Apellido de "+name);
        String apellido=scr.nextLine();
        System.out.println("Ingrese La edad de "+name);
        int edad=scr.nextInt();
        System.out.println("Ingrese El codigo de estudainte");
        int cod=scr.nextInt();
        System.out.println("Ingrese La nota final del estudainte "+name);
        float notf=scr.nextFloat();

        Estudiante E1=new Estudiante(name,apellido,edad,cod,notf);
        E1.mostrarDatos();
        System.out.println("_________________________________________");
        Persona E2=new Estudiante(name,apellido,edad,cod,notf);
        System.out.println(E2.toString());
    }
}
