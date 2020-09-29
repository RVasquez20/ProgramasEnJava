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
public class Marcas {
    private int IdMarcas;
    private String Marca;
    private Conexion cn;

    public Marcas() {
    }

    public Marcas(int IdMarcas, String Marca) {
        this.IdMarcas = IdMarcas;
        this.Marca = Marca;
    }

   

      public HashMap ListadoMarcas(){
    HashMap<String,String>drop= new HashMap();
    try{
            cn=new Conexion();
            String Query="SELECT IdMarcas as ID,Marca FROM marcas;";
            cn.abrirConcexion();
            ResultSet consulta=cn.conexionDB.createStatement().executeQuery(Query);
            while(consulta.next()){
                drop.put(consulta.getString("ID"),consulta.getString("Marca"));
            }
            cn.cerrarConecion();
    }catch(SQLException ex){
        System.out.println("ERROR: "+ex.getMessage());
    }
        return drop;
}

    public int getIdMarcas() {
        return IdMarcas;
    }

    public void setIdMarcas(int IdMarcas) {
        this.IdMarcas = IdMarcas;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

  
}
