package Framesypaneles;

import javax.swing.*;

public class ventana extends JFrame {
public ventana(){
    setSize(700,500);//tamaño de ventana
    setDefaultCloseOperation(EXIT_ON_CLOSE);
    //setLocation(350,150);//Reubicar la ventana
    //setBounds(350,150,500,500);//engloba setsize y setlocation primero van los parametros de setlocation y luego size
    setLocationRelativeTo(null);//coloca la ventana en el entro de la pantalla

    setTitle("Esta es la primer Ventana");//Estavlecemos el titulo de la ventana
}

}
