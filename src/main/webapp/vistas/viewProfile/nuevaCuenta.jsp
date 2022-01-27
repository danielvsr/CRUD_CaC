<%-- 
    Document   : createAccount
    Created on : 04/01/2022, 15:23:10
    Author     : danie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="database.AccountDAO"%>
<%@include file="/vistas/partials/header.jsp" %>
<%
    User usuario = (User) session.getAttribute("usuario");    
    String userId = Integer.toString(usuario.getId());       
    
    int numeroAleatorio = (int) (Math.random() * (0 - 100000) + 100000);
    numeroAleatorio = (numeroAleatorio + 10000000);
    String numeroCuenta = Integer.toString(numeroAleatorio);
%>

    <section>
        <div class="row m-5 text-center">
            <h1 class="display-6 text-uppercase">COMPLETE LOS DATOS PARA NUEVA CUENTA</h1>
        </div>    
    </section>
    <section class="container w-50 mb-5">
        <form class="shadow p-5 mb-5 bg-body rounded needs-validation" action="/AccountController/nuevaCuenta" method="POST" enctype="application/x-www-form-urlencoded" novalidate>
            <div class="d-flex justify-content-end mb-5">
                <a href="#" class="">
                    <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
                </a>
            </div>
            <div class="row">
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-12 col-sm-12 col-xm-12">
                    <select class="form-select" id="type" name="type" aria-label="Floating label select example" required>
                        <option selected disabled value>Seleccione tipo de cuenta</option>
                        <option value="$CA 101">Caja de Ahorro</option>
                        <option value="$CC 102">Cuenta Corriente</option>
                        <option value="u$s 201">Caja de Ahorro en Dólares</option>
                        <option value="$CA 301">Caja de Ahorro Electrónica</option>
                    </select>
                   <label for="type">Elija el tipo de cuenta</label>
                </div>
                <input type="hidden" class="form-control" id="account_number" name="account_number"
                           placeholder="account_number" value="<%= numeroCuenta %>">
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-12 col-sm-12 col-xm-12">
                    <select class="form-select" id="currency" name="currency" aria-label="Floating label select example" required>
                        <option selected disabled value>Seleccione tipo de cuenta</option>
                        <option value="ARG">PESOS</option>
                        <option value="USD">DOLARES</option>
                        <option value="BIT">BITCOINS</option>
                    </select>
                   <label for="currency">Elija el tipo de moneda</label>
                </div>            
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-12 col-sm-12 col-xm-12">
                    <input type="number" class="form-control" id="balance" name="balance" min="0.00" max="100000.00" step="0.01" required>
                    <label for="balance">Dinero a ingresar:</label>
                </div>
                <input type="hidden" class="form-control" id="user_id" name="user_id" value="<%= userId %>">
            </div>
            <div class="d-grid justify-content-end">
                <button class="btn btn-dark">Confirmar</button>
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