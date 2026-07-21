package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import SmartFeedbackManagementSystem.db.DBConnection;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")

public class ContactServlet
extends HttpServlet {

    @Override
    protected void doPost(

            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String userType =
                request.getParameter(
                        "userType");

        String fullName =
                request.getParameter(
                        "fullName");

        String email =
                request.getParameter(
                        "email");

        String id =
                request.getParameter(
                        "collegeId");

        String message =
                request.getParameter(
                        "message");

        boolean valid = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    null;

            /* =====================
               STUDENT VALIDATION
            ===================== */

            if(userType.equals(
                    "student")) {

                String query =

                "SELECT * FROM students " +
                "WHERE roll_number=? " +
                "AND email=?";

                ps =
                con.prepareStatement(
                        query);

                ps.setString(
                        1,
                        id.trim());

                ps.setString(
                        2,
                        email.trim());

            }

            /* =====================
               FACULTY VALIDATION
            ===================== */

            else if(
                    userType.equals(
                    "faculty")) {

                String query =

                "SELECT * FROM faculty " +
                "WHERE college_id=? " +
                "AND email=?";

                ps =
                con.prepareStatement(
                        query);

                ps.setString(
                        1,
                        id.trim());

                ps.setString(
                        2,
                        email.trim());

            }

            /* =====================
               ADMIN VALIDATION
            ===================== */

            else if(
                    userType.equals(
                    "admin")) {

                String query =

                "SELECT * FROM admins " +
                "WHERE college_id=? " +
                "AND email=?";

                ps =
                con.prepareStatement(
                        query);

                ps.setString(
                        1,
                        id.trim());

                ps.setString(
                        2,
                        email.trim());

            }

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                valid = true;
            }

            /* INVALID */


            if(!valid){

                    response.sendRedirect(
                    "contact.jsp?invalid=1");
                
                    return;
                }

            /* =====================
               SAVE TO DATABASE
            ===================== */

            String insertQuery =

            "INSERT INTO " +
            "contact_messages(" +
            "user_type," +
            "full_name," +
            "email," +
            "roll_or_college_id," +
            "message" +
            ") VALUES(?,?,?,?,?)";

            PreparedStatement insertPs =
                    con.prepareStatement(
                            insertQuery);

            insertPs.setString(
                    1,
                    userType);

            insertPs.setString(
                    2,
                    fullName);

            insertPs.setString(
                    3,
                    email);

            insertPs.setString(
                    4,
                    id);

            insertPs.setString(
                    5,
                    message);

            insertPs.executeUpdate();

            /* =====================
               SEND MAIL
            ===================== */

            final String senderEmail =
            "feedbackpimr@gmail.com";

            final String appPassword =
            "txqq ztku rhat sjdn";

            Properties props =
                    new Properties();

            props.put(
            "mail.smtp.host",
            "smtp.gmail.com");

            props.put(
            "mail.smtp.port",
            "587");

            props.put(
            "mail.smtp.auth",
            "true");

            props.put(
            "mail.smtp.starttls.enable",
            "true");

            Session session =
            Session.getInstance(
            props,

            new Authenticator(){

                protected
                PasswordAuthentication
                getPasswordAuthentication(){

                    return new
                    PasswordAuthentication(
                    senderEmail,
                    appPassword);
                }
            });

            Message mail =
                    new MimeMessage(
                            session);

            mail.setFrom(
                    new InternetAddress(
                            senderEmail));

            mail.setRecipients(
                    Message.RecipientType.TO,

                    InternetAddress.parse(
                    "feedbackpimr@gmail.com"));

            mail.setSubject(
                    "New Contact Message");

            mail.setText(

            "User Type: "
            + userType +

            "\nName: "
            + fullName +

            "\nEmail: "
            + email +

            "\nRoll/College ID: "
            + id +

            "\n\nMessage:\n"
            + message);

            Transport.send(
                    mail);

            response.sendRedirect(
            "contact.jsp?success=1");

        }

                catch(Exception e){

                e.printStackTrace();
                        
                response.sendRedirect(
                "contact.jsp?failed=1");
        }
    }
}