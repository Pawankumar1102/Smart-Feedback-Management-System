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

ps.setInt(1, studentId);

ResultSet rs =
ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Edit Student Profile
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

<form action="../UpdateStudentProfileServlet"
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
Roll Number
</label>

<input type="text"
name="rollNumber"
value="<%= rs.getString("roll_number") %>"
readonly
class="student-readonly">

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
class="student-readonly">

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

<!-- COURSE -->

<div class="student-edit-box">

<label>
Course
</label>

<input type="text"
id="course"
name="course"
value="<%= rs.getString("course") %>"
readonly
class="student-readonly">

</div>

<!-- DEPARTMENT -->

<%
String studentCourse =
rs.getString("course");
%>

<div class="student-edit-box"
id="departmentBox"

style="<%= 
"BTECH".equals(studentCourse)
? ""
: "display:none;" %>">

<label>
Select Branch
</label>

<select name="department"
id="department">

<option value="CS"
<%= "CS".equals(rs.getString("department")) ? "selected" : "" %>>
CS
</option>

<option value="CSDS"
<%= "CSDS".equals(rs.getString("department")) ? "selected" : "" %>>
CSDS
</option>

<option value="AIML"
<%= "AIML".equals(rs.getString("department")) ? "selected" : "" %>>
AIML
</option>

<option value="EX"
<%= "EX".equals(rs.getString("department")) ? "selected" : "" %>>
EX
</option>

<option value="EC"
<%= "EC".equals(rs.getString("department")) ? "selected" : "" %>>
EC
</option>

<option value="CIVIL"
<%= "CIVIL".equals(rs.getString("department")) ? "selected" : "" %>>
CIVIL
</option>

<option value="MECHANICAL"
<%= "MECHANICAL".equals(rs.getString("department")) ? "selected" : "" %>>
MECHANICAL
</option>

</select>

</div>

<!-- YEAR -->

<div class="student-edit-box">

<label>
Select Year
</label>

<select id="year"
name="year">

<option value="">
Select Year
</option>

</select>

<input type="hidden"
id="currentYear"
value="<%= rs.getString("year") == null
? ""
: rs.getString("year") %>">

</div>


<!-- SEMESTER -->

<div class="student-edit-box">

<label>
Select Semester
</label>

<select id="semester"
name="semester">

<option value="">
Select Semester
</option>

</select>

<input type="hidden"
id="currentSemester"
value="<%= rs.getString("semester") == null
? ""
: rs.getString("semester") %>">

</div>

<!-- BIO -->

<div class="student-edit-box"
style="grid-column:1/3;">

<label>
Bio
</label>

<textarea
name="bio"><%= rs.getString("bio")==null
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

<a href="student-profile.jsp"
class="student-back-btn">

Back Profile

</a>

</div>

</div>

</form>

<script>

/* =========================
STUDENT EDIT PROFILE LOGIC
========================= */

const courseSelect =
document.getElementById("course");

const departmentWrapper =
document.getElementById(
"departmentBox");

const yearSelect =
document.getElementById("year");

const semSelect =
document.getElementById(
"semester");

/* PAGE LOAD */

window.onload = function(){

updateCourseFields();

/* EXISTING YEAR */

let currentYear =
document.getElementById(
"currentYear").value;

if(currentYear != ""){

document.getElementById(
"year").value =
currentYear;

}

/* EXISTING SEM */

let currentSem =
document.getElementById(
"currentSemester").value;

if(currentSem != ""){

document.getElementById(
"semester").value =
currentSem;

}

};

/* COURSE CHANGE */

courseSelect.addEventListener(
"change",

function(){

updateCourseFields();

});

/* MAIN FUNCTION */

function updateCourseFields(){

const course =
courseSelect.value;

/* RESET */

yearSelect.innerHTML =
'<option value="">Select Year</option>';

semSelect.innerHTML =
'<option value="">Select Semester</option>';

let maxYear = 0;
let maxSem = 0;

/* BTECH */

if(course === "BTECH"){

departmentWrapper.style.display =
"block";

maxYear = 4;
maxSem = 8;

}

/* MBA */

else if(course === "MBA"){

departmentWrapper.style.display =
"none";

maxYear = 2;
maxSem = 4;

}

/* BBA / BCOM */

else if(
course === "BBA" ||
course === "BCOM"
){

departmentWrapper.style.display =
"none";

maxYear = 3;
maxSem = 6;

}

/* BSC / PHARMACY */

else if(
course === "BSC" ||
course === "PHARMACY"
){

departmentWrapper.style.display =
"none";

maxYear = 4;
maxSem = 8;

}

else{

departmentWrapper.style.display =
"none";

}

/* YEAR OPTIONS */

for(let i = 1;
i <= maxYear;
i++){

yearSelect.innerHTML +=

'<option value="'+i+'">'+
i+' Year'+
'</option>';


}

/* SEM OPTIONS */

for(let i = 1;
i <= maxSem;
i++){

semSelect.innerHTML +=

'<option value="'+i+'">'+
i+' Semester'+
'</option>';

}

/* AUTO SELECT SAVED YEAR */

let currentYear =
document.getElementById(
"currentYear").value;

if(currentYear != ""){

yearSelect.value =
currentYear;

}


/* AUTO SELECT SAVED SEM */

let currentSem =
document.getElementById(
"currentSemester").value;

if(currentSem != ""){

semSelect.value =
currentSem;

}

}

/* PHOTO PREVIEW */

function previewPhoto(event){

document.getElementById(
"previewImage").src =

URL.createObjectURL(
event.target.files[0]);

}

/* PASSWORD TOGGLE */

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

/* PASSWORD VALIDATION */

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