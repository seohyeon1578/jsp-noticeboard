<%@ page import="com.example.demo.MemberDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    MemberDB md = new MemberDB();
    md.doupdate(username, email, password, gender, id);
    session.setAttribute("username", username);
    response.sendRedirect("update.jsp");
%>