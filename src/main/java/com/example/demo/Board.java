package com.example.demo;

public class Board {

    private int idx;
    private String title;
    private String content;
    private String name;
    private String WDate;
    private int count;
    private String phone;
    private String email;
    private String pass;
    private String username;

    public Board() {}

    @Override
    public String toString() {
        return "Board{" +
                "idx=" + idx +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", name='" + name + '\'' +
                ", WDate='" + WDate + '\'' +
                ", count=" + count +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", pass='" + pass + '\'' +
                ", username='" + username + '\'' +
                '}';
    }

    public Board(int idx, String title, String content, String name, String WDate, int count, String phone, String email, String pass, String username) {
        this.idx = idx;
        this.title = title;
        this.content = content;
        this.name = name;
        this.WDate = WDate;
        this.count = count;
        this.phone = phone;
        this.email = email;
        this.pass = pass;
        this.username = username;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWDate() {
        return WDate;
    }

    public void setWDate(String WDate) {
        this.WDate = WDate;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) { this.count = count; }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}

