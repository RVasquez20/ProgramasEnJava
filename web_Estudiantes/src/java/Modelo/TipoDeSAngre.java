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
public class TipoDeSAngre {
    private int idtipo_sangre;
    private String TipoDeSangre;
    private Conexion cn;

    public TipoDeSAngre() {
    }
    

    public TipoDeSAngre(int idtipo_sangre, String TipoDeSangre) {
        this.idtipo_sangre = idtipo_sangre;
        this.TipoDeSangre = TipoDeSangre;
    }

      public HashMap drop_sangre(){
    HashMap<String,String>drop= new HashMap();
    try{
            cn=new Conexion();
            String Query="SELECT idtipo_sangre as ID,TipoDeSangre FROM tipo_sangre;";
            cn.abrirConcexion();
            ResultSet consulta=cn.conexionDB.createStatement().executeQuery(Query);
            while(consulta.next()){
                drop.put(consulta.getString("ID"),consulta.getString("TipoDeSangre"));
            }
            cn.cerrarConecion();
    }catch(SQLException ex){
        System.out.println("ERROR: "+ex.getMessage());
    }
        return drop;
}

    public int getIdtipo_sangre() {
        return idtipo_sangre;
    }

    public void setIdtipo_sangre(int idtipo_sangre) {
        this.idtipo_sangre = idtipo_sangre;
    }

    public String getTipoDeSangre() {
        return TipoDeSangre;
    }

    public void setTipoDeSangre(String TipoDeSangre) {
        this.TipoDeSangre = TipoDeSangre;
    }
}
