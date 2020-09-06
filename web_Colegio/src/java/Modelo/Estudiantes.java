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
public class Estudiantes{
    private int id;
    private String Nombres,Apellidos,Direccion,Telefono,Fecha_Nacimiento,Correo;
    private String Carne;
    private int idSangre;
   private Conexion cn;

    public Estudiantes(String Carne, int idSangre, int id, String Nombres, String Apellidos, String Direccion, String Telefono, String Fecha_Nacimiento, String Correo) {
        this.id=id;
        this.Carne = Carne;
        this.Nombres=Nombres;
        this.Apellidos=Apellidos;
        this.Direccion=Direccion;
        this.Telefono=Telefono;
        this.Correo=Correo;
        this.Fecha_Nacimiento=Fecha_Nacimiento;
        this.idSangre = idSangre;
    }


 

    public Estudiantes() {
    }



    public DefaultTableModel ListadoEstudiantes(){
    DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           cn = new Conexion();
           cn.abrirConcexion();
           
           String query;
            query = "SELECT e.idEstudiantes as ID,e.Carne,e.Nombres,e.Apellidos,e.Direccion,e.Telefono,e.Correo,e.FechaDeNacimiento,s.TipoDeSangre,s.idtipo_sangre FROM estudiantes as e inner join tipo_sangre as s on e.id_TipoDeSangre = s.idtipo_sangre order by ID;";
            ResultSet consulta =  cn.conexionDB.createStatement().executeQuery(query);
            
            String encabezado [] = {"ID","Carne","Nombres","Apellidos","Direccion","Telefono","Correo","FechaDeNacimiento","Sangre","id_Sangre"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[10];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("ID");
                      datos[1] = consulta.getString("Carne");
                      datos[2] = consulta.getString("Nombres");
                      datos[3] = consulta.getString("Apellidos");
                      datos[4] = consulta.getString("Direccion");
                      datos[5] = consulta.getString("Telefono");
                      datos[6] = consulta.getString("Correo");
                      datos[7] = consulta.getString("FechaDeNacimiento");
                      datos[8] = consulta.getString("TipoDeSangre");
                      datos[9] = consulta.getString("idtipo_sangre");
                      
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
 
 

  public int Agregar(){
      int retorno=0;
  try{
      cn=new Conexion();
      PreparedStatement Parametro;
      String Query="INSERT INTO estudiantes(Carne,Nombres,Apellidos,Direccion,Telefono,Correo,FechaDeNacimiento,id_TipoDeSangre)VALUES(?,?,?,?,?,?,?,?)";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1,getCarne());
      Parametro.setString(2, getNombres());
      Parametro.setString(3, getApellidos());
      Parametro.setString(4, getDireccion() );
      Parametro.setString(5, getTelefono());
      Parametro.setString(6, getCorreo());
      Parametro.setString(7, getFecha_Nacimiento());
      Parametro.setInt(8, getIdSangre());
      retorno=Parametro.executeUpdate();
      cn.cerrarConecion();
  }catch(SQLException ex){
      System.out.println("ERROR:"+ex.getMessage());
      retorno=0;
  }
  return retorno;
  }  
  
    public int Modificar(){
       int retorno=0;
  try{
      cn=new Conexion();
      PreparedStatement Parametro;
      String Query="UPDATE estudiantes SET Carne =?,Nombres=?,Apellidos=?,Direccion=?,Telefono=?,Correo=?,FechaDeNacimiento=?,id_TipoDeSangre=? WHERE idEstudiantes=?;";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1, getCarne());
      Parametro.setString(2, getNombres());
      Parametro.setString(3, getApellidos());
      Parametro.setString(4, getDireccion() );
      Parametro.setString(5, getTelefono() );
      Parametro.setString(6, getCorreo());
      Parametro.setString(7, getFecha_Nacimiento());
      Parametro.setInt(8, this.getIdSangre());
      Parametro.setInt(9,this.getId());
      retorno=Parametro.executeUpdate();
      cn.cerrarConecion();
  }catch(SQLException ex){
      System.out.println("ERROR:"+ex.getMessage());
      retorno=0;
  }
  return retorno;
  }

  public int Eliminar(){
  int retorno=0;
  try{
   cn=new Conexion();
  PreparedStatement Parametro;
      String Query="DELETE FROM estudiantes WHERE idEstudiantes=?;";
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

    public String getCarne() {
        return Carne;
    }

    public void setCarne(String Carne) {
        this.Carne = Carne;
    }

    public int getIdSangre() {
        return idSangre;
    }

    public void setIdSangre(int idSangre) {
        this.idSangre = idSangre;
    }
      public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getFecha_Nacimiento() {
        return Fecha_Nacimiento;
    }

    public void setFecha_Nacimiento(String Fecha_Nacimiento) {
        this.Fecha_Nacimiento = Fecha_Nacimiento;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }
}
