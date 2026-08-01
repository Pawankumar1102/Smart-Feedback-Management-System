package SmartFeedbackManagementSystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartFeedbackManagementSystem.db.DBConnection;
import SmartFeedbackManagementSystem.model.Admin;

public class AdminDAO {

    public boolean registerAdmin(Admin admin) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "INSERT INTO admins(full_name, college_id, email, phone, admin_type, password) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(
                    1,
                    admin.getFullName()
                    .toUpperCase());

            ps.setString(
                    2,
                    admin.getCollegeId());

            ps.setString(
                    3,
                    admin.getEmail()
                    .toLowerCase());

            ps.setString(
                    4,
                    admin.getPhone());

            ps.setString(
                    5,
                    admin.getAdminType()
                    .toUpperCase());

            ps.setString(
                    6,
                    admin.getPassword());

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