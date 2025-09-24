<%@ page contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio - Mondublio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>

    <body class="bg-light d-flex flex-column min-vh-100">
        <main class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card shadow">
                        <div class="card-body text-center">
                            <h1 class="card-title mb-4">Bienvenido a Mondublio</h1>
                            <h4 class="card-title mb-4">Si quieres aprender practicando con jsp, jstl, servlets y más,
                                ¡estás en el lugar correcto!</h4>
                            <p class="mb-4">Selecciona una opción para generar números aleatorios:</p>
                            <div class="d-grid gap-3">
                                <a href="aleatorio.jsp" class="btn btn-outline-primary">
                                    Ejemplo aleatorio fijo<br>
                                    <span class="small text-warning">Genera un número aleatorio entre 1 y 10</span>
                                </a>
                                <a href="formulario.html" class="btn btn-outline-primary">
                                    Formulario para aleatorio personalizado<br>
                                    <span class="small text-warning">Elige los límites para tu número aleatorio</span>
                                </a>
                                <a href="holamundo.jsp" class="btn btn-outline-primary">
                                    Demo holamundo.jsp<br>
                                    <span class="small text-warning ">Ejercicio demo para estudiantes de desarrollo
                                        web</span>
                                </a>
                                <a href="holamundo" class="btn btn-outline-primary">
                                    Servlet holamundo<br>
                                    <span class="small text-warning">Ejecuta el servlet holamundo</span>
                                </a>
                                <a href="conexion" class="btn btn-outline-primary">
                                    Servlet conexion<br>
                                    <span class="small text-warning">Conecta con un JSP y le pasa un ArrayList</span>
                                </a>
                                <a href="formularioservlet.html" class="btn btn-outline-primary">
                                    Formulario con Servlet<br>
                                    <span class="small text-warning">Envía parámetros al servlet /aleatorio</span>
                                </a>
                                <a href="formulariosession.jsp" class="btn btn-outline-primary">
                                    Formulario con sesión<br>
                                    <span class="small text-warning">Envía datos y usa la sesión</span>
                                </a>
                                <a href="login.jsp" class="btn btn-outline-primary">
                                    Acceso al sistema (Login)<br>
                                    <span class="small text-warning">Mantenimiento de sesión</span>
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>

    </html>