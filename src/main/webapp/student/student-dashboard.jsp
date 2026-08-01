<%@ page session="true" %>

<!DOCTYPE html>

<html>

<head>

<title>
Student Dashboard
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
href="../css/style.css">

<link rel="stylesheet"

href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body class="dashboard-page">

<div class="dashboard-navbar">

<h1>

Student Dashboard

</h1>

<a href="../LogoutServlet"
class="logout-btn">

Logout

</a>

</div>

<div class="dashboard-container">

<div class="dashboard-card">

<i class="fa-solid fa-user"></i>

<h2>

My Profile

</h2>

<p>

View & Edit Student Profile

</p>

<a href="student-profile.jsp"
class="dashboard-btn">

Open

</a>

</div>

<div class="dashboard-card">

<i class="fa-solid fa-users"></i>

<h2>

Faculty Directory


</h2>

<p>

Browse All Faculties

</p>

<a href="faculty-directory.jsp"
class="dashboard-btn">

Open

</a>

</div>

<div class="dashboard-card">

<i class="fa-solid fa-comments"></i>

<h2>

Give Feedback

</h2>

<p>

Give Subject-wise Feedback

</p>

<a href="faculty-directory.jsp"
class="dashboard-btn">

Open

</a>

</div>

<div class="dashboard-card">

<i class="fa-solid fa-chart-line"></i>

<h2>

My Activity

</h2>

<p>

View Feedback History

</p>

<a href="feedback-history.jsp"
class="dashboard-btn">

Open

</a>

</div>

</div>

</body>

</html>