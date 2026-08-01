<%@ page language="java"
contentType="text/html;
charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Boolean verified =

(Boolean)
session.getAttribute(
"otpVerified");

if(verified == null
|| !verified){

response.sendRedirect(
"forgot-password.jsp");

return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width,
initial-scale=1">

<title>
Reset Password
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
"width:500px;">

<div class=
"text-center mb-4">

<h1 class=
"main-title">

Create Password

</h1>

<p class=
"hero-text">

Create your new password

</p>

</div>

<form
action=
"ResetPasswordServlet"

method=
"post"

onsubmit=
"return validatePassword()">

<!-- PASSWORD -->

<div class=
"mb-4 position-relative">

<input
type="password"

id="password"

name="password"

class=
"form-control custom-input"

placeholder=
"Create Password"

required>

<i
class=
"fa-solid fa-eye"

id=
"togglePassword"

style=
"position:absolute;
right:20px;
top:18px;
cursor:pointer;">

</i>

</div>

<!-- RETYPE -->

<div class=
"mb-3 position-relative">

<input
type="password"

id="confirmPassword"

name=
"confirmPassword"

class=
"form-control custom-input"

placeholder=
"Retype Password"

required>

<i
class=
"fa-solid fa-eye"

id=
"toggleConfirm"

style=
"position:absolute;
right:20px;
top:18px;
cursor:pointer;">

</i>

</div>

<!-- RULE -->

<div class=
"mb-4">

<small
class=
"text-light">

Password must contain:

<br>

• 1 Capital Letter

<br>

• 1 Small Letter

<br>

• 1 Number

<br>

• 1 Special Character

<br>

• Minimum 8 Characters

</small>

</div>

<button
type="submit"

class=
"btn btn-purple w-100">

Create Password

</button>

</form>

</div>

</section>

<script>

function validatePassword(){

let password =
document.getElementById(
"password").value;

let confirmPassword =
document.getElementById(
"confirmPassword").value;

let regex =

/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

if(!regex.test(password)){

alert(

"Password must contain:\n\n" +

"• 1 Capital Letter\n" +

"• 1 Small Letter\n" +

"• 1 Number\n" +

"• 1 Special Character\n" +

"• Minimum 8 Characters"

);

return false;
}

if(password !==
confirmPassword){

alert(
"Passwords do not match");

return false;
}

return true;
}


/* PASSWORD EYE */

document
.getElementById(
"togglePassword")

.onclick =
function(){

let input =

document
.getElementById(
"password");

if(input.type
=== "password"){

input.type =
"text";

this.classList
.remove(
"fa-eye");

this.classList
.add(
"fa-eye-slash");

}

else{

input.type =
"password";

this.classList
.remove(
"fa-eye-slash");

this.classList
.add(
"fa-eye");

}

};


/* CONFIRM PASSWORD EYE */

document
.getElementById(
"toggleConfirm")

.onclick =
function(){

let input =

document
.getElementById(
"confirmPassword");

if(input.type
=== "password"){

input.type =
"text";

this.classList
.remove(
"fa-eye");

this.classList
.add(
"fa-eye-slash");

}

else{

input.type =
"password";

this.classList
.remove(
"fa-eye-slash");

this.classList
.add(
"fa-eye");

}

};

</script>

</body>
</html>