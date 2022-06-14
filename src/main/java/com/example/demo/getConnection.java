package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;

public class getConnection {

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");  // mysql.jar 라이브러리 확인
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/b2-1",
                "root", "1111");
        return con;
    }
}
