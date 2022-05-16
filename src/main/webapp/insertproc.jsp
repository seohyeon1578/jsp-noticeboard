<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.MemberDB" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    MemberDB md = new MemberDB();
    md.doinsert(username,password,gender);
    response.sendRedirect("login.jsp");
%>