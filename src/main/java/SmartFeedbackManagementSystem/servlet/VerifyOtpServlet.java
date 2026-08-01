package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import SmartFeedbackManagementSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/VerifyOtpServlet")

public class VerifyOtpServlet
extends HttpServlet {

    @Override

    protected void doPost(

    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException,
    IOException {

        String enteredOtp =
        request.getParameter(
        "otp");

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

            String query =

            "SELECT * FROM otp_verification " +

            "WHERE email=? " +

            "ORDER BY id DESC LIMIT 1";

            PreparedStatement ps =

            con.prepareStatement(
            query);

            ps.setString(
            1,
            email);

            ResultSet rs =

            ps.executeQuery();

            if(rs.next()){

                String dbOtp =

                rs.getString(
                "otp");

                Timestamp createdTime =

                rs.getTimestamp(
                "created_at");

                long currentTime =

                System
                .currentTimeMillis();

                long otpTime =

                createdTime
                .getTime();

                long difference =

                currentTime
                - otpTime;

                // 10 MIN CHECK

                if(difference >

                10 * 60 * 1000){

                    response
                    .sendRedirect(

                    "verify-otp.jsp?expired=1");

                    return;
                }

                // OTP MATCH

                if(dbOtp.equals(
                enteredOtp)){

                    session
                    .setAttribute(

                    "otpVerified",
                    true);

                    response
                    .sendRedirect(

                    "reset-password.jsp");
                }

                else{

                    response
                    .sendRedirect(

                    "verify-otp.jsp?invalid=1");
                }

            }

            else{

                response
                .sendRedirect(

                "verify-otp.jsp?invalid=1");
            }

        }

        catch(Exception e){

            e.printStackTrace();

            response
            .sendRedirect(

            "verify-otp.jsp?invalid=1");
        }
    }
}