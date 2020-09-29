/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.HashMap;
import java.sql.*;

public class marcas {
    private int idMarca;
    private String Marca;
    private conexion con;
    public marcas() {
    }

    public marcas(int idMarca, String Marca) {
        this.idMarca = idMarca;
        this.Marca = Marca;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }
    public HashMap combo_box_de_marcas(){
        HashMap<String,String> lista=new HashMap();
        try {
            con=new conexion();
            String query="SELECT idmarcas as id,marca from marcas;";
            con.abrirconexion();
            ResultSet consulta=con.conexionbd.createStatement().executeQuery(query);
            while (consulta.next()) {
                lista.put(consulta.getString("id"),consulta.getString("marca"));
            }
            con.cerrarconexion();
        } catch (SQLException e) {
             System.out.println("Error"+e.getMessage());
        }
        return lista;
    }
}
