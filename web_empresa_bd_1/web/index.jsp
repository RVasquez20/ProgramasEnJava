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
        <script src="jquery-3.5.1.js"></script>
</head>
        <title>Empleados</title>
    </head>
    <body>
        <br>
        <br>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="New" value="NEW">
    Open modal
  </button>
        <br>
        <br>
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
                </tr>
                </thead>
                <tbody id="tbl_Empleados">
                    <%
                        DefaultTableModel tblModelo = new DefaultTableModel();
                        Empleado empleado = new Empleado();
                        tblModelo = empleado.llenarEmpleado();
                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                            out.println("<tr data-idempleado=" + tblModelo.getValueAt(a,0).toString() + " data-id_puesto=" + tblModelo.getValueAt(a,8).toString() +  ">");
                            out.println("<td >" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 2).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 4).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 7).toString() + "</td>");
                            out.println("</tr>");
                        }

                    %>
                </tbody>
            </table>

        </div>
   <div class="container">


  <!-- The Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
              <h1>Formulario De Empleados</h1>
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
                        out.println("<option value='0'><<< Elija >>></option>");
                        for (String i : drop.keySet()) {
                            out.println("<option value='" +i+ "'>" + drop.get(i) + "</option>");
                        }
                    %>
                </select>
            </form>
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
            <button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" >Agregar</button> 
                <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar" >Modificar</button>
                <button  class="btn btn-outline-danger" name="btn_Eliminar" id="btn_Eliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false">Eliminar</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
      <script type="text/javascript">   
$('#tbl_Empleados').on('click','tr td', function(evt){
    $("#btn_Agregar").hide();
     $("#btn_Modificar").show();
    $("#btn_Eliminar").show();
   var target,idEmpleados,Codigo,Nombres,Apellidos,Direccion,Telefono,Fecha_De_Nacimiento,idPuesto;
   target = $(event.target);
   idEmpleados = target.parent().data('idempleado');
   idPuesto = target.parent().data('id_puesto');
   Codigo= target.parents("tr").find("td").eq(0).html();
   Nombres= target.parents("tr").find("td").eq(1).html();
   Apellidos= target.parents("tr").find("td").eq(2).html();
   Direccion= target.parents("tr").find("td").eq(3).html();
   Telefono= target.parents("tr").find("td").eq(4).html();
   Fecha_De_Nacimiento= target.parents("tr").find("td").eq(5).html();
        
   

   $("#txt_ID").val(idEmpleados);
   $("#txt_Codigo").val(Codigo);
   $("#txt_Nombres").val(Nombres);
   $("#txt_Apellidos").val(Apellidos);
   $("#txt_Direccion").val(Direccion);
   $("#txt_Telefono").val(Telefono);
   $("#txt_FechaDeNacimiento").attr("value",Fecha_De_Nacimiento);
   $("#drop_sangre").val(idPuesto);//   $("#txt_sangre").val(Puesto);
   $("#myModal").modal('show');
/*$("#drop_sangre option").filter(function() {
    return $(this).text() === Puesto;
    }).prop('selected', true);*/




   
});
</script>
      <script type="text/javascript">   
              $('#New').click (function(evt){

    $("#btn_Modificar").hide();
    $("#btn_Eliminar").hide();

   $("#txt_ID").val('');
   $("#txt_Codigo").val('');
   $("#txt_Nombres").val('');
   $("#txt_Apellidos").val('');
   $("#txt_Direccion").val('');
   $("#txt_Telefono").val('');
   $("#txt_FechaDeNacimiento").val('');
   $("#drop_sangre").val(0);//   $("#txt_sangre").val(Puesto);
   $("#myModal").modal('show');
/*$("#drop_sangre option").filter(function() {
    return $(this).text() === Puesto;
    }).prop('selected', true);*/
 
});
                
</script>
    </body>
</html>
