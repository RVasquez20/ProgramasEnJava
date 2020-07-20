/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tarea1;

/**
 *
 * @author rodri
 */
public class Tipo {
  private String tipo;

    public Tipo(String tipo) {
        this.tipo = tipo;
    }

    public Tipo() {
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
  public void agregar(){
      System.out.println("Tipo:"+this.getTipo());
  }
}
