<%-- 
    Document   : index
    Created on : 26-05-2021, 07:29:36 PM
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
    <title>JSP Page</title>

</head>

<body>
    
<main class="container mt-5">
    <div class="card">
        <div class="card-header bg-info">
            <h1 style="color: white">MENU DE OPCIONES</h1>
        </div>
        
        <div class="card-body">
            <a href="registrarCategoria.jsp" class="list-group-item list-group-item-action">REGISTRAR CATEGORIA</a>
            <a href="listaCategoria.jsp" class="list-group-item list-group-item-action"> LISTA CATEGORIA </a>
            <a href="listaProducto.jsp" class="list-group-item list-group-item-action"> LISTA PRODUCTOS </a>
        </div>
    </div>    
</main>

</body>
</html>
