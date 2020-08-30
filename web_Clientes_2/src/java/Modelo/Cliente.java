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
private Conexion cn;
    public Cliente() {
    }

    public Cliente(String nit, int id, String Nombres, String Apellidos, String Direccion, String Telefono, String Fecha_Nacimiento) {
        super(id, Nombres, Apellidos, Direccion, Telefono, Fecha_Nacimiento);
        this.nit = nit;
    }

    public Cliente(String nit) {
        this.nit = nit;
    }

  


    
    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }
   public DefaultTableModel llenarEmpleado(){
    DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           cn = new Conexion();
           cn.abrirConcexion();
           
           String query;
            query = "SELECT idclientes as ID,Nit,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento FROM clientes";
            ResultSet consulta =  cn.conexionDB.createStatement().executeQuery(query);
            
            String encabezado [] = {"ID","NIT","Nombres","Apellidos","Direccion","Telefono","FechaDeNacimiento"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[7];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("ID");
                      datos[1] = consulta.getString("Nit");
                      datos[2] = consulta.getString("Nombres");
                      datos[3] = consulta.getString("Apellidos");
                      datos[4] = consulta.getString("Direccion");
                      datos[5] = consulta.getString("Telefono");
                      datos[6] = consulta.getString("FechaDeNacimiento");
                      
                      tblModelo.addRow(datos);
                    }
              cn.cerrarConecion();
              
              return  tblModelo;            
                 }
                 
        catch(SQLException ex)
            {
                  cn.cerrarConecion();
                    System.out.println(ex.getMessage());
                    return  tblModelo;
            }    
        
    }
    @Override
  public int Agregar(){
      int retorno=0;
  try{
      cn=new Conexion();
      PreparedStatement Parametro;
      String Query="INSERT INTO clientes(Nit,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento)VALUES(?,?,?,?,?,?)";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1, getNit());
      Parametro.setString(2, getNombres());
      Parametro.setString(3, getApellidos());
      Parametro.setString(4, getDireccion() );
      Parametro.setString(5, getTelefono() );
      Parametro.setString(6, getFecha_Nacimiento());
      retorno=Parametro.executeUpdate();
      cn.cerrarConecion();
  }catch(SQLException ex){
      System.out.println("ERROR:"+ex.getMessage());
      retorno=0;
  }
  return retorno;
  }  
  @Override
  public int Modificar(){
       int retorno=0;
  try{
      cn=new Conexion();
      PreparedStatement Parametro;
      String Query="UPDATE clientes SET Nit =?,Nombres=?,Apellidos=?,Direccion=?,Telefono=?,FechaDeNacimiento=? WHERE idclientes=?;";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1, getNit());
      Parametro.setString(2, getNombres());
      Parametro.setString(3, getApellidos());
      Parametro.setString(4, getDireccion() );
      Parametro.setString(5, getTelefono() );
      Parametro.setString(6, getFecha_Nacimiento());
      Parametro.setInt(7,getId());
      retorno=Parametro.executeUpdate();
      cn.cerrarConecion();
  }catch(SQLException ex){
      System.out.println("ERROR:"+ex.getMessage());
      retorno=0;
  }
  return retorno;
  }
  @Override
  public int Eliminar(){
  int retorno=0;
  try{
   cn=new Conexion();
  PreparedStatement Parametro;
      String Query="DELETE FROM clientes WHERE idclientes=?;";
      cn.abrirConcexion();
       Parametro=cn.conexionDB.prepareStatement(Query);
        Parametro.setInt(1,getId()); 
          retorno=Parametro.executeUpdate();
      
  cn.cerrarConecion();
  }catch(SQLException ex){
      System.out.println("Error: =>"+ex.getMessage());
  }
  return retorno;
  }
}
