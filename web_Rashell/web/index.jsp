<%-- 
    Document   : index
    Created on : 18/09/2020, 10:43:41 PM
    Author     : Rashell
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
    <title>Parcial  </title>
</head>

<body style="background-image: url(fondo.jpg);">
    <nav style="background-color: #F781D8; text-decoration: none;">
        <ul>
            
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="nuevodato" style="background-color: #F781D8; border-color: #F781D8; color:#000;">
    Agregar
  </button>
           
        </ul>
    </nav>



    <header>
         
     
    </header>
<div class="container" >  
    <h1 style="text-align: center; color:#000000;">Listado de Productos</h1>
    <br>
    <table class="table table-bordered" style="background-color: #F6CED8; font-size: 24px;" >
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
    <tbody id="tablas_productos">
        <%
        DefaultTableModel data=new DefaultTableModel();
        productos v_prod=new productos();
        data=v_prod.Stock();
        for (int i = 0; i < data.getRowCount(); i++) {
                out.println("<tr data-idproducto="+data.getValueAt(i, 0)+" data-idmarca="+data.getValueAt(i, 7)+">");
                out.println("<td>"+data.getValueAt(i, 1)+"</td>");
                out.println("<td>"+data.getValueAt(i, 2)+"</td>");
                out.println("<td>"+data.getValueAt(i, 3)+"</td>");
                out.println("<td>"+data.getValueAt(i, 4)+"</td>");
                out.println("<td>"+data.getValueAt(i, 5)+"</td>");
                out.println("<td>"+data.getValueAt(i, 6)+"</td>");
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
                        <h1 class="modal-title">Formulario De Productos</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                  <div class="modal-body">
            <form action="sr_productos" method="POST" class="form-group">
                <label><b>id</b></label>
                <input type="text" name="txt_id" class="form-control" id="txt_id" placeholder="id" value="0" readonly style="max-width: 250px;"><br>
                <label><b>Productos:</b></label>
                <input type="text" name="txt_producto" class="form-control" id="txt_producto" placeholder="Ej:Donas" required><br>
                <label><b>Marcas:</b></label>
                <select name="L_Marcas" id="L_Marcas" class="form-control">
                    <%
                    marcas marcs=new marcas();
                    HashMap<String,String> listadoMarcas=marcs.combo_box_de_marcas();
                    for (String i: listadoMarcas.keySet()) {
                            out.println("<option value='"+i+"'>"+listadoMarcas.get(i)+"</option>");
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
            <button class="btn btn-primary" name="btn_agregar" id="btn_agregar" value="agregar">Agregar</button>
            <button class="btn btn-primary" name="btn_modificar" id="btn_modificar" value="modificar">Modificar</button>
            <button class="btn btn-primary" name="btn_eliminar" id="btn_eliminar" value="eliminar" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" >Cerrar</button>
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
    $('#nuevodato').click(function (evt) {
        $("#txt_id").val('');
        $("#L_Marcas").val('');
        $("#txt_producto").val('');
        $("#txt_descripcion").val('');
        $("#txt_preciocosto").val('');
        $("#txt_precioventa").val('');
        $("#txt_exitencias").val('');
        $("#myModal").modal('show');
    });
    </script>
<script type="text/javascript">
       $('#tablas_productos').on('click', 'tr td', function (evt) {

           var target, existencias, producto,idproducto, idmarcas, descripcion, precio_costo, precio_venta ;
           target = $(event.target);
           idproducto = target.parent().data('idproducto');
           idmarcas = target.parent().data('idmarca');
           producto = target.parents("tr").find("td").eq(0).html();
           descripcion = target.parents("tr").find("td").eq(2).html();
           precio_venta = target.parents("tr").find("td").eq(4).html();
           precio_costo = target.parents("tr").find("td").eq(3).html();
           existencias = target.parents("tr").find("td").eq(5).html();
           $("#txt_id").val(idproducto);
           $("#L_Marcas").val(idmarcas);
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
