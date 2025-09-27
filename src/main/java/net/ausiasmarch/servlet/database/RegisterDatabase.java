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

@WebServlet("/RegisterDatabase")
public class RegisterDatabase extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // recogida de parametros
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordRepeat = request.getParameter("passwordRepeat");
        String email = request.getParameter("email");

        // carga del driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (
            Connection con = ConnectionSingleton.getConnection();
            PreparedStatement pstmt1 = con.prepareStatement("select username from usuario where username=?");
            PreparedStatement pstmt2 = con.prepareStatement("select email from usuario where email=?");
            PreparedStatement pstmt3 = con.prepareStatement("insert into usuario(username, password, email) values(?,?,?)")
        ) {
            pstmt1.setString(1, username);
            pstmt2.setString(1, email);
            try(
                ResultSet rs1 = pstmt1.executeQuery();
                ResultSet rs2 = pstmt2.executeQuery()   
            ){
                if (rs1.next()) { 
                    response.sendRedirect("registroBD.jsp?errorRegistro=1");
                } else if(rs2.next()){
                    response.sendRedirect("registroBD.jsp?errorRegistro=2");
                } else if (!password.equals(passwordRepeat)) {
                    response.sendRedirect("registroBD.jsp?errorRegistro=3");
                } else {
                    //Guardar usuario en la bd
                    pstmt3.setString(1, username);
                    pstmt3.setString(2, password);
                    pstmt3.setString(3, email);
                    pstmt3.executeUpdate();

                    response.sendRedirect("loginBD.jsp?registrado=1");
                }
            }
        } catch (SQLException ex) {
            request.setAttribute("error", "No se pudo insertar el registro");
        } 
    }
}
