package Ejercicios;

public abstract class Poligono {
    protected int numeroDeLados;

    public Poligono(int numeroDeLados) {
        this.numeroDeLados = numeroDeLados;
    }

    public int getNumeroDeLados() {
        return numeroDeLados;
    }

    @Override
    public String toString() {
        return "numeroDeLados= " + numeroDeLados+"\n";
    }

    public abstract double area();
    
}
