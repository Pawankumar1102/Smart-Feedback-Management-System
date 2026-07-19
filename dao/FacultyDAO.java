package SmartFeedbackSystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackSystem.db.DBConnection;
import SmartFeedbackSystem.model.Faculty;

public class FacultyDAO {

    public boolean registerFaculty(
            Faculty faculty) {

        boolean status =
                false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =

            "INSERT INTO faculty(" +
            "full_name, " +
            "college_id, " +
            "email, " +
            "phone, " +
            "department, " +
            "teacher_field, " +
            "password" +
            ") VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(
                            query);

            ps.setString(
                    1,
                    faculty.getFullName()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    2,
                    faculty.getCollegeId()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    3,
                    faculty.getEmail()
                    .trim()
                    .toLowerCase());

            ps.setString(
                    4,
                    faculty.getPhone()
                    .trim());

            ps.setString(
                    5,

                    faculty.getDepartment() == null
                    ? null
                    : faculty.getDepartment()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    6,
                    faculty.getTeacherField()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    7,
                    faculty.getPassword()
                    .trim());

            int rows =
                    ps.executeUpdate();

            if(rows > 0){

                status =
                        true;
            }

        }

        catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }
}

