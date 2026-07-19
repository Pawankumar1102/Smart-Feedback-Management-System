package SmartFeedbackSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import SmartFeedbackSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentLoginServlet")

public class StudentLoginServlet extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String rollNumber =
                request.getParameter("rollNumber").trim();

        String password =
                request.getParameter("password");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM students WHERE roll_number=? AND password=? AND status='ACTIVE'";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, rollNumber);

            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                HttpSession session =
                request.getSession();

                session.setAttribute(
                "studentId",
                rs.getInt("id"));

                session.setAttribute(
                "studentName",
                rs.getString("full_name"));

                response.sendRedirect(
                "student/student-dashboard.jsp");

            }
            else{

                response.sendRedirect(
                "login.jsp?error=1");

            }

        }
        catch(Exception e){

            e.printStackTrace();

        }

    }

}