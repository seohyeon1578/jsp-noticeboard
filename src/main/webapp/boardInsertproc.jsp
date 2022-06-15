<%@ page import="com.example.demo.Board" %>
<%@ page import="com.example.demo.BoardManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String title = request.getParameter("title");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    String username = (String) session.getAttribute("username");
    System.out.println(username);
    Board board = new Board();
    board.setTitle(title);
    board.setPass(pass);
    board.setContent(content);
    board.setName(name);
    board.setUsername(username);
    BoardManager bm = new BoardManager();
    boolean success = bm.doinsert(board);
    if(success){
        response.sendRedirect("index.jsp");
    }
%>