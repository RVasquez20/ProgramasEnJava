<%-- 
    Document   : index
    Created on : 18/09/2020, 10:43:41 PM
    Author     : cindy
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Modelo.marcas"%>
<%@page import="Modelo.productos"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="jquery-3.5.1.min.js"></script>
        <title>Parcial 2</title>
    </head>
    <style>
        label{
           
            font-size: 25px;
        }
    </style>
    <body style="background-image: url(fondocindy.jpg); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
        
        <div class="container-fluid" style="background: linear-gradient(to bottom, rgba(255,124,216,1) 0%, rgba(242,148,214,1) 0%, rgba(250,227,243,1) 55%, rgba(252,236,252,1) 100%); max-width: 120%;">
            <br><h1 style="text-align: center; color: #87162a;  ">Listado De Productos</h1>
        </div> 
  
<div class="container">
 
  <br>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header"style="background: linear-gradient(to bottom, rgba(255,124,216,1) 0%, rgba(242,148,214,1) 0%, rgba(250,227,243,1) 55%, rgba(252,236,252,1) 100%);">
            <h4 class="modal-title" style="font-size: 35px;">Agregar Productos</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="background-image: url(fondocindy.jpg); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
            <form action="sr_productos" method="POST" class="form-group">
                <label><b>id</b></label>
                <input type="text" name="txt_id" class="form-control" id="txt_id" placeholder="id" value="0" readonly style="max-width: 250px;"><br>
                <label><b>Producto</b></label>
                <input type="text" name="txt_producto" class="form-control" id="txt_producto" placeholder="Ejemplo:Pan" required><br>
                <label><b>Marca</b></label>
                <select name="box_marcas" id="box_marcas" class="form-control">
                    <%
                    marcas marca=new marcas();
                    HashMap<String,String> combo=marca.box_marcas();
                    for (String i: combo.keySet()) {
                            out.println("<option value='"+i+"'>"+combo.get(i)+"</option>");
                        }
                    %> 
                </select><br>
                <label><b>descripcion</b></label>
                <input type="text" name="txt_descripcion" class="form-control" id="txt_descripcion" placeholder="Ejemplo:Pan blanco" required><br>
                 <label><b>Precio Costo</b></label>
                <input type="money" name="txt_preciocosto" class="form-control" id="txt_preciocosto" placeholder="Ejemplo:12.20" required><br>
                 <label><b>Precio Venta</b></label>
                <input type="money" name="txt_precioventa" class="form-control" id="txt_precioventa" placeholder="Ejemplo:12.20" required><br>
                  <label><b>Existencias</b></label>
                <input type="number" name="txt_exitencias" class="form-control" id="txt_exitencias" placeholder="Ejemplo:20" required><br>
                <!-- Modal footer -->
        <div class="modal-footer">
            <button class="btn btn-primary" name="btn_agregar" id="btn_agregar" value="agregar" style="background-color:#87162a; font-size: 18px;">Agregar</button>
            <button class="btn btn-primary" name="btn_modificar" id="btn_modificar" value="modificar" style="background-color:#87162a; font-size: 18px;">Modificar</button>
            <button class="btn btn-primary" name="btn_eliminar" id="btn_eliminar" value="eliminar" style="background-color:#87162a; font-size: 18px;" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color:#87162a; font-size: 18px;">Cerrar</button>
        </div>
            </form>
        </div>
        
        
        
      </div>
    </div>
  </div>
  
</div>
             
                <div class="container-fluid">
                    <div style="max-width: 250px;">    <img src="logocindy.png" alt="Logo">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                       <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="nuevo" style="margin-left: 90px; background-color:#87162a; font-size: 28px;">
    Agregar
  </button>
                        </div>
  <table class="table table-hover" style="margin-left: 400px; max-width: 1200px; background-color: #FFFFFF; border-style: inset; text-align: center; ">
    <thead>
      <tr>
        <th>Producto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Precio Costo</th>
        <th>Precio Venta</th>
        <th>Existencias</th>
      </tr>
    </thead>
    <tbody id="tbl_productos">
        <%
        DefaultTableModel tblTabla=new DefaultTableModel();
        productos producto=new productos();
        tblTabla=producto.Lista();
        for (int i = 0; i < tblTabla.getRowCount(); i++) {
                out.println("<tr data-id_productos="+tblTabla.getValueAt(i, 0)+" data-id_marcas="+tblTabla.getValueAt(i, 7)+">");
                out.println("<td>"+tblTabla.getValueAt(i, 1)+"</td>");
                out.println("<td>"+tblTabla.getValueAt(i, 2)+"</td>");
                out.println("<td>"+tblTabla.getValueAt(i, 3)+"</td>");
                out.println("<td>"+tblTabla.getValueAt(i, 4)+"</td>");
                out.println("<td>"+tblTabla.getValueAt(i, 5)+"</td>");
                out.println("<td>"+tblTabla.getValueAt(i, 6)+"</td>");
                out.println("</tr>");
            }
        %>
    </tbody>
    
  </table>
</div>
  

         <script type="text/javascript">   
$('#tbl_productos').on('click','tr td', function(evt){
 
   var target,idproducto,idmarcas,descripcion,precio_costo,precio_venta,existencias,producto;
   target = $(event.target);
   idproducto = target.parent().data('id_productos');
  idmarcas = target.parent().data('id_marcas');
   producto=target.parents("tr").find("td").eq(0).html();
   descripcion=target.parents("tr").find("td").eq(2).html();
   precio_venta=target.parents("tr").find("td").eq(4).html();
  precio_costo= target.parents("tr").find("td").eq(3).html();
  existencias= target.parents("tr").find("td").eq(5).html();
   
   $("#txt_id").val(idproducto);
    $("#box_marcas").val(idmarcas);
   $("#txt_producto").val(producto);
   $("#txt_descripcion").val(descripcion);
   $("#txt_preciocosto").val(precio_costo);
   $("#txt_precioventa").val(precio_venta);
   $("#txt_exitencias").val(existencias);
        

  
  
   

   

   $("#myModal").modal('show');





   
});
</script>
<script type="text/javascript">
      $('#nuevo').click (function(evt){
    $("#txt_id").val('');
    $("#box_marcas").val('');
   $("#txt_producto").val('');
   $("#txt_descripcion").val('');
   $("#txt_preciocosto").val('');
   $("#txt_precioventa").val('');
   $("#txt_exitencias").val('');
     $("#myModal").modal('show');
      });
</script>
    </body>
</html>
