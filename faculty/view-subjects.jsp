<%@ page import="java.sql.*" %>

<%@ page import="SmartFeedbackSystem.db.DBConnection" %>

<%

String collegeId =
(String)session.getAttribute(
"facultyCollegeId");

if(collegeId == null){

response.sendRedirect(
"../login.jsp");

return;

}

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM subjects WHERE college_id=?"

);

ps.setString(
1,
collegeId);

ResultSet rs =
ps.executeQuery();

%>

<!DOCTYPE html>

<html>

<head>

<title>
View Subjects
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

</head>

<body class="subject-body">

<div class="subject-card">

<h1 class="subject-title">

Added Subjects

</h1>

<%

boolean found = false;

while(rs.next()){

found = true;

%>

<div class="subject-view-box">

<h4>

<%= rs.getString("subject_name") %>

</h4>

<p>

Course:
<%= rs.getString("course") %>

<br><br>

Department:
<%= rs.getString("department") == null
? "N/A"
: rs.getString("department") %>

<br><br>

Year:
<%= rs.getString("year") %>

<br><br>

Semester:
<%= rs.getString("semester") %>

</p>

<a href="../DeleteSubjectServlet?id=<%= rs.getInt("id") %>"
class="btn btn-danger btn-sm">

Remove Subject

</a>

</div>

<%

}

if(!found){

%>

<div class="alert alert-warning">

No Subjects Added Yet

</div>

<%

}

%>

<a href="add-subject.jsp"
class="btn btn-purple w-100 mt-3">

Back

</a>

</div>

</body>

</html>