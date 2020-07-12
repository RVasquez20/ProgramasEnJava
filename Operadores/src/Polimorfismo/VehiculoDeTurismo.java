package Polimorfismo;

public class VehiculoDeTurismo extends Vehiculo {
    private int numeroPuertas;

    public VehiculoDeTurismo(String matricula, String marca, String modelo, int numeroPuertas) {
        super(matricula, marca, modelo);
        this.numeroPuertas = numeroPuertas;
    }

    public int getNumeroPuertas() {
        return numeroPuertas;
    }
    @Override
    public String MostrarDatos(){
        return "Marca: "+marca+"\nMatricula:"+matricula+"\nModelo:"+modelo+"\nNumero de Puertas: "+numeroPuertas;
    }
}