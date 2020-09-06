package Polimorfismo;

import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        Vehiculo VehiculoArr[]=new Vehiculo[4];
        VehiculoArr[0]=new Vehiculo("12CB","Ferrari","A2");
        VehiculoArr[1]=new VehiculoDeportivo("122c","Audi","A8",12);
        VehiculoArr[2]=new VehiculoDeTurismo("12Tur","Toyota","XD",4);
        VehiculoArr[3]=new VehiculoFulgoneta("12Fulg","Nissan","Fulgoneta",15);
        for(Vehiculo i:VehiculoArr){
            System.out.println(i.MostrarDatos());
            System.out.println("--------------------------------------------------");
        }
        Vehiculo ejemplo=new VehiculoDeportivo("122c","Audi","A8",12);
        System.out.println(ejemplo.MostrarDatos());

    }
}
