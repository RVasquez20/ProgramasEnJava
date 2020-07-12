package Polimorfismo;

public class VehiculoFulgoneta extends Vehiculo{
    private int carga;

    public VehiculoFulgoneta(String matricula, String marca, String modelo, int carga) {
        super(matricula, marca, modelo);
        this.carga = carga;
    }

    public int getCarga() {
        return carga;
    }
    @Override
    public String MostrarDatos(){
        return "Marca: "+marca+"\nMatricula:"+matricula+"\nModelo:"+modelo+"\nCarga:"+carga;
    }
}
