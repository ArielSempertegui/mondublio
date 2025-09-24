<%@ page import="java.util.Random"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int max = 0;
    int min = 0;
    try{

        max = Integer.parseInt(request.getParameter("superior"));
        min = Integer.parseInt(request.getParameter("inferior"));

    }catch(Exception e){
        response.sendRedirect("formulario.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">        
        <title>Generación de números aleatorios</title>
    </head>
    <body class="bg-light d-flex flex-column min-vh-100">
        <main class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow">
                        <div class="card-body text-center">
                            <h1 class="card-title mb-4">Generación de números aleatorios</h1>
                            <%                                
                                // comprobar que max es mayor que min
                                if (max < min) {
                            %>
                                <div class="alert alert-danger">
                                    <h2 class="mb-0">Error: El valor máximo debe ser mayor que el mínimo.</h2>
                                    <meta http-equiv="refresh" content="5;url=formulario.html">
                                </div>
                            <%
                                } else {
                                    Random rand = new Random();
                                    int randomNum = rand.nextInt((max - min) + 1) + min;
                            %>
                                <div class="alert alert-success">
                                    <h2 class="mb-0">El número generado es el... <strong><%= randomNum %></strong></h2>
                                    <!-- redirect to formulario.jsp-->                                    
                                </div>
                            <%
                                }
                            %>
                            <a href="formulario.html" class="btn btn-outline-primary mt-3">Volver al formulario</a>
                            <a href="index.jsp" class="btn btn-outline-primary mt-3">Volver</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
