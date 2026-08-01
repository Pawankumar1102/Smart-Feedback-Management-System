package SmartFeedbackManagementSystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackManagementSystem.db.DBConnection;
import SmartFeedbackManagementSystem.model.Student;

public class StudentDAO {

    public boolean registerStudent(
            Student student) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =

            "INSERT INTO students(" +
            "full_name, " +
            "roll_number, " +
            "course, " +
            "department, " +
            "year, " +
            "semester, " +
            "email, " +
            "phone, " +
            "password" +
            ") VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(
                    1,
                    student.getFullName()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    2,
                    student.getRollNumber()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    3,
                    student.getCourse()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    4,
                    student.getDepartment() == null
                    ? null
                    : student.getDepartment()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    5,
                    student.getYear()
                    .trim());

            ps.setString(
                    6,
                    student.getSemester()
                    .trim());

            ps.setString(
                    7,
                    student.getEmail()
                    .trim()
                    .toLowerCase());

            ps.setString(
                    8,
                    student.getPhone()
                    .trim());

            ps.setString(
                    9,
                    student.getPassword()
                    .trim());

            int rows =
                    ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        }

        catch(Exception e){

            e.printStackTrace();
            System.out.println(e);
        }

        return status;
    }
}