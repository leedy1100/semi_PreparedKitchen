package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pk.biz.MaterialBiz;
import com.pk.biz.RecipeBiz;
import com.pk.dto.MaterialDto;
import com.pk.dto.RecipeDto;

@WebServlet("/prodetail.do")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductDetail() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RecipeBiz rBiz = new RecipeBiz();
		MaterialBiz mBiz = new MaterialBiz();
		
		if(command.equals("detail")) {
			
			int recipeno = Integer.parseInt(request.getParameter("recipeno"));
			
			RecipeDto rDto = rBiz.selectOne(recipeno);
			List<MaterialDto> mList = mBiz.materialInRecipe(recipeno);
			
			request.setAttribute("recipe", rDto);
			request.setAttribute("material", mList);
			dispatch(request, response, "product/productdetail.jsp");
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
