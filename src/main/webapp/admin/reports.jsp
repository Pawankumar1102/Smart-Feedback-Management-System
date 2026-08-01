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

/* ADMIN TYPE */

String adminType =

(String)session.getAttribute(
"adminType");

String adminCourse =

(String)session.getAttribute(
"adminCourse");

if(adminCourse == null){

adminCourse = "";

}

/* DATABASE */

Connection con =
DBConnection.getConnection();

/* TOP FACULTY QUERY */

String topFacultyQuery =

"SELECT faculty.full_name, AVG(feedbacks.rating) AS avg_rating, COUNT(feedbacks.id) AS total_feedbacks FROM feedbacks JOIN faculty ON feedbacks.faculty_id = faculty.id WHERE faculty.teacher_field=? GROUP BY faculty.id ORDER BY avg_rating DESC";

PreparedStatement topPs =
con.prepareStatement(topFacultyQuery);

topPs.setString(
1,
adminCourse);

ResultSet topRs =
topPs.executeQuery();

/* TOTAL FEEDBACK */

String totalFeedbackQuery =

"SELECT COUNT(*) FROM feedbacks fb JOIN faculty fac ON fb.faculty_id = fac.id WHERE fac.teacher_field=?";

PreparedStatement totalPs =
con.prepareStatement(totalFeedbackQuery);

totalPs.setString(
1,
adminCourse);

ResultSet totalRs =
totalPs.executeQuery();

int totalFeedback = 0;

if(totalRs.next()){

totalFeedback =
totalRs.getInt(1);

}

/* AVG SYSTEM RATING */

String avgQuery =

"SELECT AVG(feedbacks.rating) FROM feedbacks JOIN faculty ON feedbacks.faculty_id = faculty.id WHERE faculty.teacher_field=?";

PreparedStatement avgPs =
con.prepareStatement(avgQuery);

avgPs.setString(
1,
adminCourse);

ResultSet avgRs =
avgPs.executeQuery();

double avgRating = 0;

if(avgRs.next()){

avgRating =
avgRs.getDouble(1);

}

%>

<!DOCTYPE html>

<html>

<head>

<title>
Reports & Analytics
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
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

.report-card{

background:white;

padding:30px;

border-radius:20px;

box-shadow:
0 0 20px rgba(0,0,0,0.08);

margin-bottom:30px;

}

.analytics-box{

background:white;

padding:30px;

border-radius:20px;

text-align:center;

box-shadow:
0 0 20px rgba(0,0,0,0.08);

transition:0.3s;

}

.analytics-box:hover{

transform:translateY(-5px);

}

.analytics-number{

font-size:45px;

font-weight:700;

color:#6f42c1;

}

.faculty-card{

background:white;

padding:25px;

border-radius:18px;

box-shadow:
0 0 15px rgba(0,0,0,0.08);

margin-bottom:20px;

border-left:
6px solid #8b5cf6;

}

.rating{

font-size:24px;

color:gold;

font-weight:bold;

}

</style>

</head>

<body class="dashboard-body">

<div class="container py-5">

<div class="d-flex
justify-content-between
align-items-center
mb-5">

<div>

<h1 class="text-white fw-bold">

Reports & Analytics

</h1>

<p class="text-light">

Showing
<%= adminCourse %>
Department Analytics

</p>

</div>

<a href="admin-dashboard.jsp"
class="btn btn-light">

Back Dashboard

</a>

</div>

<!-- ANALYTICS -->

<div class="row g-4 mb-5">

<div class="col-md-6">

<div class="analytics-box">

<h4>

Total Feedbacks

</h4>

<div class="analytics-number">

<%= totalFeedback %>

</div>

</div>

</div>

<div class="col-md-6">

<div class="analytics-box">

<h4>

Average Rating

</h4>

<div class="analytics-number">

<%= String.format("%.1f",
avgRating) %>

</div>

</div>

</div>

</div>

<!-- TOP FACULTY -->

<div class="report-card">

<h3 class="mb-4">

Top Rated Faculty

</h3>

<%

boolean hasFaculty = false;

while(topRs.next()){

hasFaculty = true;

%>

<div class="faculty-card">

<div class="d-flex
justify-content-between
align-items-center">

<div>

<h4 style="font-weight:700;">

<%= topRs.getString("full_name") %>

</h4>

<p class="text-muted mb-0">

Total Feedbacks:
<%= topRs.getInt("total_feedbacks") %>

</p>

</div>

<div class="rating">

&#9733;
<%= String.format("%.1f",
topRs.getDouble("avg_rating")) %>

</div>

</div>

</div>

<%

}

if(!hasFaculty){

%>

<div class="alert alert-warning">

No Feedback Data Available

</div>

<%

}

%>

</div>

</div>

</body>

</html>