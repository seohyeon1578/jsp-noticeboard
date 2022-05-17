<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.MemberDB"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    MemberDB memberdb = new MemberDB();
    boolean loginck = memberdb.dologinchk(username,password);

    if(loginck){
        System.out.println("성공");

        memberdb.doselectId(username);

        session.setAttribute("username",username);
        session.setAttribute("password",password);
        session.setAttribute("manager","false");

        boolean managerck = memberdb.domanagerck(username);
        if(managerck){
            session = request.getSession();
            session.setAttribute("manager","true");
        }
        response.sendRedirect("index.jsp");

    }else{
        out.println("실패");
        out.println("<script>");
        out.println("alert('아이디 비밀번호 확인하세요');");
        out.println("location.href='index.jsp';");
        out.println("</script>");

    }
%>