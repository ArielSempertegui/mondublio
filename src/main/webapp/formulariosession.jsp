<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de aleatorios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">                
    </head>
    <body class="bg-light d-flex flex-column min-vh-100">
        <main class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow">
                        <div class="card-body">
                            <h1 class="card-title text-center mb-4">Generación de números aleatorios</h1>
                            <form method="GET" action="session">
                                <div class="mb-3">
                                    <label for="sup" class="form-label">Límite superior</label>
                                    <input type="number" class="form-control" id="sup" placeholder="Introduce límite superior" name="superior" required>
                                </div>
                                <div class="mb-3">
                                    <label for="inf" class="form-label">Límite inferior</label>
                                    <input type="number" class="form-control" id="inf" placeholder="Introduce límite inferior" name="inferior" required>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </div>
                            </form>
                            <!-- Mostrar los parámetros debajo del formulario -->
                            <%
                                String sup = request.getParameter("superior");
                                String inf = request.getParameter("inferior");
                                if (sup != null && inf != null) {
                            %>
                                <div class="alert alert-info mt-4">
                                    <strong>Parámetros recibidos:</strong><br>
                                    Límite superior: <%= sup %><br>
                                    Límite inferior: <%= inf %>
                                </div>
                            <%
                                }
                            %>
                            <!-- Mostrar los parámetros de sesión debajo del formulario -->
                            <%
                                Integer supsession = (Integer) request.getSession().getAttribute("superior");
                                Integer infsession = (Integer) request.getSession().getAttribute("inferior");
                                if (supsession != null && infsession != null) {
                            %>
                                <div class="alert alert-info mt-4">
                                    <strong>Parámetros de sesión recibidos:</strong><br>
                                    Límite superior: <%= supsession %><br>
                                    Límite inferior: <%= infsession %>
                                </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-+0n0xgD1z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6z6Q6" crossorigin="anonymous"></script>
    </body>
</html>