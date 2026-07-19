# 🎓 Smart Feedback Management System

> A role-based web application developed using **Java, JSP, Servlets, MySQL, Bootstrap, HTML, CSS, and JavaScript** that enables students to submit anonymous feedback, faculty to monitor their performance, and administrators to manage the complete feedback process efficiently.

---

## 📖 Overview

The **Smart Feedback Management System** is a full-stack web application designed to simplify and digitize the academic feedback process within educational institutions.

The system provides separate dashboards for **Students**, **Faculty Members**, and **Administrators**, ensuring that every user has access only to features relevant to their role.

Students can securely submit anonymous feedback for faculty members, faculty can analyze their received feedback, and administrators can manage students, faculty, subjects, and overall system activities from a centralized dashboard.

The application also includes an OTP-based password recovery system, profile management, contact support, and secure authentication to improve both usability and security.

---

## ✨ Key Highlights

- 🎯 Role-Based Authentication
- 📝 Anonymous Faculty Feedback
- 👨‍🎓 Student Dashboard
- 👨‍🏫 Faculty Dashboard
- 👨‍💼 Admin Dashboard
- 🔐 OTP-Based Password Recovery
- 📧 Contact Support
- 📊 Feedback Reports
- 👤 Profile Management
- 🛡 Secure Login System

---

## 🚀 Features

### 👨‍🎓 Student Module
- Student Registration & Login
- Anonymous Faculty Feedback Submission
- View Faculty Directory
- Feedback History
- Update Student Profile
- Upload Profile Photo
- Forgot Password using OTP

### 👨‍🏫 Faculty Module
- Faculty Registration & Login
- View Received Feedback
- Subject Management
- Edit Faculty Profile
- View Performance Dashboard

### 👨‍💼 Admin Module
- Admin Registration & Login
- Manage Students
- Manage Faculty Members
- View Feedback Reports
- Manage Subjects
- Block/Unblock Users
- View Contact Messages

---

## 🛠️ Technology Stack

| Category | Technologies |
|----------|--------------|
| **Frontend** | HTML5, CSS3, Bootstrap 5, JavaScript |
| **Backend** | Java, JSP, Servlets |
| **Database** | MySQL |
| **Server** | Apache Tomcat 10 |
| **IDE** | Visual Studio Code |
| **Version Control** | Git & GitHub |

---

## 📂 Project Structure

```text
SmartFeedbackSystem/
│
├── admin/                 # Admin Dashboard & Management Pages
├── faculty/               # Faculty Module
├── student/               # Student Module
├── servlet/               # Java Servlets
├── dao/                   # Database Access Objects
├── db/                    # Database Connection
├── model/                 # Java Model Classes
├── css/                   # Stylesheets
├── images/                # Project Images
├── WEB-INF/               # Libraries & Configuration
│
├── index.jsp
├── login.jsp
├── signup.jsp
├── role-select.jsp
├── contact.jsp
├── forgot-password.jsp
├── verify-otp.jsp
├── reset-password.jsp
└── README.md
```

---

## 🔐 Authentication & Security

The application provides a secure authentication mechanism for all user roles.

### Security Features

- Role-Based Login System
- Password Encryption Support
- OTP-Based Password Recovery
- Session Management
- Anonymous Feedback Submission
- Profile Management
- Secure Database Connectivity

---