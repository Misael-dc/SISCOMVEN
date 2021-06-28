<%-- 
    Document   : registrarCategoria
    Created on : 26-05-2021, 07:30:10 PM
    Author     : Melissa Ibañez Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Registrar Categoria</title>
    </head>
    <body>
        <jsp:useBean id="categoria" scope="session" class="com.test.bean.CategoriaBean"/>
        <%
            if(request.getParameter("guardar")!=null){
                String mensaje = categoria.registrarCategoria(request);
                out.print(mensaje);

            }
        %>
        <main class="container mt-5">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center bg-info">
                    <h1 style="color: white">REGISTRAR CATEGORIA</h1>
                    <a href="index.jsp" class="btn btn-outline-primary">INICIO</a>
                </div>
                <div class="card-body"> 
                    <form method="POST">
                        <div class="mb-3">
                          <label for="exampleInputEmail1" class="form-label">NOMBRE:</label>
                          <input type="text" class="form-control" id="exampleInputEmail1" name="nomCat">
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">DESCRIPCION:</label>
                          <input type="text" class="form-control" id="exampleInputPassword1" name="desCat">
                        </div>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </form>
                </div>
            </div>
        </main>
 
    </body>
</html>
