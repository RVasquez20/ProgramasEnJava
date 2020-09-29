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
  private int idProducto,idMarca,existencia;
    private String producto;
    private String Descripcion;
    private double precio_costo;
    private double precio_venta;
    private Conexion cn;

    public Estudiantes(int idProducto, int idMarca, int existencia, String producto, String Descripcion, double precio_costo, double precio_venta) {
        this.idProducto = idProducto;
        this.idMarca = idMarca;
        this.existencia = existencia;
        this.producto = producto;
        this.Descripcion = Descripcion;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
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
            query = "SELECT a.idProducto as ID,a.producto,e.idmarca,e.marca,a.Descripcion,a.precio_costo,a.precio_venta,a.existencia FROM productos as a inner join marcas as e where e.idmarca=a.idMarca;";
            ResultSet consulta =  cn.conexionDB.createStatement().executeQuery(query);
            
           String encabezado [] = {"ID","Producto","idMarcas","Marca","Descripcion","Precio Costo","Precio Venta","Existencias"};

            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[8];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("ID");
                      datos[1] = consulta.getString("producto");
                      datos[2] = consulta.getString("idmarca");
                      datos[3] = consulta.getString("marca");
                      datos[4] = consulta.getString("Descripcion");
                      datos[5] = consulta.getString("precio_costo");
                      datos[6] = consulta.getString("precio_venta");
                      datos[7] = consulta.getString("existencia");

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
 
 /*

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

    */

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(double precio_costo) {
        this.precio_costo = precio_costo;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }
}
