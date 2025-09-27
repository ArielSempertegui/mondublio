<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <form method="post" action="RegisterDatabase"> <!-- Podemos cambiar a "database" servlet-->
                            <div class="mb-3">
                                <label for="username" class="form-label">Usuario</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="passwordRepeat" class="form-label">Repetir Contraseña</label>
                                <input type="password" class="form-control" id="passwordRepeat" name="passwordRepeat" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Registrar</button>
                            </div>
                        </form>

                        <c:choose>
                            <c:when test="${param.errorRegistro == '1'}">
                                    <div class="alert alert-danger mt-3 text-center" role="alert">
                                        Usuario ya registrado.
                                    </div>
                            </c:when>
                            <c:when test="${param.errorRegistro == '2'}">
                                    <div class="alert alert-danger mt-3 text-center" role="alert">
                                        Ese correo electrónico ya se encuentra en uso.
                                    </div>
                            </c:when>
                            <c:when test="${param.errorRegistro == '3'}">
                                 <div class="alert alert-danger mt-3 text-center" role="alert">
                                        Las contraseñas no coinciden.
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
