<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <title>Registro</title>
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Registro de usuario</h2>
                        <form method="post" action="RegisterServlet">
                            <div class="mb-3">
                                <label for="username" class="form-label">Usuario</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                                <div class="mb-3">
                                <label for="password" class="form-label">Repetir Contraseña</label>
                                <input type="password" class="form-control" id="password" name="passwordRepeat" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Registrar</button>
                            </div>
                        </form>
                            <%  String error = request.getParameter("error") != null ? request.getParameter("error") : "";
                                if (error.equals("1")) { %>
                                    <div class="alert alert-danger mt-3 text-center" role="alert">
                                        Usuario ya registrado.
                                    </div>
                            <% } else if(error.equals("2")) {%>
                                    <div class="alert alert-danger mt-3 text-center" role="alert">
                                        Las contraseñas no coinciden.
                                    </div>
                            <% } %>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
