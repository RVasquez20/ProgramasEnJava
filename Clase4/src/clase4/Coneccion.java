/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase4;
import Clases.Cliente;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author rodri
 */

public class Coneccion {
   
    public Connection conexionDB;
    static  Statement sentencia;
    public final String nameDB="db_empresa";


    public final String urlConexion=String.format("jdbc:mysql://localhost:3306/%s?useTimezone=true&serverTimezone=UTC",nameDB);
    public final String usuario="usr_empresa";
    public final String contraseña="Empres@123";
    public final String jdbc="com.mysql.cj.jdbc.Driver";
    public void abrirConcexion(){
       try{
           Class.forName(jdbc);
           conexionDB=DriverManager.getConnection(urlConexion,usuario,contraseña);
                sentencia=conexionDB.createStatement();
         
                   
       }catch(HeadlessException | ClassNotFoundException | SQLException ex){
           System.out.println("Error: "+ex);
       }
    }  
        public static void guardar(Cliente c){
         String Query="INSERT INTO clientes VALUES (default,"+"'"+c.getNit()+"','"+c.getNombre()+"','"+c.getApelido()+"','"+c.getDireccion()
                 +"','"+c.getTelefono()+"','"+c.getFechaDeNacimiento()+"')";
          try{
               sentencia.executeUpdate(Query);
            }catch(SQLException e){
                System.out.println("Error"+e.getMessage());
            }

        }    
  public void cerrarConecion(){
      try{
          conexionDB.close();
      }catch(SQLException ex){
          JOptionPane.showMessageDialog(null, "Error "+ex.getMessage());
      }
  }
}
