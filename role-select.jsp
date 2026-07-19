<!DOCTYPE html>
<html>
  <head>
    <title>Select Role</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="css/style.css" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />
  </head>

  <body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top custom-navbar">
      <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="index.jsp">
          <img src="images/logo.png" class="logo-img me-3" />

          <div>
            <h3 class="brand-title">PIMR</h3>

            <p class="brand-subtitle">Smart Feedback Management System</p>
          </div>
        </a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp"> Home </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="about.jsp"> About </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="contact.jsp"> Contact </a>
            </li>

            <li class="nav-item ms-3">
              <a href="role-select.jsp" class="btn btn-purple"> Sign In </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto align-items-center">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp"> Home </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="about.jsp"> About </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="contact.jsp"> Contact </a>
          </li>

          <li class="nav-item ms-3">
            <a href="role-select.jsp" class="btn btn-purple"> Sign In </a>
          </li>
        </ul>
      </div>
    </div>

    <section class="contact-section">
      <div
        class="container d-flex justify-content-center align-items-center min-vh-100"
      >
        <div
          class="glass-card text-center"
          style="max-width: 500px; width: 100%"
        >
          <h1 class="mb-5">Login As</h1>

          <a href="login.jsp?role=student" class="btn btn-purple w-100 mb-4">
            Student
          </a>

          <a href="login.jsp?role=faculty" class="btn btn-purple w-100 mb-4">
            Faculty
          </a>

          <a href="login.jsp?role=admin" class="btn btn-purple w-100">
            Admin
          </a>
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

  </body>
</html>
