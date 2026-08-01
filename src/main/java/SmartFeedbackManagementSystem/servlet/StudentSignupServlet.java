package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;

import SmartFeedbackManagementSystem.dao.StudentDAO;
import SmartFeedbackManagementSystem.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentSignupServlet")

public class StudentSignupServlet
extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        try {

            /* FORM DATA */

            String fullName =
                    request.getParameter(
                            "fullName");

            String rollNumber =
                    request.getParameter(
                            "rollNumber");

            String course =
                    request.getParameter(
                            "course");

            String department =
                    request.getParameter(
                            "department");

            String year =
                    request.getParameter(
                            "year");

            String semester =
                    request.getParameter(
                            "semester");

            String email =
                    request.getParameter(
                            "email");

            String phone =
                    request.getParameter(
                            "phone");

            String password =
                    request.getParameter(
                            "password");

            /* DEBUG */

            System.out.println(
            "fullName = " + fullName);

            System.out.println(
            "rollNumber = " + rollNumber);

            System.out.println(
            "course = " + course);

            System.out.println(
            "department = " + department);

            System.out.println(
            "year = " + year);

            System.out.println(
            "semester = " + semester);

            System.out.println(
            "email = " + email);

            System.out.println(
            "phone = " + phone);

            System.out.println(
            "password = " + password);

            /* REQUIRED FIELDS */

            if(fullName == null
            || fullName.trim().isEmpty()

            || rollNumber == null
            || rollNumber.trim().isEmpty()

            || course == null
            || course.trim().isEmpty()

            || email == null
            || email.trim().isEmpty()

            || phone == null
            || phone.trim().isEmpty()

            || password == null
            || password.trim().isEmpty()){

                response.getWriter().println(
                        "Missing Required Fields");

                return;
            }

            /* OPTIONAL FIELDS */

            if(department == null){

                department = "";
            }

            if(year == null
            || year.trim().isEmpty()){

                year = "1";
            }

            if(semester == null
            || semester.trim().isEmpty()){

                semester = "1";
            }

            /* CLEAN DATA */

            fullName =
                    fullName
                    .trim()
                    .toUpperCase();

            rollNumber =
                    rollNumber
                    .trim()
                    .toUpperCase();

            course =
                    course
                    .trim()
                    .toUpperCase();

            department =
                    department
                    .trim()
                    .toUpperCase();

            email =
                    email
                    .trim()
                    .toLowerCase();

            phone =
                    phone
                    .trim();

            password =
                    password
                    .trim();

            /* STUDENT OBJECT */

            Student student =
                    new Student();

            student.setFullName(
                    fullName);

            student.setRollNumber(
                    rollNumber);

            student.setCourse(
                    course);

            student.setDepartment(
                    department);

            student.setYear(
                    year);

            student.setSemester(
                    semester);

            student.setEmail(
                    email);

            student.setPhone(
                    phone);

            student.setPassword(
                    password);

            /* SAVE */

            StudentDAO dao =
                    new StudentDAO();

            boolean status =
                    dao.registerStudent(
                            student);

            if(status){

                response.sendRedirect(
                        "login.jsp?role=student&success=1");

            }

            else{

                response.getWriter().println(

                "Registration Failed. Check Console");
            }

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage());
        }
    }
}