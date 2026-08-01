<%@ page import="java.sql.*" %>

<%@ page import="SmartFeedbackManagementSystem.db.DBConnection" %>

<%

Integer studentId =
(Integer)session.getAttribute(
"studentId");

if(studentId == null){

response.sendRedirect(
"../login.jsp");

return;

}

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM students WHERE id=?");

ps.setInt(
1,
studentId);

ResultSet rs =
ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Student Profile
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

</head>

<body class="modern-profile-body">


<div class="modern-profile-card">

<div class="profile-header">

<div class="profile-left">

<img src="../<%= rs.getString("profile_photo") == null
? "images/default.png"
: rs.getString("profile_photo") %>"

class="linkedin-profile-img"

onclick="openImage(this.src)">

</div>

<div class="profile-right">

<h1 class="linkedin-name">

<%= rs.getString("full_name") %>

</h1>

<p class="faculty-course">

    <%= rs.getString("course") %>

<%
if(
"BTECH".equals(
rs.getString("course"))
&&
rs.getString("department") != null
&&
!rs.getString("department")
.trim().equals("")
){
%>

|

<%= rs.getString("department") %>

<%
}
%>


</p>

<p class="faculty-course">

Year:
<%= rs.getString("year") %>

|

Semester:
<%= rs.getString("semester") %>

</p>

<p class="linkedin-bio">

<%= rs.getString("bio") == null
? "Student at Prestige Institute Of Management And Research"
: rs.getString("bio") %>

</p>

<p class="linkedin-location">

Bhopal, Madhya Pradesh

</p>

</div>

</div>

<div class="college-info-box">

Prestige Institute Of Management And Research,
Hathai Kheda Kokta,
Raisen Road, Bhopal

</div>

<div class="text-center mt-4 d-flex
justify-content-center gap-3 flex-wrap">

<a href="student-dashboard.jsp"
class="btn btn-dark px-4">

Dashboard

</a>

</div>

<div class="text-center mt-4">

<a href="edit-student-profile.jsp"
class="btn btn-purple px-5">

Edit Profile

</a>

</div>


</div>

<!-- IMAGE MODAL -->

<div id="imageModal"
class="image-modal">

<span class="close-modal"
onclick="closeImage()">

&times;

</span>

<img id="zoomedImage"
class="modal-image">

</div>

<script>

function openImage(src){

document.getElementById(
"imageModal").style.display =
"flex";

document.getElementById(
"zoomedImage").src =
src;

}

function closeImage(){

document.getElementById(
"imageModal").style.display =
"none";

}

</script>

</body>

</html>