package net.ausiasmarch.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordRepeat = request.getParameter("passwordRepeat");

        // Obtener el "mapa de usuarios" global
        HashMap<String, String> users = (HashMap<String, String>) getServletContext().getAttribute("users");    // Scope Application
        if(users == null) {
            users = new HashMap<>();
        }

        //confirmar que el usuario sea nuevo y coincidan las contraseñas
        if(users.containsKey(username)) {
            response.sendRedirect("register.jsp?errorRegistro=1");  // <-- Aquí le estamos pasando unos parámetros por URL (al estilo http Get), porque cuando lo redirigamos
        } else if(!password.equals(passwordRepeat)){                         //     no se va a acordar. (Hacer esto es opcional, solo si le queremos pasar parámetros)
            response.sendRedirect("register.jsp?errorRegistro=2");
        } else {
            // Guardar el usuario
            users.put(username, password);
            getServletContext().setAttribute("users", users);

            response.sendRedirect("login.jsp?registrado=1");
        }                                                            
    }
}
