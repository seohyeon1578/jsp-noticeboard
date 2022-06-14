package com.example.demo;

import java.sql.*;
import java.util.*;
import java.time.LocalDateTime;

public class BoardManager {

    getConnection gc = new getConnection();

    public List<Board> doselect(){
        List<Board> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("select * from board order by idx desc");
            rs = pstmt.executeQuery();
            while(rs.next()){
                Board board = new Board();
                board.setIdx(rs.getInt("idx"));
                board.setContent(rs.getString("content"));
                board.setCount(rs.getInt("count"));
                board.setEmail(rs.getString("email"));
                board.setName(rs.getString("name"));
                board.setTitle(rs.getString("title"));
                board.setWDate(rs.getString("wdate"));
                board.setPhone(rs.getString("phone"));
                list.add(board);
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {

        }
        return list;
    }

    public boolean doinsert(Board board){
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("insert into board " +
                    "(name,title,content,wdate)" +
                    " values " +
                    "(?,?,?,?)");
            pstmt.setString(1, board.getName());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, LocalDateTime.now().toString());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return true;
    }
}

