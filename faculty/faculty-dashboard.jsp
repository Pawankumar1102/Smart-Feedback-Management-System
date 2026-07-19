<%@ page session="true" %>

<!DOCTYPE html>

<html>

<head>

<title>
Faculty Dashboard
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

</head>

<body class="dashboard-body">

<!-- NAVBAR -->

<nav class="navbar navbar-dark custom-navbar px-4">

<div class="container-fluid">

<h2 class="text-white">

Faculty Dashboard

</h2>

<a href="../LogoutServlet"
class="btn btn-light">

Logout

</a>

</div>

</nav>

<!-- DASHBOARD -->

<div class="container py-5">

<div class="row g-4">

<!-- PROFILE -->

<div class="col-md-4">

<a href="faculty-profile.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-user"></i>

</div>

<h3>

My Profile

</h3>

<p>

View & Edit Faculty Profile

</p>

</a>

</div>

<!-- ADD SUBJECT -->

<div class="col-md-4">

<a href="add-subject.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-book"></i>

</div>

<h3>

Add Subject

</h3>

<p>

Manage Subjects & Courses

</p>

</a>

</div>

<!-- VIEW SUBJECT -->

<div class="col-md-4">

<a href="view-subjects.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-book-open"></i>

</div>

<h3>

View Subjects

</h3>

<p>

See All Added Subjects

</p>

</a>

</div>

<!-- VIEW FEEDBACK -->

<div class="col-md-4">

<a href="view-feedback.jsp"
class="dashboard-card text-decoration-none">

<div class="dashboard-icon">

<i class="fa-solid fa-chart-column"></i>

</div>

<h3>

View Feedback

</h3>

<p>

Subject-wise Student Analytics

</p>

</a>

</div>

</a>

</div>

</div>

</div>

</body>

</html>