<%@ page import="java.sql.*" %>

<%@ page import="SmartFeedbackSystem.db.DBConnection" %>

<%

String facultyId =
request.getParameter("id");

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM faculty WHERE id=?"

);

ps.setInt(
1,
Integer.parseInt(facultyId));

ResultSet rs =
ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Faculty Profile
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

</head>

<body class="dashboard-body">

<div class="container py-5">

<div class="public-profile-card">

<div class="text-center">

<img

src="../<%= rs.getString("profile_photo") == null
? "images/default.png"
: rs.getString("profile_photo") %>"

class="public-profile-image">

</div>

<h1 class="mt-4 text-dark fw-bold">

<%= rs.getString("full_name") %>

</h1>

<p class="public-profile-info">

<%= rs.getString("teacher_field") == null
? "Faculty"
: rs.getString("teacher_field") %>

-

<%= rs.getString("department") == null
? "Department"
: rs.getString("department") %>

</p>

<p class="public-profile-bio">

<%= rs.getString("bio") == null
? "No bio available"
: rs.getString("bio") %>

</p>

<div class="college-box"
style="color:black;
font-weight:600;">

Prestige Institute Of Management And Research,
Hathai Kheda Kokta,
Raisen Road, Bhopal

</div>

<hr class="my-4">

<h3 class="mb-4"
style="color:black;
font-weight:700;">

Subjects Taught

</h3>

<div class="row g-3">

<%

PreparedStatement ps2 =
con.prepareStatement(

"SELECT * FROM subjects WHERE college_id=?"

);

ps2.setString(
1,
rs.getString("college_id"));

ResultSet subjects =
ps2.executeQuery();

while(subjects.next()){

%>

<div class="col-md-6">

<div class="subject-display-card">

<h3 style="color:rgba(14, 6, 17, 0.888);
font-weight:700;">

<%= subjects.getString("subject_name") %>

</h3>

<p style="color:#58319c;
font-weight:600;">>

<%= subjects.getString("course") %>

|

Year
<%= subjects.getString("year") %>

|

Sem
<%= subjects.getString("semester") %>

</p>

</div>

</div>

<%

}

%>

</div>

<a href="give-feedback.jsp?facultyId=<%= facultyId %>"
class="btn btn-purple w-100 mt-4">

Give Feedback

</a>

<a href="faculty-directory.jsp"
class="btn btn-dark w-100 mt-3">

Back Directory

</a>

</div>

</div>

</body>

</html>