package com.example.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("userId");
        System.out.println(username);
        PrintWriter pOut = response.getWriter();

        MemberDB md = new MemberDB();

        int idCheck = md.docheckId(username);

        if (idCheck == 0) {
            System.out.println("이미 존재하는 아이디");
        } else if (idCheck == 1) {
            System.out.println("사용 가능한 아이디");
        }

        pOut.write(idCheck + "");
    }
}
