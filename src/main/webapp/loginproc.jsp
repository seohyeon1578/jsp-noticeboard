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
        session.setAttribute("check", "false");
        response.sendRedirect("login.jsp");
    }
%>