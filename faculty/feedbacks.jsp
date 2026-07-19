<%@ page import="java.sql.*" %>
<%@ page import="SmartFeedbackSystem.db.DBConnection" %>

<%

Integer facultyId =
(Integer)session.getAttribute(
"facultyId");

if(facultyId == null){

response.sendRedirect(
"../login.jsp?role=faculty");

}

Connection con =
DBConnection.getConnection();

String query =
"SELECT f.rating, f.feedback_text, f.is_anonymous, s.subject_name, st.full_name FROM feedbacks f JOIN subjects s ON f.subject_id=s.id JOIN students st ON f.student_id=st.id WHERE f.faculty_id=? ORDER BY f.created_at DESC";

PreparedStatement ps =
con.prepareStatement(query);

ps.setInt(1, facultyId);

ResultSet rs =
ps.executeQuery();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Faculty Feedbacks
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

<style>

.feedback-card{

background:white;

padding:25px;

border-radius:18px;

box-shadow:
0 0 15px rgba(0,0,0,0.1);

margin-bottom:25px;

}

.rating{

font-size:24px;

color:gold;

}

.subject-title{

font-size:20px;

font-weight:700;

color:#6f42c1;

}

</style>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-5">

Faculty Feedbacks

</h2>

<%

boolean hasFeedback = false;

while(rs.next()){

hasFeedback = true;

%>

<div class="feedback-card">

<div class="d-flex justify-content-between align-items-center mb-3">

<div class="subject-title">

<%= rs.getString("subject_name") %>

</div>

<div class="rating">

<%

int rating =
rs.getInt("rating");

for(int i=1; i<=rating; i++){

%>

⭐

<%
}
%>

</div>

</div>

<p class="mb-3">

<%= rs.getString("feedback_text") %>

</p>

<div class="text-muted">

Student:

<%= rs.getBoolean("is_anonymous")
? "Anonymous"
: rs.getString("full_name") %>

</div>

</div>

<%
}

if(!hasFeedback){

%>

<div class="alert alert-warning text-center">

No Feedback Available

</div>

<%
}
%>

<div class="text-center mt-4">

<a href="faculty-dashboard.jsp"
class="btn btn-purple">

Back Dashboard

</a>

</div>

</div>

</body>

</html>