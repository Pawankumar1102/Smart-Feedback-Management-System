package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;

import SmartFeedbackManagementSystem.dao.FacultyDAO;
import SmartFeedbackManagementSystem.model.Faculty;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FacultySignupServlet")

public class FacultySignupServlet extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String fullName =
                request.getParameter("fullName").toUpperCase();

        String email =
                request.getParameter("email");

        String collegeId =
                request.getParameter("collegeId").toUpperCase();

        String phone =
                request.getParameter("phone");

        String department =
                request.getParameter("department").toUpperCase();

        String teacherField =
                request.getParameter("teacherField").toUpperCase();

        String password =
                request.getParameter("password");

        Faculty faculty = new Faculty();

        faculty.setFullName(fullName);
        faculty.setEmail(email);
        faculty.setCollegeId(collegeId);
        faculty.setPhone(phone);
        faculty.setDepartment(department);
        faculty.setTeacherField(teacherField);
        faculty.setPassword(password);

        FacultyDAO dao =
                new FacultyDAO();

        boolean status =
                dao.registerFaculty(faculty);

        if(status){

            response.sendRedirect(
                    "login.jsp?role=faculty&success=1");

        }
        else{

            response.getWriter().println(
                    "Faculty Registration Failed");

        }

    }

}