package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackManagementSystem.db.DBConnection;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteSubjectServlet")

public class DeleteSubjectServlet
extends HttpServlet {

protected void doGet(
HttpServletRequest request,
HttpServletResponse response)

throws IOException {

try{

int id =
Integer.parseInt(
request.getParameter("id"));

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"DELETE FROM subjects WHERE id=?"

);

ps.setInt(
1,
id);

ps.executeUpdate();

response.sendRedirect(
"faculty/view-subjects.jsp");

}

catch(Exception e){

e.printStackTrace();

}

}

}