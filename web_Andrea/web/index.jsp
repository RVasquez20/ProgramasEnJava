<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : andrea
--%>



<%@page import="Modelo.marcas"%>
<%@page import="Modelo.productos"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="jquery-3.5.1.js"></script>


    </head>
    <title>Parcial Andrea</title>
</head>

<body style="margin-bottom:0;background-image: url(1521.jpg); background-size: cover;">

    <br>
    <br>
    <h3 style="text-align: center;color:#FFF; font-size: 48px;">Andrea </h3>
    <h3 style="text-align: center;color:#FFF; font-size: 48px;">Parcial 2 Programacion</h3>
    <h3 style="text-align: center;color:#FFF; font-size: 48px;">Crud Productos</h3>
    <br>


    <header>
        <div class="container">


            <!-- The Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h1 class="modal-title">Formulario De Productos</h1>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" style="background-image: url(fondocindy.jpg); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
                            <form action="srv_productos" method="POST" class="form-group">
                                <label><b>id</b></label>
                                <input type="text" name="txt_id" class="form-control" id="txt_id" placeholder="id" value="0" readonly style="max-width: 250px;"><br>
                                <label><b>Producto</b></label>
                                <input type="text" name="txt_producto" class="form-control" id="txt_producto" placeholder="Ej:Donas" required><br>
                                <label><b>Marca</b></label>
                                <select name="marcalistado" id="marcalistado" class="form-control">
                                    <%
                                        marcas marca = new marcas();
                                        HashMap<String, String> combo = marca.listadomarcas();
                                        for (String i : combo.keySet()) {
                                            out.println("<option value='" + i + "'>" + combo.get(i) + "</option>");
                                        }
                                    %> 
                                </select><br>
                                <label><b>descripcion</b></label>
                                <input type="text" name="txt_descripcion" class="form-control" id="txt_descripcion" placeholder="Ej:Donas guatemaltecas" required><br>
                                <label><b>Precio Costo</b></label>
                                <input type="money" name="txt_preciocosto" class="form-control" id="txt_preciocosto" placeholder="Ej:14.10" required><br>
                                <label><b>Precio Venta</b></label>
                                <input type="money" name="txt_precioventa" class="form-control" id="txt_precioventa" placeholder="Ej:12.90" required><br>
                                <label><b>Existencias</b></label>
                                <input type="number" name="txt_exitencias" class="form-control" id="txt_exitencias" placeholder="Ej:90" required><br>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button class="btn btn-primary" name="btn_agregar" id="btn_agregar" value="agregar" style="background-color:#9A2EFE; font-size: 18px; border-color: #9A2EFE;">Agregar</button>
                                    <button class="btn btn-primary" name="btn_modificar" id="btn_modificar" value="modificar" style="background-color:#9A2EFE; font-size: 18px;border-color: #9A2EFE;">Modificar</button>
                                    <button class="btn btn-primary" name="btn_eliminar" id="btn_eliminar" value="eliminar" style="background-color:#9A2EFE; font-size: 18px;border-color: #9A2EFE;" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                                return false">Eliminar</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color:#87162a; font-size: 18px;">Cerrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="container" >       
            <button type="button" class="btn  btn-lg" data-toggle="modal" data-target="#myModal" id="agrega" style="margin: 20px 0px 20px 500px; background-color: #D7DF01;"> 
                Nuevo
            </button>
        </div>
    </header>

    <table class="table table-primary" >
        <thead class="table-primary">
            <tr>
                <th>Producto</th>
                <th>Marca</th>
                <th>Descripcion</th>
                <th>Precio Costo</th>
                <th>Precio Venta</th>
                <th>Existencias</th>
            </tr>
        </thead>
        <tbody id="tbl_productos" class="table-primary">
            <%
                DefaultTableModel tblTabla = new DefaultTableModel();
                productos ob1 = new productos();
                tblTabla = ob1.Lista();
                for (int i = 0; i < tblTabla.getRowCount(); i++) {
                    out.println("<tr data-id_productos=" + tblTabla.getValueAt(i, 0) + " data-idmarcas=" + tblTabla.getValueAt(i, 7) + ">");
                    out.println("<td>" + tblTabla.getValueAt(i, 1) + "</td>");
                    out.println("<td>" + tblTabla.getValueAt(i, 2) + "</td>");
                    out.println("<td>" + tblTabla.getValueAt(i, 3) + "</td>");
                    out.println("<td>" + tblTabla.getValueAt(i, 4) + "</td>");
                    out.println("<td>" + tblTabla.getValueAt(i, 5) + "</td>");
                    out.println("<td>" + tblTabla.getValueAt(i, 6) + "</td>");
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
                                        $('#agrega').click(function (evt) {
                                            $("#txt_id").val('');
                                            $("#marcalistado").val('');
                                            $("#txt_producto").val('');
                                            $("#txt_descripcion").val('');
                                            $("#txt_preciocosto").val('');
                                            $("#txt_precioventa").val('');
                                            $("#txt_exitencias").val('');
                                            $("#myModal").modal('show');
                                        });
</script>
<script type="text/javascript">
    $('#tbl_productos').on('click', 'tr td', function (evt) {

        var target, idproducto, idmarcas, descripcion, precio_costo, precio_venta, existencias, producto;
        target = $(event.target);
        idproducto = target.parent().data('id_productos');
        idmarcas = target.parent().data('idmarcas');
        producto = target.parents("tr").find("td").eq(0).html();
        descripcion = target.parents("tr").find("td").eq(2).html();
        precio_venta = target.parents("tr").find("td").eq(4).html();
        precio_costo = target.parents("tr").find("td").eq(3).html();
        existencias = target.parents("tr").find("td").eq(5).html();
        $("#txt_id").val(idproducto);
        $("#marcalistado").val(idmarcas);
        $("#txt_producto").val(producto);
        $("#txt_descripcion").val(descripcion);
        $("#txt_preciocosto").val(precio_costo);
        $("#txt_precioventa").val(precio_venta);
        $("#txt_exitencias").val(existencias);
        $("#myModal").modal('show');

    });
</script>

</body>
</html>
