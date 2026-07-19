<!DOCTYPE html>

<html>

<head>

<title>
Add Subject
</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="../css/style.css">

</head>

<body class="subject-body">

<div class="subject-card">

<h1 class="subject-title">

Add Subject

</h1>

<form action="../AddSubjectServlet"
method="post">

<!-- SUBJECT -->

<div class="mb-4">

<input type="text"
name="subjectName"
class="form-control custom-input"
placeholder="Enter Subject Name"
required>

</div>

<!-- COURSE -->

<div class="mb-4">

<select name="course"
id="course"
class="form-select custom-input"
required
onchange="updateFields()">

<option value="">
Select Course
</option>

<option value="BTECH">
BTECH
</option>

<option value="BCA">
BCA
</option>

<option value="BBA">
BBA
</option>

<option value="MBA">
MBA
</option>

<option value="MCA">
MCA
</option>

<option value="BCOM">
BCOM
</option>

<option value="PHARMACY">
PHARMACY
</option>
</select>

</div>

<!-- DEPARTMENT -->

<div class="mb-4"
id="departmentBox">

<select name="department"
class="form-select custom-input">

<option value="">
Select Department
</option>

<option value="CS">
CS
</option>

<option value="IT">
IT
</option>

<option value="ME">
ME
</option>

<option value="CE">
CE
</option>

<option value="EX">
EX
</option>

</select>

</div>

<!-- YEAR + SEM -->

<div class="row">

<div class="col-md-6 mb-4">

<select name="year"
id="year"
class="form-select custom-input"
required>

<option value="">
Select Year
</option>

</select>

</div>

<div class="col-md-6 mb-4">

<select name="semester"
id="semester"
class="form-select custom-input"
required>

<option value="">
Select Semester
</option>

</select>

</div>

</div>

<button class="btn btn-success px-4">

Add Subject

</button>

</form>

<div class="mt-4 d-grid gap-3">

<a href="view-subjects.jsp"
class="btn btn-dark">

View Added Subjects

</a>

</div>

<a href="faculty-dashboard.jsp"
class="btn btn-purple w-100">

Back Dashboard

</a>

</div>

</div>

<script>

function updateFields(){

const course =
document.getElementById(
"course").value;

const departmentBox =
document.getElementById(
"departmentBox");

const year =
document.getElementById(
"year");

const semester =
document.getElementById(
"semester");

year.innerHTML =
'<option value="">Select Year</option>';

semester.innerHTML =
'<option value="">Select Semester</option>';

if(course === "BTECH"){

departmentBox.style.display =
"block";

for(let i=1;i<=4;i++){

year.innerHTML +=
'<option value="'+i+'">'
+ i + ' Year' +
'</option>';

}

for(let i=1;i<=8;i++){

semester.innerHTML +=
'<option value="'+i+'">'
+ i + ' Semester' +
'</option>';

}

}

else{

departmentBox.style.display =
"none";

for(let i=1;i<=3;i++){

year.innerHTML +=
'<option value="'+i+'">'
+ i + ' Year' +
'</option>';

}

for(let i=1;i<=6;i++){

semester.innerHTML +=
'<option value="'+i+'">'
+ i + ' Semester' +
'</option>';

}

}

}

window.onload =
function(){

document.getElementById(
"departmentBox").style.display =
"none";

};

</script>

</body>

</html>