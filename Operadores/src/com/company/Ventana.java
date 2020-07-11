package com.company;

import javax.swing.*;

public class Ventana extends JFrame {
    private JPanel panel1;
    private JPasswordField Pass;
    private JTextField Us;
    private JButton ingresarButton;
    private JButton salirButton;
    private JLabel LabelUs;
    private JLabel LabelPas;
    public Ventana(){
        super("Ejemplo de Jpanel");
        setContentPane(panel1);

    }
    private void createUIComponents() {
        // TODO: place custom component creation code here
    }
}
