<%@ page import="com.example.demo.MemberDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String ids[] = request.getParameterValues("id");

    MemberDB md = new MemberDB();
    md.dodelete(ids);

    response.sendRedirect("select.jsp");
%>