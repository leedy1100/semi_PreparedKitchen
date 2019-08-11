package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pk.biz.MartBiz;
import com.pk.biz.MaterialBiz;
import com.pk.biz.RecipeBiz;
import com.pk.dto.MartDto;
import com.pk.dto.MaterialDto;
import com.pk.dto.RecipeDto;

@WebServlet("/dummy.do")
public class Dummy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Dummy() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RecipeBiz recipeBiz = new RecipeBiz();
		MaterialBiz materialBiz = new MaterialBiz();
		MartBiz martBiz = new MartBiz();
		
		if(command.equals("recipedb")) {

			response.sendRedirect("dummy/createrecipedb.jsp");

		} else if(command.equals("createdbinfo")) {

			String info = request.getParameter("info");

			JsonParser parser = new JsonParser();
			JsonElement infoEle = parser.parse(info);

			List<RecipeDto> recipe = recipeBiz.selectList();

			if(recipe.size() == 0) {

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

					if(dto.getRecipe_no() == 100) {
						break;
					}
				}

				int res = recipeBiz.insert(recipe);
				out.println(res + "개의 더미데이터가 등록되었습니다.\n2번을 눌러주세요");

			} else {
				out.println("이미 등록되어 있습니다.");
			}

		} else if(command.equals("createdbcon")) {

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

				if(!step_img.isJsonNull()) {
					img = step_img.getAsString();
				}

				if(!step_tip.isJsonNull()) {
					tip = step_tip.getAsString();
				}

				RecipeDto dto = new RecipeDto();

				dto.setRecipe_no(recipe_no);

				if(img != null && tip != null) {
					dto.setRecipe_content("<div class='contentDiv'>" + step_no + " : " + step_content + " tip : " + tip
							+ " <img class='contentImg' alt=recipe_img src='" + img + "'></div> ");
				} else if(img != null && tip == null) {
					dto.setRecipe_content("<div class='contentDiv'>" + step_no + " : " + step_content
							+ " <img class='contentImg' alt=recipe_img src='" + img + "'></div> ");
				} else if(img == null && tip != null) {
					dto.setRecipe_content(
							"<div class='contentDiv'>" + step_no + " : " + step_content + " tip : " + tip + "</div> ");
				} else {
					dto.setRecipe_content("<div class='contentDiv'>" + step_no + " : " + step_content + "</div> ");
				}

				if(dto.getRecipe_no() == 101) {
					break;
				}

				list.add(dto);

			}

			List<RecipeDto> conList = new ArrayList<RecipeDto>();
			String content = "";

			for (int i = 0; i < list.size(); i++) {

				if(i > 0 && i != (list.size() - 1)) {

					if(list.get(i).getRecipe_no() == list.get(i - 1).getRecipe_no()) {
						content += list.get(i).getRecipe_content();

					} else {

						RecipeDto dto = new RecipeDto();
						dto.setRecipe_no(list.get(i - 1).getRecipe_no());
						dto.setRecipe_content(content);

						conList.add(dto);

						content = list.get(i).getRecipe_content();
					}

				} else if(i == 0) {
					content = list.get(i).getRecipe_content();

				} else if(i == (list.size() - 1)) {

					if(list.get(i).getRecipe_no() == list.get(i - 1).getRecipe_no()) {

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

			int res = recipeBiz.update(conList);

			if(res == -1) {
				out.println("2번 성공!!\n3번을 눌러주세요");
			} else {
				out.println("2번 실패!!");
			}

		} else if(command.equals("createdbmat")) {

			String mat = request.getParameter("mat");

			JsonParser parser = new JsonParser();
			JsonElement matEle = parser.parse(mat);

			List<MaterialDto> list = materialBiz.selectList();

			if(list.size() == 0) {
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
					
					String[] m_name = material_name.split("]");
					
					if(m_name.length > 1) {
						material_name = m_name[1].trim();
					}

					if(!irdnt_cpcty.isJsonNull()) {
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

					if(dto.getRecipe_no() == 101) {
						break;
					}

					list.add(dto);
				}
				int res = materialBiz.insert(list);

				if(res > 0) {
					out.println("3번 성공!!\n4번을 눌러주세요");

				} else {
					out.println("뭔가 잘못되었다...");
				}

			} else {
				out.println("이미 등록되어 있습니다");
			}

		} else if(command.equals("deletedummy")) {

			int res = recipeBiz.deleteDummy();

			if(res > 0) {
				out.println("삭제완료");
				
			} else {
				out.println("더미데이터가 없습니다.");
			}

		} else if(command.equals("martdummy")) {
			
			List<MaterialDto> list = materialBiz.selectList();
			List<String> mList = new ArrayList<String>();
			List<MartDto> dummy = new ArrayList<MartDto>();
			
			for(int i = 0; i < list.size(); i++) {
				
				if(i != 0) {
					
					if(!list.get(i).getMaterial_name().equals(list.get(i-1).getMaterial_name())) {
						mList.add(list.get(i).getMaterial_name());
					}
					
				} else {
					mList.add(list.get(i).getMaterial_name());
					
				}
			}
			
			for(int i = 0; i < mList.size(); i++) {
				
				MartDto aDto = new MartDto();
				MartDto bDto = new MartDto();
				MartDto cDto = new MartDto();
				
				aDto.setMaterial_name("a회사" + mList.get(i));
				bDto.setMaterial_name("b회사" + mList.get(i));
				cDto.setMaterial_name("c회사" + mList.get(i));
				
				aDto.setMart_price((int)((Math.random() * 31) + 20) * 100);
				bDto.setMart_price((int)((Math.random() * 31) + 20) * 100);
				cDto.setMart_price((int)((Math.random() * 31) + 20) * 100);
				
				aDto.setCategory(mList.get(i));
				bDto.setCategory(mList.get(i));
				cDto.setCategory(mList.get(i));
				
				dummy.add(aDto);
				dummy.add(bDto);
				dummy.add(cDto);
				
			}
			
			int res = martBiz.createDummy(dummy);
			
			if(res > 0) {
				out.println(res+"개의 마트데이터 생성");
			} else {
				out.println("뭔가 잘못되었다..");
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
