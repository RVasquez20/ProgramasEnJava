/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.SQLException;


/**
 *
 * @author rodri
 */

public class Conexion {
   
    public Connection conexionDB;
    public final String nameDB="db_parcialii";
    public final String urlConexion=String.format("jdbc:mysql://localhost:3306/%s?useTimezone=true&serverTimezone=UTC",nameDB);
    public final String usuario="user_Parcial";
    public final String contraseña="supermerc@do123";
    public final String jdbc="com.mysql.cj.jdbc.Driver";
    public void abrirConcexion(){
       try{
           Class.forName(jdbc);
           conexionDB=DriverManager.getConnection(urlConexion,usuario,contraseña);
          
       }catch(HeadlessException | ClassNotFoundException | SQLException ex){
           System.out.println("Error: "+ex);
       }
    }  
      
  public void cerrarConecion(){
      try{
          conexionDB.close();
      }catch(SQLException ex){
          
      }
  }
}
