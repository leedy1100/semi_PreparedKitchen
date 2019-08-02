package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pk.biz.MemberBiz;
import com.pk.dto.MemberDto;

/**
 * Servlet implementation class member
 */
@WebServlet("/member.do")
public class member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+ command +"]");
		
		MemberBiz biz = new MemberBiz();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		if(command.equals("mypage")) {
			dispatch(request, response, "userinfo.jsp");
		}else if(command.equals("paymentinfo")) {
			dispatch(request, response, "paymentinfo.jsp");
		}else if(command.equals("cart")) {
			dispatch(request, response, "cart.jsp");
		}else if(command.equals("updateinfo")) {
			MemberDto dto = new MemberDto();
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setBirth(birth);
			dto.setEmail(email);
			
			int res = biz.updateinfo(dto);
			
			if(res>0) {
				out.println("<script>");
				out.println("alert('입력 성공');");
				out.println("location.href='login.do?command=mypage';");
				out.println("</script>");
			}
			else {
				out.println("<script>");
				out.println("alert('입력 실패');");
				out.println("location.href='login.do?command=mypage';");
				out.println("</script>");
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
