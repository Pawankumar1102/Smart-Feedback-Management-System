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

/* GET ADMIN COURSE */

String adminCourse =
(String)session.getAttribute(
"adminCourse");

Connection con =
DBConnection.getConnection();

/* TOTAL STUDENTS */

String studentQuery =

"SELECT COUNT(*) " +
"FROM students " +
"WHERE UPPER(course)=?";

PreparedStatement studentPs =
con.prepareStatement(studentQuery);

studentPs.setString(
1,
adminCourse.toUpperCase());

ResultSet studentRs =
studentPs.executeQuery();

int totalStudents = 0;

if(studentRs.next()){

totalStudents =
studentRs.getInt(1);

}

/* TOTAL FACULTY */

String facultyQuery =

"SELECT COUNT(*) " +
"FROM faculty " +
"WHERE UPPER(teacher_field)=?";

PreparedStatement facultyPs =
con.prepareStatement(facultyQuery);

facultyPs.setString(
1,
adminCourse.toUpperCase());

ResultSet facultyRs =
facultyPs.executeQuery();

int totalFaculty = 0;

if(facultyRs.next()){

totalFaculty =
facultyRs.getInt(1);

}

/* TOTAL FEEDBACKS */

String feedbackQuery =

"SELECT COUNT(*) " +
"FROM feedbacks fb " +
"JOIN faculty f " +
"ON fb.faculty_id=f.id " +
"WHERE UPPER(f.teacher_field)=?";

PreparedStatement feedbackPs =
con.prepareStatement(feedbackQuery);

feedbackPs.setString(
1,
adminCourse.toUpperCase());

ResultSet feedbackRs =
feedbackPs.executeQuery();

int totalFeedbacks = 0;

if(feedbackRs.next()){

totalFeedbacks =
feedbackRs.getInt(1);

}

/* AVERAGE RATING */

String avgQuery =

"SELECT AVG(rating) " +
"FROM feedbacks fb " +
"JOIN faculty f " +
"ON fb.faculty_id=f.id " +
"WHERE UPPER(f.teacher_field)=?";

PreparedStatement avgPs =
con.prepareStatement(avgQuery);

avgPs.setString(
1,
adminCourse.toUpperCase());

ResultSet avgRs =
avgPs.executeQuery();

double averageRating = 0;

if(avgRs.next()){

averageRating =
avgRs.getDouble(1);

}

%>

<!DOCTYPE html>

<html>

<head>

<title>
Admin Dashboard
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="dashboard-body">

<!-- DEBUG (TEMPORARY) -->

<h3 style="color:lime; text-align:center;">

<%= adminCourse %>

</h3>

<!-- NAVBAR -->

<nav class="navbar navbar-dark custom-navbar px-4">

<div class="container-fluid">

<h2 class="text-white">

Admin Dashboard

</h2>

<a href="../LogoutServlet"
class="btn btn-light">

Logout

</a>

</div>

</nav>

<!-- DASHBOARD -->

<div class="container py-5">

<h2 class="text-center text-white mb-5">

Welcome Admin,
<%= adminName %>

</h2>

<div class="row g-4">

<!-- PROFILE -->

<div class="col-md-4">

<a href="admin-profile.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-user"></i>

</div>

<h3>My Profile</h3>

<p>
View & Edit Admin Profile
</p>

</a>

</div>

<!-- STUDENTS -->

<div class="col-md-4">

<a href="manage-students.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-users"></i>

</div>

<h3>Students</h3>

<p>

Total Students:
<%= totalStudents %>

</p>

</a>

</div>

<!-- FACULTY -->

<div class="col-md-4">

<a href="manage-faculty.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-chalkboard-user"></i>

</div>

<h3>Faculty</h3>

<p>

Total Faculty:
<%= totalFaculty %>

</p>

</a>

</div>

<!-- FEEDBACK -->

<div class="col-md-4">

<a href="view-feedback.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-comments"></i>

</div>

<h3>Feedbacks</h3>

<p>

Total Feedbacks:
<%= totalFeedbacks %>

</p>

</a>

</div>

<!-- REPORT -->

<div class="col-md-4">

<a href="reports.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-chart-column"></i>

</div>

<h3>Reports</h3>

<p>

Average Rating:
<%= String.format("%.1f",
averageRating) %>

</p>

</a>

</div>

<!-- LOGOUT -->

<div class="col-md-4">

<a href="../LogoutServlet"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-right-from-bracket"></i>

</div>

<h3>Logout</h3>

<p>
Secure Logout
</p>

</a>

</div>

</div>

</div>

</body>

</html>