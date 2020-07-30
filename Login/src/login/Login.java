/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import javax.swing.JOptionPane;

/**
 *
 * @author rodri
 */
public class Login {
private String Us,Pas;
private final String usuario="admin";
private final String password="Empres@123";

    public Login() {
    }

    public Login(String Us, String Pas) {
        this.Us = Us;
        this.Pas = Pas;
    }



    public String getUs() {
        return Us;
    }

    public void setUs(String Us) {
        this.Us = Us;
    }

    public String getPas() {
        return Pas;
    }

    public void setPas(String Pas) {
        this.Pas = Pas;
    }
   public String toString() {
        return "Login{" + "Us=" + Us + ", Pas=" + Pas + '}';
    }
 public boolean verificacion(String usu,String Pass){
     boolean x=false;
     if(usu.equals(this.Us)&&Pass.equals(Pas)){
     x=true;
     }else{
         JOptionPane.showMessageDialog(null,"Error, Datos Incorrectos","",JOptionPane.INFORMATION_MESSAGE);
     }
     return x;
 }

}
