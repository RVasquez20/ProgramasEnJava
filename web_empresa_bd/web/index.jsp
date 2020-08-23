<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : rodri
--%>


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
        <title>Empleados</title>
    </head>
    <body>
        <h1>Formulario De Empleados</h1>
        <div class="container">
            <form action="sr_Empleado" method="POST" class="form-group">
                <label><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly style="width: 300px"><br>
                <label for="lbl_Codigo"><b>Codigo:</b></label>
                <input type="text" name="txt_Codigo" class="form-control" id="txt_Codigo" placeholder="Ejemplo: E001" required><br>
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
                <label for="lbl_sangre "><b>Tipo de Sangre:</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <%
                        Puestos puestos = new Puestos();
                        HashMap<String, String> drop = puestos.drop_sangre();
                        for (String i : drop.keySet()) {
                            out.println("<option value='" +i+ "'>" + drop.get(i) + "</option>");
                        }
                    %>
                </select>
                <br><button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" >Agregar</button> 
                <button  class="btn btn-outline-success" name="btn_A" id="btn_A" value="A" >A</button>

            </form>
        </div>
        <div class="container-fluid">
            <table class="table table-dark table-hover">
                <thead>
                <th>Codigos</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Fecha de Nacimiento</th>
                <th>Puesto</th>
                <!--<th>Acciones</th>-->
                </tr>
                </thead>
                <tbody id="tbl_Empleados">
                    <%
                        DefaultTableModel tblModelo = new DefaultTableModel();
                        Empleado empleado = new Empleado();
                        tblModelo = empleado.llenarEmpleado();
                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                            out.println("<tr data-idempleado=" + tblModelo.getValueAt(a, 0).toString() + ">");

                            out.println("<td >" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 2).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 4).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 7).toString() + "</td>");
                            /*out.println("<td><a href='#'  style='color:#FFFFFF;'><i class='fa fa-pencil' aria-hidden='true' style='margin-left: 10px' ></i></a>");
                            out.println("<i class='fa fa-trash' aria-hidden='true' style='margin-left: 20px'></i></td>");*/
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
$('#tbl_Empleados').on('click','tr td', function(evt){
    
   var target,idEmpleados,Codigo,Nombres,Apellidos,Direccion,Telefono,Fecha_De_Nacimiento,Puesto;
   target = $(event.target);
   idEmpleados = target.parent().data('idempleado');
   Codigo= target.parents("tr").find("td").eq(0).html();
   Nombres= target.parents("tr").find("td").eq(1).html();
   Apellidos= target.parents("tr").find("td").eq(2).html();
   Direccion= target.parents("tr").find("td").eq(3).html();
   Telefono= target.parents("tr").find("td").eq(4).html();
   Fecha_De_Nacimiento= target.parents("tr").find("td").eq(5).html();
   Puesto= target.parents("tr").find("td").eq(6).html();

   $("#txt_ID").val(idEmpleados);
   $("#txt_Codigo").val(Codigo);
   $("#txt_Nombres").val(Nombres);
   $("#txt_Apellidos").val(Apellidos);
   $("#txt_Direccion").val(Direccion);
   $("#txt_Telefono").val(Telefono);
   $("#txt_FechaDeNacimiento").attr("value",Fecha_De_Nacimiento);
  // $("#drop_sangre").val(Puesto);//   $("#txt_sangre").val(Puesto);
$("#drop_sangre option").filter(function() {
    return $(this).text() == Puesto;
    }).prop('selected', true);




   
});
</script>
    </body>
</html>
