package controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pk.biz.CalendarBiz;
import com.pk.dto.CalDto;


@WebServlet("/cal.do")
public class calcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public calcontroller() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<" + command + ">");
		
		CalendarBiz biz = new CalendarBiz();
		
		
		if(command.equals("calendar")) {
			String id = "user";
			
			
			
			
			
			//request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("calendar.jsp");
			dispatch.forward(request, response);
			
		
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
