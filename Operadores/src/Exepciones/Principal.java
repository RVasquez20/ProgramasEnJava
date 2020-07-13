package Exepciones;

import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Principal {
    static Scanner datos=new Scanner(System.in);
    public static void divicion() {
        int x=0,y = 0, div;
        System.out.println("Ingrese el primer numero a dividir");
        x=datos.nextInt();
        System.out.println("Ingrese el segundo numero a dividir ");
        y=datos.nextInt();
        div = x / y;
        System.out.println(div);
    }

    public static void main(String[] args) {
        try {
            divicion();

        } catch (Throwable ex) {
            System.out.println("Error de division en cero o cadena de texto ingresada");
        }
    }
}
