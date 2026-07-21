package SmartFeedbackManagementSystem.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
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

@WebServlet("/UploadStudentPhotoServlet")

@MultipartConfig

public class UploadStudentPhotoServlet
extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        Integer studentId =
                (Integer)session.getAttribute(
                        "studentId");

        Part filePart =
                request.getPart("photo");

        String fileName =
                Paths.get(
                        filePart.getSubmittedFileName())
                        .getFileName()
                        .toString();

        String uploadPath =
                getServletContext().getRealPath("")
                + "images/profile";

        File uploadDir =
                new File(uploadPath);

        if(!uploadDir.exists()){

            uploadDir.mkdir();

        }

        filePart.write(
                uploadPath + File.separator + fileName);

        String dbPath =
                "images/profile/" + fileName;

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "UPDATE students SET profile_photo=? WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, dbPath);

            ps.setInt(2, studentId);

            ps.executeUpdate();

            response.sendRedirect(
                    "student/student-profile.jsp?success=1");

        }
        catch(Exception e){

            e.printStackTrace();

        }

    }

}