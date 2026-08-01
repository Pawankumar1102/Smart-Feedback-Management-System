package SmartFeedbackManagementSystem.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import SmartFeedbackManagementSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateFacultyProfileServlet")

@MultipartConfig

public class UpdateFacultyProfileServlet
extends HttpServlet {
        

        @Override

protected void doPost(

HttpServletRequest request,
HttpServletResponse response)

throws ServletException, IOException {

try{

HttpSession session =
request.getSession();

Integer facultyId =
(Integer)session.getAttribute(
"facultyId");

Connection con =
DBConnection.getConnection();

/* OLD DATA */

PreparedStatement oldPs =
con.prepareStatement(

"SELECT * FROM faculty WHERE id=?");

oldPs.setInt(1, facultyId);

ResultSet rs =
oldPs.executeQuery();

rs.next();

/* NEW VALUES */

String fullName =
request.getParameter(
"fullName");

String email =
request.getParameter(
"email");

String phone =
request.getParameter(
 "phone");

String teacherField =
rs.getString("teacher_field");

String department =
request.getParameter(
"department");

if ("BTECH".equals(teacherField)) {

        department = request.getParameter(
                        "department");

}

String bio =
request.getParameter(
"bio");

String password =
request.getParameter(
"password");

/* KEEP OLD VALUES */

if(fullName == null ||
fullName.trim().equals("")){

fullName =
rs.getString("full_name");

}

if(email == null ||
email.trim().equals("")){

email =
rs.getString("email");

}

if(phone == null ||
phone.trim().equals("")){

phone =
rs.getString("phone");

}

if(teacherField == null ||
teacherField.trim().equals("")){

teacherField =
rs.getString("teacher_field");

}

if("BTECH".equals(teacherField)){

if(department == null ||
department.trim().equals("")){

department =
rs.getString("department");

}

}
else{

department = null;

}


if(bio == null ||
bio.trim().equals("")){

bio =
rs.getString("bio");

}

if(password == null ||
password.trim().equals("")){

password =
rs.getString("password");

}

/* PHOTO */

Part filePart =
request.getPart(
"profilePhoto");

String profilePhoto =
rs.getString(
"profile_photo");

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

uploadDir.mkdir();

}

filePart.write(
uploadPath
+ File.separator
+ fileName);

profilePhoto =
"images/profile/"
+ fileName;

}

/* UPDATE */

PreparedStatement ps =
con.prepareStatement(

"UPDATE faculty SET full_name=?, email=?, phone=?, teacher_field=?, department=?, bio=?, password=?, profile_photo=? WHERE id=?");


ps.setString(1,
fullName.toUpperCase());

ps.setString(2,
email.toLowerCase());

ps.setString(3,
phone);

ps.setString(4,
teacherField.toUpperCase());

ps.setString(5,
department == null
? null
: department.toUpperCase());

ps.setString(6,
bio == null
? null
: bio);

ps.setString(7,
password);

ps.setString(8,
profilePhoto);

ps.setInt(9,
facultyId);


ps.executeUpdate();

response.sendRedirect(
"faculty/faculty-profile.jsp");

}

catch(Exception e){

e.printStackTrace();

response.getWriter().println(e);

}

}
}