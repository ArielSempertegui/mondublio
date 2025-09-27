<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Iniciar sesión</h2>
                        <form method="post" action="LoginDatabase">
                            <div class="mb-3">
                                <label for="email" class="form-label">Correo elecntrónico</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                        </form>
                        <c:if test="${param.errorLogin == '1'}">
                                <div class="alert alert-danger mt-3 text-center" role="alert">
                                    Correo electrónico o contraseña incorrectos.
                                </div>
                        </c:if>
                        <c:if test="${param.registrado == '1'}">
                                <div class="alert alert-success mt-3 text-center" role="alert">
                                    Usuario registrado correctamente.
                                </div>
                        </c:if>
                        <div class="text-center">
                            <a href="registroBD.jsp">No tienes cuenta? Create una haciendo click aquí</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
