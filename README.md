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
SmartFeedbackManagementSystem/
│
├── admin/                  # Admin Module
├── faculty/                # Faculty Module
├── student/                # Student Module
├── servlet/                # Java Servlet Controllers
├── dao/                    # Database Access Objects (DAO)
├── db/                     # Database Configuration
├── model/                  # Java Model Classes
├── css/                    # Stylesheets
├── images/
│   ├── logo.png            # Application Logo
│   └── profile/            # User Uploaded Profile Images (Ignored by Git)
├── database/
│   ├── smart_feedback_system.sql
│   └── README.md
├── WEB-INF/
│   ├── classes/
│   ├── lib/
│   └── web.xml
│
├── index.jsp
├── login.jsp
├── signup.jsp
├── role-select.jsp
├── contact.jsp
├── forgot-password.jsp
├── verify-otp.jsp
├── reset-password.jsp
├── README.md
└── .gitignore
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


---

## ⚙️ Installation Guide

### Prerequisites

Before running this project, make sure the following software is installed:

- Java JDK 17 or above
- Apache Tomcat 10 or above
- MySQL Server 8.0+
- MySQL Workbench
- Visual Studio Code or any Java IDE

---

### 1. Clone the Repository

```bash
git clone https://github.com/Pawankumar1102/Smart-Feedback-Management-System.git
```

---

### 2. Import the Database

- Create a database named **smart_feedback_system**.
- Import the SQL file located in:

```
database/smart_feedback_system.sql
```

---

### 3. Configure Database Connection

Update your MySQL database credentials in the project configuration.

Example:

- Host: `localhost`
- Port: `3306`
- Database: `smart_feedback_system`
- Username: `root`
- Password: `your_password`

---

### 4. Deploy the Project

Deploy the project to an Apache Tomcat server using your preferred development environment (Visual Studio Code, Eclipse, IntelliJ IDEA, or by copying it to the Tomcat deployment directory).

---

## 📝 Note

The project can be deployed using any Apache Tomcat-supported development environment. Deployment steps may vary depending on the IDE or server configuration.


### 5. Run the Application

Start Apache Tomcat and open:

```
http://localhost:8080/SmartFeedbackManagementSystem/
```



## 👨‍💻 Author

**Pawan Mehta**

Computer Science Engineering Graduate

**GitHub:** [Pawankumar1102](https://github.com/Pawankumar1102)
---

# 📄 License

This project is developed for educational and learning purposes.

Feel free to explore, learn from, and modify the project for personal or academic use.