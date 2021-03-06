
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/vistas/partials/header.jsp" %>
       
        <!-- LOGIN DE LA PAGINA -->
        <main class="container mb-5">
            <h1 class="text-center mt-5 mb-5 display-6 text-uppercase">Iniciar Sesión en Online Banking</h1>
            <section class="row">
                <div class="col-lg-6 col-md-12 col-sm-12 p-0 text-center">
                    <img class="img-fluid shadow rounded" src="../img/login.jpg" alt="quienes">
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 p-0">
                    <form method="POST" action="/UserController/login" class="p-5 bg-body needs-validation" novalidate>
                    <div class="d-flex justify-content-end">
                        <a href="#" class="">
                            <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
                        </a>
                    </div>
                    <div class="mb-3">
                        <label for="user" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="user" name="user" required>
                        <div id="userHelp" class="form-text">Nunca compartiremos sus datos con alguien más.</div>
                        <div class="invalid-feedback">Coloque su nombre de usuario.</div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <div class="invalid-feedback">Coloque su contraseña.</div>
                    </div>
                    <div class="row align-items-center justify-content-between">
                        <div class="col-auto">
                            <button type="submit" class="btn btn-dark">Ingresar</button>
                        </div>
                        <div class="col-auto">
                            <a href="/view/register" class="link-primary">Registrarme</a>
                        </div>
                    </div>
                </form>
                </div>
            </section>
        </main>
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

