package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;

import SmartFeedbackManagementSystem.dao.SubjectDAO;
import SmartFeedbackManagementSystem.model.Subject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddSubjectServlet")

public class AddSubjectServlet
extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        String collegeId =
                (String)session.getAttribute(
                        "facultyCollegeId");

        /* FORM DATA */

        String subjectName =
                request.getParameter(
                        "subjectName");

        String course =
                request.getParameter(
                        "course");

        String department =
                request.getParameter(
                        "department");

        String yearName =
                request.getParameter(
                        "year");

        String semester =
                request.getParameter(
                        "semester");

        /* NULL SAFETY */

        if(collegeId == null){

            response.sendRedirect(
                    "login.jsp");

            return;
        }

        /* SUBJECT OBJECT */

        Subject subject =
                new Subject();

        subject.setCollegeId(
                collegeId
                .trim()
                .toUpperCase());

        subject.setSubjectName(
                subjectName
                .trim()
                .toUpperCase());

        subject.setCourse(
                course
                .trim()
                .toUpperCase());

        subject.setDepartment(

                department == null
                ? null
                : department
                .trim()
                .toUpperCase());

        subject.setYearName(
                yearName
                .trim());

        subject.setSemester(
                semester
                .trim());

        /* SAVE */

        SubjectDAO dao =
                new SubjectDAO();

        boolean status =
                dao.addSubject(
                        subject);

        if(status){

            response.sendRedirect(
                    "faculty/add-subject.jsp?success=1");

        }

        else{

            response.sendRedirect(
                    "faculty/add-subject.jsp?error=1");
        }
    }
}