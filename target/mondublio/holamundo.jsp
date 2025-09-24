<%@ page contentType="text/html; charset=UTF-8" %>
<%! String valor = "Mundo";%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body class="bg-light">
        <main class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <h1 class="card-title text-center mb-4">Ejercicios JSP con Bootstrap</h1>
                            <!-- ejercicio 1: comentario en HTML -->       
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 1</strong>
                                </div>
                                <div>
                                    <% String nombre = "Rafa";
                                       for (int i = 1; i <= 10; i++) { %>
                                        <span class="badge bg-info text-dark mb-1">Rafa es el mejor</span><br>
                                    <% } %>
                                </div>
                            </div>
                            <!-- ejercicio 2 -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 2</strong>
                                </div>
                                <div>
                                    <% for (int i = 1; i <= 10; i++) {
                                           out.print("<span class='badge bg-success mb-1'>Rafa es el mejor</span><br>");
                                       } %>
                                </div>
                            </div>
                            <!-- ejercicio 3 -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 3</strong>
                                </div>
                                <div>
                                    <% for (int i = 1; i <= 10; i++) {
                                           out.println("<span class='badge bg-warning text-dark mb-1'>Rafa es el mejor</span><br>");
                                       } %>
                                </div>
                            </div>
                            <!-- ejercicio 4 variables -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 4</strong>
                                </div>
                                <div>
                                    <% for (int i = 1; i <= 10; i++) {
                                           out.println("<span class='badge bg-secondary mb-1'>EL valor de i es: " + i + "</span><br>");
                                       } %>
                                </div>
                            </div>
                            <!-- ejercicio 5 variables -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 5</strong>
                                </div>
                                <div>
                                    <% for (int i = 1; i <= 10; i++) { %>
                                        <span class="badge bg-danger mb-1">El valor de i es ... <%=i%></span><br>
                                    <% }%>
                                </div>
                            </div>
                            <!-- ejercicio 6 variables e if -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 6</strong>
                                </div>
                                <div>
                                    <% for (int i = 1; i <= 10; i++) {
                                           if (i < 5) { %>                                    
                                            <span class="badge bg-primary mb-1">El valor de i es ... <%=i%></span><br>
                                        <% } else { %>  
                                            <span class="badge bg-dark mb-1">******** El valor de i es ... <%=i%></span><br>
                                        <% }
                                       }%>
                                </div>
                            </div>
                            <!-- ejercicio 7 incluir expresión -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 7</strong>
                                </div>
                                <span class="badge bg-success mb-1">Hola <%=valor%></span>
                            </div>
                            <!-- ejercicio 8 incluir ficheros -->
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 8: Inclusión estática</strong>
                                </div>
                                <%@include file="incluir_estatica.jsp" %>
                            </div>
                            <div class="mb-3">
                                <div class="alert alert-primary">
                                    <strong>Ejercicio 9: Inclusión dinámica de jsp</strong>
                                </div>
                                <% String command = "hola"; %>
                                <jsp:include page="incluir_dinamica.jsp" flush="true">                      
                                    <jsp:param name="p1" value="<%=command%>" />                
                                    <jsp:param name="p2" value="Rafa" /> 
                                </jsp:include>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
