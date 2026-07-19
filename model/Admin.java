package SmartFeedbackSystem.model;

public class Admin {

    private int id;

    private String fullName;
    private String collegeId;
    private String email;
    private String phone;
    private String adminType;
    private String password;

    // ================= ID =================

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // ================= FULL NAME =================

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    // ================= COLLEGE ID =================

    public String getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(String collegeId) {
        this.collegeId = collegeId;
    }

    // ================= EMAIL =================

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // ================= PHONE =================

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // ================= ADMIN TYPE =================

    public String getAdminType() {
        return adminType;
    }

    public void setAdminType(String adminType) {
        this.adminType = adminType;
    }

    // ================= PASSWORD =================

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}