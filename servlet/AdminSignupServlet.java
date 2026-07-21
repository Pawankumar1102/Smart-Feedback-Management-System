package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;

import SmartFeedbackManagementSystem.dao.AdminDAO;
import SmartFeedbackManagementSystem.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminSignupServlet")

public class AdminSignupServlet extends HttpServlet {

    @Override

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String fullName =
                request.getParameter("fullName").toUpperCase();

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");

        String collegeId =
                request.getParameter("collegeId").toUpperCase();

        String adminType =
                request.getParameter("adminType").toUpperCase();

        String password =
                request.getParameter("password");
                

        

        Admin admin = new Admin();

        admin.setFullName(fullName);
        admin.setEmail(email);
        admin.setPhone(phone);
        admin.setCollegeId(collegeId);
        admin.setAdminType(adminType);
        admin.setPassword(password);
        
        

        AdminDAO dao =
                new AdminDAO();

        boolean status =
                dao.registerAdmin(admin);

        if(status){

            response.sendRedirect(
                    "login.jsp?role=admin&success=1");

        }
        else{

            response.getWriter().println(
                    "Admin Registration Failed");

        }

    }

}