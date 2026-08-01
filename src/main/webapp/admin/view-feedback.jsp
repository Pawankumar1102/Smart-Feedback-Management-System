<%@ page import="java.sql.*" %>
<%@ page import="SmartFeedbackManagementSystem.db.DBConnection" %>

<%

String adminName =
(String)session.getAttribute(
"adminName");

if(adminName == null){

response.sendRedirect(
"../login.jsp?role=admin");

return;

}

/* ADMIN COURSE */

String adminCourse =
(String)session.getAttribute(
"adminCourse");

if(adminCourse == null){

adminCourse = "";

}

/* DATABASE */

Connection con =
DBConnection.getConnection();

/* FILTERED FEEDBACK */

String query =

"SELECT fb.*, " +

"s.full_name AS student_name, " +

"s.roll_number, " +

"fac.full_name AS faculty_name " +

"FROM feedbacks fb " +

"JOIN students s ON fb.student_id = s.id " +

"JOIN faculty fac ON fb.faculty_id = fac.id " +

"WHERE UPPER(s.course)=? " +

"ORDER BY fb.feedback_date DESC";

PreparedStatement ps =
con.prepareStatement(query);

ps.setString(
1,
adminCourse.toUpperCase());

ResultSet rs =
ps.executeQuery();

%>

<!DOCTYPE html>

<html>

<head>

<title>
View Feedback
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

<style>

.feedback-card{

background:white;

padding:25px;

border-radius:20px;

margin-bottom:30px;

box-shadow:
0 10px 30px rgba(0,0,0,0.12);

border-left:
8px solid #8b5cf6;

}

.feedback-title{

font-size:26px;

font-weight:700;

color:#111827;

}

.feedback-sub{

font-size:15px;

font-weight:600;

color:#6b7280;

}

.rating{

font-size:20px;

color:#facc15;

font-weight:bold;

}

.comment-box{

background:#ede9fe;

padding:18px;

border-radius:15px;

margin-top:15px;

}

</style>

</head>

<body class="dashboard-body">

<div class="container py-5">

<div class="d-flex
justify-content-between
align-items-center
mb-5">

<h1 class="text-white fw-bold">

Feedback Reports

</h1>

<a href="admin-dashboard.jsp"
class="btn btn-light">

Back Dashboard

</a>

</div>

<%

while(rs.next()){

%>

<div class="feedback-card">

<h2 class="feedback-title">

<%= rs.getString("faculty_name") %>

</h2>

<p class="feedback-sub">

Subject:
<%= rs.getString("subject_name") %>

</p>

<p class="feedback-sub">

Student:
<%= rs.getString("student_name") %>

</p>

<p class="feedback-sub">

Roll Number:
<%= rs.getString("roll_number") %>

</p>

<p class="feedback-sub">

Date:
<%= rs.getString("feedback_date") %>

</p>

<hr>

<p class="rating">

Subject Knowledge:

<%= rs.getInt("subject_knowledge") %>/5

</p>

<p class="rating">

Behaviour:

<%= rs.getInt("behaviour") %>/5

</p>

<p class="rating">

Teaching Skill:

<%= rs.getInt("teaching_skill") %>/5

</p>

<div class="comment-box">

<b>
Comment:
</b>

<br><br>

<%= rs.getString("comment") == null
? "No comment"
: rs.getString("comment") %>

</div>

</div>

<%

}

%>

</div>

</body>

</html>