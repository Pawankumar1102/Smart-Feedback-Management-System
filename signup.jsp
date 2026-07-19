<%
String role = request.getParameter("role");

if(role == null){
role = "student";
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Signup</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="stylesheet"
href="css/style.css">

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark fixed-top custom-navbar">

<div class="container">

<a class="navbar-brand d-flex align-items-center"
href="index.jsp">

<img src="images/logo.png"
class="logo-img me-3">

<div>

<h3 class="brand-title">
PIMR
</h3>

<p class="brand-subtitle">
Smart Feedback Management System
</p>

</div>

</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
id="navbarNav">

<ul class="navbar-nav ms-auto align-items-center">

<li class="nav-item">
<a class="nav-link"
href="index.jsp">
Home
</a>
</li>

<li class="nav-item">
<a class="nav-link"
href="about.jsp">
About
</a>
</li>

<li class="nav-item">
<a class="nav-link"
href="contact.jsp">
Contact
</a>
</li>

<li class="nav-item ms-3">
<a href="role-select.jsp"
class="btn btn-purple">
Sign In
</a>
</li>

</ul>

</div>

</div>

</nav>

<!-- SIGNUP SECTION -->

<section class="signup-section">

<div class="container">

<div class="row justify-content-center">

<div class="col-lg-7">

<div class="signup-box">

<a href="login.jsp?role=<%= role %>"
class="back-btn">
&larr; Back

</a>

<h1 class="text-center mb-5">

<%= role.toUpperCase() %> REGISTRATION

</h1>

<form action="<%= role.equals("student") ? "StudentSignupServlet" : role.equals("faculty") ? "FacultySignupServlet" : "AdminSignupServlet" %>" method="post"
onsubmit="return validatePassword()">

<!-- =========================
STUDENT REGISTRATION
========================= -->

<% if(role.equals("student")){ %>

<div class="mb-4">

<input type="text"
name="fullName"
class="form-control custom-input"
placeholder="Full Name"
required>

</div>

<div class="mb-4">

<input type="text"
name="rollNumber"
class="form-control custom-input"
placeholder="Roll Number"
required>

</div>

<div class="mb-4">

<select id="course"
name="course"
class="form-select custom-select"
required>

<option value="">
Select Course
</option>

<option value="BTECH">
BTECH
</option>

<option value="MBA">
MBA
</option>

<option value="BBA">
BBA
</option>

<option value="BCOM">
BCOM
</option>

<option value="BSC">
BSC
</option>

<option value="PHARMACY">
PHARMACY
</option>

</select>

</div>

<div class="mb-4"
id="departmentWrapper"
style="display:none;">

<select
name="department"
class="form-select custom-select">

<option value="">
Select Department
</option>

<option>
CS
</option>

<option>
EX
</option>

<option>
CSDS
</option>

<option>
EC
</option>

<option>
MECHANICAL
</option>

<option>
CIVIL
</option>

<option>
AI/ML
</option>

</select>

</div>

<div class="row">

<div class="col-md-6 mb-4">

<select id="year"
name="year"
class="form-select custom-select"
required>

<option value="">
Select Year
</option>

</select>

</div>

<div class="col-md-6 mb-4">

<select id="semester"
name="semester"
class="form-select custom-select"
required>

<option value="">
Select Semester
</option>

</select>

</div>

</div>

<div class="mb-4">

<input type="email"
name="email"
class="form-control custom-input"
placeholder="Email Address"
required>

</div>

<div class="mb-4">

<input type="text"
name="phone"
class="form-control custom-input"
placeholder="Phone Number"
required>

</div>

<% } %>

<!-- =========================
FACULTY REGISTRATION
========================= -->

<% if(role.equals("faculty")){ %>

<div class="mb-4">

<input type="text"
name="fullName"
class="form-control custom-input"
placeholder="Full Name"
required>

</div>

<div class="mb-4">

<input type="email"
name="email"
class="form-control custom-input"
placeholder="Email Address"
required>

</div>

<div class="mb-4">

<input type="text"
name="collegeId"
class="form-control custom-input"
placeholder="College ID"
required>

</div>

<div class="mb-4">

<input type="text"
name="phone"
class="form-control custom-input"
placeholder="Phone Number"
required>

</div>

<div class="mb-4">

<select id="facultyField"
name="teacherField"
class="form-select custom-select"
required>

<option value="">
Teacher Field
</option>

<option value="BTECH">
BTECH
</option>

<option value="MBA">
MBA
</option>

<option value="BBA">
BBA
</option>

<option value="BCOM">
BCOM
</option>

<option value="BSC">
BSC
</option>

<option value="PHARMACY">
PHARMACY
</option>

</select>

</div>

<div class="mb-4"
id="facultyDepartmentWrapper"
style="display:none;">

<select
name="department"
class="form-select custom-select">

<option value="">
Select Department
</option>

<option>
CS
</option>

<option>
EX
</option>

<option>
CSDS
</option>

<option>
EC
</option>

<option>
MECHANICAL
</option>

<option>
CIVIL
</option>

<option>
AI/ML
</option>

</select>

</div>

<% } %>

<!-- =========================
ADMIN REGISTRATION
========================= -->

<% if(role.equals("admin")){ %>

<div class="mb-4">

<input type="text"
name="fullName"
class="form-control custom-input"
placeholder="Full Name"
required>

</div>

<div class="mb-4">

<input type="email"
name="email"
class="form-control custom-input"
placeholder="Email Address"
required>

</div>

<div class="mb-4">

<input type="text"
name="phone"
class="form-control custom-input"
placeholder="Phone Number"
required>

</div>

<div class="mb-4">

<input type="text"
name="collegeId"
class="form-control custom-input"
placeholder="College ID"
required>

</div>

<div class="mb-4">

<select
name="adminType"
class="form-select custom-select"
required>

<option value="">
Select Admin Type
</option>

<option>
BTECH PRINCIPAL
</option>

<option>
MBA PRINCIPAL
</option>

<option>
BBA PRINCIPAL
</option>

<option>
BCOM PRINCIPAL
</option>

<option>
BSC PRINCIPAL
</option>

<option>
PHARMACY PRINCIPAL
</option>

</select>

</div>

<% } %>

<!-- PASSWORD -->


<div class="position-relative mb-4">

<input type="password"
id="password"
name="password"
class="form-control custom-input pe-5"
placeholder="Create Password"
required>

<i class="fa-solid fa-eye"
onclick="togglePassword()"
style="
position:absolute;
top:50%;
right:15px;
transform:translateY(-50%);
cursor:pointer;
color:gray;
">
</i>

</div>



<div class="position-relative mb-2">

<input type="password"
id="confirmPassword"
class="form-control custom-input pe-5"
placeholder="Retype Password"
required>

<i class="fa-solid fa-eye"
onclick="toggleConfirmPassword()"
style="
position:absolute;
top:50%;
right:15px;
transform:translateY(-50%);
cursor:pointer;
color:gray;
">
</i>

</div>


<p class="text-secondary small mt-2">

Password must contain:
1 Capital Letter,
1 Small Letter,
1 Number,
1 Special Character
(Min 6 & Max 10 Characters)

</p>

<button class="btn btn-purple w-100">

Create Account

</button>

</form>

</div>

</div>

</div>

</div>

</section>

<!-- FOOTER -->


<footer class="footer-section">


<div class="container">


<p>


© 2026 PIMR Smart Feedback Management System |
Designed for Academic Excellence


</p>


</div>


</footer>

<!-- SCRIPT -->

<script>

const role =
"<%= role %>";

/* =========================
STUDENT LOGIC
========================= */

if(role === "student"){

const courseSelect =
document.getElementById("course");

const departmentWrapper =
document.getElementById("departmentWrapper");

const yearSelect =
document.getElementById("year");

const semSelect =
document.getElementById("semester");

courseSelect.addEventListener(
"change",

function(){

const course =
this.value;

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

for(let i = 1; i <= maxYear; i++){

let yearText = i + " Year";

yearSelect.innerHTML +=
'<option value="'+i+'">'+
yearText+
'</option>';

}

/* SEM OPTIONS */

for(let i = 1; i <= maxSem; i++){

let semText = i + " Semester";

semSelect.innerHTML +=
'<option value="'+i+'">'+
semText+
'</option>';

}

});

}

/* =========================
FACULTY LOGIC
========================= */

if(role === "faculty"){

const facultyField =
document.getElementById("facultyField");

const facultyDepartmentWrapper =
document.getElementById("facultyDepartmentWrapper");

facultyField.addEventListener(
"change",

function(){

if(this.value === "BTECH"){

facultyDepartmentWrapper.style.display =
"block";

}
else{

facultyDepartmentWrapper.style.display =
"none";

}

});

}

function togglePassword(){

const password =
document.getElementById("password");

if(password.type === "password"){

password.type = "text";

}
else{

password.type = "password";

}

}

function toggleConfirmPassword(){

const confirmPassword =
document.getElementById("confirmPassword");

if(confirmPassword.type === "password"){

confirmPassword.type = "text";

}
else{

confirmPassword.type = "password";

}

}

/* ONLY NAME FIELDS UPPERCASE */

const upperCaseInputs =
document.querySelectorAll(

'input[name="fullName"]'

);

upperCaseInputs.forEach(input => {

input.addEventListener(

"input",

function(){

this.value =
this.value.toUpperCase();

}

);

});

/* EMAIL ALWAYS LOWERCASE */

const emailInputs =
document.querySelectorAll(

'input[type="email"]'

);

emailInputs.forEach(input => {

input.addEventListener(

"input",

function(){

this.value =
this.value.toLowerCase();

}

);

});

function validatePassword(){

const password =
document.getElementById("password").value;

const confirmPassword =
document.getElementById("confirmPassword").value;

/* PASSWORD REGEX */

const passwordPattern =
/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,10}$/;

/* CHECK STRONG PASSWORD */

if(!passwordPattern.test(password)){

alert(
"Password must contain:\n\n1 Capital Letter\n1 Small Letter\n1 Number\n1 Special Character\nMin 6 & Max 10 Characters"
);

return false;

}

/* CHECK CONFIRM PASSWORD */

if(password !== confirmPassword){

alert(
"Password and Confirm Password do not match!"
);

return false;

}

return true;

}

</script>

</body>

</html>