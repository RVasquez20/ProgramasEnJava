<%-- 
    Document   : index
    Created on : 15/08/2020, 01:02:38 PM
    Author     : rodri
--%>


<%@page import="Modelo.Estudiantes"%>
<%@page import="Modelo.TipoDeSAngre"%>
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
        <link rel="stylesheet" href="Estilos.css">
        
        
</head>
        <title>Colegio</title>
    </head>

    <body>
        <header>
                
<nav class="menu">
    <div class="Navegacion">
  <ul class="menu-nav">
      <li>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="New" value="NEW" ><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7.5-3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
  <path fill-rule="evenodd" d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
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
                 <h1 class="titulo">CRUD COLEGIO</h1>
              </div>
</nav>
            
<div class="sesgoabajo"></div>
        </header>
   <main>
        <section class="acerca-de">
            <div class="contenedor">
                <h2 class="sobre-nosotros">Sobre nosotros</h2>
                <h3 class="slogan">Todo lo que necesitas sobre Fitness en Tu idioma</h3>
                <p class="parrafo">En The Aesthetics Crew te ofrecemos el mejor entrenamiento personalizado que puedas obtener, no solo nos enfocamos en que  cumplas con los ejercicio, si no que adquieras todo el conocimiento que necesites para que no solo obtengas un cuerpo estético si no también adquieras el conocimiento de como se hace cada ejercicio y la utilidad de cada uno, en nuestro plan de entrenamiento nos enfocamos en  enseñarte todo sobre alimentación que no es tan complicado como dicen, no nos enfocamos en solo hacerte adelgazar, nos enfocamos  en hacerte desarrollar fuerza, mejor movilidad, resistencia y por supuesto un cuerpo estético, nuestro  programa de entrenamientos es amplio para cualquier persona que desee cambiar su  estilo de vida.</p>
            </div>
        </section>
        <section class="galeria">
            <div class="sesgoarriba"></div>
            <div class="imagenes">
                <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2F-f09eyOVQXk%2Fmaxresdefault.jpg&f=1&nofb=1" alt="">
            </div>
            <div class="imagenes">
                <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fescritoradebolsillo.files.wordpress.com%2F2015%2F06%2Flibrosss.jpg&f=1&nofb=1" alt="">
            </div>
            <div class="imagenes">
                <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fc%2Fc4%2FRm46.jpg%2F1200px-Rm46.jpg&f=1&nofb=1" alt="">
                <div class="encima">
                    <h2>CRUD COLEGIO</h2>
                    <div></div>
                </div>
            </div>
            <div class="imagenes">
                <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.dondeir.com%2Fwp-content%2Fuploads%2F2016%2F08%2Futiles-escolares-baratos-1024x767.jpg&f=1&nofb=1" alt="">

            </div>
            <div class="imagenes">
                <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffiles.informabtl.com%2Fuploads%2F2015%2F07%2FBack-To-School-%25C3%259Atiles-escolares.jpg&f=1&nofb=1" alt="">
            </div>
            <div class="sesgoabajo"></div>
        </section>

            <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
           <h1 class="modal-title">Listado De Estudiantes</h1>
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
                <th>Carne</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>Fecha de Nacimiento</th>
                <th>Tipo De Sangre</th>
                </tr>
                </thead>
                <tbody id="tbl_Estudiantes">
                   <%
                        Estudiantes estudiante = new Estudiantes();
                        DefaultTableModel tblModelo = new DefaultTableModel();
                        tblModelo = estudiante.listadoEstudiantes();
                        for (int a = 0; a < tblModelo.getRowCount(); a++) {
                            out.println("<tr data-idestudiantes=" + tblModelo.getValueAt(a,0).toString() + " data-id_sangre=" + tblModelo.getValueAt(a,9).toString() +  ">");
                            out.println("<td >" + tblModelo.getValueAt(a, 1).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 2).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 3).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 4).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 5).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 6).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 7).toString() + "</td>");
                            out.println("<td>" + tblModelo.getValueAt(a, 8).toString() + "</td>");
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
            <h1 class="modal-title">Formulario De Estudiantes</h1>
          <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
             
            <form action="sr_Estudiantes" method="POST" class="form-group">
                <label id="ID1"><b>ID</b></label> <input type="text" name="txt_ID" class="form-control" id="txt_ID" placeholder="ID" value="0" readonly ><br>
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
                <label for="lbl_FechaDeNacimiento"><b>Fecha De Nacimiento:</b></label>
                <input type="date" name="txt_FechaDeNacimiento" class="form-control" id="txt_FechaDeNacimiento" required><br>
                <label for="lbl_sangre "><b>Tipo de Sangre:</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <%
                        TipoDeSAngre sangre = new TipoDeSAngre();
                        HashMap<String, String> drop = sangre.drop_sangre();
                        out.println("<option value='0'><<< Elija >>></option>");
                        for (String i : drop.keySet()) {
                            out.println("<option value='" +i+ "'>" + drop.get(i) + "</option>");
                        }
                    %>
                </select>
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
            <h3>Tarea #2</h3><h3>Programacion 2</h3><h3>Carne: 1290-19-2634</h3>    
            
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
$('#tbl_Estudiantes').on('click','tr td', function(evt){
    $("#btn_Agregar").hide();
     $("#btn_Modificar").show();
    $("#btn_Eliminar").show();
    $("#txt_ID").show();
                  $("#ID1").show();
   var target,idEstudiantes,Carne,Nombres,Apellidos,Direccion,Telefono,Fecha_De_Nacimiento,idSangre,Correo;
   target = $(event.target);
   idEstudiantes = target.parent().data('idestudiantes');
   idSangre = target.parent().data('id_sangre');
   Carne= target.parents("tr").find("td").eq(0).html();
   Nombres= target.parents("tr").find("td").eq(1).html();
   Apellidos= target.parents("tr").find("td").eq(2).html();
   Direccion= target.parents("tr").find("td").eq(3).html();
   Telefono= target.parents("tr").find("td").eq(4).html();
   Correo= target.parent("tr").find("td").eq(5).html();
   Fecha_De_Nacimiento= target.parents("tr").find("td").eq(6).html();
        
   

   $("#txt_ID").val(idEstudiantes);
   $("#txt_Carne").val(Carne);
   $("#txt_Nombres").val(Nombres);
   $("#txt_Apellidos").val(Apellidos);
   $("#txt_Direccion").val(Direccion);
   $("#txt_Telefono").val(Telefono);
   $("#txt_Correo").val(Correo);
   $("#txt_FechaDeNacimiento").attr("value",Fecha_De_Nacimiento);
   $("#drop_sangre").val(idSangre);//   $("#txt_sangre").val(Puesto);
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
   $("#txt_Carne").val('');
   $("#txt_Nombres").val('');
   $("#txt_Apellidos").val('');
   $("#txt_Direccion").val('');
   $("#txt_Telefono").val('');
   $("#txt_Correo").val('');
   $("#txt_FechaDeNacimiento").attr("value",'');
   $("#drop_sangre").val(0);//   $("#txt_sangre").val(Puesto);
   $("#myModal").modal('show');
/*$("#drop_sangre option").filter(function() {
    return $(this).text() === Puesto;
    }).prop('selected', true);*/
 
});
                
</script>
<script type="text/javascript">

$("#Mostrar").click(function(){
    $("#myModal2").modal('show');
});


</script>
<script type="text/javascript"> 
$(document).ready(function(){
	var altura = $('.Navegacion').offset().top;
	
	$(window).on('scroll', function(){
		if ( $(window).scrollTop() > altura ){
			$('.Navegacion').addClass('menu-fixed');
		} else {
			$('.Navegacion').removeClass('menu-fixed');
		}
	}); 
});
</script>
<script>
          function disabletext(e){
          return false;
          }
          function reEnable(){
          return true;
          }
          document.onselectstart=new Function ("return false");
          if (window.sidebar){
          document.onmousedown=disabletext;
          document.onclick=reEnable;
          }
          </script>
          <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#tbl_Estudiantes tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
    });
  });
});
</script>
    </body>
</html>
