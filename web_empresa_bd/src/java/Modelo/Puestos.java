/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import Modelo.Conexion;
/**
 *
 * @author rodri
 */
public class Puestos {
    private int idPuesto;
    private String Puesto;
    private Conexion cn;

    public Puestos(int idPuesto, String Puesto) {
        this.idPuesto = idPuesto;
        this.Puesto = Puesto;
    }

    public Puestos() {
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    public String getPuesto() {
        return Puesto;
    }

    public void setPuesto(String Puesto) {  
        this.Puesto = Puesto;
    }
      public HashMap drop_sangre(){
    HashMap<String,String>drop= new HashMap();
    try{
            cn=new Conexion();
            String Query="select idPuestos as ID,Puesto from puestos";
            cn.abrirConcexion();
            ResultSet consulta=cn.conexionDB.createStatement().executeQuery(Query);
            while(consulta.next()){
                drop.put(consulta.getString("ID"),consulta.getString("Puesto"));
            }
            cn.cerrarConecion();
    }catch(SQLException ex){
        System.out.println("ERROR: "+ex.getMessage());
    }
        return drop;
}
}
