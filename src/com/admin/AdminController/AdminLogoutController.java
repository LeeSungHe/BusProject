package com.admin.AdminController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class AdminLogoutController  extends HttpServlet {

 
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url="NonageServlet?command=admin_login_form";
    
    HttpSession session=request.getSession(false);
    if(session!=null){
      session.invalidate();
      request.setAttribute("message", "");
    }    
    
    request.getRequestDispatcher(url).forward(request, response);  
  }
}
