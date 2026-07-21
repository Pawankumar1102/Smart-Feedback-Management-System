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

@WebServlet("/UpdateAdminProfileServlet")

@MultipartConfig

public class UpdateAdminProfileServlet
extends HttpServlet {
        

        @Override

protected void doPost(

HttpServletRequest request,
HttpServletResponse response)

throws ServletException, IOException {

try{

HttpSession session =
request.getSession();

Integer adminId =
(Integer)session.getAttribute(
"adminId");

Connection con =
DBConnection.getConnection();

/* OLD DATA */

PreparedStatement oldPs =
con.prepareStatement(

"SELECT * FROM admins WHERE id=?");

oldPs.setInt(1, adminId);

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
request.getPart("profilePhoto");

String profilePhoto =
rs.getString("profile_photo");

if(filePart != null &&
filePart.getSize() > 0){

String fileName =
System.currentTimeMillis()
+ "_"
+ filePart.getSubmittedFileName();

String uploadPath =
getServletContext()
.getRealPath("/images/profile");

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

/* UPDATE */

PreparedStatement ps =
con.prepareStatement(

"UPDATE admins SET full_name=?, email=?, phone=?, bio=?, password=?, profile_photo=? WHERE id=?");

ps.setString(1,
fullName.toUpperCase());

ps.setString(2,
email.toLowerCase());

ps.setString(3,
phone);

ps.setString(4,
bio == null
? null
: bio);

ps.setString(5,
password);

ps.setString(6,
profilePhoto);

ps.setInt(7,
adminId);

/* EXECUTE UPDATE */

ps.executeUpdate();

response.sendRedirect(
"admin/admin-profile.jsp");

}

catch(Exception e){

e.printStackTrace();

response.getWriter().println(e);

}

}
}