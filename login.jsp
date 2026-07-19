<%
String role = request.getParameter("role");

if(role == null){
    role = "student";
}

String title = "";
String placeholder = "";

if(role.equals("student")){
    title = "STUDENT LOGIN";
    placeholder = "Enter Roll Number";
}
else if(role.equals("faculty")){
    title = "FACULTY LOGIN";
    placeholder = "Enter College ID";
}
else{
    title = "ADMIN LOGIN";
    placeholder = "Enter Admin ID";
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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

<!-- LOGIN SECTION -->

<section class="login-section">

<div class="container d-flex justify-content-center align-items-center">

<div class="login-box">

<a href="role-select.jsp"
class="back-btn">

&larr; Back

</a>

<h1 class="text-center mb-5">

<%= title %>

</h1>

<%
String error =
request.getParameter("error");

if(error != null){
%>

<div class="alert alert-danger custom-alert text-center">

<i class="fa-solid fa-triangle-exclamation me-2"></i>

Invalid Roll Number or Password

</div>

<%
}
%>

<form action="<%= role.equals("student") ? "StudentLoginServlet" : role.equals("faculty") ? "FacultyLoginServlet" : "AdminLoginServlet" %>" method="post">

<%
String success =
request.getParameter("success");

if(success != null){
%>

<div class="alert alert-success custom-alert text-center">

<i class="fa-solid fa-circle-check me-2"></i>

Account Created Successfully

</div>

<%
}
%>

<!-- USER INPUT -->

<div class="mb-4">

<input type="text"

name="<%= role.equals("student") ? "rollNumber" : "collegeId" %>"

class="form-control custom-input"

placeholder="<%= role.equals("student") ? "Roll Number" : "College ID" %>"

required>

</div>

<!-- PASSWORD -->

<div class="mb-3">

<input type="password"
name="password"
class="form-control custom-input"
placeholder="Password"
required>

</div>

<!-- FORGOT PASSWORD -->

<div class="text-center mt-4">

<a href="forgot-password.jsp"
class="forgot-btn">

Forgot Password?

</a>

</div>


<!-- LOGIN BUTTON -->

<button type="submit"
class="btn btn-purple w-100">

Login

</button>

</form>

<!-- CREATE ACCOUNT -->

<div class="text-center mt-4">

<a href="signup.jsp?role=<%= role %>"
class="text-light">

Create New Account

</a>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<%
String reset =

request.getParameter(
"passwordReset");
%>

<script>

window.onload =
function(){

<%
if(reset != null){
%>

alert(
"✅ Password Created Successfully");

window.history
.replaceState(

{},
document.title,
"login.jsp"

);

<%
}
%>

};

</script>

</body>
</html>