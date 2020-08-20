/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import clase4.Coneccion;
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
Coneccion cn;
    public Cliente() {
    }

    public Cliente(String nit) {
        this.nit = nit;
    }

    public Cliente(String nit, String nombre, String apelido, String telefono, String direccion, String fechaDeNacimiento) {
        super(nombre, apelido, telefono, direccion, fechaDeNacimiento);
        this.nit = nit;
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

       public DefaultTableModel Leer() {
           DefaultTableModel tabla=new DefaultTableModel();
           try{
               cn=new Coneccion();
               cn.abrirConcexion();
               String Query="select idclientes as ID,Nit,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento from clientes";
               ResultSet consulta=cn.conexionDB.createStatement().executeQuery(Query);
               String encabezado[]={"ID","Nit","Nombres","Apellidos","Direccion","Telefono","Fecha De Nacimiento"};
               tabla.setColumnIdentifiers(encabezado);
               String Datos[]=new String[7];
               while(consulta.next()){
                   Datos[0]=consulta.getString("ID");
                   Datos[1]=consulta.getString("Nit");
                   Datos[2]=consulta.getString("Nombres");
                   Datos[3]=consulta.getString("Apellidos");
                   Datos[4]=consulta.getString("Direccion");
                   Datos[5]=consulta.getString("Telefono");
                   Datos[6]=consulta.getString("FechaDeNacimiento");
                   tabla.addRow(Datos);
               }
               cn.cerrarConecion();
               
           }catch(SQLException ex){
                 cn.cerrarConecion();
               System.out.println("Error "+ex.getMessage());
           }
        return tabla;
        }
       
       public void Agregar(){
      
           try{
               cn=new Coneccion();
               PreparedStatement ptm;
               cn.abrirConcexion();
               String Query="INSERT INTO clientes (Nit,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento) VALUES (?,?,?,?,?,?)";
               ptm=(PreparedStatement)cn.conexionDB.prepareStatement(Query);
               ptm.setString(1, getNit());
               ptm.setString(2, getNombre());
               ptm.setString(3, getApelido());
               ptm.setString(4, getDireccion());
               ptm.setString(5, getTelefono());
               ptm.setString(6, getFechaDeNacimiento());
               int ejecutar=ptm.executeUpdate();
               cn.cerrarConecion();
               JOptionPane.showMessageDialog(null,"Se han Insertado "+Integer.toString(ejecutar)+" registros","Mensaje",JOptionPane.INFORMATION_MESSAGE);
           }catch(SQLException ex){
               System.out.println("Error"+ex);
           }
       }
       public void Modificar(String x){
            try{
               cn=new Coneccion();
               PreparedStatement ptm;
               cn.abrirConcexion();
               String Query="update clientes set Nit=?,Nombres=?,Apellidos=?,Direccion=?,Telefono=?,FechaDeNacimiento=? where idclientes=?";
               
               ptm=(PreparedStatement)cn.conexionDB.prepareStatement(Query);
               ptm.setString(1, getNit());
               ptm.setString(2, getNombre());
               ptm.setString(3, getApelido());
               ptm.setString(4, getDireccion());
               ptm.setString(5, getTelefono());
               ptm.setString(6, getFechaDeNacimiento());
               ptm.setString(7, x);
               int ejecutar=ptm.executeUpdate();
               cn.cerrarConecion();
               JOptionPane.showMessageDialog(null,"Se han Actualizado "+Integer.toString(ejecutar)+" registros","Mensaje",JOptionPane.INFORMATION_MESSAGE);
           }catch(SQLException ex){
               System.out.println("Error"+ex);
           }
       }    
       public void Eliminar(String x){
                       try{
               cn=new Coneccion();
               PreparedStatement ptm;
               cn.abrirConcexion();
               String Query="delete from clientes where idclientes=?";
               
               ptm=(PreparedStatement)cn.conexionDB.prepareStatement(Query);
               ptm.setString(1, x);
               int ejecutar=ptm.executeUpdate();
               cn.cerrarConecion();
               JOptionPane.showMessageDialog(null,"Se han Eliminado "+Integer.toString(ejecutar)+" registros","Mensaje",JOptionPane.INFORMATION_MESSAGE);
           }catch(SQLException ex){
               System.out.println("Error"+ex);
           }
       }

    private String getApellidos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
