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

import com.biz.calbiz.Calbiz;
import com.dto.caldto.Caldto;


@WebServlet("/cal.do")
public class calcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public calcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<" + command + ">");
		
		Calbiz biz = new Calbiz();
		
		
		if(command.equals("calendar")) {
			String id = request.getParameter("id");
			
			Caldto dto = biz.mycal(id);
			request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("calendar.jsp");
			dispatch.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
