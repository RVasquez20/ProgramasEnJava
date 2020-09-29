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
public class Productos{
   
 private int Id_Producto,Id_Marca,Existencias;
    private double PrecioCosto,PrecioVenta;
    private String Producto,Descripcion;
    private Conexion cn;
    public Productos() {
    }

    public Productos(int Id_Producto, int Id_Marca, int Existencias, double PrecioCosto, double PrecioVenta, String Producto, String Descripcion) {
        this.Id_Producto = Id_Producto;
        this.Id_Marca = Id_Marca;
        this.Existencias = Existencias;
        this.PrecioCosto = PrecioCosto;
        this.PrecioVenta = PrecioVenta;
        this.Producto = Producto;
        this.Descripcion = Descripcion;
    }
    


    public DefaultTableModel listadoDeProductos(){
    DefaultTableModel tblModelo= new DefaultTableModel();
           try
            {
           cn = new Conexion();
           cn.abrirConcexion();
           
           String query;
            query = "select p.IdProductos as ID,p.Producto,m.IdMarcas,m.Marca,p.Descripcion,p.Precio_Costo,p.Precio_Venta,p.Existencia from productos as p inner join marcas as m where m.IdMarcas=p.Id_Marca order by ID;";
            ResultSet consulta =  cn.conexionDB.createStatement().executeQuery(query);
            
            String encabezado [] = {"ID","Producto","Descripcion","IdMarca","Marca","Precio Costo","Precio Venta","Existencias"};
            
            tblModelo.setColumnIdentifiers(encabezado);
            
            String datos[]= new String[8];      
            while (consulta.next())
                    {           
                      datos[0] = consulta.getString("ID");
                      datos[1] = consulta.getString("Producto");
                      datos[2] = consulta.getString("IdMarcas");
                      datos[3] = consulta.getString("Marca");
                      datos[4] = consulta.getString("Descripcion");
                      datos[5] = consulta.getString("Precio_Costo");
                      datos[6] = consulta.getString("Precio_Venta");
                      datos[7] = consulta.getString("Existencia");
                     
                      
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
      String Query="INSERT INTO productos(Producto,Id_Marca,Descripcion,Precio_Costo,Precio_Venta,Existencia)VALUES(?,?,?,?,?,?);";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1,getProducto());
      Parametro.setInt(2, this.getId_Marca());
      Parametro.setString(3, getDescripcion());
      Parametro.setDouble(4, getPrecioCosto() );
      Parametro.setDouble(5, getPrecioVenta());
      Parametro.setInt(6, getExistencias());
      retorno=Parametro.executeUpdate();
      cn.cerrarConecion();
      return retorno;
  }catch(SQLException ex){
      System.out.println("ERROR:"+ex.getMessage());
      return retorno;
  }
  
  }  
    
    public int Modificar(){
       int retorno=0;
  try{
      cn=new Conexion();
      PreparedStatement Parametro;
      String Query="UPDATE productos SET Producto =?,Id_Marca=?,Descripcion=?,Precio_Costo=?,Precio_Venta=?,Existencia=? WHERE IdProductos=?;";
      cn.abrirConcexion();
      Parametro=cn.conexionDB.prepareStatement(Query);
      Parametro.setString(1, getProducto());
      Parametro.setInt(2, getId_Marca());
      Parametro.setString(3, getDescripcion());
      Parametro.setDouble(4, getPrecioCosto());
      Parametro.setDouble(5, getPrecioVenta() );
      Parametro.setInt(6, getExistencias());
      Parametro.setInt(7, getId_Producto());
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
      String Query="DELETE FROM productos WHERE IdProductos=?;";
      cn.abrirConcexion();
       Parametro=cn.conexionDB.prepareStatement(Query);
        Parametro.setInt(1,getId_Producto()); 
          retorno=Parametro.executeUpdate();
      
  cn.cerrarConecion();
  return retorno;
  }catch(SQLException ex){
      System.out.println("Error: =>"+ex.getMessage());
      return retorno;
  }
  
  }

    public int getId_Producto() {
        return Id_Producto;
    }

    public void setId_Producto(int Id_Producto) {
        this.Id_Producto = Id_Producto;
    }

    public int getId_Marca() {
        return Id_Marca;
    }

    public void setId_Marca(int Id_Marca) {
        this.Id_Marca = Id_Marca;
    }

    public int getExistencias() {
        return Existencias;
    }

    public void setExistencias(int Existencias) {
        this.Existencias = Existencias;
    }

    public double getPrecioCosto() {
        return PrecioCosto;
    }

    public void setPrecioCosto(double PrecioCosto) {
        this.PrecioCosto = PrecioCosto;
    }

    public double getPrecioVenta() {
        return PrecioVenta;
    }

    public void setPrecioVenta(double PrecioVenta) {
        this.PrecioVenta = PrecioVenta;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

   
}
