<!DOCTYPE html>
<html>

<head>

<title>Forgot Password</title>

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

</div>

</nav>

<!-- FORGOT PASSWORD SECTION -->

<section class="login-section">

<div class="login-box">

<a href="login.jsp"
class="back-btn">
&larr; Back

</a>

<div class="text-center mb-4">

<div class="forgot-icon">

<i class="fa-solid fa-lock"></i>

</div>

<h1 class="mt-4">

Forgot Password

</h1>

<p class="text-secondary mt-3">

Enter your registered email or phone number
to receive OTP verification.

</p>

</div>

<form action="ForgotPasswordServlet"
method="post">

<input
type="text"
name="emailOrPhone"
class="form-control custom-input"
placeholder=
"Enter Email or Phone Number"
required>

<button
type="submit"
class="btn btn-purple w-100 mt-4">

Send OTP

</button>

</form>

</div>

</section>

<%
String invalid =
request.getParameter(
"invalid");

String sent =
request.getParameter(
"sent");
%>

<script>

window.onload =
function(){

<% if(invalid != null){ %>

alert(
"❌ Invalid Email or Phone Number");

window.history.replaceState(
{},
document.title,
"forgot-password.jsp"
);

<% } %>


<% if(sent != null){ %>

alert(
"✅ OTP Sent Successfully");

window.history.replaceState(
{},
document.title,
"forgot-password.jsp"
);

<% } %>

};

</script>

</body>

</html>