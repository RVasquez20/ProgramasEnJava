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
public class Vehiculo {
    private String serie;
    private String motor;
    private String cilindros;
    private String marca;
    private String modelo;
    private String linea;
    private String asientos;

    private String placa;
    private String chasis;
    private Tipo Tipe;

    public Vehiculo() {
    }

    public Vehiculo(String serie, String motor, String cilindros, String marca, String modelo, String linea, String asientos, String placa, String chasis, Tipo Tipe) {
        this.serie = serie;
        this.motor = motor;
        this.cilindros = cilindros;
        this.marca = marca;
        this.modelo = modelo;
        this.linea = linea;
        this.asientos = asientos;
        this.placa = placa;
        this.chasis = chasis;
        this.Tipe = Tipe;
    }
    

  

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public String getCilindros() {
        return cilindros;
    }

    public void setCilindros(String cilindros) {
        this.cilindros = cilindros;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public String getAsientos() {
        return asientos;
    }

    public void setAsientos(String asientos) {
        this.asientos = asientos;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getChasis() {
        return chasis;
    }

    public void setChasis(String chasis) {
        this.chasis = chasis;
    }

    public Tipo getTipe() {
        return Tipe;
    }

    public void setTipe(Tipo Tipe) {
        this.Tipe = Tipe;
    }
public void agregar(){
        System.out.println("Asientos"+this.getAsientos());
        System.out.println("Chasis:"+this.getChasis());
        System.out.println("Cilindros:"+this.getCilindros());
        System.out.println("Linea: "+this.getLinea());
        System.out.println("Marca: "+this.getMarca());
        System.out.println("Modelo: "+this.getModelo());
        System.out.println("Motor: "+this.getMotor());
        System.out.println("Placa:"+this.getPlaca());
        System.out.println("Serie:"+this.getSerie());
    
}
    
}
