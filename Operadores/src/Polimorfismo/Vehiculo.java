package Polimorfismo;

public class Vehiculo {
    protected String matricula,marca,modelo;

    public Vehiculo(String matricula, String marca, String modelo) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }
    public String MostrarDatos(){
        return "Marca: "+marca+"\nMatricula:"+matricula+"\nModelo:"+modelo;
    }
}
