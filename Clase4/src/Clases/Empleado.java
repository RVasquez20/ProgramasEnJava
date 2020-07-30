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
public class Empleado extends Persona{
    private String codigoEmpleado,puesto;

    public Empleado() {
    }

    
    public Empleado(String codigoEmpleado, String puesto) {
        this.codigoEmpleado = codigoEmpleado;
        this.puesto = puesto;
    }

    public Empleado(String codigoEmpleado, String puesto, String nombre, String apelido, String telefono, String direccion, String fechaDeNacimiento) {
        super(nombre, apelido, telefono, direccion, fechaDeNacimiento);
        this.codigoEmpleado = codigoEmpleado;
        this.puesto = puesto;
    }
      public int calcularEdad(String fecha){
   Date fechaNac=null;
       try {
          
           fechaNac = new SimpleDateFormat("dd-MM-yyyy").parse(fecha);
       } catch (ParseException | NullPointerException ex) {
           System.out.println("Error:");
       }
      
       Calendar fechaNacimiento = Calendar.getInstance();
       Calendar fechaActual = Calendar.getInstance();
       fechaNacimiento.setTime(fechaNac);
       int año = fechaActual.get(Calendar.YEAR)- fechaNacimiento.get(Calendar.YEAR);
       int mes =fechaActual.get(Calendar.MONTH)- fechaNacimiento.get(Calendar.MONTH);
       int dia = fechaActual.get(Calendar.DATE)- fechaNacimiento.get(Calendar.DATE);
       if(mes<0 || (mes==0 && dia<0)){
           año--;
       }
       return año;
   }
    public void Agregar(){
           
       }
    public void Modificar(String x){
           
       }
    public void Eliminar(String x){
           
       }
}
