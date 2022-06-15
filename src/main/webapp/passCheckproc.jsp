<%@ page import="com.example.demo.BoardManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String idx = request.getParameter("idx");
    String pass = request.getParameter("pass");
    if(idx == null) idx = "1";
    BoardManager bm = new BoardManager();

    String success = bm.dopassCkeck(Integer.parseInt(idx));
    if(success.equals(pass)){
        response.sendRedirect("boardDelete.jsp?idx=" + idx);
    }else {
        out.println("<script>");
        out.println("alert('비밀번호가 다릅니다.');");
        out.println("window.location.href='boardPasscheck.jsp?idx="+idx+"';");
        out.println("</script>");
    }
%>

