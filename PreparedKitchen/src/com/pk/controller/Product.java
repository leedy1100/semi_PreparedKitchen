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

		if (command.equals("recipedb")) {

			response.sendRedirect("product/createrecipedb.jsp");

		} else if (command.equals("createdbinfo")) {

			String info = request.getParameter("info");

			JsonParser parser = new JsonParser();
			JsonElement infoEle = parser.parse(info);

			List<RecipeDto> recipe = rBiz.selectList();

			if (recipe.size() == 0) {

				for (int i = 0; i < infoEle.getAsJsonObject().get("data").getAsJsonArray().size(); i++) {

					JsonObject infoObj = infoEle.getAsJsonObject().get("data").getAsJsonArray().get(i)
							.getAsJsonObject();

					JsonElement recipe_id = infoObj.get("RECIPE_ID");
					JsonElement recipe_nm = infoObj.get("RECIPE_NM_KO");
					JsonElement recipe_img_url = infoObj.get("IMG_URL");
					JsonElement recipe_cal = infoObj.get("CALORIE");
					JsonElement recipe_cate1 = infoObj.get("NATION_NM");
					JsonElement recipe_cate2 = infoObj.get("TY_NM");

					int recipe_no = recipe_id.getAsInt();
					String recipe_name = recipe_nm.getAsString();
					String recipe_img = recipe_img_url.getAsString();
					String recipe_nutrient = recipe_cal.getAsString();
					String recipe_category = recipe_cate1.getAsString() + "," + recipe_cate2.getAsString();

					RecipeDto dto = new RecipeDto();
					dto.setRecipe_no(recipe_no);
					dto.setRecipe_name(recipe_name);
					dto.setRecipe_img(recipe_img);
					dto.setRecipe_content("a");
					dto.setRecipe_nutrient(recipe_nutrient);
					dto.setRecipe_category(recipe_category);
					dto.setRecipe_reg("N");

					recipe.add(dto);

					if (dto.getRecipe_no() == 100) {
						break;
					}
				}

				int res = rBiz.insert(recipe);
				out.println(res + "개의 더미데이터가 등록되었습니다.\n2번을 눌러주세요");

			} else {
				out.println("이미 등록되어 있습니다.");
			}

		} else if (command.equals("createdbcon")) {

			String con = request.getParameter("con");

			JsonParser parser = new JsonParser();
			JsonElement conEle = parser.parse(con);

			List<RecipeDto> list = new ArrayList<RecipeDto>();

			for (int i = 0; i < conEle.getAsJsonObject().get("data").getAsJsonArray().size(); i++) {

				JsonObject conObj = conEle.getAsJsonObject().get("data").getAsJsonArray().get(i).getAsJsonObject();

				JsonElement recipe_id = conObj.get("RECIPE_ID");
				JsonElement cooking_no = conObj.get("COOKING_NO");
				JsonElement cooking_dc = conObj.get("COOKING_DC");
				JsonElement step_img = conObj.get("STRE_STEP_IMAGE_URL");
				JsonElement step_tip = conObj.get("STEP_TIP");

				int recipe_no = recipe_id.getAsInt();
				int step_no = cooking_no.getAsInt();
				String step_content = cooking_dc.getAsString();
				String img = null;
				String tip = null;

				if (!step_img.isJsonNull()) {
					img = step_img.getAsString();
				}

				if (!step_tip.isJsonNull()) {
					tip = step_tip.getAsString();
				}

				RecipeDto dto = new RecipeDto();

				dto.setRecipe_no(recipe_no);

				if (img != null && tip != null) {
					dto.setRecipe_content(step_no + " : " + step_content + " tip : " + tip
							+ " <img alt=recipe_img src='" + img + "'><br/> ");
				} else if (img != null && tip == null) {
					dto.setRecipe_content(step_no + " : " + step_content
							+ " <img class='contentImg' alt=recipe_img src='" + img + "'><br/> ");
				} else if (img == null && tip != null) {
					dto.setRecipe_content(step_no + " : " + step_content + " tip : " + tip + "<br/> ");
				} else {
					dto.setRecipe_content(step_no + " : " + step_content + "<br/> ");
				}

				if (dto.getRecipe_no() == 101) {
					break;
				}

				list.add(dto);

			}

			List<RecipeDto> conList = new ArrayList<RecipeDto>();
			String content = "";

			for (int i = 0; i < list.size(); i++) {

				if (i > 0) {

					if (list.get(i).getRecipe_no() == list.get(i - 1).getRecipe_no()) {
						content += list.get(i).getRecipe_content();

					} else {

						RecipeDto dto = new RecipeDto();
						dto.setRecipe_no(list.get(i - 1).getRecipe_no());
						dto.setRecipe_content(content);

						conList.add(dto);

						content = list.get(i).getRecipe_content();
					}

				} else if (i == 0) {
					content = list.get(i).getRecipe_content();

				} else if (i == list.size()) {

					if (list.get(i).getRecipe_no() == list.get(i - 1).getRecipe_no()) {

						content += list.get(i).getRecipe_content();

						RecipeDto dto = new RecipeDto();
						dto.setRecipe_no(list.get(i).getRecipe_no());
						dto.setRecipe_content(content);

						conList.add(dto);

					} else {

						RecipeDto dto = new RecipeDto();
						dto.setRecipe_no(list.get(i - 1).getRecipe_no());
						dto.setRecipe_content(content);
						conList.add(dto);

						RecipeDto lastDto = new RecipeDto();
						content = list.get(i).getRecipe_content();
						lastDto.setRecipe_no(list.get(i).getRecipe_no());
						lastDto.setRecipe_content(content);
						conList.add(lastDto);
					}
				}
			}

			int res = rBiz.update(conList);

			if (res == -1) {
				out.println("2번 성공!!\n3번을 눌러주세요");
			} else {
				out.println("2번 실패!!");
			}

		} else if (command.equals("createdbmat")) {

			String mat = request.getParameter("mat");

			JsonParser parser = new JsonParser();
			JsonElement matEle = parser.parse(mat);

			List<MaterialDto> list = mBiz.selectList();

			if (list.size() == 0) {
				for (int i = 0; i < matEle.getAsJsonObject().get("data").getAsJsonArray().size(); i++) {

					JsonObject matObj = matEle.getAsJsonObject().get("data").getAsJsonArray().get(i).getAsJsonObject();

					JsonElement recipe_id = matObj.get("RECIPE_ID");
					JsonElement irdnt_sn = matObj.get("IRDNT_SN");
					JsonElement irdnt_nm = matObj.get("IRDNT_NM");
					JsonElement irdnt_cpcty = matObj.get("IRDNT_CPCTY");
					JsonElement irdnt_ty_code = matObj.get("IRDNT_TY_CODE");
					JsonElement irdnt_ty_nm = matObj.get("IRDNT_TY_NM");

					int recipe_no = recipe_id.getAsInt();
					int material_no = irdnt_sn.getAsInt();
					String material_name = irdnt_nm.getAsString();
					String material_capacity = "";
					int material_typeCode = irdnt_ty_code.getAsInt();
					String material_typeName = irdnt_ty_nm.getAsString();

					if (!irdnt_cpcty.isJsonNull()) {
						material_capacity = irdnt_cpcty.getAsString();
					} else {
						continue;
					}

					MaterialDto dto = new MaterialDto();
					dto.setRecipe_no(recipe_no);
					dto.setMaterial_no(material_no);
					dto.setMaterial_name(material_name);
					dto.setMaterial_capacity(material_capacity);
					dto.setMaterial_typeCode(material_typeCode);
					dto.setMaterial_typeName(material_typeName);

					if (dto.getRecipe_no() == 101) {
						break;
					}

					list.add(dto);
				}
				int res = mBiz.insert(list);

				if (res > 0) {
					out.println("더미데이터 생성 완료");

				} else {
					out.println("뭔가 잘못되었다...");
				}

			} else {
				out.println("이미 등록되어 있습니다");
			}

		} else if (command.equals("productview")) {

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

			List<RecipeDto> listcategory = rBiz.selectListCategory();
			List<RecipeDto> list = rBiz.recipeList(categoryname, offset, paging.getRecordsPerPage());
			paging.setNumberOfRecords(rBiz.getNoOfRecords());
			paging.makePaging();
			
			request.setAttribute("categoryname", categoryname);
			request.setAttribute("listcategory", listcategory);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch(request, response, "admin/detaillist.jsp");

		} else if (command.equals("productinsert")) {
			ProductListDto dto = null;
			List<ProductListDto> list = new ArrayList<ProductListDto>();

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
				alert(response, "상품등록이 되었습니다", "product.do?command=adminrecipeview");
			} else {
				alert(response, "상품등록에 실패했습니다", "product.do?command=adminrecipeview");
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
