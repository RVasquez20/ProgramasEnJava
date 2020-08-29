/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.*;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author rodri
 */
public class Empleado extends Persona{
    private String Codigo;
    private int idPuesto;
   private Conexion cn;

 

    public Empleado() {
    }

    public Empleado(String Codigo, int idPuesto, int id, String Nombres, String Apellidos, String Direccion, String Telefono, String Fecha_Nacimiento) {
        super(id, Nombres, Apellidos, Direccion, Telefono, Fecha_Nacimiento);
        this.Codigo = Codigo;
        this.idPuesto = idPuesto;
    }

    public Empleado(String Codigo, int idPuesto) {
        this.Codigo = Codigo;
        this.idPuesto = idPuesto;
    }


    public DefaultTableModel llenarEmpleado(){
    DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           cn = new Conexion();
           cn.abrirConcexion();
           
           String query;
            query = "SELECT e.idEmpleados as ID,e.Codigo,e.Nombres,e.Apellidos,e.Direccion,e.Telefono,e.FechaDeNacimiento,p.Puesto,p.idPuestos FROM empleados as e inner join puestos as p on e.id_Puesto = p.idPuestos order by ID;";
            ResultSet consulta =  cn.conexionDB.createStatement().executeQuery(query);
            
            String encabezado [] = {"ID","Codigo","Nombres","Apellidos","Direccion","Telefono","FechaDeNacimiento","Puesto","id_Puesto"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[9];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("ID");
                      datos[1] = consulta.getString("Codigo");
                      datos[2] = consulta.getString("Nombres");
                      datos[3] = consulta.getString("Apellidos");
                      datos[4] = consulta.getString("Direccion");
                      datos[5] = consulta.getString("Telefono");
                      datos[6] = consulta.getString("FechaDeNacimiento");
                      datos[7] = consulta.getString("Puesto");
                      datos[8] = consulta.getString("idPuestos");
                      
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
      String Query="INSERT INTO empleados(Codigo,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento,id_Puesto)VALUES(?,?,?,?,?,?,?)";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1, getCodigo());
      Parametro.setString(2, getNombres());
      Parametro.setString(3, getApellidos());
      Parametro.setString(4, getDireccion() );
      Parametro.setString(5, getTelefono() );
      Parametro.setString(6, getFecha_Nacimiento());
      Parametro.setInt(7, getIdPuesto());
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
      String Query="UPDATE empleados SET Codigo =?,Nombres=?,Apellidos=?,Direccion=?,Telefono=?,FechaDeNacimiento=?,id_Puesto=? WHERE idEmpleados=?;";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1, getCodigo());
      Parametro.setString(2, getNombres());
      Parametro.setString(3, getApellidos());
      Parametro.setString(4, getDireccion() );
      Parametro.setString(5, getTelefono() );
      Parametro.setString(6, getFecha_Nacimiento());
      Parametro.setInt(7, getIdPuesto());
      Parametro.setInt(8,getId());
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
      String Query="DELETE FROM empleados WHERE idEmpleados=?;";
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

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    
}
