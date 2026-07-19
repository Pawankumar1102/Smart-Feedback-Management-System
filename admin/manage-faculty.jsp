<%@ page import="java.sql.*" %>
<%@ page import="SmartFeedbackSystem.db.DBConnection" %>

<%

String adminName =
(String)session.getAttribute(
"adminName");

if(adminName == null){

response.sendRedirect(
"../login.jsp?role=admin");

return;

}

/* ADMIN COURSE */

String adminCourse =
(String)session.getAttribute(
"adminCourse");

if(adminCourse == null){

adminCourse = "";

}

/* DATABASE */

Connection con =
DBConnection.getConnection();

/* FILTERED FACULTY */

String query =

"SELECT * FROM faculty " +
"WHERE UPPER(teacher_field)=? " +
"ORDER BY created_at DESC";

PreparedStatement ps =
con.prepareStatement(query);

ps.setString(
1,
adminCourse.toUpperCase());

ResultSet rs =
ps.executeQuery();

%>

<!DOCTYPE html>

<html>

<head>

<title>
Manage Faculty
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

<style>

.manage-card{
background:white;
padding:30px;
border-radius:20px;
box-shadow:
0 0 20px rgba(0,0,0,0.08);
margin-top:40px;
}

.profile-img{
width:55px;
height:55px;
border-radius:50%;
object-fit:cover;
}

table{
vertical-align:middle;
}

.exp-box{
max-width:250px;
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
}

</style>

</head>

<body class="dashboard-body">

<div class="container py-5">

<div class="manage-card">

<div class="d-flex justify-content-between align-items-center mb-4">

<div>

<h2>

Manage Faculty

</h2>

<p style="color:#6b7280;">

Showing
<%= adminCourse %>
Faculty Only

</p>

</div>

<a href="admin-dashboard.jsp"
class="btn btn-purple">

Back Dashboard

</a>

</div>

<div class="mb-4">

<input type="text"
id="facultySearch"
class="form-control custom-input"
placeholder="Search Faculty...">

</div>

<div class="table-responsive">

<table
id="facultyTable"
class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>Photo</th>
<th>Name</th>
<th>College ID</th>
<th>Department</th>
<th>Teacher Field</th>
<th>Email</th>
<th>Phone</th>
<th>Experience</th>
<th>Status</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%

while(rs.next()){

%>

<tr>

<td>

<img src="../<%= rs.getString("profile_photo") == null
? "images/default.png"
: rs.getString("profile_photo") %>"
class="profile-img">

</td>

<td>

<%= rs.getString("full_name") %>

</td>

<td>

<%= rs.getString("college_id") %>

</td>

<td>

<%

String teacherField =
rs.getString(
"teacher_field");

String department =
rs.getString(
"department");

if(teacherField != null
&& teacherField.equalsIgnoreCase(
"BTECH")){

out.print(
department);

}

else{

out.print("-");

}

%>

</td>

<td>

<span class="badge bg-primary">

<%= rs.getString("teacher_field") %>

</span>

</td>

<td>

<%= rs.getString("email") %>

</td>

<td>

<%= rs.getString("phone") %>

</td>

<td>

<div class="exp-box">
N/A
</div>

</td>

<td>

<%

String status =
rs.getString("status");

if(status.equalsIgnoreCase("ACTIVE")){

%>

<span class="badge bg-success">

ACTIVE

</span>

<%

}
else{

%>

<span class="badge bg-danger">

INACTIVE

</span>

<%

}

%>

</td>

<td>

<%

if(status.equalsIgnoreCase("ACTIVE")){

%>

<a href="../ToggleFacultyStatusServlet?id=<%= rs.getInt("id") %>&status=INACTIVE"
class="btn btn-danger btn-sm">

Block

</a>

<%

}
else{

%>

<a href="../ToggleFacultyStatusServlet?id=<%= rs.getInt("id") %>&status=ACTIVE"
class="btn btn-success btn-sm">

Unblock

</a>

<%

}

%>

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</div>

<script>

const facultySearch =
document.getElementById(
"facultySearch");

facultySearch.addEventListener(
"keyup",

function(){

const filter =
this.value.toLowerCase();

const rows =
document.querySelectorAll(
"#facultyTable tbody tr");

rows.forEach(row => {

const text =
row.innerText.toLowerCase();

row.style.display =
text.includes(filter)
? ""
: "none";

});

});

</script>

</body>

</html>