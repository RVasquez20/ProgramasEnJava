/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tarea1;

import java.util.Date;

/**
 *
 * @author rodri
 */
public class Propietario extends Persona {
    protected String nit;
    protected double cui;

    public Propietario() {
    }



    public Propietario(String nit, double cui, String nombre, String apellido, String direccion, int telefono,String fechaDeNacimiento) {
        super(nombre, apellido, direccion, telefono,fechaDeNacimiento);
        this.nit = nit;
        this.cui = cui;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public double getCui() {
        return cui;
    }

    public void setCui(double cui) {
        this.cui = cui;
    }
    
    @Override
    public String agregar() { 
        String x="";
        x+="\n-------------------------------------------------\n"
                + "Nombre: "+this.getNombre()
        +"\nApellido: "+this.getApellido()
        +"\nDireccion: "+this.getDireccion()
        +"\nTelefono: "+this.getTelefono()
        +"\nFecha De Nacimiento: "+this.getFechaDeNacimiento()
       +"\nEdad: "+(calcularEdad(this.getFechaDeNacimiento()))
        +"\nNIT: "+this.getNit()
        +"\nCUI: "+this.getCui();
        return x;
    }
    
}
