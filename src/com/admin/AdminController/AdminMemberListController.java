package com.admin.AdminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Member.MemberDAO;
import Member.MemberDTO;

public class AdminMemberListController  extends HttpServlet {


  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "admin/member/memberList.jsp";
    String key = "";
    if (request.getParameter("key") != null) {
      key = request.getParameter("key");
    }

    MemberDAO dao = MemberDAO.getInstance();
    ArrayList<MemberDTO> memberList = dao.listMember(key);

    request.setAttribute("memberList", memberList);

    request.getRequestDispatcher(url).forward(request, response);
  }
}
