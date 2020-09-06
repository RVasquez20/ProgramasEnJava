/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Cliente;

/**
 *
 * @author rodri
 */
public class sr_Cliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_Empleado</title>");
            out.println("</head>");
            out.println("<body>");
       if ("Agregar".equals(request.getParameter("btn_Agregar"))) {
               Cliente clientes=new Cliente(request.getParameter("txt_NIT"),0, request.getParameter("txt_Nombres"), 
    request.getParameter("txt_Apellidos"), request.getParameter("txt_Direccion"), request.getParameter("txt_Telefono"), request.getParameter("txt_FechaDeNacimiento"));
                if (clientes.Agregar() > 0) {
                    out.println("<script>alert('Agregado Exitosamente');</script> ");
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("<h3>Error de ingreso :C</h3>");
                }

            }
            if("Modificar".equals(request.getParameter("btn_Modificar"))){
               Cliente clientes = new Cliente(request.getParameter("txt_Nit"), Integer.valueOf(request.getParameter("txt_ID")), request.getParameter("txt_Nombres"), 
    request.getParameter("txt_Apellidos"), request.getParameter("txt_Direccion"), request.getParameter("txt_Telefono"), request.getParameter("txt_FechaDeNacimiento"));
                if (clientes.Modificar() > 0) {
                    out.println("<script>alert('Modificado Exitosamente');</script> ");
                    response.sendRedirect("index.jsp");


                } else {
                    out.println("<h3>Error de ingreso :C</h3>");
                }
                
            }
            if("Eliminar".equals(request.getParameter("btn_Eliminar"))){
               Cliente clientes = new Cliente(request.getParameter("txt_Nit"), Integer.valueOf(request.getParameter("txt_ID")), request.getParameter("txt_Nombres"), 
    request.getParameter("txt_Apellidos"), request.getParameter("txt_Direccion"), request.getParameter("txt_Telefono"), request.getParameter("txt_FechaDeNacimiento"));
                if (clientes.Eliminar()> 0) {
                    out.println("<script>alert('Eliminado Exitosamente');</script> ");
                    response.sendRedirect("index.jsp");


                } else {
                    out.println("<h3>Error de ingreso :C</h3>");
                }
                
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
