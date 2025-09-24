<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String username = (String) request.getSession().getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zona Privada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <main class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body text-center">
                        <h2 class="card-title mb-4">Bienvenido, <%= username %>!</h2>
                        <p class="mb-4">Has accedido a la zona privada.</p>
                        <form method="post" action="LogoutServlet">
                            <button type="submit" class="btn btn-danger">Cerrar sesión</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
