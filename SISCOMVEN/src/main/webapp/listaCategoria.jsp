<%-- 
    Document   : listaCategoria
    Created on : 01-06-2021, 08:39:55 PM
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
        <title>Lista de Categoria</title>
        <style>
            body{
                margin: 0;
                height: 100vh;
                background: rgb(10,55,73);
                background: linear-gradient(180deg, rgba(10,55,73,1) 0%, rgba(15,90,143,1) 35%, rgba(0,212,255,1) 100%);
            }
        </style>
    </head>
    <body>
        <main class="container mt-5">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center bg-primary">
                    <h1 style="color: white">Lista de Categoría</h1>
                    <a href="index.jsp" class="btn btn-outline-light">Menu Inicio</a>
                </div>
                <div class="card-body">
                    <jsp:useBean id="categoriaBean" scope="session" class="com.test.bean.CategoriaBean"/>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%=categoriaBean.listarCategoria()%>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </main>
            
    </body>
</html>
