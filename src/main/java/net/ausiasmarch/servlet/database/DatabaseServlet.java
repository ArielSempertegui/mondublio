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
        // try {
        //     Class.forName("com.mysql.cj.jdbc.Driver");
        // } catch (ClassNotFoundException e) {
        //     e.printStackTrace();
        // }

        int id = 0;
        String error = null;
        // Connection oConnection = null;
        // PreparedStatement oPreparedStatement = null;
        // ResultSet oResultSet = null;
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
                while (rs.next()) { 
                    id = rs.getInt("id");
                }
            }
            // ...cambio: considerar éxito si rowsAffected > 0 aunque no se devuelva
            // generated key...
            // if (rowsAffected > 0) {
            //     oResultSet = oPreparedStatement.getGeneratedKeys();
            //     if (oResultSet != null && oResultSet.next()) {
            //         id = String.valueOf(oResultSet.getLong(1));
            //     } else {
            //         id = ""; // éxito pero sin id generado disponible
            //     }
            // } else {
            //     error = "No se pudo insertar el registro.";
            // }

        } catch (SQLException ex) {
            error = "No se pudo insertar el registro";
        } //finally {
            
            // try {
            //     if (oResultSet != null) {
            //         oResultSet.close();
            //     }
            // } catch (SQLException ex) {
            //     ex.printStackTrace();
            // }
            // try {
            //     if (oPreparedStatement != null) {
            //         oPreparedStatement.close();
            //     }
            // } catch (SQLException ex) {
            //     ex.printStackTrace();
            // }
            // try {
            //     if (oConnection != null) {
            //         oConnection.close();
            //     }
            // } catch (SQLException ex) {
            //     ex.printStackTrace();
            // }

        //}

        if (id != 0) {
            request.setAttribute("id", id);
        } else {
            request.setAttribute("error", error);
        }
        
        request.getRequestDispatcher("registro_resultado.jsp").forward(request, response);

    }
}
