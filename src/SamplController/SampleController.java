package SamplController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sample.do")
public class SampleController {
	private static final long serialVersionUID = 1L;
	
	

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		doUser(request,response);
	}//end
	
	

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost(1,2)");
		doUser(request, response);
	} //end
	
	//sample
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doUser(1,2) "); 
	 	response.setContentType("text/html; charset=UTF-8");
	 		PrintWriter out = response.getWriter() ;
		  	
		  	
		  	
	}
	
	
}
