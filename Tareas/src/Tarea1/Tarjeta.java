/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tarea1;

/**
 *
 * @author rodri
 */
public class Tarjeta {
    private String noTarjeta,uso;
    private Vehiculo vehiculo;
    public Tarjeta() {
    }

    public Tarjeta(String noTarjeta, String uso, Vehiculo vehiculo) {
        this.noTarjeta = noTarjeta;
        this.uso = uso;
        this.vehiculo = vehiculo;
    }

    public String getNoTarjeta() {
        return noTarjeta;
    }

    public void setNoTarjeta(String noTarjeta) {
        this.noTarjeta = noTarjeta;
    }

    public String getUso() {
        return uso;
    }

    public void setUso(String uso) {
        this.uso = uso;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
            
    public void agregar() {
        
        System.out.println("No Tarjeta: "+this.getNoTarjeta());
        System.out.println("USO: "+this.getUso());

 
    }
    
}
