package Ejercicios;

import javax.swing.*;

public class MainEjercicio1 {
    public static void main(String[] args) {
       Ejercicio1 c1;
       float l1,l2;
       l1=Float.parseFloat(JOptionPane.showInputDialog("Ingrese el lado 1"));
       l2=Float.parseFloat(JOptionPane.showInputDialog("Ingrese el lado 2"));
        //Deteccion si es cuadrado
        if(l1==l2){
            c1=new Ejercicio1(l1);
        }else{
            c1=new Ejercicio1(l1,l2);
        }
        System.out.println("El perimetro es de : "+c1.getPerimetro());
        System.out.println("El Area es de :"+c1.getArea());
    }
}
