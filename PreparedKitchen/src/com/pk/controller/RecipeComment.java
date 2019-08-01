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
import com.pk.biz.RecipeCommentBiz;
import com.pk.dto.MemberDto;
import com.pk.dto.RecipeCommentDto;

/**
 * Servlet implementation class RecipeComment
 */
@WebServlet("/recipeComment.do")
public class RecipeComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecipeComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");

		String command = request.getParameter("command");
		RecipeCommentBiz recipeCommentBiz = new RecipeCommentBiz();
		
		if (command.equals("cmt")) {
			
			String ccon = request.getParameter("comment_content");
			
			if (ccon.trim().equals("") ||ccon == null) {
				PrintWriter out = response.getWriter();
				out.print("comment null");
			} else {

				int recipeBoard_no = Integer.parseInt(request.getParameter("recipeBoard_no"));
				int comment_order = Integer.parseInt(request.getParameter("comment_order"));
				int comment_tab = Integer.parseInt(request.getParameter("comment_tab"));
				String id = memberDto.getId();
				String comment_content = request.getParameter("comment_content");
				JSONArray result = new JSONArray();

				RecipeCommentDto dto = new RecipeCommentDto();
				dto.setRecipeBoard_no(recipeBoard_no);
				dto.setComment_order(comment_order);
				dto.setComment_tab(comment_tab);
				dto.setId(id);
				dto.setComment_content(comment_content);

				try {
					result = recipeCommentBiz.insertCmt(dto);
				} catch (Exception e) {
					e.printStackTrace();
				}

				JSONObject jobj = new JSONObject();
				jobj.put("result", result);

				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(jobj.toString());

				System.out.println("element : " + element);
				PrintWriter out = response.getWriter();
				out.print(element);

			}

		} else if (command.equals("cmtread")) {
			int recipeBoard_no = Integer.parseInt(request.getParameter("recipeBoard_no"));
			JSONArray comments = new JSONArray();
			
			try {
				comments = recipeCommentBiz.selectListCmt2(recipeBoard_no);
			} catch (Exception e) {
				e.printStackTrace();
			}

			JSONObject jobj = new JSONObject();
			jobj.put("comments", comments);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());

			System.out.println("element2 : " + element);
			PrintWriter out = response.getWriter();
			out.print(element);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
