<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/vistas/partials/header.jsp" %>
<%
  User usuario = (User) session.getAttribute("usuario");  
  session.setAttribute("id", usuario.getId());
  int id_mp = (Integer) session.getAttribute("id");
  String id = Integer.toString(id_mp);
  
%>

<section>
    <div class="row m-5 text-center">
        <h1 class="display-6 text-uppercase">Edite sus Datos Personales</h1>
    </div>    
</section>
<section class="container w-75 mb-5">
    
    <form class="shadow p-5 mb-5 bg-body rounded needs-validation" method="POST" action="/UserController/modificarUsuario" enctype="application/x-www-form-urlencoded" novalidate>
        <div class="d-flex justify-content-end mb-5">
            <a href="#" class="">
                <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
            </a>
        </div>
        <div class="row">
            <input type="hidden" name="id_mp" value="<%= id %>">
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="text" class="form-control" id="name_ep" name="name_ep" placeholder="" required>
                <label for="name_ep" class="text-muted">First name</label>
                <div class="invalid-feedback">Coloque su nombre.</div>
            </div>
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="text" class="form-control" id="lastname_ep" name="lastname_ep" placeholder="" required>
                <label for="lastname_ep" class="text-muted">Last name</label>
                <div class="invalid-feedback">Coloque su apellido.</div>
            </div>
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="email" class="form-control" id="email_ep" name="email_ep" placeholder="name@example.com" required>
                <label for="email_ep" class="text-muted">Email address</label>
                <div class="invalid-feedback">Coloque una casilla de correo válida.</div>
            </div>
  
            <div class="col-md-3 align-self-center mb-3">
                <label class="form-label" for="gender_ep">Género</label>
                <div class="d-flex">
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender_ep" id="gender_ep" value="Female" required>
                        <label class="form-check-label" for="Female">Femenino</label>
                        <div class="invalid-feedback">Seleccione su género.</div>
                    </div>
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender_ep" id="gender_ep" value="Male" required>
                        <label class="form-check-label" for="Male">Masculino</label>
                    </div>
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender_ep" id="gender_ep" value="NoBin" required>
                        <label class="form-check-label" for="NoBin">Otro</label>                        
                    </div>
                </div>    
            </div>
            <%--
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="text" class="form-control" id="nameUser_ep" name="nameUser_ep" placeholder="nameUser"  required>
                <label for="nameUser_ep" class="text-muted" >Usuario</label>
                <div id="userHelp" class="form-text text-truncate">Su nombre de usuario es: <% out.println(" " + usuario.getUsername()); %></div>
            </div>
            --%>
        </div>
        <div class="col-auto mt-3">
            <button type="submit" class="btn btn-dark">Confirmar</button>
        </div>
    </form>
        
</section>
<%--ACA EMPIEZA LA VALIDACIÓN DEL FORMULARIO--%>    
<script>
    (function () {
          'use strict'

          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.querySelectorAll('.needs-validation')

          // Loop over them and prevent submission
          Array.prototype.slice.call(forms)
            .forEach(function (form) {
              form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                }

                form.classList.add('was-validated')
              }, false);
            });
        })();                
</script>            
<%@include file="/vistas/partials/footer.jsp" %>