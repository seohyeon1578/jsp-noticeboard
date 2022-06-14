<%@ page import="com.example.demo.Board" %>
<%@ page import="com.example.demo.BoardManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String title = request.getParameter("title");
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    Board board = new Board();
    board.setTitle(title);
    board.setContent(content);
    board.setName(name);
    BoardManager bm = new BoardManager();
    boolean success = bm.doinsert(board);
    if(success){
        out.println("<script>");
        out.println("alert('글저장하였습니다.');");
        out.println("window.location.href='index.jsp';");
        out.println("</script>");
    }
%>