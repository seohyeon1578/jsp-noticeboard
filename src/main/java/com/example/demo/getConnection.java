package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class getConnection {

    private static String classname = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/b2-1";
    private static String user = "root";
    private static String pw = "1111";

    public static Connection getConnection() throws Exception {
        Class.forName(classname);  // mysql.jar 라이브러리 확인
        Connection con = DriverManager.getConnection(url,user,pw);
        return con;
    }

    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs)
            throws Exception{
        if(rs!=null) rs.close();
        if(pstmt!=null) pstmt.close();
        if(con!=null) con.close();
    }

    public static void close(Connection con, PreparedStatement pstmt) throws Exception{
        if(pstmt!=null) pstmt.close();
        if(con!=null) con.close();
    }
}
