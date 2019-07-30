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

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+ command +"]");
		
		MemberBiz biz = new MemberBiz();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		if(command.equals("gologin")) {
			
			response.sendRedirect("login.jsp");
			
		} else if(command.equals("signup")) {
			
			response.sendRedirect("signup.jsp");
			
		} else if(command.equals("signupres")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
			String addr = request.getParameter("addr");
			String birth = request.getParameter("birth");
			
			MemberDto dto = new MemberDto();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setBirth(birth);
			
			int res = biz.signup(dto);
			
			if(res > 0) {
				System.out.println("회원가입 성공");
				response.sendRedirect("login.jsp");
				
			} else {
				System.out.println("회원가입 실패");
				response.sendRedirect("signup.jsp");
			}
			
			
		} else if(command.equals("idchk")) {
			
			String id = request.getParameter("id");
			
			MemberDto dto = biz.idchk(id);
			
			if(dto != null) {
				out.println(dto.getId());
			}
			
		} else if(command.equals("login")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberDto dto = biz.login(id,pw);
			
			if(dto != null) {
				
				session.setAttribute("memberDto", dto);
				response.sendRedirect("index.jsp");
				
			} else {
				response.sendRedirect("login.jsp");
			}
			
		} else if(command.equals("logout")) {
			
			session.invalidate();
			response.sendRedirect("index.jsp");
			
		} else if(command.equals("emailchk")) {
			
			String email = request.getParameter("email");
			
			MemberDto dto = biz.emailchk(email);
			
			if(dto != null) {
				out.println(dto.getEmail());
				
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
