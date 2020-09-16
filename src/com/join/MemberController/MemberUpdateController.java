package com.join.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberDTO;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate.do")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String m_id = request.getParameter("m_id");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMember(m_id);
		request.setAttribute("dto", dto);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("member/JoinUpdate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐을 방지
		// 폼에서 입력한 회원 정보 얻어오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_img = request.getParameter("m_img");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
		String m_admin = request.getParameter("m_admin");
		// 회원 정보를 저장할 객체 생성
		MemberDTO dto = new MemberDTO();
		dto.setM_id(m_id);
		dto.setM_pw(m_pw);
		dto.setM_email(m_email);
		dto.setM_phone(m_phone);
		dto.setM_admin(Integer.parseInt(m_admin));
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(dto);
		response.sendRedirect("login.do");
	}

}
