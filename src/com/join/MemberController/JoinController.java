package com.join.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Join.do")
public class JoinController  extends HttpServlet{

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doJoin(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doJoin(req, resp);
	}
	
	  public void doJoin(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {    
	    String url = "Member/Join.jsp";  
	    
	    RequestDispatcher dispatcher=request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	
	  }
}