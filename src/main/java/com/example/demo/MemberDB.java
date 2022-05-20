package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDB {

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");  // mysql.jar 라이브러리 확인
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/b2-1",
                "root", "1111");
        return con;
    }

    public List<Member> doselect() {
        List<Member> list = new ArrayList();
        Connection con = null;  // DB연결
        PreparedStatement pstmt = null; // SQL문 작성..
        ResultSet rs = null;  // DB Table 저장..
        try {
            con = getConnection();
            pstmt = con.prepareStatement("select id, username, email, password, gender from member");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getInt("id"));
                member.setUsername(rs.getString("username"));
                member.setEmail(rs.getString("email"));
                member.setPassword(rs.getString("password"));
                member.setGender(rs.getString("gender"));

                list.add(member);
            }
            System.out.println("DB 연결 성공");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public Member doselectId(String username) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Member member = new Member();
        try {
            con = getConnection();
            // sql 구문 준비
            pstmt = con.prepareStatement("select id, username, email, password, gender from member where username = ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                member.setId(rs.getInt("id"));
                member.setUsername(rs.getString("username"));
                member.setEmail(rs.getString("email"));
                member.setPassword(rs.getString("password"));
                member.setGender(rs.getString("gender"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return member;
    }

    public void dodelete(String[] ids) {
        Connection con = null;
        PreparedStatement pstmt = null;
        // ids [ 2 3 4 ] -> 2,3,4
        System.out.println(ids.length);
        String values = "";
        for (int i = 0; i < ids.length; i++) {
            if (i == (ids.length - 1))
                values = values + ids[i];
            else
                values = values + ids[i] + ",";
        }
        // 2,3,4,

        System.out.println("values = " + values);
        try {
            con = getConnection();
            // sql 구문 준비
            pstmt = con.prepareStatement("delete from member where id in (" + values + ")");
            pstmt.executeUpdate();// sql 구문 실행...
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void dodeleteId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        System.out.println("values = " + id);
        try {
            con = getConnection();
            // sql 구문 준비
            pstmt = con.prepareStatement("delete from member where id in (" + id + ")");
            pstmt.executeUpdate();// sql 구문 실행...
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doinsert(String username, String email, String password, String gender) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement("insert into member" +
                    "(username, email, password,gender) " +
                    "values (?,?,?,?)");
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, gender);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doupdate(String username, String email, String password, String gender, String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement("update member set username=?, " +
                    "email=?, " +
                    "password=?, " +
                    "gender = ? " +
                    " where id = ?");
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, gender);
            pstmt.setInt(5, Integer.parseInt(id));
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean dologinchk(String u, String p) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement("select * from member where username = ? and password =?");
            pstmt.setString(1, u);
            pstmt.setString(2, p);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                System.out.println("행있음");
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean domanagerck(String username) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement("select manager from member where username = ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getBoolean(1)) {
                    System.out.println("관리자임");
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int docheckId(String username) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int idCheck = 0;

        try {
            con = getConnection();
            pstmt = con.prepareStatement("select username from member where username = ?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                idCheck = 0;
            } else {
                idCheck = 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return idCheck;
    }

    public int docheckEmail(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int emailCheck = 0;

        try {
            con = getConnection();
            pstmt = con.prepareStatement("select email from member where email = ?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                emailCheck = 0;
            } else {
                emailCheck = 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return emailCheck;
    }
}
