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
 * @author andrea
 */
public class productos {
    private int idproducto,idmarca,existencia;
    private double precio_costo,precio_venta;
    private String producto,descripcion;
    private conexion con;
    public productos() {
    }

    public productos(int idproducto, int idmarca, int existencia, double precio_costo, double precio_venta, String producto, String descripcion) {
        this.idproducto = idproducto;
        this.idmarca = idmarca;
        this.existencia = existencia;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
        this.producto = producto;
        this.descripcion = descripcion;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getIdmarca() {
        return idmarca;
    }

    public void setIdmarca(int idmarca) {
        this.idmarca = idmarca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
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

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public DefaultTableModel Lista(){
        DefaultTableModel tabla=new DefaultTableModel();
        try {
            con=new conexion();
            con.abrirconexion();
            String query="SELECT p.idProductos as id,p.producto,m.marca,p.id_Marca,p.descripcion,p.precio_costo,p.precio_venta,p.existencia FROM productos as p inner join marcas as m on p.id_Marca=m.idmarcas order by id;";
            ResultSet consulta=con.conexionbd.createStatement().executeQuery(query);
            String encabezado[]={"id","Producto","Descripcion","Marca","Precio Costo","Precio venta","Existencia","id_Marca"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[]=new String[8];
            while (consulta.next()) {
                datos[0]=consulta.getString("id");
                datos[1]=consulta.getString("producto");
                datos[2]=consulta.getString("marca");
                datos[3]=consulta.getString("descripcion");
                datos[4]=consulta.getString("precio_costo");
                datos[5]=consulta.getString("precio_venta");
                datos[6]=consulta.getString("existencia");
                datos[7]=consulta.getString("id_Marca");
                tabla.addRow(datos);
                }
            
            con.cerrarconexion();
            return tabla;
        } catch (SQLException e) {
                System.out.println("Error->"+e.getMessage());
                return tabla;
        }
        
    }
    public int agregar(){
        int retorno=0;
        try {
            con=new conexion();
            PreparedStatement parametro;
            String query="INSERT INTO productos(producto,id_Marca,descripcion,precio_costo,precio_venta,existencia)VALUES(?,?,?,?,?,?);";
            con.abrirconexion();
            parametro=con.conexionbd.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setInt(2, getIdmarca());
            parametro.setString(3,getDescripcion());
            parametro.setDouble(4,getPrecio_costo());
            parametro.setDouble(5,getPrecio_venta());
            parametro.setInt(6, getExistencia());
                    retorno=parametro.executeUpdate();
            con.cerrarconexion(); 
            return retorno;
        } catch (SQLException e) {
            System.out.println("Error->"+e.getMessage());
              return retorno;
        }
      
    }
        public int modificar(){
        int retorno=0;
        try {
            con=new conexion();
            PreparedStatement parametro;
            String query="UPDATE  productos SET producto=? ,id_Marca=?,descripcion=?,precio_costo=?,precio_venta=?,existencia=? WHERE idProductos=?;";
            con.abrirconexion();
            parametro=con.conexionbd.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setInt(2, getIdmarca());
            parametro.setString(3,getDescripcion());
            parametro.setDouble(4,getPrecio_costo());
            parametro.setDouble(5,getPrecio_venta());
            parametro.setInt(6, getExistencia());
            parametro.setInt(7,getIdproducto());
            
                    retorno=parametro.executeUpdate();
            con.cerrarconexion(); 
            return retorno;
        } catch (SQLException e) {
            System.out.println("Error->"+e.getMessage());
              return retorno;
        }
      
    }
             public int eliminar(){
        int retorno=0;
        try {
            con=new conexion();
            PreparedStatement parametro;
            String query="DELETE FROM productos WHERE idProductos=?;";
            con.abrirconexion();
            parametro=con.conexionbd.prepareStatement(query);
            
            parametro.setInt(1,getIdproducto());
            
                    retorno=parametro.executeUpdate();
            con.cerrarconexion(); 
            return retorno;
        } catch (SQLException e) {
            System.out.println("Error->"+e.getMessage());
              return retorno;
        }
      
    }
        
}
