<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : rodri
--%>


<%@page import="Modelo.Cliente"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<%@page import="Modelo.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="jquery-3.5.1.js"></script>
        
        
</head>
        <title>Clientes</title>
    </head>
    
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item">
        <button type="button" class="btn btn-primary" id="Mostrar">  
    Lista
  </button>
    </li>
  </ul>
</nav>
    <body>
        <br>
        <br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="New" value="NEW" >  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7.5-3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
  <path fill-rule="evenodd" d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
</svg>  
    Nuevo
  </button>
        <br>
        <br>
        </div>

            <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
           <h1 class="modal-title">Listado De Clientes</h1>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         
            <table class="table table-dark table-hover">
                <thead>
                <th>NIT</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Fecha de Nacimiento</th>
                </tr>
                </thead>
                <tbody id="tbl_Clientes">
                    <%
                        DefaultTableModel tblModelo = new DefaultTableModel();
                        Cliente cliente = new Cliente();
                        tblModelo = cliente.llenarCliente();
                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                            out.println("<tr data-idclientes=" + tblModelo.getValueAt(a,0).toString()+">");
                            out.println("<td >" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 2).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 4).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                            out.println("</tr>");
                        }

                    %>
                </tbody>
            </table>
  <div class="modal-footer">


          <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>

        
      </div>
        </div>
      </div>
                </div>
                </div>
                </div>
                
   <div class="container">


  <!-- The Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
            <h1 class="modal-title">Formulario De Clientes</h1>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
             
            <form action="sr_Empleado" method="POST" class="form-group">
                <label id="ID1"><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly style="width: 300px"><br>
                <label for="lbl_Nit"><b>NIT:</b></label>
                <input type="text" name="txt_Nit" class="form-control" id="txt_Nit" placeholder="Ejemplo: 1234567-8" required><br>
                <label for="lbl_Nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_Nombres" class="form-control" id="txt_Nombres" placeholder="Ejemplo: Nombre 1 Nombre 2 " required><br>
                <label for="lbl_Apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_Apellidos" class="form-control" id="txt_Apellidos" placeholder="Ejemplo: Apellido 1 Apellido 2 " required><br>
                <label for="lbl_Direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_Direccion" class="form-control" id="txt_Direccion" placeholder="Ejemplo: 2da avenida 11-1 Antigua" required><br>
                <label for="lbl_Telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_Telefono" class="form-control" id="txt_Telefono" placeholder="Ejemplo: 0000-0000" required><br>
                <label for="lbl_FechaDeNacimiento"><b>Fecha De Nacimiento:</b></label>
                <input type="date" name="txt_FechaDeNacimiento" class="form-control" id="txt_FechaDeNacimiento" required><br>
                
                    <!-- Modal footer -->
      
      <div class="modal-footer">
          <button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" >Agregar</button> 
                <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar" >Modificar</button>
                <button  class="btn btn-outline-danger" name="btn_Eliminar" id="btn_Eliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false">Eliminar</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
     
            </form>
        </div>
  
      
    </div>
  </div>
  
</div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
      <script type="text/javascript">   
$('#tbl_Clientes"').on('click','tr td', function(evt){
    $("#btn_Agregar").hide();
     $("#btn_Modificar").show();
    $("#btn_Eliminar").show();
    $("#txt_ID").show();
                  $("#ID1").show();
   var target,idClientes,NIT,Nombres,Apellidos,Direccion,Telefono,Fecha_De_Nacimiento;
   target = $(event.target);
   idClientes = target.parent().data('idclientes');
   NIT= target.parents("tr").find("td").eq(0).html();
   Nombres= target.parents("tr").find("td").eq(1).html();
   Apellidos= target.parents("tr").find("td").eq(2).html();
   Direccion= target.parents("tr").find("td").eq(3).html();
   Telefono= target.parents("tr").find("td").eq(4).html();
   Fecha_De_Nacimiento= target.parents("tr").find("td").eq(5).html();
        
   

   $("#txt_ID").val(idEmpleados);
   $("#txt_Nit").val(Codigo);
   $("#txt_Nombres").val(Nombres);
   $("#txt_Apellidos").val(Apellidos);
   $("#txt_Direccion").val(Direccion);
   $("#txt_Telefono").val(Telefono);
   $("#txt_FechaDeNacimiento").attr("value",Fecha_De_Nacimiento);
   $("#myModal").modal('show');



   
});
</script>
<script type="text/javascript">   
              $('#New').click (function(evt){
                  $("#txt_ID").hide();
                  $("#ID1").hide();
$("#btn_Agregar").show();
    $("#btn_Modificar").hide();
    $("#btn_Eliminar").hide();

   $("#txt_ID").val('');
   $("#txt_Nit").val('');
   $("#txt_Nombres").val('');
   $("#txt_Apellidos").val('');
   $("#txt_Direccion").val('');
   $("#txt_Telefono").val('');
   $("#txt_FechaDeNacimiento").attr("value",'');
   $("#myModal").modal('show');
 
});
                
</script>
<script type="text/javascript">

$("#Mostrar").click(function(){
    $("#myModal2").modal('show');
});


</script>

    </body>
</html>
