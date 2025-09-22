package net.ausiasmarch.servlet.database;

import java.io.IOException;
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
        String nombre = request.getParameter("username") != null ? request.getParameter("username") : "invitado";
        String password = request.getParameter("password") != null ? request.getParameter("password") : "invitado";
        String email = request.getParameter("email") != null ? request.getParameter("email") : "invitado";

        // carga del driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String id = null;
        String error = null;
        java.sql.Connection oConnection = null;
        PreparedStatement oPreparedStatement = null;
        ResultSet oResultSet = null;
        try {
            oConnection = DatabaseService.getConnection();
            String sql = "INSERT INTO usuario (username, password, email) VALUES (?, ?, ?)";
            oPreparedStatement = oConnection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            oPreparedStatement.setString(1, nombre);
            oPreparedStatement.setString(2, password);
            oPreparedStatement.setString(3, email);
            int rowsAffected = oPreparedStatement.executeUpdate();
            // ...cambio: considerar éxito si rowsAffected > 0 aunque no se devuelva
            // generated key...
            if (rowsAffected > 0) {
                oResultSet = oPreparedStatement.getGeneratedKeys();
                if (oResultSet != null && oResultSet.next()) {
                    id = String.valueOf(oResultSet.getLong(1));
                } else {
                    id = ""; // éxito pero sin id generado disponible
                }
            } else {
                error = "No se pudo insertar el registro.";
            }

        } catch (SQLException ex) {
            error = ex.getMessage();
        } finally {

            try {
                if (oResultSet != null) {
                    oResultSet.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if (oPreparedStatement != null) {
                    oPreparedStatement.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if (oConnection != null) {
                    oConnection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }

        try {
            request.setAttribute("id", id);
            request.setAttribute("error", error);
            request.getRequestDispatcher("registro_resultado.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }
}
