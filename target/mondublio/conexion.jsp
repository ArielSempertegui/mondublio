<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Conexión - Mondublio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-body text-center">
                        <a href="index.jsp" class="btn btn-link mb-3">&larr; Volver al menú principal</a>
                        <h2 class="mb-4">Welcome to JSTL Example!</h2>

                        <!-- Condicional if -->
                         <h3>Uso de condicional simple</h3>
                        <c:if test="${nombre == 'Rafa'}">
                            Hola Rafa
                        </c:if>
                        <c:if test="${nombre != 'Rafa'}">
                            Hola desconocido
                        </c:if>
                        <!---   -->
                        <p class="mb-3">La hora actual es:
                            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="HH:mm:ss" />
                        </p>
                        <h3 class="mt-4">Lista con JSTL:</h3>
                        <p>Lista completa: <span class="text-primary">${lista}</span></p>
                        <p>Elemento a elemento:</p>
                        <ul class="list-group mb-4">
                        <c:forEach var="item" items="${listaDeElementos}">
                            <li class="list-group-item">${item}</li>
                        </c:forEach>
                        </ul>
                        <h3 class="mt-4">Lista de elementos con scriptlets: <small class="text-muted">(uso no recomendado)</small></h3>
                        <ul class="list-group mb-4">
                        <% 
                            java.util.ArrayList<String> lista = (java.util.ArrayList<String>) request.getAttribute("listaDeElementos");
                            for (String item : lista) {
                        %>
                            <li class="list-group-item"><%= item %></li>
                        <% } %>
                        </ul>
                        <h3 class="mt-4">Herramienta de debug temporal:</h3>
                        <div class="text-start">
                        <% java.util.Enumeration<String> names = request.getAttributeNames();
                            out.println("<h4>Request attributes:</h4> <ul class='list-group'>");
                            while (names.hasMoreElements()) {
                                String n = names.nextElement();
                                out.println("<li class='list-group-item'>" + n + " = " + request.getAttribute(n) + "</li>");
                            }
                            out.println("</ul>");
                        %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
