package SmartFeedbackSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ToggleStudentStatusServlet")

public class ToggleStudentStatusServlet
extends HttpServlet {

    @Override

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        String status =
                request.getParameter("status");

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "UPDATE students SET status=? WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, status);

            ps.setInt(2, id);

            ps.executeUpdate();

            response.sendRedirect(
                    "admin/manage-students.jsp");

        }
        catch(Exception e){

            e.printStackTrace();

        }

    }

}