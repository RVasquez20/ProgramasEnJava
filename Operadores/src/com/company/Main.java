package com.company;

import javax.swing.*;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	/*Suma suma1=new Suma();
	Double numero1,numero2;
	numero1=Double.parseDouble(JOptionPane.showInputDialog("Ingrese el numero 1: "));
        numero2=Double.parseDouble(JOptionPane.showInputDialog("Ingrese el numero 2: "));
        JOptionPane.showMessageDialog(null,"La suma es: "+suma1.Sumar(numero1,numero2));
        ////Ejemplo 2
        Scanner Datos=new Scanner(System.in);
        String Nombre;
        int Edada;
        System.out.println("Ingrese el nombre");
        Nombre=Datos.nextLine();
        System.out.println("Ingrese la edad");
        Edada=Datos.nextInt();

    Persona p1=new Persona(Nombre,Edada);
    p1.mostrar();
*/
        //Sobrecarga de metodos
  /*  Persona p1=new Persona("Rodrigo",19);
    Persona p2=new Persona("1234");
    p1.Correr();
    p2.Correr(100);*/
SwingUtilities.invokeLater(new Runnable() {
    @Override
    public void run() {
        JFrame frame=new Ventana();
                frame.setSize(300,300);
                frame.setVisible(true);
    }
});
    }
}
