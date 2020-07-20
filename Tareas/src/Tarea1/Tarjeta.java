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
        System.out.println("Asientos"+this.vehiculo.getAsientos());
        System.out.println("Chasis:"+this.vehiculo.getChasis());
        System.out.println("Cilindros:"+this.vehiculo.getCilindros());
        System.out.println("Linea: "+this.vehiculo.getLinea());
        System.out.println("Marca: "+this.vehiculo.getMarca());
        System.out.println("Modelo: "+this.vehiculo.getModelo());
        System.out.println("Motor: "+this.vehiculo.getMotor());
        System.out.println("Placa:"+this.vehiculo.getPlaca());
        System.out.println("Serie:"+this.vehiculo.getSerie());
        System.out.println("Tipo:"+this.vehiculo.getTipe().getTipo());
    }
    
}
