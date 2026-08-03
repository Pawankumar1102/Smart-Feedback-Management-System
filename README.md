# 🎓 Smart Feedback Management System

![Java](https://img.shields.io/badge/Java-17-orange)
![JSP](https://img.shields.io/badge/JSP-Jakarta-blue)
![Servlet](https://img.shields.io/badge/Servlet-Jakarta-success)
![Maven](https://img.shields.io/badge/Maven-3.9-red)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED)
![Render](https://img.shields.io/badge/Render-Deployed-46E3B7)
![Aiven](https://img.shields.io/badge/Aiven-Cloud%20Database-purple)
![License](https://img.shields.io/badge/License-MIT-green)


A role-based web application developed using Java Servlet, JSP, Maven, MySQL, Docker, and Render Cloud. The system allows Students, Faculty, and Administrators to manage academic feedback through a secure and centralized platform.

---

## 🌐 Live Demo

**🔗 Live Application**

https://smart-feedback-management-system.onrender.com

**💻 GitHub Repository**

https://github.com/Pawankumar1102/Smart-Feedback-Management-System.git


## 📖 Project Overview

The **Smart Feedback Management System** is a role-based web application designed for educational institutions to simplify the process of collecting and managing student feedback.

The system provides separate portals for **Students, Faculty, and Administrators**, ensuring secure authentication and role-based access. Students can submit subject-wise feedback, Faculty can manage academic information, and Administrators can monitor and manage the complete feedback system through a centralized dashboard.

The application is built using **Java Servlet, JSP, Maven, and MySQL**, containerized with **Docker**, and deployed on **Render Cloud** with **Aiven MySQL** as the cloud database.

## ✨ Features

### 👨‍🎓 Student Module

- Student Registration & Login
- Secure Authentication
- Update Profile & Profile Photo
- Browse Faculty Directory
- Submit Subject-wise Feedback
- View Feedback Activity

---

### 👨‍🏫 Faculty Module

- Faculty Registration & Login
- Manage Faculty Profile
- Department-wise Dashboard
- View Assigned Subjects
- View Student Feedback

---

### 👨‍💼 Admin Module

- Admin Registration & Login
- Manage Students
- Manage Faculty
- Manage Subjects
- View Feedback Reports
- Manage Contact Messages
- Dashboard Analytics

---

### 🔐 Security Features

- OTP Verification
- Forgot Password
- Password Reset
- Role-Based Authentication
- Session Management

## 🛠️ Technology Stack

| Category | Technology |
|----------|------------|
| Programming Language | Java 17 |
| Backend | Jakarta Servlet |
| Frontend | JSP, HTML5, CSS3, Bootstrap 5, JavaScript |
| Build Tool | Maven |
| Database | MySQL 8 |
| Cloud Database | Aiven MySQL |
| Web Server | Apache Tomcat 10 |
| Containerization | Docker |
| Cloud Platform | Render |
| Version Control | Git & GitHub |
| IDE | Eclipse IDE / VS Code |

## 🏗️ Project Architecture

```text
                    ┌────────────────────────┐
                    │        Browser         │
                    │ (Student / Faculty /  │
                    │        Admin)          │
                    └───────────┬────────────┘
                                │
                                ▼
                    JSP Pages (View Layer)
                                │
                                ▼
                    Servlet Controllers
                                │
                                ▼
                         DAO (JDBC Layer)
                                │
                                ▼
                       MySQL Database
                        (Aiven Cloud)
                                │
                                ▼
                   Docker + Render Cloud
```


## 📸 Project Screenshots

### 🏠 Home Page

> *(Screenshot will be added here)*

---

### 🔐 Login Page

> *(Screenshot will be added here)*

---

### 📝 Registration Page

> *(Screenshot will be added here)*

---

### 👨‍🎓 Student Dashboard

> *(Screenshot will be added here)*

---

### 👨‍🏫 Faculty Dashboard

> *(Screenshot will be added here)*

---

### 👨‍💼 Admin Dashboard

> *(Screenshot will be added here)*


## 🚀 Installation Guide

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Pawankumar1102/Smart-Feedback-Management-System.git
```

### 2️⃣ Open the Project

Open the project in **Eclipse IDE** or **Visual Studio Code**.

### 3️⃣ Configure Database

Create a MySQL database and import the provided SQL file.

```sql
smart_feedback_system.sql
```

### 4️⃣ Configure Environment Variables

Set the following environment variables:

```text
DB_URL=jdbc:mysql://localhost:3306/smart_feedback_system
DB_USER=your_username
DB_PASSWORD=your_password
```

### 5️⃣ Build the Project

```bash
mvn clean package
```

### 6️⃣ Run the Application

Deploy the generated WAR file on **Apache Tomcat 10**.

Open:

```
http://localhost:8080/SmartFeedbackManagementSystem
```

## 🐳 Docker Deployment

Build Docker Image

```bash
docker build -t smart-feedback-system .
```

Run using Docker Compose

```bash
docker compose up -d
```

The application will be available at:

```
http://localhost:8080
```

## 🗄️ Database

This project uses **MySQL** as the primary database.

### Local Database

- MySQL 8
- Database Name: `smart_feedback_system`

### Cloud Database

- Aiven MySQL Cloud Database
- SSL Enabled Connection
- Used for Production Deployment on Render

### Main Tables

- admins
- faculty
- students
- subjects
- feedbacks
- blocked_words
- otp_verification
- contact_messages


## 🚀 Future Improvements

- Spring Boot Migration
- REST API Integration
- React Frontend
- JWT Authentication
- Email Verification
- Analytics Dashboard
- Export Reports (PDF & Excel)
- CI/CD Pipeline using GitHub Actions


## 👨‍💻 Author

**Pawan Mehta**

- GitHub: https://github.com/Pawankumar1102
- Project Repository: https://github.com/Pawankumar1102/Smart-Feedback-Management-System
- Live Demo: https://smart-feedback-management-system.onrender.com

---

## ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub.