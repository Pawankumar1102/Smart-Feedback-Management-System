package SmartFeedbackSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import SmartFeedbackSystem.db.DBConnection;

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
import jakarta.servlet.http.HttpSession;

@WebServlet("/ForgotPasswordServlet")

public class ForgotPasswordServlet
extends HttpServlet {

    @Override

    protected void doPost(

    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException,
    IOException {

        String emailOrPhone =
        request.getParameter(
        "emailOrPhone");

        boolean found = false;

        String email = "";

        try {
                System.out.println(
                "Servlet Started");

            Connection con =
            DBConnection
            .getConnection();

            // STUDENT CHECK

            String studentQuery =

            "SELECT email FROM students " +
            "WHERE email=? OR phone=?";

            PreparedStatement ps1 =
            con.prepareStatement(
            studentQuery);

            ps1.setString(
            1,
            emailOrPhone);

            ps1.setString(
            2,
            emailOrPhone);

            ResultSet rs1 =
            ps1.executeQuery();

            if(rs1.next()){

                found = true;

                email =
                rs1.getString(
                "email");
            }

            // FACULTY CHECK

            if(!found){

                String facultyQuery =

                "SELECT email FROM faculty " +
                "WHERE email=? OR phone=?";

                PreparedStatement ps2 =
                con.prepareStatement(
                facultyQuery);

                ps2.setString(
                1,
                emailOrPhone);

                ps2.setString(
                2,
                emailOrPhone);

                ResultSet rs2 =
                ps2.executeQuery();

                if(rs2.next()){

                    found = true;

                    email =
                    rs2.getString(
                    "email");
                }
            }

            // ADMIN CHECK

            if(!found){

                String adminQuery =

                "SELECT email FROM admins " +
                "WHERE email=? OR phone=?";

                PreparedStatement ps3 =
                con.prepareStatement(
                adminQuery);

                ps3.setString(
                1,
                emailOrPhone);

                ps3.setString(
                2,
                emailOrPhone);

                ResultSet rs3 =
                ps3.executeQuery();

                if(rs3.next()){

                    found = true;

                    email =
                    rs3.getString(
                    "email");
                }
            }

            // INVALID

            if(!found){

                response.sendRedirect(
                "forgot-password.jsp?invalid=1");

                return;
            }

            // OTP GENERATE

            Random random =
            new Random();

            int otpNumber =

            100000 +
            random.nextInt(
            900000);

            String otp =
            String.valueOf(
            otpNumber);

            // SAVE OTP IN DB

            String insertOtp =

            "INSERT INTO otp_verification(email, otp) VALUES(?,?)";

            PreparedStatement psOtp =
            con.prepareStatement(
            insertOtp);

            psOtp.setString(
            1,
            email);

            psOtp.setString(
            2,
            otp);

            psOtp.executeUpdate();

            // EMAIL CONFIG

            String senderEmail =
            "feedbackpimr@gmail.com";

            String appPassword =
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

                senderEmail,

                "PIMR Smart Feedback Management System"
                ));

            mail.setRecipients(

            Message.RecipientType.TO,

            InternetAddress.parse(
            email.trim()));

            mail.setSubject(
                "PIMR Security Verification Code");
        

            mail.setContent(

                        "<div style='font-family:Arial;padding:20px;'>"

                        +

                        "<h2 style='color:#6f42c1;'>"

                        +

                        "PIMR Smart Feedback Management System"

                        +

                        "</h2>"

                        +

                        "<p>Hello User,</p>"

                        +

                        "<p>Your verification code is:</p>"

                        +

                        "<div style='font-size:32px;font-weight:bold;color:#6f42c1;'>"

                        +

                        otp

                        +

                        "</div>"

                        +

                        "<p>This code will expire in <b>10 minutes</b>.</p>"

                        +

                        "<p>If you didn't request this, ignore this email.</p>"

                        +

                        "<br>"

                        +

                        "<p>Regards,<br>PIMR Security Team</p>"

                        +

                        "</div>",

                        "text/html"
                        );


            System.out.println(
                "Sending OTP...");

            System.out.println(
                "Sending to: "
                + email);
            
                            
            Transport.send(
            mail);
            
            System.out.println(
                "OTP MAIL SENT");


            HttpSession httpSession =
            request.getSession();

            httpSession
            .setAttribute(
            "resetEmail",
            email);

            response.sendRedirect(
            "verify-otp.jsp?sent=1");

        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
            "forgot-password.jsp?invalid=1");
        }
    }
}