package Herencia.SobreEscrituraDeMiembros;

public class Persona extends Animal{
    @Override
    public void comer(){
        System.out.println("Estoy comiendo sentado con cubiertos");
    }
}
