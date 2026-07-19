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

@WebServlet("/FacultyLoginServlet")

public class FacultyLoginServlet
extends HttpServlet {

@Override

protected void doPost(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException, IOException {


String collegeId =
request.getParameter(
"collegeId");

if (collegeId != null) {

    collegeId = collegeId.trim();

}
    
String password =
request.getParameter(
"password");

if(password != null){

password =
password.trim();

}

try{

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM faculty WHERE college_id=? AND password=? AND status='ACTIVE'";

PreparedStatement ps =
con.prepareStatement(query);

ps.setString(
1,
collegeId);

ps.setString(
2,
password);

ResultSet rs =
ps.executeQuery();

if(rs.next()){

    HttpSession session =
    request.getSession();

    session.setAttribute(
    "facultyId",
    rs.getInt("id"));

    session.setAttribute(
    "facultyName",
    rs.getString("full_name"));

    session.setAttribute(
    "facultyEmail",
    rs.getString("email"));

    session.setAttribute(
    "facultyCollegeId",
    rs.getString("college_id"));

    response.sendRedirect(
    "faculty/faculty-dashboard.jsp");

}
else{

    response.sendRedirect(
    "login.jsp?error=faculty");

}

}
catch(Exception e){

e.printStackTrace();

}

}

}