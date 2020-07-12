package Ejercicios;

public class Triangulo extends Poligono{
private double l1,l2,l3;

    public Triangulo(double l1, double l2, double l3) {
        super(3);
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
    }

    public double getL1() {
        return l1;
    }

    public double getL2() {
        return l2;
    }

    public double getL3() {
        return l3;
    }

    @Override
    public String toString() {
        return "Triangulo: \n" +super.toString()+
                "l1=" + l1 +
                ", l2=" + l2 +
                ", l3=" + l3;
    }

    @Override
    public double area() {
        double s,d;
        s=l1+l2+l3;
        d=s/2;
        return Math.sqrt((d*(d-l1)*(d-l2)*(d-l3)));
    }
}
