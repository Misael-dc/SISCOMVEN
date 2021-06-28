<%-- 
    Document   : productoBajoStock
    Created on : 27 jun. 2021, 21:32:34
    Author     : Misael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Listado de Productos</title>
</head>
<body>
    <main class="container mt-5">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center bg-info">
                <h1 style="color: white">Listado de Productos</h1>
                <a href="index.jsp" class="btn btn-outline-primary">MENU INICIO</a>
            </div>
            <div class="card-body">
                <form class="d-flex justify-content-between align-items-center" method="POST">
                    
                    <label for="formFileSm" class="form-label">Stock <= </label>
                    <select class="form-select" name="cantidad" style="width: 80%"> 
                        <option value="10000" selected>Elija una opcion</option>
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                    </select>

                    <button class="btn btn-outline-success" type="submit" name="buscar">Search</button>
                </form>
            </div>
            <div class="card-body">
                <jsp:useBean id="productoBean" scope="session" class="com.test.bean.ProductoBean"/>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>NOMBRE</th>
                            <th>DESCRIPCION</th>
                            <th>COSTO UNIT. COMPRA</th>
                            <th>COSTO UNIT. VENTA</th>
                            <th>STOCK</th>
                            <th>PROVEEDOR</th>
                            <th>CATEGORIA</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if(request.getParameter("buscar") != null){
                            String datos =  productoBean.productoBajoStock(request);
                            out.print(datos);
                        }else{
                            String datos =  productoBean.productoBajoStock(null);
                            out.print(datos);
                        }
                           
                        %>
                    </tbody>
                </table>

            </div>
        </div>

    </main>
</body>
</html>
