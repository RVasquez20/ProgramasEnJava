/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.awt.HeadlessException;
import java.sql.*;
/**
 *
 * @author rodri
 */
public class Conexion {
    public Connection conexionDB;
    public final String Name="db_empresa";
    public final String url=String.format("jdbc:mysql://localhost:3306/%s?useTimezone=true&serverTimezone=UTC",Name);
    public final String User="usr_empresa";
    public final String Password="Empres@123";
    public final String jdbc="com.mysql.jdbc.Driver";
    public void Open_Conection(){
      try{
          Class.forName(jdbc);
         conexionDB=DriverManager.getConnection(url, User, Password);

      }catch(SQLException |HeadlessException|ClassNotFoundException ex){
          System.out.println("Error: "+ex.getMessage());
      }
    }
    public void Close_Conection(){
              try{
         
         conexionDB.close();
      }catch(SQLException ex){
          System.out.println("Error: "+ex.getMessage());
      }
    }
    
}
