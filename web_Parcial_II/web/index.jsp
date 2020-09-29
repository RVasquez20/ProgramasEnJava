<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : rodri
--%>


<%@page import="Modelo.tipo_sangre"%>
<%@page import="Modelo.Estudiantes"%>
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
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="jquery-3.5.1.js"></script>


    </head>
    <title>Estudiantes</title>
</head>

<body>
   
    <div class="jumbotron text-center" style="margin-bottom:0;background-color:#008798;">
        <h1 style="text-align: center;color:#FFF;">Formulario De Estudiantes</h1>
        <br>
    </div>

    <header>
        <div class="container" >       
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="Nuevo" style="margin: 20px 0px 20px 500px;"> 
                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-plus-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                </svg>
                Nuevo
            </button>
        </div>
    </header>
    <div class="container" style="font-size: larger; max-width:1250px;">

        <h1 class="modal-title">Listado De Estudiantes</h1><br>
        <h3>Busqueda:</h3>
        <input class="form-control" id="myInput" type="text" placeholder="Buscar" style="width: 500px;">
        <div>
            <br>Esta busqueda esta basada en Nombre,Apellido,Nit,Telefono,Direccion
            y año de nacimiento.
            <b>Si desea regresar a la lista completa de empleados solo debe borrar lo
                buscado :D.</b>

        </div>
        <br>


        <table class="table table-hover" style=" text-align: center;">
            <thead class="thead-dark">
            <th>Producto</th>
            <th>Marca</th>
            <th>Descripcion</th>
            <th>Precio Costo</th>
            <th>Precio Venta</th>
            <th>Existencias</th>
            </tr>
            </thead>
            <tbody id="tbl_Estudiantes"   class="thead-light" style=" Cursor : pointer;">
                <%
                    Estudiantes estudiante = new Estudiantes();
                    DefaultTableModel tblModelo = new DefaultTableModel();
                    tblModelo = estudiante.ListadoEstudiantes();
                    for (int a = 0; a < tblModelo.getRowCount(); a++) {
                        out.println("<tr data-idestudiantes=" + tblModelo.getValueAt(a, 0).toString() + " data-id_sangre=" + tblModelo.getValueAt(a, 2).toString() + ">");
                        out.println("<td >" + tblModelo.getValueAt(a, 1).toString() + "</td>");
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
        <br>
    </div>


    <div class="container">


        <!-- The Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h1 class="modal-title">Formulario De Estudiantes</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <form action="sr_Estudiantes" method="POST" class="form-group">
                            <label id="idEstudiante"><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" style="width: 250px;" placeholder="ID" value="0" readonly ><br>
                            <label for="lbl_Carne"><b>Carne:</b></label>
                            <input type="text" name="txt_Carne" class="form-control" id="txt_Carne" placeholder="Ejemplo: C123" required><br>
                            <label for="lbl_Nombres"><b>Nombres:</b></label>
                            <input type="text" name="txt_Nombres" class="form-control" id="txt_Nombres" placeholder="Ejemplo: Nombre 1 Nombre 2 " required><br>
                            <label for="lbl_Apellidos"><b>Apellidos:</b></label>
                            <input type="text" name="txt_Apellidos" class="form-control" id="txt_Apellidos" placeholder="Ejemplo: Apellido 1 Apellido 2 " required><br>
                            <label for="lbl_Direccion"><b>Direccion:</b></label>
                            <input type="text" name="txt_Direccion" class="form-control" id="txt_Direccion" placeholder="Ejemplo: 2da avenida 11-1 Antigua" required><br>
                            <label for="lbl_Telefono"><b>Telefono:</b></label>
                            <input type="number" name="txt_Telefono" class="form-control" id="txt_Telefono" placeholder="Ejemplo: 0000-0000" required><br>
                            <label for="lbl_Telefono"><b>Correo:</b></label>
                            <input type="email" name="txt_Correo" class="form-control" id="txt_Correo" placeholder="Ejemplo:ejemplo@ejemplo.ej" required><br>
                            <label for="lbl_sangre "><b>Tipo de Sangre:</b></label>
                            <select name="drop_sangre" id="drop_sangre" class="form-control">
                                <%                                    tipo_sangre sangre = new tipo_sangre();
                                  /*  
                                HashMap<String, String> drop = sangre.drop_sangre();
                                    out.println("<option value='0'>==Seleccione==</option>");
                                    for (String i : drop.keySet()) {
                                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                    }
*/
                                %>
                            </select>
                            <br><label for="lbl_FechaDeNacimiento"><b>Fecha De Nacimiento:</b></label>
                            <input type="date" name="txt_FechaDeNacimiento" class="form-control" id="txt_FechaDeNacimiento" required><br>
                            <!-- Modal footer -->

                            <div class="modal-footer">
                                <button  class="btn btn-outline-success" name="btn_Agregar" id="btn_Agregar" value="Agregar" >Agregar</button> 
                                <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar" >Modificar</button>
                                <button  class="btn btn-outline-danger" name="btn_Eliminar" id="btn_Eliminar" value="Eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar Al Estudiante?'))
                                            return false">Eliminar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>


                        </form>
                    </div>


                </div>
            </div>

        </div>
    </div>
    <!-- Footer -->
    <footer class="text-center" style="background-color: #2f2f2f; /* Black Gray */
            color: #fff; font-size: 30px;" >
        <p><br>Ericka Del Rosario Gonzalez Acuta <br>1290-19-3192<br>Programacion II<br>Tarea 2</p> 
        <br>
    </footer>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 
    <script type="text/javascript">
                                $('#tbl_Estudiantes').on('click', 'tr td', function (evt) {
                                    $("#btn_Agregar").hide();
                                    $("#btn_Modificar").show();
                                    $("#btn_Eliminar").show();
                                    $("#txt_ID").show();
                                    $("#idEstudiante").show();
                                    var target, idEstudiantes, Carne, Nombres, Apellidos, Direccion, Telefono, Fecha_De_Nacimiento, idSangre, Correo;
                                    target = $(event.target);
                                    idEstudiantes = target.parent().data('idestudiantes');
                                    idSangre = target.parent().data('id_sangre');
                                    Carne = target.parents("tr").find("td").eq(0).html();
                                    Nombres = target.parents("tr").find("td").eq(1).html();
                                    Apellidos = target.parents("tr").find("td").eq(2).html();
                                    Direccion = target.parents("tr").find("td").eq(3).html();
                                    Telefono = target.parents("tr").find("td").eq(4).html();
                                    Correo = target.parent("tr").find("td").eq(5).html();
                                    Fecha_De_Nacimiento = target.parents("tr").find("td").eq(7).html();



                                    $("#txt_ID").val(idEstudiantes);
                                    $("#txt_Carne").val(Carne);
                                    $("#txt_Nombres").val(Nombres);
                                    $("#txt_Apellidos").val(Apellidos);
                                    $("#txt_Direccion").val(Direccion);
                                    $("#txt_Telefono").val(Telefono);
                                    $("#txt_Correo").val(Correo);
                                    $("#txt_FechaDeNacimiento").attr("value", Fecha_De_Nacimiento);
                                    $("#drop_sangre").val(idSangre);//   $("#txt_sangre").val(Puesto);
                                    $("#myModal").modal('show');






                                });
    </script>
    <script type="text/javascript">
        $('#Nuevo').click(function (evt) {
            $("#txt_ID").hide();
            $("#idEstudiante").hide();
            $("#btn_Agregar").show();
            $("#btn_Modificar").hide();
            $("#btn_Eliminar").hide();

            $("#txt_ID").val('');
            $("#txt_Carne").val('');
            $("#txt_Nombres").val('');
            $("#txt_Apellidos").val('');
            $("#txt_Direccion").val('');
            $("#txt_Telefono").val('');
            $("#txt_Correo").val('');
            $("#txt_FechaDeNacimiento").attr("value", '');
            $("#drop_sangre").val(0);
            $("#myModal").modal('show');

        });

    </script>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbl_Estudiantes tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script> 
</body>
</html>
