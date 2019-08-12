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
import com.pk.biz.MaterialBiz;
import com.pk.biz.ProductListBiz;
import com.pk.biz.RecipeBiz;
import com.pk.dto.MaterialDto;
import com.pk.dto.PagingDto;
import com.pk.dto.PagingRecipeDto;
import com.pk.dto.ProductListDto;
import com.pk.dto.RecipeDto;

@WebServlet("/product.do")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Product() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ProductListBiz pBiz = new ProductListBiz();
		RecipeBiz rBiz = new RecipeBiz();
		MaterialBiz mBiz = new MaterialBiz();

		int currentPageNo = 1;
		int recordsPerPage = 0;

		if (request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		if (request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}

		PagingRecipeDto paging = new PagingRecipeDto(recordsPerPage, currentPageNo);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();

		if (command.equals("productview")) {

			JSONArray jArr = new JSONArray();
			jArr = pBiz.productViewChart();

			JSONObject jobj = new JSONObject();

			jobj.put("proview", jArr);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());
			out.print(element);
			System.out.println(element);
		} else if (command.equals("productsales")) {
			JSONArray jArr = new JSONArray();
			jArr = pBiz.productSalesChart();

			JSONObject jobj = new JSONObject();

			jobj.put("prosales", jArr);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());
			out.print(element);
			System.out.println(element);

		} else if (command.equals("adminchart")) {
			response.sendRedirect("admin/adminchart.jsp");
		} else if (command.equals("adminrecipeview")) {

			List<RecipeDto> listcategory = rBiz.selectListCategory();
			request.setAttribute("listcategory", listcategory);
			dispatch(request, response, "admin/adminrecipeview.jsp");

		} else if (command.equals("category")) {
			String categoryname = request.getParameter("categoryname");
			String recipe_reg = request.getParameter("recipe_reg");

			List<RecipeDto> listcategory = rBiz.selectListCategory();
			List<RecipeDto> list = rBiz.recipeList(categoryname, recipe_reg, offset, paging.getRecordsPerPage());
			paging.setNumberOfRecords(rBiz.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("categoryname", categoryname);
			request.setAttribute("listcategory", listcategory);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch(request, response, "admin/detaillist.jsp");

		} else if(command.equals("reglist")) {
			
			String categoryname = request.getParameter("categoryname");
			String recipe_reg = request.getParameter("recipe_reg");

			List<RecipeDto> listcategory = rBiz.selectListCategory();
			List<RecipeDto> list = rBiz.recipeList(categoryname, recipe_reg, offset, paging.getRecordsPerPage());
			paging.setNumberOfRecords(rBiz.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("categoryname", categoryname);
			request.setAttribute("listcategory", listcategory);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch(request, response, "admin/detaillistreg.jsp");
			
		} else if (command.equals("productinsert")) {
			ProductListDto dto = null;
			List<ProductListDto> list = new ArrayList<ProductListDto>();

			String categoryname = request.getParameter("categoryname");
			String recipe_no[] = request.getParameterValues("recipe_no");
			String recipe_img[] = request.getParameterValues("recipe_img");
			String recipe_name[] = request.getParameterValues("recipe_name");

			for (int i = 0; i < recipe_no.length; i++) {
				dto = new ProductListDto();
				dto.setRecipe_no(Integer.parseInt(recipe_no[i]));
				dto.setRecipe_img(recipe_img[i]);
				dto.setRecipe_name(recipe_name[i]);

				list.add(dto);
			}

			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getRecipe_no());
				System.out.println(list.get(i).getRecipe_img());
				System.out.println(list.get(i).getRecipe_name());
			}
			int res = pBiz.insertProduct(list);

			if (res > 0) {
				alert(response, "상품등록이 되었습니다", "product.do?command=category&recipe_reg=N&categoryname=" + categoryname);
			} else {
				alert(response, "상품등록에 실패했습니다", "product.do?command=category&recipe_reg=N&categoryname=" + categoryname);
			}
		}else if(command.equals("productdelete")) {
			
			ProductListDto dto = null;
			List<ProductListDto> list = new ArrayList<ProductListDto>();

			String categoryname = request.getParameter("categoryname");
			String recipe_no[] = request.getParameterValues("recipe_no");

			request.setAttribute("categoryname", categoryname);
			
			int res = pBiz.deleteProduct(recipe_no);
			
			if(res < 0) {
				alert(response, "상품리스트에서 제외 되었습니다.", "product.do?command=reglist&categoryname="+categoryname+"&recipe_reg=Y");
			}else {
				alert(response, "상품리스트 제외에 실패했습니다.", "product.do?command=reglist&categoryname="+categoryname+"&recipe_reg=Y");
			}
			
			
			
		}

// recipeInfo - {"RECIPE_ID":"레시피 코드"},{"RECIPE_NM_KO":"레시피 이름"},{"SUMRY":"간략(요약) 소개"},{"NATION_CODE":"유형코드"},{"NATION_NM":"유형분류"},{"TY_CODE":"음식분류코드"},
//		{"TY_NM":"음식분류"},{"COOKING_TIME":"조리시간"},{"CALORIE":"칼로리"},{"QNT":"분량"},{"LEVEL_NM":"난이도"},{"IRDNT_CODE":"재료별 분류명"},{"PC_NM":"가격별 분류"},
//		{"IMG_URL":"대표이미지 URL"},{"DET_URL":"상세 URL"}

//recipeContent - {"RECIPE_ID":"레시피 코드"},{"COOKING_NO":"요리설명순서"},{"COOKING_DC":"요리설명"},{"STRE_STEP_IMAGE_URL":"과정 이미지 URL"},{"STEP_TIP":"과정팁"}

//recipeMaterial - {"RECIPE_ID":"레시피 코드"},{"IRDNT_SN":"재료순번"},{"IRDNT_NM":"재료명"},{"IRDNT_CPCTY":"재료용량"},{"IRDNT_TY_CODE":"재료타입 코드"},{"IRDNT_TY_NM":"재료타입명"}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void alert(HttpServletResponse response, String msg, String url) throws IOException {

		PrintWriter out = response.getWriter();
		String res = "<script type='text/javascript'>\r\n" + "alert('" + msg + "');\r\n" + "location.href='" + url
				+ "';\r\n" + "</script>";

		out.println(res);
	}

}
