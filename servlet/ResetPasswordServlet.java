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
import jakarta.servlet.http.HttpSession;

@WebServlet("/ResetPasswordServlet")

public class ResetPasswordServlet
extends HttpServlet {

    @Override

    protected void doPost(

    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException,
    IOException {

        String password =
        request.getParameter(
        "password");

        HttpSession session =
        request.getSession();

        String email =

        (String)
        session.getAttribute(
        "resetEmail");

        try {

            Connection con =

            DBConnection
            .getConnection();

            boolean updated =
            false;

            /* STUDENT */

            String studentQuery =

            "UPDATE students " +
            "SET password=? " +
            "WHERE email=?";

            PreparedStatement ps1 =

            con.prepareStatement(
            studentQuery);

            ps1.setString(
            1,
            password);

            ps1.setString(
            2,
            email);

            int studentRows =

            ps1.executeUpdate();

            if(studentRows > 0){

                updated =
                true;
            }

            /* FACULTY */

            if(!updated){

                String facultyQuery =

                "UPDATE faculty " +
                "SET password=? " +
                "WHERE email=?";

                PreparedStatement ps2 =

                con.prepareStatement(
                facultyQuery);

                ps2.setString(
                1,
                password);

                ps2.setString(
                2,
                email);

                int facultyRows =

                ps2.executeUpdate();

                if(facultyRows > 0){

                    updated =
                    true;
                }
            }

            /* ADMIN */

            if(!updated){

                String adminQuery =

                "UPDATE admins " +
                "SET password=? " +
                "WHERE email=?";

                PreparedStatement ps3 =

                con.prepareStatement(
                adminQuery);

                ps3.setString(
                1,
                password);

                ps3.setString(
                2,
                email);

                int adminRows =

                ps3.executeUpdate();

                if(adminRows > 0){

                    updated =
                    true;
                }
            }

            /* SUCCESS */

            session.removeAttribute(
            "resetEmail");

            session.removeAttribute(
            "otpVerified");

            response.sendRedirect(

            "login.jsp?passwordReset=1");
        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
            "reset-password.jsp");
        }
    }
}