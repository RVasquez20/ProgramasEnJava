package Ejercicios;

public class Rectangulo extends Poligono{
    private double l1,l2;

    public Rectangulo( double l1, double l2) {
        super(2);
        this.l1 = l1;
        this.l2 = l2;
    }

    public double getL1() {
        return l1;
    }

    public double getL2() {
        return l2;
    }

    @Override
    public String toString() {
        return "Rectangulo: \n" + super.toString()+
                "lado 1=" + l1 +
                ", lado 2=" + l2;
    }

    @Override
    public double area() {
        return l1*l2;
    }
}
