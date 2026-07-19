<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>About</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />

    <link rel="stylesheet" href="css/style.css" />
  </head>

  <body>
    <!-- NAVBAR -->

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
              <a class="nav-link active-nav" href="about.jsp"> About </a>
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

    <!-- ABOUT SECTION -->

    <section class="about-section">
      <div class="container">
        <div class="row align-items-center g-5">
          <!-- LEFT -->

          <div class="col-lg-7">
            <h1 class="main-title">
              About Smart <br />

              Feedback  <br />

              Management <br />

              System
            </h1>

            <p class="hero-text mt-4">
              The Smart Feedback Management System is a modern web-based platform
              developed for educational institutions to automate the process of
              collecting and managing student feedback.
            </p>

            <p class="hero-text mt-4">
              The system ensures transparency, confidentiality and real-time
              performance analysis for faculty members and administration.
            </p>
          </div>

          <!-- RIGHT -->

          <div class="col-lg-5">
            <div class="glass-card">
              <h2 class="mb-4">Why This System?</h2>

              <ul class="about-list">
                <li>Secure Login Authentication</li>

                <li>Role-Based Access System</li>

                <li>Department-Wise Faculty Access</li>

                <li>Automated Report Generation</li>

                <li>Real-Time Feedback Analysis</li>

                <li>Responsive User Interface</li>

                <li>Paperless & Efficient System</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->

    <footer class="footer-section">
      <div class="container">
        <p>
          © 2026 PIMR Smart Feedback Management System | Designed for Academic Excellence
        </p>
      </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

