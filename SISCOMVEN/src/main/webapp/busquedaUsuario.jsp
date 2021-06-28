<%-- 
    Created on : 27-06-2021 
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
    <title>Lista de Usuario</title>
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
                <h1 style="color: white">Lista de Usuarios</h1>
                <a href="index.jsp" class="btn btn-outline-light">Menu Inicio</a>
            </div>
            <div class="card-body">
                <form class="d-flex justify-content-between align-items-center" >
                    <label for="formFileSm" class="form-label">Paterno: </label>
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="busqueda" style="width:80%">
                    <button class="btn btn-outline-success" type="submit" name="buscar">Search</button>
                 </form>
            </div>
            <div class="card-body">
                <jsp:useBean id="usuarioBean" scope="session" class="com.test.bean.UsuarioBean"/>
                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Rol</th>
                            <th>Nombre Completo</th>
                            <th>Cedula</th>
                            <th>Codigo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if(request.getParameter("buscar") != null){
                            String datos = usuarioBean.busquedaUsuario(request);
                            if (datos.equals("")) {   
                                out.print("<tr><td colspan='4' align='center'>No se Encontro el Usuario!</td></tr>");
                            }else{
                                out.print(datos);
                            }

                        }else{
                            String datos = usuarioBean.busquedaUsuario(null);
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
