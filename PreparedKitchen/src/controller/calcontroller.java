package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
			
			List<CalDto>list = biz.mycalendar(id);
			JSONArray jArr = new JSONArray();
			HashMap<String, Object> hm = null;
			for(int i=0; i<list.size(); i++) {
				hm = new HashMap<String, Object>();
				hm.put("title", list.get(i).getTitle());
				hm.put("start", list.get(i).getPaymentdate());
				hm.put("description", list.get(i).getMaterialname());
				
				jArr.add(hm);
			}
			
			JSONObject jobj = new JSONObject();
			jobj.put("cal", jArr);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());
			System.out.println("element : " + element);
			PrintWriter out = response.getWriter();
			out.print(element);
			
		}else if(command.equals("calendar2")) {
			response.sendRedirect("calendar.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
