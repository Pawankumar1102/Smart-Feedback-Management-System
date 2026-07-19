package SmartFeedbackSystem.servlet;

import java.io.IOException;

import SmartFeedbackSystem.dao.FeedbackDAO;
import SmartFeedbackSystem.model.Feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitFeedbackServlet")

public class SubmitFeedbackServlet
extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession();

            Integer studentId =
                    (Integer) session.getAttribute(
                            "studentId");

            if(studentId == null){

                response.sendRedirect(
                        "login.jsp");

                return;
            }

            /* FORM DATA */

            int facultyId =
                    Integer.parseInt(

                    request.getParameter(
                            "facultyId"));

            String subjectName =
                    request.getParameter(
                            "subjectName");

            int subjectKnowledge =
                    Integer.parseInt(

                    request.getParameter(
                            "subjectKnowledge"));

            int behaviour =
                    Integer.parseInt(

                    request.getParameter(
                            "behaviour"));

            int teachingSkill =
                    Integer.parseInt(

                    request.getParameter(
                            "teachingSkill"));

            String comment =
                    request.getParameter(
                            "comment");

            /* NULL SAFETY */

            if(subjectName == null){

                subjectName =
                        "UNKNOWN";
            }

            if(comment == null
                    || comment.trim().isEmpty()){

                comment =
                        "No Comment";
            }

            /* CLEAN DATA */

            subjectName =
                    subjectName
                    .trim()
                    .toUpperCase();

            comment =
                    comment
                    .trim();

            /* AVERAGE RATING */

            double rating =

                    (subjectKnowledge
                    + behaviour
                    + teachingSkill)
                    / 3.0;

            /* OBJECT */

            Feedback feedback =
                    new Feedback();

            feedback.setStudentId(
                    studentId);

            feedback.setFacultyId(
                    facultyId);

            feedback.setSubjectName(
                    subjectName);

            feedback.setSubjectKnowledge(
                    subjectKnowledge);

            feedback.setBehaviour(
                    behaviour);

            feedback.setTeachingSkill(
                    teachingSkill);

            feedback.setRating(
                    rating);

            feedback.setComment(
                    comment);

            /* SAVE */

            FeedbackDAO dao =
                    new FeedbackDAO();

            boolean status =
                    dao.addFeedback(
                            feedback);

            if(status){

                response.sendRedirect(

                "student/student-dashboard.jsp?feedback=success");

            }

            else{

                response.sendRedirect(

                "student/give-feedback.jsp?error=1");
            }

        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
                    "student/give-feedback.jsp?error=1");
        }
    }
}