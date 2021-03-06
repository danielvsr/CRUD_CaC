<%@include file="/vistas/partials/header.jsp" %>


    <!-- SECCION DE PORTADA -->
    <section>
        <div class="mb-3 ">
            <img class=" img-fluid min-vw-100 " src="img/portada.jpg" alt="portada" style="height:500px;">
        </div>
    </section>

    <main class="container d-flex justify-content-center align-items-center" ></main>
    <!-- SECCION INSTITUCIONAL -->
        <h1 class="text-center m-5 display-6 text-uppercase">La Banca Online que lo acompa?a en sus proyectos</h1>
        <section class="container" id="institucional">
            <article class="row" >
                <div class="col-lg-6 col-md-12 col-sm-12 p-0 text-center">
                    <img class="img-fluid shadow rounded" src="img/quienes.jpg" alt="quienes">
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 p-0" >
                    <p class="p-2 fs-5 text-uppercase text-muted">
                        Culpa occaecat officia non eiusmod veniam sit occaecat. Pariatur occaecat velit duis magna proident. Eiusmod incididunt aute non aliqua velit consequat Lorem Lorem.
                        Irure laboris nisi laborum amet eiusmod Lorem veniam cillum esse cillum. Laboris voluptate esse 
                        et nulla enim ea veniam. Exercitation non consequat ex ut anim velit 
                        dolor eu. Do ullamco eiusmod sit fugiat esse. 
                        Sint consectetur proident deserunt cupidatat laboris labore duis. Labore enim commodo quis sit sunt ad cillum elit et nostrud sint.
                    </p>
                </div>
            </article>
        </section>
    <!-- SECCION PRODUCTOS -->    
        <h1 class="text-center m-5 display-6 text-uppercase">Solicite sus productos</h1>
        <section class="container mb-5">
            <article class="row" id="productos">
                <div class="col-lg-6 col-md-12 col-sm-12 p-0" >
                    <p class="p-2 fs-5 text-uppercase text-muted">
                        Culpa occaecat officia non eiusmod veniam sit occaecat. Pariatur occaecat velit duis magna proident. Eiusmod incididunt aute non aliqua velit consequat Lorem Lorem.
                        Irure laboris nisi laborum amet eiusmod Lorem veniam cillum esse cillum. Laboris voluptate esse 
                        et nulla enim ea veniam. Exercitation non consequat ex ut anim velit 
                        dolor eu. Do ullamco eiusmod sit fugiat esse. 
                    </p>
                    <div class="mb-5">
                        <%
                            if(isLogged){
                                User usuario = (User) session.getAttribute("usuario");
                                Account account = (Account) session.getAttribute("accounts");  
                        %>   
                        <a href="/view/nuevaCuenta" type="button" class="btn btn-dark mt-3">Solicitar</a>
                        <%
                            } else {
                        %>
                        <a href="/view/login" type="button" class="btn btn-secondary mt-3">Solicitar</a>
                        <%
                            }    
                        %>
                    </div>
                </div>                
                <div class="col-lg-6 col-md-12 col-sm-12 p-0 text-center">
                    <img class="img-fluid shadow rounded" src="img/producto.jpg" alt="producto">
                </div>
            </article>
        </section> 
    </main>

<%@include file="/vistas/partials/footer.jsp" %>
