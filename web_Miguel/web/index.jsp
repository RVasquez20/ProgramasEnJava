<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : Miguel
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
    <title>Colegio</title>
</head>

<body>
    <style>
     
        .Navegacion{
            width: 100%;
            background: #81DAF5;
            color: #fff;
            font-size: 20px;
            z-index: 1000;

        }
        .Navegacion ul {
            list-style:none;
            text-align: right;
            font-size: 28px;
        }

        .menu-nav li{
            position: relative;
            display: inline-block;
            padding: 20px;
            border-color: #fff;

        }
        .menu-nav li button{

            display: block;
            color:#fff;
            font-family: 'open sans';
            text-decoration: none;
            background-color: transparent;
            border-color: transparent;
        }
        .div2{
            text-align: center;
        }

        header {
            width: 100%;
            height: 650px;
            display: inline-block;
            background-image: url(https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fe0%2Fb5%2F0a%2Fe0b50ab191043da5955813051da869ac.png&f=1&nofb=1);
            background-repeat: no-repeat;
            background-size: cover;
            color: #fff;
            text-align: center;
        }

        header .subtitulo {
            font-size: 42px;
            font-weight: 300;
            margin-bottom: 32px;
        }
        .titulo-pag {
            margin-left: 20px;
            margin-top: 210px;
            color: rgb(255, 255, 255);
            font-size: 100px;
        }
        .menu-nav li button:hover{
            color: #ff9f32;
            transition: all .3s;
        }
        .titulo-pag{
            color:#000;
        }
        .contenedor {

            width: 90%;
            max-width: 1000px;
            margin: auto;
            overflow: hidden;
            padding: 52px 0;
        }
        footer{
            background: #F5DA81;
            width: 100%;
            overflow: hidden;
            transition: all 0.25s;
        }
        .contenedor-cr{
            size: 12px;
            text-align: center;
            color: #000;
        }
        .div2{
            font-size: 30px;
            
        }

    </style>
    <header>

        <nav class="menu">
            <div class="Navegacion">
                <ul class="menu-nav">
                    <li>
                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="botagregar" > Agregar
                        </button>
                    </li>
                    
                </ul>
            </div>
            <div class="titulo-pag">
                <h1 class="titulo">CRUD Parcial De</h1>
            </div>
        </nav>
<br>
    </header>
    <main>
        <div class="div2">
            <br>
            <br>
            <h2>Lista de productos</h2>
            <br>
        </div>
        <table class="table table-hover" >
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
                    DefaultTableModel tblTabla = new DefaultTableModel();
                    productos producto = new productos();
                    tblTabla = producto.Lista();
                    for (int i = 0; i < tblTabla.getRowCount(); i++) {
                        out.println("<tr data-id_productos=" + tblTabla.getValueAt(i, 0) + " data-id_marcas=" + tblTabla.getValueAt(i, 7) + ">");
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
    <div class="container">

        <br>

        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-size: 35px;">Agregar Productos</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="sr_productos" method="POST" class="form-group">
                            <label><b>id</b></label>
                            <input type="text" name="txt_id" class="form-control" id="txt_id" placeholder="id" value="0" readonly style="max-width: 250px;"><br>
                            <label><b>Producto</b></label>
                            <input type="text" name="txt_producto" class="form-control" id="txt_producto" placeholder="Ejemplo:Pan" required><br>
                            <label><b>Marca</b></label>
                            <select name="marcas" id="marcas" class="form-control">
                                <%
                                    marcas marca = new marcas();
                                    HashMap<String, String> combo = marca.listademarcas();
                                    for (String i : combo.keySet()) {
                                        out.println("<option value='" + i + "'>" + combo.get(i) + "</option>");
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
                                <button class="btn btn-primary" name="btn_agregar" id="btn_agregar" value="agregar">Agregar</button>
                                <button class="btn btn-primary" name="btn_modificar" id="btn_modificar" value="modificar">Modificar</button>
                                <button class="btn btn-primary" name="btn_eliminar" id="btn_eliminar" value="eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                        return false">Eliminar</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            </div>
                        </form>
                    </div>



                </div>
            </div>
        </div>

    </div>









</main>

<footer>        

    <div class="contenedor-cr">
        <h2 class="copyrighttt">&copy;Miguel</h2>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


<script type="text/javascript">
       $('#tbl_productos').on('click', 'tr td', function (evt) {

           var target, idproducto, idmarcas, descripcion, precio_costo, precio_venta, existencias, producto;
           target = $(event.target);
           idproducto = target.parent().data('id_productos');
           idmarcas = target.parent().data('id_marcas');
           producto = target.parents("tr").find("td").eq(0).html();
           descripcion = target.parents("tr").find("td").eq(2).html();
           precio_venta = target.parents("tr").find("td").eq(4).html();
           precio_costo = target.parents("tr").find("td").eq(3).html();
           existencias = target.parents("tr").find("td").eq(5).html();

           $("#txt_id").val(idproducto);
           $("#marcas").val(idmarcas);
           $("#txt_producto").val(producto);
           $("#txt_descripcion").val(descripcion);
           $("#txt_preciocosto").val(precio_costo);
           $("#txt_precioventa").val(precio_venta);
           $("#txt_exitencias").val(existencias);

           $("#myModal").modal('show');

       });
</script>
<script type="text/javascript">
    $('#botagregar').click(function (evt) {
        $("#txt_id").val('');
        $("#marcas").val('');
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
