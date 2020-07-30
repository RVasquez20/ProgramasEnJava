/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import javax.swing.JOptionPane;

/**
 *
 * @author Diana Cardenas Moren
 */
public class Matrices {
     
              
        
        
    
    public static void main(String[] args) {
       
    int fila= Integer.parseInt(JOptionPane.showInputDialog(null,"Por favor digite el numero de las filas", ""));
       
         int columna= Integer.parseInt(JOptionPane.showInputDialog(null,"Por favor digite el numero de las columnas", ""));
         int matriz[][]=new int[fila][columna];
         int opc;
         
             int cantidad= Integer.parseInt(JOptionPane.showInputDialog(null,"Por favor digite la cantidad del tamaño del vector", ""));
             int vector[]=new int[cantidad];
             do{
            StringBuilder menu = new StringBuilder("");
            menu.append("\n1. \"(1)para Rellenar Matriz ");
	    menu.append("\n2. \"(2)para Sumar fila\"");
	    menu.append("\n3. \"(3)para Sumar columna\"");
	    menu.append("\n4.\"(4)para imprimir la matriz");
	    menu.append("\n5.\"(5)para llenar un vector");
	    menu.append("\n6. \"(6)para buscar un elemento del vector");
             menu.append("\n7. \"(7)para para imprimir el vector");
             menu.append("\n8. \"(8)para salir");
	 opc=Integer.parseInt(JOptionPane.showInputDialog(null, menu, ""));
       
           
          
        switch(opc){
            case 1: {
                         for(int x=0;x<fila;x++)
                         {
                            for(int y=0;y<columna;y++)
                                {
                                   // System.out.println("Por favor digite el valor de la fila "+x+" la columna "+y);
                                  matriz[x][y]=Integer.parseInt(JOptionPane.showInputDialog(null, "Por favor digite el valor de la fila "+x+" la columna "+y));
                                } 
                         }
                    break;
            }
            case 2:{
            
                          for(int i=0;i<fila;i++){
                              int suma=0;
                          for(int j=0;j<columna;j++)
                                {
                               suma+=matriz[i][j];
                                } 
                              JOptionPane.showMessageDialog(null, "La suma de la fila ("+i+") es "+suma);
                          }
                       
 
                    break;
            }
            case 3:{
          
                   for(int j=0;j<fila;j++)
                          {
                         int suma=0;
                               for(int i=0;i<columna;i++) {
                               suma+=matriz[i][j];
                                } 
                              JOptionPane.showMessageDialog(null, "La suma de la columna ("+j+") es "+suma);
                          }
                break;
            }
            case 4:{
                System.out.println("La Matriz Es: ");
                for(int i=0;i<fila;i++){
                    for (int j = 0; j < matriz.length; j++) {
                        System.out.print(matriz[i][j]+" ");
                    }
                    System.out.println("");
                }
                break;
            }
            case 5:{
                for(int i=0;i<cantidad;i++){
                    vector[i]=Integer.parseInt(JOptionPane.showInputDialog("Ingrese el valor que ira en la posicion "+(i+1)+"Del vector"));
                }
                break;
            }
            case 6:{
                int aux=0;
                int enc=0;
                aux=Integer.parseInt(JOptionPane.showInputDialog("Ingrese el numero a buscar"));
                for (int i = 0; i < cantidad; i++) {
                    if(aux==vector[i]){
                       JOptionPane.showMessageDialog(null, "El numero "+aux+" se encontro y esta en la posicion "+i+" del vector");
                       enc=1;
                    }
                }
                if(enc==0){
                    JOptionPane.showMessageDialog(null, "El numero no esta en el vector");
                }
                break;
            }
            case 7:{
                System.out.println("\n\n\n\nEl Vector es:");
                for (int i = 0; i < vector.length; i++) {
                    System.out.print(vector[i]+" ");
                    
                }
                break;
            }
    }
             }
   while(opc!=8);
}
}
