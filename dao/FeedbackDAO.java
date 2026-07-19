package SmartFeedbackSystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackSystem.db.DBConnection;
import SmartFeedbackSystem.model.Feedback;

public class FeedbackDAO {

    public boolean addFeedback(
            Feedback feedback) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =

            "INSERT INTO feedbacks(" +
            "student_id, " +
            "faculty_id, " +
            "subject_name, " +
            "subject_knowledge, " +
            "behaviour, " +
            "teaching_skill, " +
            "comment, " +
            "rating" +
            ") VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(
                    1,
                    feedback.getStudentId());

            ps.setInt(
                    2,
                    feedback.getFacultyId());

            ps.setString(
                    3,
                    feedback.getSubjectName());

            ps.setInt(
                    4,
                    feedback.getSubjectKnowledge());

            ps.setInt(
                    5,
                    feedback.getBehaviour());

            ps.setInt(
                    6,
                    feedback.getTeachingSkill());

            ps.setString(
                    7,
                    feedback.getComment());

            ps.setDouble(
                    8,
                    feedback.getRating());

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