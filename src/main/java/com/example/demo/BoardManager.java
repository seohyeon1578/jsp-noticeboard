package com.example.demo;

import java.sql.*;
import java.util.*;
import java.time.LocalDateTime;

public class BoardManager {

    getConnection gc = new getConnection();

    public List<Board> doselect(int pageNum) throws Exception {
        int start = ( pageNum -1 )* 21;

        List<Board> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("select * from board order by idx desc limit "+start+",21");
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
                board.setPass(rs.getString("password"));
                list.add(board);
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt,rs);
        }
        return list;
    }

    public List<Board> doselect(int pageNum, String searchType, String searchKeyword) throws Exception {
        int start = ( pageNum -1 )* 21;

        List<Board> list = new ArrayList<>();

        String sql = "select * from board where " + searchType + " like ? order by idx desc limit "+start+",21";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%" + searchKeyword + "%");

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
                board.setPass(rs.getString("password"));
                list.add(board);
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt,rs);
        }
        return list;
    }

    public int getPageCnt() throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("select " +
                    "ceil(count(idx)/21) as cnt " +
                    "from board");
            rs = pstmt.executeQuery();
            if(rs.next())
                return rs.getInt("cnt");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            gc.close(con,pstmt,rs);
        }
        return 1;
    }

    public int getPageCnt( String searchType, String searchKeyword) throws Exception {
        String sql = "select " +
                "ceil(count(idx)/21) as cnt " +
                "from board where " + searchType + " like ?";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%" + searchKeyword + "%");
            rs = pstmt.executeQuery();
            if(rs.next())
                return rs.getInt("cnt");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            gc.close(con,pstmt,rs);
        }
        return 1;
    }

    public boolean doinsert(Board board) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("insert into board " +
                    "(name,title,content,wdate,password)" +
                    " values " +
                    "(?,?,?,?,?)");
            pstmt.setString(1, board.getName());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, LocalDateTime.now().toString());
            pstmt.setString(5, board.getPass());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt);
        }
        return true;
    }

    public Board doselectrow(int idx) throws Exception{
        Board board = new Board();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("select * from board where idx=?");
            pstmt.setInt(1, idx);
            // select -> executeQuery
            // insert update delete executeUpdate();
            rs = pstmt.executeQuery();
            if(rs.next()){
                board.setIdx(rs.getInt("idx"));
                board.setName(rs.getString("name"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setWDate(rs.getString("wdate"));
                board.setCount(rs.getInt("count"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt,rs);
        }

        return board;
    }

    public void docount(int idx) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;

        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("update board set count = count + 1 where idx = ?");
            pstmt.setInt(1, idx);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt);
        }
    }

    public void dodelete(int idx) throws Exception{
        Connection con = null;
        PreparedStatement pstmt = null;

        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("delete from board where idx =?");
            pstmt.setInt(1, idx);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt);
        }
    }

    public void doupdate(int idx, String name, String title, String content) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;

        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("update board set name = ?, title = ?, content = ? where idx = ?");
            pstmt.setString(1,name);
            pstmt.setString(2,title);
            pstmt.setString(3,content);
            pstmt.setInt(4, idx);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt);
        }
    }

    public String dopassCkeck(int idx) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            con = gc.getConnection();
            pstmt = con.prepareStatement("select password from board where idx = ?");
            pstmt.setInt(1,idx);

            rs = pstmt.executeQuery();
            if(rs.next())
                return rs.getString("password");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            gc.close(con,pstmt);
        }
        return "";
    }
}

