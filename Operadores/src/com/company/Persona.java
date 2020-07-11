package com.company;

public class Persona {
    //Atributos
    String Nombre;
    int Edad;
    String DPI;
    //Metodos
    //Metodo constructor no lleva tipo , y con el mismo nombre de la clase
    /*
    Puede hacerse el constructor con nombres distintos o con iguales pero poniendo this
    public  Persona(String _nombre,int _edad){
    nombre=_nombre;
    Edad=_edad;
    }*/
    //Metodo constructor forma 2
    //Al colocar this le indicamos que es el atributo, posteriormente se iguala al metodo
    /*
    public Persona(String nombre,int Edad){
        this.nombre=nombre;
        this.Edad=Edad;
    }
    public void mostrar(){
        System.out.println("El nombre es "+nombre);
        System.out.println("La edad es "+Edad);
    }*/
    //Ejemplo Sobrecarga de Métodos
//Para generar el constructor automatico alt ins(o insertar o generar), constructor,seleccionar los atributos
    public Persona(String nombre, int edad) {
        Nombre = nombre;
        Edad = edad;
    }

    public Persona(String DPI) {
        this.DPI = DPI;
    }
    public void Correr(){
        System.out.println("Soy "+Nombre+" Tengo "+Edad+" años y estoy corriendo una maraton :D");
    }

    public void Correr(int km){
        System.out.println("He Corrido "+km+" Kilometros");
    }
}
