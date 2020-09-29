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
 * @author andrea
 */
public class conexion {
    
    public Connection conexionbd;
    public final String nombre="db_Parcial_Andrea";
    public final String url=String.format("jdbc:mysql://localhost:3306/%s?useTimezone=true&serverTimezone=UTC",nombre);
    public final String usuario="usr_andrea";
    public final String contraseña="andreaparcial123";
    public final String jdbc="com.mysql.cj.jdbc.Driver";
    public void abrirconexion(){
        try{
            Class.forName(jdbc);
            conexionbd=DriverManager.getConnection(url,usuario,contraseña);
            System.out.println("Exito");
        }catch(HeadlessException|ClassNotFoundException|SQLException ex){
            System.out.println("Error->"+ex.getMessage());
        }
    }
    public void cerrarconexion(){
        try{
            conexionbd.close();
        }catch(SQLException ex){
                System.out.println("Error->"+ex.getMessage());
        }
    }
 
    
}
