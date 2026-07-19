<%@ page import="java.sql.*" %>

<%@ page import="SmartFeedbackSystem.db.DBConnection" %>

<!DOCTYPE html>

<html>

<head>

<title>
Faculty Directory
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body class="dashboard-body">

<div class="container py-5">

<div class="d-flex
justify-content-between
align-items-center
mb-5">

<h1 class="text-white fw-bold">

Faculty Directory

</h1>

<a href="student-dashboard.jsp"
class="btn btn-light">

Back Dashboard

</a>

</div>

<div class="row g-4">

<%

Integer studentId =
(Integer)session.getAttribute(
"studentId");

if(studentId == null){

response.sendRedirect(
"../login.jsp?role=student");

return;

}

Connection con =
DBConnection.getConnection();

/* STUDENT COURSE */

PreparedStatement studentPs =
con.prepareStatement(

"SELECT course FROM students WHERE id=?"

);

studentPs.setInt(
1,
studentId);

ResultSet studentRs =
studentPs.executeQuery();

String studentCourse = "";

if(studentRs.next()){

studentCourse =
studentRs.getString("course");

}

/* FACULTY FILTER */

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM faculty WHERE teacher_field=? AND status='ACTIVE'"

);

ps.setString(
1,
studentCourse);

ResultSet rs =
ps.executeQuery();

while(rs.next()){

%>

<div class="col-md-4">

<div class="faculty-card">

<div class="text-center">

<img

src="../<%= rs.getString("profile_photo") == null
? "images/default.png"
: rs.getString("profile_photo") %>"

class="faculty-directory-image">

</div>

<h2 class="mt-3 text-center"
style="color:rgb(0, 0, 0);">

<%= rs.getString("full_name") %>

</h2>

<p class="faculty-course">

<%= rs.getString("teacher_field") == null
? "Faculty"
: rs.getString("teacher_field") %>

-

<%= rs.getString("department") == null
? "Department"
: rs.getString("department") %>

</p>

<p class="faculty-bio-small">

<%= rs.getString("bio") == null
? "No bio available"
: rs.getString("bio") %>

</p>

<div class="d-grid gap-2 mt-4">

<a

href="faculty-public-profile.jsp?id=<%= rs.getInt("id") %>"

class="btn btn-purple">

View Profile

</a>

<a

href="give-feedback.jsp?facultyId=<%= rs.getInt("id") %>"

class="btn btn-dark">

Give Feedback

</a>

</div>

</div>

</div>

<%

}

%>

</div>

</div>

</body>

</html>