package SmartFeedbackSystem.model;

public class Subject {

    private String collegeId;

    private String subjectName;

    private String course;

    private String department;

    private String yearName;

    private String semester;

    public String getCollegeId(){

        return collegeId;

    }

    public void setCollegeId(
            String collegeId){

        this.collegeId =
                collegeId;

    }

    public String getSubjectName(){

        return subjectName;

    }

    public void setSubjectName(
            String subjectName){

        this.subjectName =
                subjectName;

    }

    public String getCourse(){

        return course;

    }

    public void setCourse(
            String course){

        this.course =
                course;

    }

    public String getDepartment(){

        return department;

    }

    public void setDepartment(
            String department){

        this.department =
                department;

    }

    public String getYearName(){

        return yearName;

    }

    public void setYearName(
            String yearName){

        this.yearName =
                yearName;

    }

    public String getSemester(){

        return semester;

    }

    public void setSemester(
            String semester){

        this.semester =
                semester;

    }

}