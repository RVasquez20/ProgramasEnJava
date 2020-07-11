package Estatico;

public class Estatico {
    private static String frase="Primera frase";
    public static int sumar(int n1,int n2){
        return n1+n2;
    }
    public static void main(String[] args) {
        Estatico Ob1=new Estatico();
        Estatico Ob2 =new Estatico();
        Ob2.frase="Segunda frase";
        System.out.println(Ob1.frase);
        System.out.println(Ob2.frase);
        System.out.println(Estatico.frase);
        System.out.println("La suma es : "+Estatico.sumar(2,3));
    }
}
