# Database Setup

This project uses **MySQL** as the backend database.

## Database Name

```sql
smart_feedback_system
```

## Import Database

1. Open **MySQL Workbench**.
2. Create a new database named **smart_feedback_system** (if it doesn't already exist).
3. Go to **Server → Data Import**.
4. Select **Import from Self-Contained File**.
5. Choose the file **smart_feedback_system.sql**.
6. Select the target schema **smart_feedback_system**.
7. Click **Start Import**.

## Database Configuration

Update your database connection details in the project configuration if required.

Example:

- Host: `localhost`
- Port: `3306`
- Database: `smart_feedback_system`
- Username: `root`
- Password: `your_password`

## Notes

- Import the database before running the project.
- Apache Tomcat must be running.
- Ensure MySQL Server is running before starting the application.