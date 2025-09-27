package net.ausiasmarch.servlet.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginDatabase")
public class LoginDatabase extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // recogida de parametros
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // carga del driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (
            Connection con = ConnectionSingleton.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement("select * from usuario where email=?");
        ) {
            pstmt1.setString(1, email);

            try(ResultSet rs = pstmt1.executeQuery()){
                if (rs.next() && rs.getString("email").equals(email) && rs.getString("password").equals(password)) { 
                    request.getSession().setAttribute("username", rs.getString("username"));
                    response.sendRedirect("welcome.jsp");
                } else {
                    response.sendRedirect("loginBD.jsp?errorLogin=1");
                }
            }
        } catch (SQLException ex) {
            request.setAttribute("error", "No se pudo insertar el registro");
        } 
    }
}
