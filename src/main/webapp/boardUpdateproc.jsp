<%@ page import="com.example.demo.BoardManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idx = request.getParameter("idx");
    String name = request.getParameter("name");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardManager bm = new BoardManager();
    bm.doupdate(Integer.parseInt(idx), name, title, content);

    response.sendRedirect("view.jsp?idx=" + idx);
%>