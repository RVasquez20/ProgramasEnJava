package Polimorfismo;

public class VehiculoDeportivo extends Vehiculo{
    private int cilindrada;

    public VehiculoDeportivo(String matricula, String marca, String modelo, int cilindrada) {
        super(matricula, marca, modelo);
        this.cilindrada = cilindrada;
    }

    public int getCilindrada() {
        return cilindrada;
    }
    @Override
    public String MostrarDatos(){
        return "Marca: "+marca+"\nMatricula:"+matricula+"\nModelo:"+modelo+"\nCilindrada:"+cilindrada;
    }
}
