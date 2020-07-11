package Ejercicios;

import javax.naming.directory.InitialDirContext;
import javax.swing.*;

public class MainEjercicio3 {
    public static int Ganador(Ejercicio3 Corredores[]){
        int pos=0;
        float tiempo;
        tiempo=Corredores[0].getTiempoAtleta();
        for (int i = 1; i <Corredores.length ; i++) {
            if(Corredores[i].getTiempoAtleta()<tiempo){
                tiempo=Corredores[i].getTiempoAtleta();
                pos=i;
            }
        }
        return pos;
    }
    public static void main(String[] args) {
        int cantidadAtletas;
        int numerosAtleta;
        String nombresAtleta;
        float tiempoAtleta;
        int indice=0;
        cantidadAtletas=Integer.parseInt(JOptionPane.showInputDialog("Ingrese la cantidad de atletas a listar"));
        Ejercicio3 Atleta[]=new Ejercicio3[cantidadAtletas];
        for (int i = 0; i <cantidadAtletas ; i++) {
            numerosAtleta=Integer.parseInt(JOptionPane.showInputDialog("Ingrese el numero del atleta "+(i+1)));
            nombresAtleta=JOptionPane.showInputDialog("Ingrese el nombre del atleta");
            tiempoAtleta=Float.parseFloat(JOptionPane.showInputDialog("Ingrese el tiempo del Atleta"));
            Atleta[i]=new Ejercicio3(numerosAtleta,nombresAtleta,tiempoAtleta);
        }
        indice=Ganador(Atleta);
        JOptionPane.showMessageDialog(null,Atleta[indice].ganador());

    }
}
