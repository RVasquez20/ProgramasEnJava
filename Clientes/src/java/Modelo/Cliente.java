/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.Conexion;
import Modelo.Persona;
import java.sql.*;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author rodri
 */
public class Cliente extends Persona {
    private String Nit;
    private Conexion con;

    public Cliente() {
    }

    public Cliente(String Nit, int id, String Nombres, String Apellidos, String Direccion, String Telefono, String FechaDeNacimiento) {
        super(id, Nombres, Apellidos, Direccion, Telefono, FechaDeNacimiento);
        this.Nit = Nit;
    }

        public DefaultTableModel Lista(){
            DefaultTableModel tabla=new DefaultTableModel();
            try{
                con=new Conexion();
                con.Open_Conection();
                String Query="SELECT idclientes as ID,Nit,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento FROM clientes order by ID;";
                ResultSet Consulta=con.conexionDB.createStatement().executeQuery(Query);
                String[] Encabezado={"ID","NIT","Nombres","Apellidos","Direccion","Telefono","FechaDeNacimiento"};
                tabla.setColumnIdentifiers(Encabezado);
                String[] datos=new String[7];
                while(Consulta.next()){
                    datos[0]=Consulta.getString("ID");
                    datos[1]=Consulta.getString("Nit");
                    datos[2]=Consulta.getString("Nombres");
                    datos[3]=Consulta.getString("Apellidos");
                    datos[4]=Consulta.getString("Direccion");
                    datos[5]=Consulta.getString("Telefono");
                    datos[6]=Consulta.getString("FechaDeNacimiento");
                    tabla.addRow(datos);
                }
                con.Close_Conection();
            }catch(SQLException ex){
                System.out.println("Error"+ex.getMessage());
            }
            return tabla;
        }
    
    @Override
    public int Agregar() {
        int retorno = 0;
        try{
            con=new Conexion();
            PreparedStatement Parametro;
            String Query="INSERT INTO clientes(Nit,Nombres,Apellidos,Direccion,Telefono,FechaDeNacimiento)VALUES(?,?,?,?,?,?,?);";
            con.Open_Conection();
            Parametro=con.conexionDB.prepareStatement(Query);
            Parametro.setString(1,getNit());
            Parametro.setString(2,getNombres());
            Parametro.setString(3,getApellidos());
            Parametro.setString(4,getDireccion());
            Parametro.setString(5,getTelefono());
            Parametro.setString(6,getFechaDeNacimiento());
            retorno=Parametro.executeUpdate();
            con.Close_Conection();
        }catch(SQLException ex){
            
            System.out.println("Error"+ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    @Override
    public int Modificar() {
        int retorno = 0;
        try{
            con=new Conexion();
            PreparedStatement Parametro;
            String Query="UPDATE clientes SET Nit=?,Nombres=?,Apellidos=?,Direccion=?,Telefono=?,FechaDeNacimiento=? WHERE idclientes=?;";
            con.Open_Conection();
            Parametro=con.conexionDB.prepareStatement(Query);
            Parametro.setString(1,getNit());
            Parametro.setString(2,getNombres());
            Parametro.setString(3,getApellidos());
            Parametro.setString(4,getDireccion());
            Parametro.setString(5,getTelefono());
            Parametro.setString(6,getFechaDeNacimiento());
            Parametro.setInt(7,getId());
            retorno=Parametro.executeUpdate();
            con.Close_Conection();
        }catch(SQLException ex){
            System.out.println("Error"+ex.getMessage());
            return retorno;
        }
        return retorno;
    }
    @Override
    public int Eliminar() {
        int retorno = 0;
         try{
            con=new Conexion();
            PreparedStatement Parametro;
            String Query="DELETE FROM clientes WHERE idclientes=?;";
            con.Open_Conection();
            Parametro=con.conexionDB.prepareStatement(Query);
            Parametro.setInt(1,getId());
            retorno=Parametro.executeUpdate();
            con.Close_Conection();
        }catch(SQLException ex){
            System.out.println("Error"+ex.getMessage());
            return retorno;
        }
        return retorno;
    }

    public String getNit() {
        return Nit;
    }

    public void setNit(String Nit) {
        this.Nit = Nit;
    }
}
