<%-- 
    Document   : index
    Created on : 25/08/2020, 09:19:47 PM
    Author     : rodri
--%>

<%@page import="Modelo.Puestos"%>
<%@page import="java.util.HashMap"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
  <h2>Extra Large Modal</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
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
                        out.println("<option value='0'><<< Elija >>></option>");
                        for (String i : drop.keySet()) {
                            out.println("<option value='" +i+ "'>" + drop.get(i) + "</option>");
                        }
                      
                    %>
                </select>
               
            </form>
        </div>
   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
            <button  class="btn btn-outline-primary" name="btn_Modificar" id="btn_Modificar" value="Modificar"data-dismiss="modal" >Modificar</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>  
    </body>
</html>
