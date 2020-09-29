/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.productos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class sr_productos extends HttpServlet {

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
            out.println("<title>Productos</title>");            
            out.println("</head>");
            out.println("<body>");
            
           if("agregar".equals(request.getParameter("btn_agregar"))){
               productos producto=new productos(0,Integer.parseInt(request.getParameter("L_Marcas")),Integer.parseInt(request.getParameter("txt_exitencias")),
                       Double.parseDouble(request.getParameter("txt_preciocosto")),Double.parseDouble(request.getParameter("txt_precioventa")),
                       request.getParameter("txt_producto"),request.getParameter("txt_descripcion"));
               if(producto.agregar()>0){
                    response.sendRedirect("index.jsp"); 
               }else{
                   out.println("<h1>Error Llame a soporte Tecnico</h1>");
               }
           }
          
              if("modificar".equals(request.getParameter("btn_modificar"))){
               productos producto=new productos(Integer.parseInt(request.getParameter("txt_id")),Integer.parseInt(request.getParameter("L_Marcas")),
                       Integer.parseInt(request.getParameter("txt_exitencias")),Double.parseDouble(request.getParameter("txt_preciocosto")),
                       Double.parseDouble(request.getParameter("txt_precioventa")),request.getParameter("txt_producto"),
                       request.getParameter("txt_descripcion"));
               if(producto.modificar()>0){
                    response.sendRedirect("index.jsp"); 
               }else{
                   out.println("<h1>Error Llame a soporte Tecnico</h1>");
               }
           }
              
                 if("eliminar".equals(request.getParameter("btn_eliminar"))){
               productos producto=new productos(Integer.parseInt(request.getParameter("txt_id")),Integer.parseInt(request.getParameter("L_Marcas")),
                       Integer.parseInt(request.getParameter("txt_exitencias")),Double.parseDouble(request.getParameter("txt_preciocosto")),
                       Double.parseDouble(request.getParameter("txt_precioventa")),request.getParameter("txt_producto"),
                       request.getParameter("txt_descripcion"));
               if(producto.eliminar()>0){
                    response.sendRedirect("index.jsp"); 
               }else{
                   out.println("<h1>Error Llame a soporte Tecnico</h1>");
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
