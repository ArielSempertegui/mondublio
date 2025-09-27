<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Resultado del registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow">
                    <div class="card-body text-center">

                        <h2 class="card-title mb-4">Resultado del registro</h2>
                        <c:choose>
                            <c:when test="${id != null}">
                                <div class="alert alert-success">Registro insertado correctamente. Nuevo ID: <strong>${id}</strong></div>
                            </c:when>
                            <c:when test="${error != null}">
                                <div class="alert alert-danger">Error al insertar el registro: ${error}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-info">No se ha realizado ninguna operación.</div>
                            </c:otherwise>
                        </c:choose>

                        <!-- COMMENTS
                        <c:if test="${id != null}">
                            <div class="alert alert-success">Registro insertado correctamente. Nuevo ID: <strong>${id}</strong></div>
                        </c:if>
                        <c:if test="${error != null}">
                            <div class="alert alert-danger">Error al insertar el registro: ${error}</div>
                        </c:if>
                        <c:if test="${empty id and empty error}">
                            <div class="alert alert-info">No se ha realizado ninguna operación.</div>
                        </c:if>
                        COMMENT -->
                        
                        <!-- COMMENT 
                        <% 
                            Integer id = (Integer) request.getAttribute("id");
                            String error = (String) request.getAttribute("error");
                            if (id != null) {
                        %>
                            <div class="alert alert-success">Registro insertado correctamente. Nuevo ID: <strong><%= id %></strong></div>
                        <% } else if (error != null) { %>
                            <div class="alert alert-danger">Error al insertar el registro: <%= error %></div>
                        <% } else { %>
                            <div class="alert alert-info">No se ha realizado ninguna operación</div>
                        <% } %>
                        COMMENT -->
                        <a href="registro.html" class="btn btn-link mt-3">Volver al formulario</a>

                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>