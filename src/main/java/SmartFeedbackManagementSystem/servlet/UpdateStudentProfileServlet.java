package SmartFeedbackManagementSystem.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackManagementSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateStudentProfileServlet")

@MultipartConfig

public class UpdateStudentProfileServlet
extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession();

            Integer studentId =
                    (Integer) session.getAttribute(
                            "studentId");

            // FORM DATA

            String rollNumber =
                    request.getParameter(
                            "rollNumber");

            String fullName=
                    request.getParameter(
                            "fullName");

            String course =
                    request.getParameter(
                            "course");

            String department =
                    request.getParameter(
                            "department");

            String email =
                    request.getParameter(
                            "email");

            String phone =
                    request.getParameter(
                            "phone");

            String year =
                    request.getParameter(
                            "year");

            String semester =
                    request.getParameter(
                            "semester");

            String bio =
                    request.getParameter(
                            "bio");

            String password =
                    request.getParameter(
                            "password");

            // IMAGE

            Part filePart =
                    request.getPart(
                            "profilePhoto");

            String profilePhoto = null;

            if(filePart != null &&
               filePart.getSize() > 0){

                String fileName =
                        System.currentTimeMillis()
                        + "_"
                        + filePart.getSubmittedFileName();

                String uploadPath =
                        "D:/apache-tomcat-10.1.54/webapps/SmartFeedbackManagementSystem/images/profile";

                File uploadDir =
                        new File(uploadPath);

                if(!uploadDir.exists()){

                    uploadDir.mkdirs();

                }

                filePart.write(
                        uploadPath
                        + File.separator
                        + fileName);

                profilePhoto =
                        "images/profile/"
                        + fileName;
            }

            Connection con =
                    DBConnection.getConnection();

            String query;

            // PASSWORD + PHOTO

            if(password != null &&
               !password.isEmpty()){

                if(profilePhoto != null){

                    query =
                    "UPDATE students SET " +
                    "roll_number=?, " +
                    "full_name=?, " +
                    "course=?, " +
                    "department=?, " +
                    "email=?, " +
                    "phone=?, " +
                    "year=?, " +
                    "semester=?, " +
                    "bio=?, " +
                    "password=?, " +
                    "profile_photo=? " +
                    "WHERE id=?";
                }

                else{

                    query =
                    "UPDATE students SET " +
                    "roll_number=?, " +
                    "full_name=?, " +
                    "course=?, " +
                    "department=?, " +
                    "email=?, " +
                    "phone=?, " +
                    "year=?, " +
                    "semester=?, " +
                    "bio=?, " +
                    "password=? " +
                    "WHERE id=?";
                }

            }

            // NO PASSWORD

            else{

                if(profilePhoto != null){

                    query =
                    "UPDATE students SET " +
                    "roll_number=?, " +
                    "full_name=?, " +
                    "course=?, " +
                    "department=?, " +
                    "email=?, " +
                    "phone=?, " +
                    "year=?, " +
                    "semester=?, " +
                    "bio=?, " +
                    "profile_photo=? " +
                    "WHERE id=?";
                }

                else{

                    query =
                    "UPDATE students SET " +
                    "roll_number=?, " +
                    "full_name=?, " +
                    "course=?, " +
                    "department=?, " +
                    "email=?, " +
                    "phone=?, " +
                    "year=?, " +
                    "semester=?, " +
                    "bio=? " +
                    "WHERE id=?";
                }

            }

        PreparedStatement ps =
        con.prepareStatement(query);

                ps.setString(1,
                rollNumber);
                
                ps.setString(2,
                fullName.toUpperCase());
                
                ps.setString(3,
                course.toUpperCase());
                
                ps.setString(4,
                department == null
                ? null
                : department.toUpperCase());
                
                ps.setString(5,
                email.toLowerCase());
                
                ps.setString(6,
                phone);
                
                ps.setString(7,
                year);
                
                ps.setString(8,
                semester);
                
                ps.setString(9,
                bio == null
                ? null
                : bio);
          
        
// PASSWORD + PHOTO

            if(password != null &&
               !password.isEmpty()){

                ps.setString(
                        10,
                        password);

                if(profilePhoto != null){

                    ps.setString(
                            11,
                            profilePhoto);

                    ps.setInt(
                            12,
                            studentId);
                }

                else{

                    ps.setInt(
                            11,
                            studentId);
                }

            }

            // NO PASSWORD

            else{

                if(profilePhoto != null){

                    ps.setString(
                            10,
                            profilePhoto);

                    ps.setInt(
                            11,
                            studentId);
                }

                else{

                    ps.setInt(
                            10,
                            studentId);
                }

            }

            ps.executeUpdate();

            response.sendRedirect(
                    "student/student-profile.jsp");

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);

        }

    }

}