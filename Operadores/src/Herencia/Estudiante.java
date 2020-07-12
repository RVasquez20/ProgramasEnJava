package Herencia;

public class Estudiante extends Persona {
private int codigoEstudiante;
private float notaFinal;
public Estudiante(String nombre,String apellido,int edad,int codigoEstudiante,float notaFinal){
super(nombre,apellido,edad);
this.codigoEstudiante=codigoEstudiante;
this.notaFinal=notaFinal;
}
public void mostrarDatos(){
    System.out.println("Nombre:"+getNombre());
    System.out.println("Apellidos:"+getApellidos());
    System.out.println("Edad:"+getEdad());
    System.out.println("Codigo De Estudiante: "+codigoEstudiante);
    System.out.println("Nota Final: "+notaFinal);
}
}
