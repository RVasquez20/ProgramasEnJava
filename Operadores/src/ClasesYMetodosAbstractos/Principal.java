package ClasesYMetodosAbstractos;

public class Principal {
    public static void main(String[] args) {
        Planta p1=new Planta();
        p1.aimentarse();
        AnimalHerbiboro AnimalH=new AnimalHerbiboro();
        AnimalCarnivoro A1=new AnimalCarnivoro();
        AnimalH.aimentarse();
        A1.aimentarse();
    }
}
