package SmartFeedbackSystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackSystem.db.DBConnection;
import SmartFeedbackSystem.model.Subject;

public class SubjectDAO {

    public boolean addSubject(
            Subject subject) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =

            "INSERT INTO subjects(" +
            "college_id, " +
            "subject_name, " +
            "course, " +
            "department, " +
            "year, " +
            "semester" +
            ") VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(
                    1,
                    subject.getCollegeId()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    2,
                    subject.getSubjectName()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    3,
                    subject.getCourse()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    4,
                    subject.getDepartment() == null
                    ? null
                    : subject.getDepartment()
                    .trim()
                    .toUpperCase());

            ps.setString(
                    5,
                    subject.getYearName()
                    .trim());

            ps.setString(
                    6,
                    subject.getSemester()
                    .trim());

            int rows =
                    ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        }

        catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }
}