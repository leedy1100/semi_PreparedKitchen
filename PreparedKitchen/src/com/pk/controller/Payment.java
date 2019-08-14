package com.pk.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.pk.biz.CartBiz;
import com.pk.biz.MartBiz;
import com.pk.biz.MaterialBiz;
import com.pk.biz.PaymentBiz;
import com.pk.biz.ProductListBiz;
import com.pk.biz.RecipeBiz;
import com.pk.dto.CartDto;
import com.pk.dto.MartDto;
import com.pk.dto.MemberDto;
import com.pk.dto.PaymentDto;
import com.pk.dto.RecipeDto;


@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PaymentBiz pBiz = new PaymentBiz();   
    private MartBiz martBiz = new MartBiz();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		ProductListBiz proBiz = new ProductListBiz();
		
		if(command.equals("pay")) {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST"); // POST 방식으로 요청
			conn.setRequestProperty("Authorization", "KakaoAK 247d7866a02bfad3351e76235bc0f663"); 
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"); 
			conn.setDoInput(true); 
			conn.setDoOutput(true); 
	        
			String partner_order_id = request.getParameter("partner_order_id");
			String partner_user_id = request.getParameter("partner_user_id");
			String item_name = request.getParameter("item_name");
			String item_code = request.getParameter("item_code");
	       
			Map<String, String> params = new HashMap<String, String>();
	        params.put("cid", "TC0ONETIME");
	        params.put("partner_order_id", partner_order_id);
	        params.put("partner_user_id", partner_user_id);
	        params.put("item_name", request.getParameter("item_name"));
	        params.put("item_code", request.getParameter("item_code"));
	        params.put("quantity", request.getParameter("quantity"));
	        params.put("total_amount", request.getParameter("total_amount"));
	        params.put("tax_free_amount", request.getParameter("tax_free_amount"));
	        params.put("approval_url", "http://localhost:8787/PreparedKitchen/payment/approval.jsp");
	        params.put("cancel_url", "http://localhost:8787/PreparedKitchen/payment/cancel.jsp");
	        params.put("fail_url", "http://localhost:8787/PreparedKitchen/payment/fail.jsp");
	        
	        String string_params = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&");
			}
	        
	        System.out.println(string_params);
	        
	        OutputStream out = conn.getOutputStream();
	        out.write(string_params.getBytes());
	        out.flush();
	        out.close(); // POST 호출
	 
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String successUrl = null; // 준비 성공 시 연결할 url
			
	        try { // 응답받은 json 파싱작업
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject)parser.parse(in);
				
				successUrl = (String)obj.get("next_redirect_pc_url");
				
				session.setAttribute("tid", (String)obj.get("tid"));
				session.setAttribute("partner_order_id", partner_order_id);
				session.setAttribute("partner_user_id", partner_user_id);
				session.setAttribute("item_name", item_name);
				session.setAttribute("item_code", item_code);
				
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close(); // 응답 스트림 닫기
			}
			
			response.sendRedirect(successUrl);
			
		}else if(command.equals("approval")) {
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 247d7866a02bfad3351e76235bc0f663");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			String tid = (String)session.getAttribute("tid");
			String partner_order_id = (String)session.getAttribute("partner_order_id");
			String partner_user_id = (String)session.getAttribute("partner_user_id");
			String item_name = (String)session.getAttribute("item_name");
			String item_code = (String)session.getAttribute("item_code");
			String pg_token = request.getParameter("pg_token");
			String recipeno = session.getAttribute("recipeno").toString();

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
				
				// subString 으로 item_code 자른 후 각각의 재료no로 list에 담는다
				List<PaymentDto> list = new ArrayList<PaymentDto>();
				
				String[] split = item_code.split(",");
				Date date = new Date();
				SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd  hh시");
				String payment_date = dateform.format(date);
				
				for(String sp : split) {
					int mart_no = Integer.parseInt(sp);
					PaymentDto pDto = new PaymentDto();
					MartDto martDto = martBiz.selectOne(mart_no);
					pDto.setPayment_group(tid);
					pDto.setId(partner_user_id);
					pDto.setItem_name(martDto.getItem_name());
					pDto.setMart_no(mart_no);
					pDto.setPayment_price(martDto.getMart_price());
					pDto.setPayment_date(payment_date);
					pDto.setRecipe_date(payment_date);
					pDto.setShipping_addr("배송지");
					
					list.add(pDto);
					
				}
				
				int res = pBiz.insert(list);
				
				if(res == list.size()) {
					System.out.println("db 저장 성공");
					proBiz.salesCount(recipeno);
				}else {
					System.out.println("db 저장 실패");
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {
				in.close();
			}
			

			System.out.println("success 이동");
			
			response.sendRedirect("payment/success.jsp");
			
		}else if(command.equals("cancle")) {
			URL url = new URL("https://kapi.kakao.com/v1/payment/cancel");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 247d7866a02bfad3351e76235bc0f663");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			
			String tid = request.getParameter("tid");
			
			List<PaymentDto> plist = pBiz.selectOneList(tid);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("cid", "TC0ONETIME");
			map.put("tid", tid);
			map.put("cancel_amount", "1000");
			map.put("cancel_tax_free_amount", "0");
			
			StringBuffer str = new StringBuffer();
			for(Map.Entry<String, String> ele : map.entrySet()) {
				str.append(ele.getKey() + "=" + ele.getValue() + "&");
			}
			
			conn.getOutputStream().write(str.toString().getBytes());;
			
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			try {
				JSONParser parse = new JSONParser();
				JSONObject obj = (JSONObject)parse.parse(in);
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			int res = pBiz.delete(tid);
			
			response.sendRedirect("/PreparedKitchen/payment/mypagepayment.jsp");
			
		} else if(command.equals("confirmpay")) {
			
			PrintWriter out = response.getWriter();
			MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
			
			if(mDto == null) {
				
				out.println("<script>");
				out.println("alert('로그인을 해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				
			} else {
				
				int recipeno = Integer.parseInt(request.getParameter("recipeno"));
				String product = request.getParameter("proList");
				String[] proList = product.split(",");
				System.out.println("confirmpay부분 : " + request.getParameter("recipeno"));
				MartBiz martBiz = new MartBiz();
				List<MartDto> list = martBiz.buyProduct(proList);
				
				RecipeBiz recipeBiz = new RecipeBiz();
				RecipeDto rDto = recipeBiz.selectOne(recipeno);
				List<RecipeDto> rList = new ArrayList<RecipeDto>();
				
				rList.add(rDto);
				
				session.setAttribute("recipeno", recipeno);
				session.setAttribute("productList", list);
				session.setAttribute("recipeList", rList);
				response.sendRedirect("/PreparedKitchen/payment/confirmpayment.jsp");
			}
			
		}

	}
}
