<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : rodri
--%>



<%@page import="Modelo.Marcas"%>
<%@page import="Modelo.Productos"%>
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
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
        
        <link rel="stylesheet" href="CSS/Estilos.css">


    </head>
    <title>PARCIAL II</title>
</head>

<body>
    <header>

        <nav class="menu">
            <div class="Navegacion">
                <ul class="menu-nav">
                    <li>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="New" value="NEW" ><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-clipboard-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
  <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zM8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
</svg> 
                            &ensp; Nuevo
                        </button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-primary" id="Mostrar" >  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
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
            </div>
            <div class="titulo-pag">
                <h1 class="titulo">Parcial II</h1>
            </div>
        </nav>

        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                        style="height: 100%; width: 100%;">
            <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                  style="stroke: none; fill: #fff;"></path>
            </svg></div>
    </header>
    <main>
        <section class="contenedor sobre-nosotros1">
            <h2 class="titulo1">Funcionamiento del CRUD</h2>
            <div class="contenedor-sobre-nosotros1">
                <img src="source/Imagen1.svg" alt="" class="imagen-about-us1">
                <div class="contenido-textos1">
                     <h3><span>1 </span>Mostrar</h3>
                    <p>Para Mostrar los productosdebera precionar el boton " Lista " en la barra de navegacion ,Posterior Tendra una 
                       tabla con los datos de los productos</p>
                    <h3><span>2</span>Agregar</h3>
                    <p>Para agregar debera precionar el boton " Nuevo " en la barra de navegacion ,Posterior Tendra que 
                        rellenar un formulario en el cual estaran los datos de los productos</p>
                    <h3><span>3</span>Modificar</h3>
                    <p>Para modificar debera precionar el boton " Lista " en la barra de navegacion ,Posterior Tendra que 
                       seleccionar el producto que desea modificar de la tabla que se hara visible, Por ultimo se rellenaran
                       los datos del formulario en el cual podra modificar el dato que desee</p>
                    <h3><span>4</span>Eliminar</h3>
                    <p>Para eliminar debera precionar el boton " Lista " en la barra de navegacion ,Posterior Tendra que 
                       seleccionar el producto que desea eliminar de la tabla que se hara visible, Por ultimo debera precionar el boton eliminar
                    y aceptar</p>
                   
                </div>
            </div>
        </section>


        <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h1 class="modal-title">Listado De Productos</h1>
                        <form class="mr-sm-2">
                            <input class="form-control" id="myInput" type="text" placeholder="Buscar">
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
                        <!--       <button type="button" class="close" data-dismiss="modal">&times;</button>-->
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <table class="table table-dark table-hover">
                            <thead>
                            <th>Producto</th>
                            <th>Marca</th>
                            <th>Descripcion</th>
                            <th>Precio Costo</th>
                            <th>Precio Venta</th>
                            <th>Existencias</th>
                            </tr>
                            </thead>
                            <tbody id="tbl_Productos">
                                <%
                                   Productos producto = new Productos();
                                    DefaultTableModel tblModelo = new DefaultTableModel();
                                    tblModelo = producto.listadoDeProductos();
                                    for (int a = 0; a < tblModelo.getRowCount(); a++) {
                                        out.println("<tr data-idestudiantes=" + tblModelo.getValueAt(a, 0) + " data-id_Marcas=" + tblModelo.getValueAt(a, 2) + ">");
                                        out.println("<td >" + tblModelo.getValueAt(a, 1) + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 3)+ "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 4) + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 5) + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 6) + "</td>");
                                        out.println("<td>" + tblModelo.getValueAt(a, 7) + "</td>");
                                        out.println("</tr>");
                                    }
                                    
                                %>
                            </tbody>
                        </table>
                        <div class="modal-footer">


                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>


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
                            <h1 class="modal-title">Formulario De Productos</h1>
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">

                            <form action="serv_Producto" method="POST" class="form-group">
                                <label id="ID1"><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly ><br>
                                <label for="lbl_Producto"><b>Producto:</b></label>
                                <input type="text" name="txt_Producto" class="form-control" id="txt_Producto" placeholder="Ejemplo: Gaseosa" required><br>
                                 <label for="lbl_Marcas "><b>Marca:</b></label>
                                <select name="ListMarcas" id="ListMarcas" class="form-control">
                                    <%         
                                        Marcas marcas = new Marcas();
                                        HashMap<String, String> List=marcas.ListadoMarcas();
                                        out.println("<option value='0'><<< Elija >>></option>");
                                        for (String i : List.keySet()) {
                                            out.println("<option value='" + i + "'>" + List.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                                <label for="lbl_Descripcion"><b>Descripcion:</b></label>
                                <textarea type="text" name="txt_Descripcion" class="form-control" id="txt_Descripcion" placeholder="Ejemplo: Lata de 120ml " required></textarea><br>
                                <label for="lbl_PrecioCosto"><b>Precio Costo:</b></label>
                                <input type="money" name="txt_PrecioCosto" class="form-control" id="txt_PrecioCosto" placeholder="Ejemplo: 120.20 " required><br>
                                <label for="lbl_PrecioVenta"><b>Precio Venta:</b></label>
                                <input type="money" name="txt_PrecioVenta" class="form-control" id="txt_PrecioVenta" placeholder="Ejemplo: 140.50" required><br>
                                <label for="lbl_Existencias"><b>Existencias:</b></label>
                                <input type="number" name="txt_Existencias" class="form-control" id="txt_Existencias" placeholder="Ejemplo: 1200" required><br>
                                
                               
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
    </main>

    <footer>        
        <div class="Redes">
            <h3>Parcial II</h3><h3>Programacion 2</h3><h3>Carne: 1290-19-2634</h3>    

        </div>
        <div class="contenedor-cr">
            <h2 class="copyrighttt">&copy;Rodrigo Vasquez</h2>
            <h3>2020</h3>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    <script type="text/javascript">
                                        $('#tbl_Productos').on('click', 'tr td', function (ev) {
                                            $("#btn_Agregar").hide();
                                            $("#btn_Modificar").show();
                                            $("#btn_Eliminar").show();
                                            $("#txt_ID").show();
                                            $("#ID1").show();
                                            var target, idProductos, Productos, Descripcion, PrecioCosto, PrecioVenta,IdMarc, Existencias;
                                            target = $(event.target);
                                            
                                            idProductos = target.parent().data('idestudiantes');
                                            IdMarc = target.parent().data('id_Marcas');
                                            Productos = target.parent("tr").find("td").eq(0).html();
                                            Descripcion = target.parent("tr").find("td").eq(2).html();
                                            PrecioCosto = target.parent("tr").find("td").eq(3).html();
                                            PrecioVenta = target.parent("tr").find("td").eq(4).html();
                                            Existencias = target.parent("tr").find("td").eq(5).html();
                                            
                                            $("#txt_ID").val(idProductos);
                                            $("#txt_Producto").val(Productos);
                                            $("#txt_Descripcion").val(Descripcion);
                                            $("#txt_PrecioCosto").val(PrecioCosto);
                                            $("#txt_PrecioVenta").val(PrecioVenta);
                                            $("#txt_Existencias").val(Existencias);
                                            $("#ListMarcas").val(IdMarc);
                                            $("#myModal").modal('show');






                                        });
    </script>
    <script type="text/javascript">
        $('#New').click(function (evt) {
            $("#txt_ID").hide();
            $("#ID1").hide();
            $("#btn_Agregar").show();
            $("#btn_Modificar").hide();
            $("#btn_Eliminar").hide();

            $("#txt_ID").val('');
            $("#txt_Producto").val('');
            $("#txt_Descripcion").val('');
            $("#txt_PrecioCosto").val('');
            $("#txt_PrecioVenta").val('');
            $("#txt_Existencias").val('');
            $("#ListMarcas").val(0);
            $("#myModal").modal('show');
            });

    </script>
    <script type="text/javascript">

        $("#Mostrar").click(function () {
            $("#myModal2").modal('show');
        });


    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var altura = $('.Navegacion').offset().top;

            $(window).on('scroll', function () {
                if ($(window).scrollTop() > altura) {
                    $('.Navegacion').addClass('menu-fixed');
                } else {
                    $('.Navegacion').removeClass('menu-fixed');
                }
            });
        });
    </script>
    <script>
        function disabletext(e) {
            return false;
        }
        function reEnable() {
            return true;
        }
        document.onselectstart = new Function("return false");
        if (window.sidebar) {
            document.onmousedown = disabletext;
            document.onclick = reEnable;
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbl_Productos tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>
