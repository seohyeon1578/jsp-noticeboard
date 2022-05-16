<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 세션 내용 삭제
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
