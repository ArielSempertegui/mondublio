package net.ausiasmarch.servlet;

import java.io.IOException;
import java.util.ArrayList; // import arraylist

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/conexion")
public class Conexion extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // crear un arraylist de strings
        ArrayList<String> lista = new ArrayList<String>();
        lista.add("Elemento 1");
        lista.add("Elemento 2");
        lista.add("Elemento 3");
        lista.add("Elemento 4");
        lista.add("Elemento 5");
        //pasar como parametro a la jsp para que lo muestre
        request.setAttribute("listaDeElementos", lista);
        String nombre = "Rafa";
        request.setAttribute("nombre", nombre);
        //redirigir a la jsp
        request.getRequestDispatcher("conexion.jsp").forward(request, response); // Le pasamos el request y el response, porque sino no se acordará (nivel scope request)
        //response.sendRedirect("conexion.jsp");  <--- A menos que creemos una session (nivel scope session) para que se acuerde y ya no hace falta pasarle el request, responde
        /*
         * Diferencias:
         * Nivel Scope Request
         * request.getParameter("") --> Me devuelve un String siempre, sirve para pillar las peticiones que le hemos enviado 
         * request.setAttribute("", )
         * request.getAttribute("") --> Me devuelve un objeto que hay que castearlo al tipo envolvente del que proviente ej: int --> castear a Integer o string --> castear a String
         *                              El getAttribute() es por que le hemos puesto un setAttribute() antes
         * Nivel Scope Session
         * request.getSession().setAttribute("", )
         * request.getSession().getAttribute("") --> Igual
         * 
         * Nivel Scope Application
         * getServletContext().setAttribute("", )
         * getServletContext().getAttribute("") --> Igual
        */
    }
}
