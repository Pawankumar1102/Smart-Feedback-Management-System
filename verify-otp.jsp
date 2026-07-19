<%@ page language="java"
contentType="text/html;
charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width,
initial-scale=1">

<title>
Verify OTP
</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet"/>

<link rel="stylesheet"
href="css/style.css"/>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

</head>

<body>

<section class=
"login-page d-flex
justify-content-center
align-items-center">

<div class=
"glass-card p-5"
style=
"width:450px;">

<a href=
"forgot-password.jsp"

class=
"btn btn-outline-light
mb-4">

← Back

</a>

<div class=
"text-center">

<div class=
"login-icon mb-4">

<i class=
"fa-solid
fa-shield-halved">
</i>

</div>

<h1 class=
"main-title">

Verify OTP

</h1>

<p class=
"hero-text">

Enter the 6-digit OTP
sent to your email

</p>

</div>

<form
action=
"VerifyOtpServlet"

method=
"post">

<input
type="text"

name="otp"

maxlength="6"

class=
"form-control
custom-input
mb-4"

placeholder=
"Enter OTP"

required>

<button
type="submit"

class=
"btn btn-purple
w-100">

Verify OTP

</button>

</form>

</div>

</section>

<%
String invalid =
request.getParameter(
"invalid");

String expired =
request.getParameter(
"expired");
%>

<script>

window.onload =
function(){

<%
if(invalid
!= null){
%>

alert(
"❌ Invalid OTP");

window.history
.replaceState(

{},
document.title,
"verify-otp.jsp"

);

<%
}
%>

<%
if(expired
!= null){
%>

alert(
"⚠ OTP Expired. Please request again.");

window.history
.replaceState(

{},
document.title,
"verify-otp.jsp"

);

<%
}
%>

};

</script>

</body>
</html>