/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.Conexion;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author rodri
 */
public class Cliente extends Persona {
private String nit;
Conexion cn;
    public Cliente() {
    }

    public Cliente(String nit) {
        this.nit = nit;
    }

    public Cliente(String nit, Conexion cn, int id, String Nombres, String Apellidos, String Direccion, String Telefono, String Fecha_Nacimiento) {
        super(id, Nombres, Apellidos, Direccion, Telefono, Fecha_Nacimiento);
        this.nit = nit;
        this.cn = cn;
    }

    public Cliente(String nit, Conexion cn) {
        this.nit = nit;
        this.cn = cn;
    }

    
    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
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

      public int Agregar(){return 0;}
      public int Modificar(){return 0;}
      public int Eliminar(){return 0;}
}
