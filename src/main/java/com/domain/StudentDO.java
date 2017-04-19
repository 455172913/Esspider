package com.domain;

public class StudentDO {
    private Integer id;

    private String studentname;

    private String studentnumber;

    private String classname;

    private Integer lessonid;

    private String lessonname;

    private Integer attendcount;

    private Integer usualscore;

    private Integer examscore;

    private Integer finalscore;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname == null ? null : studentname.trim();
    }

    public String getStudentnumber() {
        return studentnumber;
    }

    public void setStudentnumber(String studentnumber) {
        this.studentnumber = studentnumber == null ? null : studentnumber.trim();
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Integer getLessonid() {
        return lessonid;
    }

    public void setLessonid(Integer lessonid) {
        this.lessonid = lessonid;
    }

    public String getLessonname() {
        return lessonname;
    }

    public void setLessonname(String lessonname) {
        this.lessonname = lessonname == null ? null : lessonname.trim();
    }

    public Integer getAttendcount() {
        return attendcount;
    }

    public void setAttendcount(Integer attendcount) {
        this.attendcount = attendcount;
    }

    public Integer getUsualscore() {
        return usualscore;
    }

    public void setUsualscore(Integer usualscore) {
        this.usualscore = usualscore;
    }

    public Integer getExamscore() {
        return examscore;
    }

    public void setExamscore(Integer examscore) {
        this.examscore = examscore;
    }

    public Integer getFinalscore() {
        return finalscore;
    }

    public void setFinalscore(Integer finalscore) {
        this.finalscore = finalscore;
    }
}