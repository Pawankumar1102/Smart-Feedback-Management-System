<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
content="width=device-width, initial-scale=1">

<title>Contact</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet"/>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<link rel="stylesheet"
href="css/style.css"/>

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
<a class="nav-link active-nav"
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

<section class="contact-section">

<div class="container">

<div class="text-center mb-5">

<h1 class="main-title">
Get In Touch
</h1>

<p class="hero-text">
Need help regarding the feedback portal?
</p>

</div>

<div class="row g-5 align-items-center">

<!-- LEFT -->

<div class="col-lg-4">

<div class="glass-card h-100">

<h2 class="mb-4">
Contact Information
</h2>

<div class="mb-4">

<h5 class="text-purple">
<i class="fa-solid fa-phone me-2"></i>
Phone
</h5>

<p class="hero-text">
+91 7898312446
</p>

</div>

<div class="mb-4">

<h5 class="text-purple">
<i class="fa-solid fa-envelope me-2"></i>
Email
</h5>

<p class="hero-text">
feedbackpimr@gmail.com
</p>

</div>

<div class="mb-4">

<h5 class="text-purple">
<i class="fa-solid fa-user-shield me-2"></i>
Support
</h5>

<p class="hero-text">
Admin & Technical Team
</p>

</div>

</div>
</div>

<!-- RIGHT FORM -->

<div class="col-lg-8">

<div class="glass-card">

<form action="ContactServlet"
method="post">

<!-- USER TYPE -->

<div class="mb-4">

<select
name="userType"
id="userType"
class="form-select custom-input"
required>

<option value="">
Select User Type
</option>

<option value="student">
Student
</option>

<option value="faculty">
Faculty
</option>

<option value="admin">
Admin
</option>

</select>

</div>

<!-- FULL NAME -->

<div class="mb-4">

<input type="text"
name="fullName"
class="form-control custom-input"
placeholder="Full Name"
required>

</div>

<!-- EMAIL -->

<div class="mb-4">

<input type="email"
name="email"
class="form-control custom-input"
placeholder="Email Address"
required>

</div>

<!-- ID -->

<div class="mb-4">

<input type="text"
id="idField"
name="collegeId"
class="form-control custom-input"
placeholder="Roll Number / College ID"
required>

</div>

<!-- MESSAGE -->

<div class="mb-4">

<textarea rows="6"
name="message"
class="form-control custom-input"
placeholder="Your Message"
required></textarea>

</div>

<button type="submit"
class="btn btn-purple w-100">

Send Message

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

<script>

const userType =
document.getElementById(
"userType");

const idField =
document.getElementById(
"idField");

userType.addEventListener(
"change",

function(){

if(this.value ===
"student"){

idField.placeholder =
"Enter Roll Number";

}

else if(
this.value ===
"faculty"){

idField.placeholder =
"Enter College ID";

}

else if(
this.value ===
"admin"){

idField.placeholder =
"Enter College ID";

}

});

</script>


<%
String success =
request.getParameter("success");

String invalid =
request.getParameter("invalid");

String failed =
request.getParameter("failed");
%>

<script>

window.addEventListener(
"load",

function(){

<% if(success != null){ %>

setTimeout(function(){

alert(
"✅ Message Sent Successfully");

}, 200);

window.history.replaceState(
{},
document.title,
"contact.jsp"
);

<% } %>


<% if(invalid != null){ %>

setTimeout(function(){

alert(
"❌ Invalid Email or Roll Number / College ID");

}, 200);

window.history.replaceState(
{},
document.title,
"contact.jsp"
);

<% } %>


<% if(failed != null){ %>

setTimeout(function(){

alert(
"⚠ Failed To Send Message");

}, 200);

window.history.replaceState(
{},
document.title,
"contact.jsp"
);

<% } %>

});

</script>

</body>
</html>