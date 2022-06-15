<%@ page import="com.example.demo.BoardManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String idx = request.getParameter("idx");
    BoardManager bm = new BoardManager();
    bm.dodelete(Integer.parseInt(idx));
    response.sendRedirect("index.jsp");
%>
