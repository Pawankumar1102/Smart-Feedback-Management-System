<%@ page import="java.sql.*" %>
<%@ page import="SmartFeedbackManagementSystem.db.DBConnection" %>

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

PreparedStatement ps =
con.prepareStatement(

"SELECT f.full_name, fb.subject_name, fb.subject_knowledge, fb.behaviour, fb.teaching_skill, fb.comment, fb.feedback_date FROM feedbacks fb JOIN faculty f ON fb.faculty_id = f.id WHERE fb.student_id=? ORDER BY fb.feedback_date DESC"

);

ps.setInt(
1,
studentId);

ResultSet rs =
ps.executeQuery();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Feedback History
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

.activity-card{

background:white;

border-radius:25px;

padding:25px;

box-shadow:
0 10px 30px rgba(0,0,0,0.15);

margin-bottom:30px;

transition:0.3s;

border-left:
8px solid #8b5cf6;

}

.activity-card:hover{

transform:translateY(-5px);

}

.activity-title{

font-size:28px;

font-weight:700;

color:#111827;

}

.activity-subject{

font-size:20px;

font-weight:700;

color:#7c3aed;

}

.activity-date{

font-size:14px;

color:#6b7280;

font-weight:600;

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

My Activity

</h1>

<a href="student-dashboard.jsp"
class="btn btn-light">

Back Dashboard

</a>

</div>

<%

boolean hasData = false;

while(rs.next()){

hasData = true;

%>

<div class="activity-card">

<div class="d-flex
justify-content-between
align-items-center
mb-3">

<div>

<h2 class="activity-title">

<%= rs.getString("full_name") %>

</h2>

<p class="activity-subject mb-0">

<%= rs.getString("subject_name") %>

</p>

</div>

<div class="activity-date">

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

<!-- TEACHING SKILL -->

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

Additional Comment

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

<i class="fa-solid fa-clock-rotate-left"
style="font-size:80px;
color:#8b5cf6;"></i>

<h2 class="mt-4 fw-bold text-dark">

No Feedback Activity Yet

</h2>

<p class="text-secondary mt-3">

Your submitted feedback history will appear here.

</p>

</div>

<%

}

%>

</div>

</body>

</html>