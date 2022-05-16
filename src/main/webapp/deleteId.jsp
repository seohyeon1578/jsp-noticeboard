<%@ page import="com.example.demo.MemberDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String id = request.getParameter("id");

    MemberDB md = new MemberDB();
    md.dodeleteId(id);

    session.removeAttribute("username");

    response.sendRedirect("index.jsp");
%>