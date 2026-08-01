<%@ page import="java.sql.*" %>
<%@ page import="SmartFeedbackManagementSystem.db.DBConnection" %>

<%

Integer facultyId =
(Integer)session.getAttribute(
"facultyId");

if(facultyId == null){

response.sendRedirect(
"../login.jsp?role=faculty");

return;

}

Connection con =
DBConnection.getConnection();

/* FACULTY COLLEGE ID */

PreparedStatement facultyPs =
con.prepareStatement(

"SELECT college_id FROM faculty WHERE id=?"

);

facultyPs.setInt(
1,
facultyId);

ResultSet facultyRs =
facultyPs.executeQuery();

String facultyCollegeId = "";

if(facultyRs.next()){

facultyCollegeId =
facultyRs.getString("college_id");

}

/* FEEDBACK QUERY */

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM feedbacks WHERE faculty_id=? ORDER BY feedback_date DESC"

);

ps.setInt(
1,
facultyId);

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

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.feedback-card{

background:white;

border-radius:25px;

padding:25px;

margin-bottom:30px;

box-shadow:
0 10px 30px rgba(0,0,0,0.15);

border-left:
8px solid #8b5cf6;

transition:0.3s;

}

.feedback-card:hover{

transform:translateY(-5px);

}

.subject-title{

font-size:28px;

font-weight:700;

color:#111827;

}

.anonymous-box{

background:#ede9fe;

color:#6d28d9;

padding:10px 18px;

border-radius:30px;

font-weight:700;

display:inline-block;

margin-top:10px;

}

.rating-box{

background:#f3f4f6;

padding:14px 18px;

border-radius:15px;

font-weight:700;

margin-bottom:10px;

font-size:18px;

color:#facc15;

}

.rating-title{

color:#111827;

font-weight:700;

margin-right:10px;

}

.comment-box{

background:#ede9fe;

padding:18px;

border-radius:15px;

color:#111827;

font-weight:500;

}

.feedback-date{

font-size:14px;

font-weight:600;

color:#6b7280;

}

.empty-box{

background:white;

padding:50px;

border-radius:25px;

text-align:center;

box-shadow:
0 10px 30px rgba(0,0,0,0.15);

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

Subject Feedback Analytics

</h1>

<a href="faculty-dashboard.jsp"
class="btn btn-light">

Back Dashboard

</a>

</div>

<%

boolean hasData = false;

while(rs.next()){

hasData = true;

%>

<div class="feedback-card">

<div class="d-flex
justify-content-between
align-items-center">

<div>

<h2 class="subject-title">

<%= rs.getString("subject_name") %>

</h2>

<div class="anonymous-box">

<i class="fa-solid fa-user-secret me-2"></i>

Anonymous Student

</div>

</div>

<div class="feedback-date">

<i class="fa-solid fa-calendar-days me-2"></i>

<%= rs.getString("feedback_date") %>

</div>

</div>

<div class="row mt-4">

<!-- SUBJECT KNOWLEDGE -->

<div class="col-md-4">

<div class="rating-box">

<span class="rating-title">

Subject Knowledge:

</span>

<%

int sk =
rs.getInt("subject_knowledge");

for(int i=1; i<=5; i++){

if(i <= sk){

out.print("&#9733; ");

}
else{

out.print("&#9734; ");

}

}

%>

</div>

</div>

<!-- BEHAVIOUR -->

<div class="col-md-4">

<div class="rating-box">

<span class="rating-title">

Behaviour:

</span>

<%

int behaviour =
rs.getInt("behaviour");

for(int i=1; i<=5; i++){

if(i <= behaviour){

out.print("&#9733; ");

}
else{

out.print("&#9734; ");

}

}

%>

</div>

</div>

<!-- TEACHING -->

<div class="col-md-4">

<div class="rating-box">

<span class="rating-title">

Teaching Skill:

</span>

<%

int ts =
rs.getInt("teaching_skill");

for(int i=1; i<=5; i++){

if(i <= ts){

out.print("&#9733; ");

}
else{

out.print("&#9734; ");

}

}

%>

</div>

</div>

</div>

<!-- COMMENT -->

<div class="mt-4">

<h5 class="fw-bold text-dark mb-3">

Student Comment

</h5>

<div class="comment-box">

<%= rs.getString("comment") == null
|| rs.getString("comment").trim().equals("")

? "No comment added"

: rs.getString("comment") %>

</div>

</div>

</div>

<%

}

if(!hasData){

%>

<div class="empty-box">

<i class="fa-solid fa-chart-column"
style="font-size:80px;
color:#8b5cf6;"></i>

<h2 class="mt-4 fw-bold text-dark">

No Feedback Yet

</h2>

<p class="text-secondary mt-3">

Feedback received from students will appear here.

</p>

</div>

<%

}

%>

</div>

</body>

</html>