package net.ausiasmarch.servlet.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
        String contrasenya = request.getParameter("password") != null ? request.getParameter("password") : "invitado";
        String email = request.getParameter("email") != null ? request.getParameter("email") : "";

        // carga del driver
        // try {
        //     Class.forName("com.mysql.cj.jdbc.Driver");
        // } catch (ClassNotFoundException e) {
        //     e.printStackTrace();
        // }

        // String id = null;
        // String error = null;
        // Connection oConnection = null;
        // PreparedStatement oPreparedStatement = null;
        // ResultSet oResultSet = null;
        try {
            Connection con = DatabaseService.getConnection();
            PreparedStatement pstm = con.prepareStatement("insert into usuario(nombre, contrasenya, email) values(?,?,?)");
            pstm.setString(1, nombre);
            pstm.setString(2, contrasenya);
            pstm.setString(3, email);
            pstm.executeUpdate();
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
            //error = ex.getMessage();
        } finally {
            
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

        }

        // try {
        //     request.setAttribute("id", id);
        //     request.setAttribute("error", error);
        //     request.getRequestDispatcher("registro_resultado.jsp").forward(request, response);
        // } catch (ServletException | IOException e) {
        //     e.printStackTrace();
        // }

    }
}
