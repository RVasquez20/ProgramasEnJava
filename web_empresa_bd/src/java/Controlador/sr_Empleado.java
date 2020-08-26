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
import Modelo.Empleado;

/**
 *
 * @author rodri
 */
public class sr_Empleado extends HttpServlet {

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
                Empleado empleado = new Empleado(request.getParameter("txt_Codigo"), Integer.valueOf(request.getParameter("drop_sangre")), 0, request.getParameter("txt_Nombres"), 
    request.getParameter("txt_Apellidos"), request.getParameter("txt_Direccion"), request.getParameter("txt_Telefono"), request.getParameter("txt_FechaDeNacimiento"));
                if (empleado.Agregar() > 0) {
                    out.println("<h3>Ingreso Exitoso :D</h3>");
                    out.println("<script>alert('Agregado Exitosamente');</script> ");
                    response.sendRedirect("index.jsp");

                } else {
                    out.println("<h3>Error de ingreso :C</h3>");
                }

            }
            if("A".equals(request.getParameter("btn_A"))){
                
                 out.println("<script>alert('id empleado:"+request.getParameter("txt_ID")+"');</script>");
                 out.println("<script>alert('Codigo:"+request.getParameter("txt_Codigo")+"');</script>");                 
               out.println("<script>alert('Nombre:"+request.getParameter("txt_Nombres")+"');</script>");
               out.println("<script>alert('Apellido:"+request.getParameter("txt_Apellidos")+"');</script>");
               out.println("<script>alert('Direccion:"+request.getParameter("txt_Direccion")+"');</script>");
               out.println("<script>alert('Telefono"+request.getParameter("txt_Telefono")+"');</script>");
                out.println("<script>alert('Fecha:"+request.getParameter("txt_FechaDeNacimiento")+"');</script>");
                out.println("<script>alert('id puesto: "+Integer.valueOf(request.getParameter("drop_sangre"))+"');</script>");
                
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
