package Ejercicios;

import com.sun.jdi.PathSearchingVirtualMachine;

import javax.crypto.spec.PBEKeySpec;
import java.util.function.DoubleFunction;

public class Ejercicio3 {
    private int numeroAtleta;
    private String nombreAtleta;
    private float tiempoAtleta;

    public Ejercicio3(int numeroAtleta, String nombreAtleta, float tiempoAtleta) {
        this.numeroAtleta = numeroAtleta;
        this.nombreAtleta = nombreAtleta;
        this.tiempoAtleta = tiempoAtleta;
    }

    public float getTiempoAtleta() {
        return tiempoAtleta;
    }

    public String ganador(){
        return "El Ganador es \n Nombre: "+nombreAtleta+"\n Numero de atleta: "+numeroAtleta+"\n Con tiempo de : "+tiempoAtleta;
    }


}
