<%@ page import="java.util.Random"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
                                // Generación de números aleatorios
                                int max = 10;
                                int min = 1;
                                Random rand = new Random();
                                int randomNum = rand.nextInt((max - min) + 1) + min;
                            %>
                            <div class="alert alert-success">
                                <h2 class="mb-0">El número generado es el... <strong><%= randomNum %></strong></h2>
                            </div>
                            <a href="index.jsp" class="btn btn-outline-primary mt-3">Volver</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
