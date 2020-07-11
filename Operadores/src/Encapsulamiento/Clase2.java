package Encapsulamiento;

import javax.swing.*;

public class Clase2 {
    public static void main(String[] args) {
    Clase1 Obj1=new Clase1();
    Obj1.setNombre("Juan");
    Obj1.setEdad(5);
        JOptionPane.showMessageDialog(null,"El nombre es : "+Obj1.getNombre()+" \nLa edad es de "+Obj1.getEdad());
        constantes Obj2=new constantes("Rodrigo",19);
        Obj2.mostrar();
        Obj2.setEdad(20);
        Obj2.mostrar();

    }
}
