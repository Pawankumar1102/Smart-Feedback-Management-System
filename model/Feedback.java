package SmartFeedbackSystem.model;

public class Feedback {

    private int id;

    private int studentId;
    private int facultyId;

    private String subjectName;

    private int subjectKnowledge;
    private int behaviour;
    private int teachingSkill;
    private double rating;
    private String comment;

    // ================= ID =================

    public int getId() {
        return id;
    }



    
    public void setId(int id) {
        this.id = id;
    }

    // ================= STUDENT ID =================

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    // ================= FACULTY ID =================

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    // ================= SUBJECT =================

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    // ================= SUBJECT KNOWLEDGE =================

    public int getSubjectKnowledge() {
        return subjectKnowledge;
    }

    public void setSubjectKnowledge(int subjectKnowledge) {
        this.subjectKnowledge = subjectKnowledge;
    }

    // ================= BEHAVIOUR =================

    public int getBehaviour() {
        return behaviour;
    }

    public void setBehaviour(int behaviour) {
        this.behaviour = behaviour;
    }

    // ================= TEACHING SKILL =================

    public int getTeachingSkill() {
        return teachingSkill;
    }

    public void setTeachingSkill(int teachingSkill) {
        this.teachingSkill = teachingSkill;
    }

    // ================= COMMENT =================

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    // ================= RATING =================

    public double getRating() {

    return rating;

    }

    public void setRating(double rating) {

    this.rating = rating;

    }
    
}