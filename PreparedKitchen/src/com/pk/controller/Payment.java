package com.pk.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("pay")) {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); // url 준비
			HttpURLConnection conn = (HttpURLConnection)url.openConnection(); // url로 통신 시작
			conn.setRequestMethod("POST"); // POST 방식으로 요청
			conn.setRequestProperty("Authorization", "KakaoAK 247d7866a02bfad3351e76235bc0f663"); // 요청 헤더 정의
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"); // 요청 헤더 정의
			conn.setDoInput(true); // inputstream 으로 응답 헤더와 메시지를 읽겠다
			conn.setDoOutput(true); // outputstream 으로 POST 방식의 요청을 하겠다
	        
	        Map<String, String> params = new HashMap<String, String>(); // 파라미터 세팅
	        params.put("cid", "TC0ONETIME");
	        params.put("partner_order_id", "0000001");
	        params.put("partner_user_id", "0000011");
	        params.put("item_name", "레시피 이름 [ 돼지고기, 마늘, 양파 ] ...");
	        params.put("quantity", "1");
	        params.put("total_amount", "10000");
	        params.put("tax_free_amount", "1000");
	        params.put("approval_url", "http://localhost:8787/PreparedKitchen/payment/approval.jsp");
	        params.put("cancel_url", "http://localhost:8787/PreparedKitchen/payment/cancel.jsp");
	        params.put("fail_url", "http://localhost:8787/PreparedKitchen/payment/fail.jsp");
	        
	        String string_params = new String(); // 보낼 파라미터
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&"); // 파라미터 전송 준비
			}
	        
	        System.out.println(string_params);
	        
	        OutputStream out = conn.getOutputStream();
	        out.write(string_params.getBytes());
	        out.flush();
	        out.close(); // POST 호출
	 
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String successUrl = null; // 준비 성공 시 연결할 url
			String tid = null; // 준비 성공시 받을 결제 고유 번호
			
	        try { // 응답받은 json 파싱작업
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject)parser.parse(in);
				successUrl = (String)obj.get("next_redirect_pc_url");
				tid = (String)obj.get("tid");
				HttpSession session = request.getSession();
				session.setAttribute("tid", tid);
				session.setAttribute("partner_order_id", "0000001");
				session.setAttribute("partner_user_id", "0000011");
				System.out.println(successUrl);
				System.out.println(tid);
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close(); // 응답 스트림 닫기
			}
	        
	        System.out.print(conn.getResponseCode());
			System.out.println(conn.getResponseMessage());
			System.out.println(conn.getRequestMethod());
			
			response.sendRedirect(successUrl);
			
		}else if(command.equals("approval")) {
			System.out.println("approval 이동");
			
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 247d7866a02bfad3351e76235bc0f663");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			HttpSession session = request.getSession();
			String tid = (String)session.getAttribute("tid");
			String partner_order_id = (String)session.getAttribute("partner_order_id");
			String partner_user_id = (String)session.getAttribute("partner_user_id");
			String pg_token = request.getParameter("pg_token");
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("cid", "TC0ONETIME");
			map.put("tid", tid);
			map.put("partner_order_id", partner_order_id);
			map.put("partner_user_id", partner_user_id);
			map.put("pg_token", pg_token);
			
			StringBuffer param = new StringBuffer();
			for(Map.Entry<String, String> one : map.entrySet()) {
				param.append(one.getKey() + "=" + one.getValue() + "&");
			}
			
			conn.getOutputStream().write(param.toString().getBytes());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			try {
				JSONParser parse = new JSONParser();
				JSONObject obj = (JSONObject)parse.parse(in);
				
				String amount = obj.get("amount").toString();
				System.out.println(amount);
				JSONObject amountObj = (JSONObject)parse.parse(amount);
				String total = amountObj.get("total").toString();
				System.out.println(total);
				
				
				session.setAttribute("item_name", (String)obj.get("item_name"));
				session.setAttribute("total", total);
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close();
			}
			

			System.out.println("success 이동");
			
			response.sendRedirect("payment/success.jsp");
		}
	}

}
