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

String facultyId =
request.getParameter(
"facultyId");

if(facultyId == null){

response.sendRedirect(
"faculty-directory.jsp");

return;

}

Connection con =
DBConnection.getConnection();

/* STUDENT DETAILS */

PreparedStatement studentPs =
con.prepareStatement(

"SELECT * FROM students WHERE id=?"

);

studentPs.setInt(
1,
studentId);

ResultSet studentRs =
studentPs.executeQuery();

String course = "";
String department = "";
String yearName = "";
String semester = "";

if(studentRs.next()){

course =
studentRs.getString("course");

department =
studentRs.getString("department");

yearName =
studentRs.getString("year");

semester =
studentRs.getString("semester");

}

/* FACULTY COLLEGE ID */

PreparedStatement facultyPs =
con.prepareStatement(

"SELECT college_id FROM faculty WHERE id=?"

);

facultyPs.setInt(
1,
Integer.parseInt(facultyId));

ResultSet facultyRs =
facultyPs.executeQuery();

String facultyCollegeId = "";

if(facultyRs.next()){

facultyCollegeId =
facultyRs.getString("college_id");

}

/* MATCHING SUBJECTS */

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM subjects " +
"WHERE college_id=? " +
"AND UPPER(course)=? " +
"AND year=? " +
"AND semester=?"

);

ps.setString(
1,
facultyCollegeId);

ps.setString(
2,
course.toUpperCase());

ps.setString(
3,
yearName);

ps.setString(
4,
semester);

ResultSet rs =
ps.executeQuery();

/* CHECK SUBJECT EXISTS */

boolean canGiveFeedback =
rs.next();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Give Feedback
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

select option{

color:gold;
font-weight:bold;

}

.feedback-card{

background:white;

padding:40px;

border-radius:20px;

box-shadow:
0 0 20px rgba(0,0,0,0.1);

margin-top:60px;

}

</style>

</head>

<body>

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="feedback-card">

<h2 class="text-center mb-5"
style="color:black;
font-weight:700;">

Give Feedback

</h2>

<%

if(!canGiveFeedback){

%>

<div class="alert alert-danger text-center">

<h4>

Unable to Give Feedback

</h4>

<p>

No subject found for your

<b>

Year:
<%= yearName %>

</b>

and

<b>

Semester:
<%= semester %>

</b>

for this faculty.

</p>

<a href="faculty-directory.jsp"
class="btn btn-dark">

Back Directory

</a>

</div>

<%

}
else{

%>

<form action="../SubmitFeedbackServlet"
method="post">

<input type="hidden"
name="facultyId"
value="<%= facultyId %>">

<!-- SUBJECT -->

<div class="mb-4">

<label class="mb-2"
style="color:black;
font-weight:600;">

Select Subject

</label>

<select
name="subjectName"
class="form-select custom-input"
required>

<option value="">
Select Subject
</option>

<%

do{

%>

<option value="<%= rs.getString("subject_name") %>">

<%= rs.getString("subject_name") %>

</option>

<%

}while(rs.next());

%>

</select>

</div>

<!-- SUBJECT KNOWLEDGE -->

<div class="mb-4">

<label class="mb-2"
style="color:black;
font-weight:600;">

Subject Knowledge

</label>

<select
name="subjectKnowledge"
class="form-select custom-input"
required>

<option value="5">
&#9733; &#9733; &#9733; &#9733; &#9733; Excellent
</option>

<option value="4">
&#9733; &#9733; &#9733; &#9733; Very Good
</option>

<option value="3">
&#9733; &#9733; &#9733; Good
</option>

<option value="2">
&#9733; &#9733; Average
</option>

<option value="1">
&#9733; Poor
</option>

</select>

</div>

<!-- BEHAVIOUR -->

<div class="mb-4">

<label class="mb-2"
style="color:black;
font-weight:600;">

Behaviour

</label>

<select
name="behaviour"
class="form-select custom-input"
required>

<option value="5">
&#9733; &#9733; &#9733; &#9733; &#9733; Excellent
</option>

<option value="4">
&#9733; &#9733; &#9733; &#9733; Very Good
</option>

<option value="3">
&#9733; &#9733; &#9733; Good
</option>

<option value="2">
&#9733; &#9733; Average
</option>

<option value="1">
&#9733; Poor
</option>

</select>

</div>

<!-- TEACHING SKILL -->

<div class="mb-4">

<label class="mb-2"
style="color:black;
font-weight:600;">

Teaching Skill

</label>

<select
name="teachingSkill"
class="form-select custom-input"
required>

<option value="5">
&#9733; &#9733; &#9733; &#9733; &#9733; Excellent
</option>

<option value="4">
&#9733; &#9733; &#9733; &#9733; Very Good
</option>

<option value="3">
&#9733; &#9733; &#9733; Good
</option>

<option value="2">
&#9733; &#9733; Average
</option>

<option value="1">
&#9733; Poor
</option>

</select>

</div>

<!-- COMMENT -->

<div class="mb-4">

<label class="mb-2"
style="color:black;
font-weight:600;">

Additional Comment
(Optional)

</label>

<textarea
name="comment"
class="form-control custom-input"
rows="5"
placeholder="Write feedback..."></textarea>

</div>

<button
class="btn btn-purple w-100">

Submit Feedback

</button>

<a href="faculty-directory.jsp"
class="btn btn-dark w-100 mt-3">

Back Directory

</a>

</form>

<%

}

%>

</div>

</div>

</div>

</div>

</body>

</html>