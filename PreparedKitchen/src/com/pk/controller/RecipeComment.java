package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.pk.dto.PagingDto;
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
		
		int currentPageNo = 1;
		int recordsPerPage = 0;

		if (request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		if (request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}

		PagingDto paging = new PagingDto(recordsPerPage, currentPageNo);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();
		
		String command = request.getParameter("command");
		RecipeCommentBiz recipeCommentBiz = new RecipeCommentBiz();
		
		if (command.equals("insertcmt")) {
			
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

				RecipeCommentDto dto = new RecipeCommentDto();
				dto.setRecipeBoard_no(recipeBoard_no);
				dto.setComment_order(comment_order);
				dto.setComment_tab(comment_tab);
				dto.setId(id);
				dto.setComment_content(comment_content);

				int res = recipeCommentBiz.insertCmt(dto);
				PrintWriter out = response.getWriter();
				out.print(res);
				
			}

		} else if (command.equals("cmtread")) {
			int recipeBoard_no = Integer.parseInt(request.getParameter("recipeBoard_no"));
			JSONArray comments = new JSONArray();
			
			comments = recipeCommentBiz.selectListCmt(recipeBoard_no,offset, paging.getRecordsPerPage());
			paging.setNumberOfRecords(recipeCommentBiz.getNoOfRecords());
			paging.makePaging();

			int firstPageNo = paging.getFirstPageNo();
			int prevPageNo = paging.getPrevPageNo();
			int startPageNo = paging.getStartPageNo();
			int endPageNo = paging.getEndPageNo();
			int nextPageNo = paging.getNextPageNo();
			int finalPageNo = paging.getFinalPageNo();
			
			JSONObject jobj = new JSONObject();
			jobj.put("comments", comments);
			jobj.put("recordsPerPage", recordsPerPage);
			jobj.put("firstPageNo", firstPageNo);
			jobj.put("prevPageNo", prevPageNo);
			jobj.put("startPageNo", startPageNo);
			jobj.put("currentPageNo", currentPageNo);
			jobj.put("endPageNo", endPageNo);
			jobj.put("nextPageNo", nextPageNo);
			jobj.put("finalPageNo", finalPageNo);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(jobj.toString());

			PrintWriter out = response.getWriter();
			out.print(element);
			
		}else if(command.equals("deleteCmt")) {
			
			int comment_no = Integer.parseInt(request.getParameter("comment_no"));
			int res = recipeCommentBiz.deleteCmt(comment_no);
			
			PrintWriter out = response.getWriter();
			out.print(res);
		}else if(command.equals("updateCmt")) {
			RecipeCommentDto dto = new RecipeCommentDto();
			int comment_no = Integer.parseInt(request.getParameter("comment_no"));
			String comment_content = request.getParameter("comment_content");
			
			dto.setComment_content(comment_content);
			dto.setComment_no(comment_no);
			int res = recipeCommentBiz.updateCmt(dto);
			
			PrintWriter out = response.getWriter();
			out.print(res);
			
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
