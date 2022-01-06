<%@include file="/vistas/partials/header.jsp" %>
        
    <main class="container mt-5">    
        <form action="/AccountController?accion=actualizar" method="POST">
            <div class="mb-3">
                <label for="id" class="form-label"></label>
                <input type="hidden" class="form-control" id="id" name="id" value=<%=resultado.getId()%>></input>
                
            </div>
            <div class="form-floating mb-3 col-6 p-2">
                <select class="form-select" id="type" name="type" aria-label="Floating label select example">
                    <option selected>Seleccione tipo de cuenta</option>
                    <option value=<%=resultado.getType()%>>Caja de Ahorro</option>
                    <option value=<%=resultado.getType()%>>Cuenta Corriente</option>
                    <option value=<%=resultado.getType()%>>Caja de Ahorro en Dólares</option>
                    <option value=<%=resultado.getType()%>>Caja de Ahorro Electrónica</option>
                </select>
               <label for="type">Elija el tipo de cuenta</label>
            </div>
            <div class="form-floating mb-3 col-6 p-2">
                <input type="number" class="form-control" id="account_number" name="account_number"
                placeholder="account_number" value=<%=resultado.getAccountNumber()%>>
                <label for="account_number">N° Cuenta:</label>
            </div>
            <div class="form-floating mb-3 col-6 p-2">
                <select class="form-select" id="currency" name="currency" aria-label="Floating label select example">
                    <option selected>Seleccione tipo de cuenta</option>
                    <option value=<%=resultado.getCurrency()%>>ARG</option>
                    <option value=<%=resultado.getCurrency()%>>USD</option>
                    <option value=<%=resultado.getCurrency()%>>BIT</option>
        
                </select>
               <label for="currency">Elija el tipo de moneda</label>
            </div>            
            <div class="form-floating mb-3 col-6 p-2">
                <input type="number" class="form-control" id="balance" name="balance" value=<%=resultado.getBalance()%>>
                <label for="balance">Dinero a ingresar:</label>
            </div>            
            <div class="mx-3 mt-3">
                <button class="btn btn-primary">Crear</button>
            </div>
        </form>
    </main>   