package com.domain;

public class LessonDo {
    private Integer id;

    private String lessonname;

    private Integer teacherid;

    private String teachername;

    private String lessonstart;

    private String sessonend;

    private String weekday;

    private String lessonnum;

    private String callcount;

    private String teachpro;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLessonname() {
        return lessonname;
    }

    public void setLessonname(String lessonname) {
        this.lessonname = lessonname == null ? null : lessonname.trim();
    }

    public Integer getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Integer teacherid) {
        this.teacherid = teacherid;
    }

    public String getTeachername() {
        return teachername;
    }

    public void setTeachername(String teachername) {
        this.teachername = teachername == null ? null : teachername.trim();
    }

    public String getLessonstart() {
        return lessonstart;
    }

    public void setLessonstart(String lessonstart) {
        this.lessonstart = lessonstart == null ? null : lessonstart.trim();
    }

    public String getSessonend() {
        return sessonend;
    }

    public void setSessonend(String sessonend) {
        this.sessonend = sessonend == null ? null : sessonend.trim();
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday == null ? null : weekday.trim();
    }

    public String getLessonnum() {
        return lessonnum;
    }

    public void setLessonnum(String lessonnum) {
        this.lessonnum = lessonnum == null ? null : lessonnum.trim();
    }

    public String getCallcount() {
        return callcount;
    }

    public void setCallcount(String callcount) {
        this.callcount = callcount == null ? null : callcount.trim();
    }

    public String getTeachpro() {
        return teachpro;
    }

    public void setTeachpro(String teachpro) {
        this.teachpro = teachpro == null ? null : teachpro.trim();
    }
}