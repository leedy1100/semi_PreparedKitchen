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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pk.biz.ProductListBiz;
import com.pk.biz.RecipeBiz;
import com.pk.dto.MaterialDto;
import com.pk.dto.RecipeDto;

@WebServlet("/product.do")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Product() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RecipeBiz biz = new RecipeBiz();
		ProductListBiz productListBiz = new ProductListBiz();
		
		if(command.equals("detail")) {
			
			response.sendRedirect("product/productdetail.jsp");
			
		} else if(command.equals("recipedb")) {
			
			response.sendRedirect("product/createrecipedb.jsp");
			
		} else if(command.equals("createdbinfo")) {
			
			String info = request.getParameter("info");
			
			JsonParser parser = new JsonParser();
			JsonElement infoEle = parser.parse(info);
			
			List<RecipeDto> recip = biz.selectList();
			
			if(recip.size() == 0) {
				
				for(int i = 0; i < infoEle.getAsJsonObject().get("data").getAsJsonArray().size(); i++) {
					
					JsonObject infoObj = infoEle.getAsJsonObject().get("data").getAsJsonArray().get(i).getAsJsonObject();
					
					JsonElement recipe_id = infoObj.get("RECIPE_ID");
					JsonElement recipe_nm = infoObj.get("RECIPE_NM_KO");
					JsonElement recipe_cal = infoObj.get("CALORIE");
					JsonElement recipe_cate1 = infoObj.get("NATION_NM");
					JsonElement recipe_cate2 = infoObj.get("TY_NM");
					
					int recipe_no = recipe_id.getAsInt();
					String recipe_name = recipe_nm.getAsString();
					String recipe_nutrient = recipe_cal.getAsString();
					String recipe_category = recipe_cate1.getAsString() + "," + recipe_cate2.getAsString();
					
					RecipeDto dto = new RecipeDto();
					dto.setRecipe_no(recipe_no);
					dto.setRecipe_name(recipe_name);
					dto.setRecipe_content("a");
					dto.setRecipe_nutrient(recipe_nutrient);
					dto.setRecipe_category(recipe_category);
					
					recip.add(dto);
				}
				
				int res = biz.insert(recip);
				out.println(res+"개의 더미데이터가 등록되었습니다.");
				
			} else {
				out.println("이미 등록되어 있습니다.");
			}
			
			
		} else if(command.equals("createdbcon")) {
			
			String con = request.getParameter("con");
			
			JsonParser parser = new JsonParser();
			JsonElement conEle = parser.parse(con);
			
		} else if(command.equals("createdbmat")) {

			String mat = request.getParameter("mat");
			
			JsonParser parser = new JsonParser();
			JsonElement matEle = parser.parse(mat);
			
		} else if(command.equals("productview")) {
			
			JSONArray jArr = new JSONArray();
			jArr = productListBiz.productViewChart();
			
			JSONObject jobj = new JSONObject();
			
			jobj.put("proview",jArr);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());

			out.print(element);
		}else if(command.equals("productsales")) {
			JSONArray jArr = new JSONArray();
			jArr = productListBiz.productSalesChart();
			
			JSONObject jobj = new JSONObject();
			
			jobj.put("proview",jArr);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());

			out.print(element);
		}
		
		
		
// recipeInfo - {"RECIPE_ID":"레시피 코드"},{"RECIPE_NM_KO":"레시피 이름"},{"SUMRY":"간략(요약) 소개"},{"NATION_CODE":"유형코드"},{"NATION_NM":"유형분류"},{"TY_CODE":"음식분류코드"},
//		{"TY_NM":"음식분류"},{"COOKING_TIME":"조리시간"},{"CALORIE":"칼로리"},{"QNT":"분량"},{"LEVEL_NM":"난이도"},{"IRDNT_CODE":"재료별 분류명"},{"PC_NM":"가격별 분류"},
//		{"IMG_URL":"대표이미지 URL"},{"DET_URL":"상세 URL"}

//recipeContent - {"RECIPE_ID":"레시피 코드"},{"COOKING_NO":"요리설명순서"},{"COOKING_DC":"요리설명"},{"STRE_STEP_IMAGE_URL":"과정 이미지 URL"},{"STEP_TIP":"과정팁"}

//recipeMaterial - {"RECIPE_ID":"레시피 코드"},{"IRDNT_SN":"재료순번"},{"IRDNT_NM":"재료명"},{"IRDNT_CPCTY":"재료용량"},{"IRDNT_TY_CODE":"재료타입 코드"},{"IRDNT_TY_NM":"재료타입명"}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
