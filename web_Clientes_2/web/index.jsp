<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : rodri
    web de formulario de clientes
--%>


<%@page import="Modelo.Cliente"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="Modelo.Puestos"%>
<%@page import="Modelo.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Clientes</title>
        
    </head>
    
    <body>
        
<div class="jumbotron text-center" style="margin-bottom:0;background-color:#008798;">
  <h1 style="text-align: center;color:#FFF;">Formulario De Clientes</h1>
  
</div>

        <div class="container">
            <br>
            <br>
           
            <form action="srv_Clientes" method="POST" class="form-group">
                <label><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly style="width: 300px"><br>
                <label for="lbl_NIT"><b>NIT:</b></label>
                <input type="text" name="txt_NIT" class="form-control" id="txt_NIT" placeholder="Ejemplo: 1234567-8" required><br>
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
                <br><button  class="btn btn-outline-primary" name="btn_Refrescar" id="btn_Refrescar" value="Refresh">Limpiar</button> 
                <button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" >Agregar</button> 
                <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar" >Modificar</button>
                <button  class="btn btn-outline-danger" name="btn_Eliminar" id="btn_Eliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false">Eliminar</button>
            </form>
        </div>
        <div class="container-fluid">
             <h1 style="text-align: center; color:#000; ">Listado  De Clientes</h1>           
             <br>
             <br>
             <input class="form-control" id="myInput" type="text" placeholder="Busqueda..." style="width: 300px"><label style="color:#C0C0C0; font-size: 25px;">Busqueda por medio de Nombre,Apellido,Telefono,Direccion o NIT</label>
             <br> <br>
            <table class="table table-bordered table-hover" style="text-align: center;">
                <thead>
                <th>Nit</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Fecha de Nacimiento</th>
                </tr>
                </thead>
                <tbody id="tbl_Clientes" style=" Cursor : pointer;">
                    <%
                        DefaultTableModel tblModelo = new DefaultTableModel();
                        Cliente clientes=new Cliente();
                        tblModelo = clientes.llenarEmpleado();
                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                            out.println("<tr data-idclientes=" + tblModelo.getValueAt(a,0).toString() +">");
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

        </div>
   
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
<script type="text/javascript">   
$('#tbl_Clientes').on('click','tr td', function(evt){
    
   var target,idClientes,NIT,Nombres,Apellidos,Direccion,Telefono,Fecha_De_Nacimiento;
   target = $(event.target);
   idClientes = target.parent().data('idclientes');
   NIT= target.parents("tr").find("td").eq(0).html();
   Nombres= target.parents("tr").find("td").eq(1).html();
   Apellidos= target.parents("tr").find("td").eq(2).html();
   Direccion= target.parents("tr").find("td").eq(3).html();
   Telefono= target.parents("tr").find("td").eq(4).html();
   Fecha_De_Nacimiento= target.parents("tr").find("td").eq(5).html();
   $("#txt_ID").val(idClientes);
   $("#txt_NIT").val(NIT);
   $("#txt_Nombres").val(Nombres);
   $("#txt_Apellidos").val(Apellidos);
   $("#txt_Direccion").val(Direccion);
   $("#txt_Telefono").val(Telefono);
   $("#txt_FechaDeNacimiento").attr("value",Fecha_De_Nacimiento);
   var Agregar=document.getElementById('btn_Agregar');
  Agregar.disabled=true;
     var Modificar=document.getElementById('btn_Modificar');
  Modificar.disabled=false;
  var Eliminar=document.getElementById('btn_Eliminar');
  Eliminar.disabled=false;
  var Refrescar=document.getElementById('btn_Refrescar');
  Refrescar.disabled=false;
    $("#btn_Refrescar").show();
});

</script>
<script type="text/javascript">
    window.onload=function(){
        var Agregar=document.getElementById('btn_Agregar');
        Agregar.disabled=false;
  var Modificar=document.getElementById('btn_Modificar');
  Modificar.disabled=true;
  var Eliminar=document.getElementById('btn_Eliminar');
  Eliminar.disabled=true;
    var Refrescar=document.getElementById('btn_Refrescar');
  Refrescar.disabled=true;
  $("#btn_Refrescar").hide();
    }
  
</script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_Clientes tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
    </body>
</html>
