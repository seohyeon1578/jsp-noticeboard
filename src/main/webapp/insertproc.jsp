<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.MemberDB" %>

<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");

    if(gender == ""){
        gender = "선택 안함";
    }

    MemberDB md = new MemberDB();

    md.doinsert(username, email, password,gender);
    response.sendRedirect("login.jsp");
%>