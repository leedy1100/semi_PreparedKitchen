package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.pk.biz.CalendarBiz;
import com.pk.dto.CalDto;
import com.pk.dto.MemberDto;


@WebServlet("/cal.do")
public class calcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public calcontroller() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
	
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		System.out.println("<" + command + ">");
		
		
		CalendarBiz biz = new CalendarBiz();
		
		if(command.equals("calendar")) {
			
			MemberDto dto = (MemberDto)session.getAttribute("memberDto");
			String id = dto.getId();
			
			
			List<CalDto>list = biz.mycalendar(id);
			JSONArray jArr = new JSONArray();
			HashMap<String, Object> hm = null;
			for(int i=0; i<list.size(); i++) {
				hm = new HashMap<String, Object>();
				hm.put("title", list.get(i).getRecipe_name());
				hm.put("start", list.get(i).getRecipe_date());
				hm.put("description", list.get(i).getPayment_no());
				
				
				jArr.add(hm);
			}
			
			JSONObject jobj = new JSONObject();
			jobj.put("event", jArr);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());
			
		
			out.print(jArr.toString());
			
		}else if(command.equals("calendar2")) {
			
			MemberDto dto = (MemberDto)session.getAttribute("memberDto");
			if(dto != null) {
			dispatch(request, response, "calendar.jsp");
			}else {
				out.println("<script>");
				out.println("alert('로그인을 해주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}else if(command.contentEquals("calendarupdate")) {
			String start = request.getParameter("start");
			int payment_no = Integer.parseInt(request.getParameter("payment_no"));
			MemberDto dtoo = (MemberDto)session.getAttribute("memberDto");
			String id = dtoo.getId();
			
			CalDto dto = new CalDto();
			dto.setRecipe_date(start);
			dto.setId(id);
			dto.setPayment_no(payment_no);
			
			
			int res = biz.updatecalendar(dto);
			if(res>0) {
				out.println("<script>");
				out.println("location.href='cal.do?command=calendar2'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("error'");
				out.println("</script>");
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
