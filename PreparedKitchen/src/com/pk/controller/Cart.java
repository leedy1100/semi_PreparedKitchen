package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pk.biz.CartBiz;
import com.pk.biz.MartBiz;
import com.pk.dto.CartDto;
import com.pk.dto.MartDto;
import com.pk.dto.MemberDto;

@WebServlet("/cart.do")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Cart() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		CartBiz cartBiz = new CartBiz();
		
		if(command.equals("addcart")) {
			
			MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
			
			if(mDto == null) {
				
				out.println("<script>");
				out.println("alert('로그인을 해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				
			} else {
				
				String id = mDto.getId();
				int recipeno = Integer.parseInt(request.getParameter("recipenos"));
				String product = request.getParameter("proList");
				String[] proList = product.split(",");
				
				MartBiz martBiz = new MartBiz();
				List<MartDto> martList = martBiz.buyProduct(proList);
				List<CartDto> cartList = new ArrayList<CartDto>();
				
				for(MartDto dto : martList) {
					
					CartDto cartDto = new CartDto();
					cartDto.setId(id);
					cartDto.setRecipe_no(recipeno);
					cartDto.setMart_no(dto.getMart_no());
					
					cartList.add(cartDto);
				}
				
				int res = cartBiz.isnertCart(cartList);
				
				if(res > 0) {
					
					out.println("<script>");
					out.println("alert('선택하신 상품들이 장바구니에 담겼습니다.');");
					out.println("history.back();");
					out.println("</script>");
				}
				
			}
			
		} else if(command.equals("deletecart")) {
			
			MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
			String recipenos_String = request.getParameter("recipenos");
			
			String id = mDto.getId();
			String[] recipenos_arr = recipenos_String.split(",");
			int[] recipenos = new int[recipenos_arr.length];
			
			for(int i = 0; i < recipenos_arr.length; i++) {
				recipenos[i] = Integer.parseInt(recipenos_arr[i]);
			}
			
			int res = cartBiz.deleteCart(id, recipenos);
			
			response.sendRedirect("/PreparedKitchen/member.do?command=cart");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
