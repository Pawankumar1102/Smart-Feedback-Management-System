<%@ page import="java.sql.*" %>
<%@ page import="SmartFeedbackManagementSystem.db.DBConnection" %>

<%

Integer facultyId =
(Integer)session.getAttribute(
"facultyId");

if(facultyId == null){

response.sendRedirect(
"../login.jsp");

return;

}

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM faculty WHERE id=?");

ps.setInt(1, facultyId);

ResultSet rs =
ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Edit Faculty Profile
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

</head>

<body class="modern-profile-body">

<div class="edit-profile-container">

<div class="edit-profile-card">

<h2 class="text-center mb-4">
Edit Profile
</h2>

<form action="../UpdateFacultyProfileServlet"
method="post"
enctype="multipart/form-data">

<div class="student-edit-wrapper">

<!-- TOP -->

<div class="student-edit-top">

<img src="../<%= rs.getString("profile_photo")==null
? "images/default.png"
: rs.getString("profile_photo") %>"

class="student-edit-photo">

<div>

<label class="student-upload-btn">

Choose Profile Photo

<input type="file"
name="profilePhoto"
hidden>

</label>

</div>

</div>

<!-- GRID -->

<div class="student-edit-grid">

<!-- ROLL -->

<div class="student-edit-box">

<label>
College ID
</label>

<input type="text"
name="facultyId"
value="<%= rs.getString("college_id") %>"
readonly
class="faculty-readonly">

</div>

<!-- NAME -->

<div class="student-edit-box">

<label>
Full Name
</label>

<input type="text"
name="fullName"
value="<%= rs.getString("full_name") %>"
readonly
class="faculty-readonly">

</div>

<!-- EMAIL -->

<div class="student-edit-box">

<label>
Email
</label>

<input type="email"
name="email"
value="<%= rs.getString("email") %>">

</div>

<!-- PHONE -->

<div class="student-edit-box">

<label>
Phone Number
</label>

<input type="text"
name="phone"
value="<%= rs.getString("phone") %>">

</div>

<!-- TEACHER FIELD -->

<div class="student-edit-box">

<label>
Teacher Field
</label>

<input type="text"

value="<%= rs.getString("teacher_field") %>"

readonly

class="student-readonly">

</div>

<!-- DEPARTMENT -->

<%
String teacherField =
rs.getString("teacher_field");
%>

<% if("BTECH".equals(teacherField)){ %>

<div class="student-edit-box">

<label>
Select Branch
</label>

<select name="department"
id="department">

<option value="CS">CS</option>

<option value="CSDS">CSDS</option>

<option value="AIML">AIML</option>

<option value="EX">EX</option>

<option value="EC">EC</option>

<option value="CIVIL">CIVIL</option>

<option value="MECHANICAL">
MECHANICAL
</option>

</select>

</div>

<% } %>

<!-- BIO -->

<div class="student-edit-box"
style="grid-column:1/3;">

<label>
Bio
</label>

<textarea name="bio"><%= 
rs.getString("bio") == null
? ""
: rs.getString("bio") %></textarea>

</div>

<!-- PASSWORD -->

<div class="student-edit-box">

<label>
New Password
</label>

<div class="password-box">

<input type="password"
id="password"
name="password">

<span class="toggle-eye"
onclick="togglePassword()">

&#128065;

</span>

</div>

</div>

<!-- CONFIRM -->

<div class="student-edit-box">

<label>
Confirm Password
</label>

<div class="password-box">

<input type="password"
id="confirmPassword">

<span class="toggle-eye"
onclick="toggleConfirmPassword()">

&#128065;

</span>

</div>

<p id="passwordError"></p>

<p class="password-note">

Password must contain:

<br>

• 1 Capital Letter

<br>

• 1 Small Letter

<br>

• 1 Number

<br>

• 1 Special Character

</p>

</div>

<!-- BUTTONS -->

<div class="student-btn-row">

<button type="submit"
class="student-update-btn">

Update Profile

</button>

<a href="faculty-profile.jsp"
class="student-back-btn">

Back Profile

</a>

</div>

</div>

</form>



/* =========================
STUDENT EDIT PROFILE LOGIC
========================= */

<script>

function updateCourseFields(){

let course =
document.getElementById(
"course").value;

let departmentBox =
document.getElementById(
"departmentBox");

if(course === "BTECH"){

departmentBox.style.display =
"block";

}

else{

departmentBox.style.display =
"none";

}

}

window.onload = function(){

updateCourseFields();

};

function previewPhoto(event){

document.getElementById(
"previewImage").src =

URL.createObjectURL(
event.target.files[0]);

}

function togglePassword(){

let pass =
document.getElementById(
"password");

if(pass.type === "password"){

pass.type = "text";

}
else{

pass.type = "password";

}

}

function toggleConfirmPassword(){

let confirm =
document.getElementById(
"confirmPassword");

if(confirm.type === "password"){

confirm.type = "text";

}
else{

confirm.type = "password";

}

}

document.querySelector("form")
.addEventListener(
"submit",

function(e){

let p1 =
document.getElementById(
"password").value;

let p2 =
document.getElementById(
"confirmPassword").value;

let error =
document.getElementById(
"passwordError");

let regex =
/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

if(p1 !== "" &&
!regex.test(p1)){

e.preventDefault();

error.innerHTML =
"Password is too weak";

return;

}

if(p1 !== p2){

e.preventDefault();

error.innerHTML =
"Password does not match";

return;

}

});

</script>

</body>

</html>