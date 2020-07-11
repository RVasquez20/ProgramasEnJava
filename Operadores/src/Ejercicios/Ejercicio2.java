package Ejercicios;

public class Ejercicio2 {
    private String marca,modelo;
    private float precio;

    public Ejercicio2(String marca, String modelo, float precio) {
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
    }

    public float getPrecio() {
        return precio;
    }
    public String mostrarDatos(){
        return "Marca: "+marca+" Modelo: "+modelo+" Precio: "+precio+"\n";
    }
}
