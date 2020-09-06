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
        <style>
            body {
    font: 20px Montserrat, sans-serif;
    line-height: 1.8;
    color: #000;
  }
 
  .container-fluid {
    padding-top: 70px;
    padding-bottom: 70px;
  }
  .navbar {
    padding-top: 15px;
    padding-bottom: 15px;
    border: 0;
    border-radius: 0;
    margin-bottom: 0;
    font-size: 12px;
    letter-spacing: 5px;
  }
  .navbar-nav  li a:hover {
    color: #1abc9c !important;
  }
    .margin {margin-bottom: 45px;}
 .bg-1 { 

    background-color: #FAFAFA; 
    color: #000;

  }
  
        </style>
    </head>
    
<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
  <ul class="navbar-nav">
      <li>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="New" value="NEW" style="font-size: 24px;"><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7.5-3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
  <path fill-rule="evenodd" d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
</svg>  
   &ensp; Nuevo
  </button>
      </li>
    <li class="nav-item">
        <button type="button" class="btn btn-primary" id="Mostrar" style="font-size: 24px;">  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
  <circle cx="3.5" cy="5.5" r=".5"/>
  <circle cx="3.5" cy="8" r=".5"/>
  <circle cx="3.5" cy="10.5" r=".5"/>
</svg>
    &ensp;Lista
  </button>
    </li>
  </ul>
  
</nav>
    <body>
       <div class="container-fluid bg-1 text-center" style="    width: 100%;
    height:950px;">

           <img src="https://umgnaranjo.com/wp-content/uploads/2018/11/logo-umg.png" class="img-responsive img-circle margin" style="display:inline" alt="Logo" width="500" height="350">

  <h3 class="margin">Universidad Mariano Galvez</h3>
  <h1 class="margin">Tarea 1</h1>
  <h2>Hector Rodrigo Vasquez Morales</h2>
  <h2>1290-19-2634</h2>
  <h3>Formulario de Clientes</h3>
</div>
            <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
            <h1 class="modal-title">Listado De Clientes</h1>
              <form class="mr-sm-2" style="margin-left: 43%;" >
        <input class="form-control" id="myInput" type="text" placeholder="Buscar" style="border-radius: 4em; border-color: #0080FF; box-shadow: 2px 2px 5px #0040FF;">
        <br><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo"><svg width="1.7em" height="1.7em" viewBox="0 0 16 16" class="bi bi-info-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
  <circle cx="8" cy="4.5" r="1"/>
</svg>&ensp;Ayuda</button>
  <div id="demo" class="collapse">
      <br>Esta busqueda esta basada en Nombre,Apellido,Nit,Telefono,Direccion
      y año de nacimiento.
      <b>Si desea regresar a la lista completa de empleados solo debe borrar lo
      buscado :D.</b>

  </div>
    </form>
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
                        Cliente clientes=new Cliente();
                        tblModelo = clientes.llenarEmpleado();
                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                            out.println("<tr data-idcliente=" + tblModelo.getValueAt(a,0).toString()+">");
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
             
            <form action="sr_Cliente" method="POST" class="form-group">
                <label id="ID1"><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly style="width: 300px"><br>
                <label for="lbl_NIT"><b>NIT:</b></label>
                <input type="text" name="txt_NIT" class="form-control" id="txt_NIT" placeholder="Ejemplo: 12345678" required><br>
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
          <button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" ><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-check-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm9.854-2.854a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
</svg>  &ensp;Agregar</button> 
                <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar" ><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-lines-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
</svg>&ensp;Modificar</button>
                <button  class="btn btn-outline-danger" name="btn_Eliminar" id="btn_Eliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false"><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-dash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm5-.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
</svg>&ensp;Eliminar</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
        
     
            </form>
        </div>
  
      
    </div>
  </div>
          </div>

</div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

      <script type="text/javascript">   
$('#tbl_Clientes').on('click','tr td', function(evt){
    $("#btn_Agregar").hide();
     $("#btn_Modificar").show();
    $("#btn_Eliminar").show();
    $("#txt_ID").show();
                  $("#ID1").show();
   var target,idCliente,NIT,Nombres,Apellidos,Direccion,Telefono,Fecha_De_Nacimiento;
   target = $(event.target);
   idCliente = target.parent().data('idcliente');
   NIT= target.parents("tr").find("td").eq(0).html();
   Nombres= target.parents("tr").find("td").eq(1).html();
   Apellidos= target.parents("tr").find("td").eq(2).html();
   Direccion= target.parents("tr").find("td").eq(3).html();
   Telefono= target.parents("tr").find("td").eq(4).html();
   Fecha_De_Nacimiento= target.parents("tr").find("td").eq(5).html();
        
   

   $("#txt_ID").val(idCliente);
   $("#txt_NIT").val(NIT);
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
   $("#txt_NIT").val('');
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
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_Clientes tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
    });
  });
});
</script>


    </body>
</html>
