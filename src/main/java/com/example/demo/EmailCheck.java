package com.example.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/EmailCheck")
public class EmailCheck extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userEmail = request.getParameter("userEmail");
        System.out.println(userEmail);
        PrintWriter pOut = response.getWriter();

        MemberDB md = new MemberDB();

        int emailCheck = md.docheckEmail(userEmail);

        if (emailCheck == 0) {
            System.out.println("이미 존재하는 이메일");
        } else if (emailCheck == 1) {
            System.out.println("사용 가능한 이메일");
        }

        pOut.write(emailCheck + "");
    }
}
