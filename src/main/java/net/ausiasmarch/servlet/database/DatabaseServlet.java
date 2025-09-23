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

@WebServlet("/database")
public class DatabaseServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // recogida de parametros
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // carga del driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (
            Connection con = ConnectionSingleton.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement("insert into usuario(username, password, email) values(?,?,?)");
            PreparedStatement pstmt2 = con.prepareStatement("select id from usuario where email = ?")
        ) {
            pstmt1.setString(1, username);
            pstmt1.setString(2, password);
            pstmt1.setString(3, email);
            pstmt1.executeUpdate();

            pstmt2.setString(1, email);
            try(ResultSet rs = pstmt2.executeQuery()){
                if (rs.next()) { 
                    request.setAttribute("id", rs.getInt("id"));
                }
            }
        } catch (SQLException ex) {
            request.setAttribute("error", "No se pudo insertar el registro");
        } 
    
        request.getRequestDispatcher("registro_resultado.jsp").forward(request, response);
    }
}
