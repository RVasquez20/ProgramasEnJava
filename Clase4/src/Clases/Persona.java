/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author rodri
 */
public abstract class Persona {
    private String nombre,apelido,telefono,direccion,fechaDeNacimiento;

    public Persona() {
    }

    public Persona(String nombre, String apelido, String telefono, String direccion, String fechaDeNacimiento) {
        this.nombre = nombre;
        this.apelido = apelido;
        this.telefono = telefono;
        this.direccion = direccion;
        this.fechaDeNacimiento = fechaDeNacimiento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFechaDeNacimiento() {
        return fechaDeNacimiento;
    }

    public void setFechaDeNacimiento(String fechaDeNacimiento) {
        this.fechaDeNacimiento = fechaDeNacimiento;
    }
   public abstract int calcularEdad(String fecha);
    public abstract void Agregar();
    public abstract void Modificar(String x);
    public abstract void Eliminar(String x);
}
