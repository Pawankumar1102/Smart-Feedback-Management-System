package SmartFeedbackManagementSystem.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import SmartFeedbackManagementSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String collegeId =
                request.getParameter("collegeId");

        String password =
                request.getParameter("password");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM admins " +
                    "WHERE college_id=? " +
                    "AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, collegeId);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                HttpSession session =
                        request.getSession();

                String adminType =
                        rs.getString("admin_type");

                String adminCourse =
                        "";

                /* COURSE DETECT */

                if (adminType != null) {

                    adminType =
                            adminType
                                    .toUpperCase()
                                    .trim();

                    if (adminType.startsWith("BTECH")) {

                        adminCourse =
                                "BTECH";
                    }

                    else if (adminType.startsWith("BCOM")) {

                        adminCourse =
                                "BCOM";
                    }

                    else if (adminType.startsWith("BBA")) {

                        adminCourse =
                                "BBA";
                    }

                    else if (adminType.startsWith("MBA")) {

                        adminCourse =
                                "MBA";
                    }

                    else if (adminType.startsWith("PHARMACY")) {

                        adminCourse =
                                "PHARMACY";
                    }

                    else if (adminType.startsWith("BSC")) {

                        adminCourse =
                                "BSC";
                    }
                }

                /* SAVE SESSION */

                session.setAttribute(
                        "adminName",
                        rs.getString("full_name"));

                session.setAttribute(
                        "adminId",
                        rs.getInt("id"));

                session.setAttribute(
                        "adminType",
                        adminType);

                session.setAttribute(
                        "adminCourse",
                        adminCourse);

                response.sendRedirect(
                        "admin/admin-dashboard.jsp");

            } else {

                response.sendRedirect(
                        "login.jsp?role=admin&error=1");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}