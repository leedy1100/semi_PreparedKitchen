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

import com.pk.dto.MemberDto;

@WebServlet("/map.do")
public class Map extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Map() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+ command +"]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(command.equals("map")) {
			
			MemberDto dto = (MemberDto)session.getAttribute("memberDto");
			
			if(dto != null) {
				response.sendRedirect("map/mapsample.jsp");
				
			} else {
				
				out.println("<script>");
				out.println("alert('로그인을 해주세요.');");
				out.println("history.back();");
				out.println("</script>");
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
