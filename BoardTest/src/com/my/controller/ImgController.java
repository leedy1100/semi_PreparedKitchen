package com.my.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.my.paging.Paging;
import com.myboard.dao.MyBoardDao;
import com.myboard.dto.MyBoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ImgController
 */
@WebServlet("/mmcon")
public class ImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImgController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int currentPageNo = 1;
		int recordsPerPage = 0;
		String url = null;

		if (request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		if (request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}

		Paging paging = new Paging(recordsPerPage, currentPageNo);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		MyBoardDao myboardDao = new MyBoardDao();
		MyBoardDto myboardDto = null;

		if (command.equals("selectone")) {
			int myno = Integer.parseInt(request.getParameter("myno"));
			myboardDto = myboardDao.selectOne(myno);
			request.setAttribute("dto", myboardDto);
			dispatch(request, response, "selectone.jsp");

		} else if (command.equals("insert")) {
			response.sendRedirect("summernote.jsp");
		} else if (command.equals("insertres")) {
			String myname = request.getParameter("myname");
			String mytitle = request.getParameter("mytitle");
			String mycontent = request.getParameter("mycontent");
			myboardDto = new MyBoardDto();

			myboardDto.setMyname(myname);
			myboardDto.setMytitle(mytitle);
			myboardDto.setMycontent(mycontent);

			int res = myboardDao.insert(myboardDto);

			if (res > 0) {
				alert(response, "등록성공", "img.do?command=list");
			} else {
				alert(response, "등록실패", "img.do?command=insert");
			}

		} else if (command.equals("imgupload")) {

			String uploadPath = request.getSession().getServletContext().getRealPath("/upload");

			int size = 10 * 1024 * 1024;

			String fileName = "";

			try {
				// 파일업로드 및 업로드 후 파일명 가져옴
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
						new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				String file = (String) files.nextElement();
				fileName = multi.getFilesystemName(file);

			} catch (Exception e) {
				e.printStackTrace();
			}

			// 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
			String uploadPath2 = "/BoardTest/upload/" + fileName;

			// 생성된 경로를 JSON 형식으로 보내주기 위한 설정
			JSONObject jobj = new JSONObject();
			jobj.put("url", uploadPath2);

			response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
			PrintWriter out = response.getWriter();
			out.print(jobj.toJSONString());
		} else if (command.equals("list")) {
			List<MyBoardDto> list = myboardDao.selectList(offset, paging.getRecordsPerPage());

			paging.setNumberOfRecords(myboardDao.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch(request, response, "boardlist.jsp");

		} else if (command.equals("search")) {
			String searchFiled = request.getParameter("searchFiled");
			String searchValue = request.getParameter("searchValue");
			List<MyBoardDto> list = myboardDao.searchTitle(offset, paging.getRecordsPerPage(), searchFiled,
					searchValue);
			paging.setSearchFiled(searchFiled);
			paging.setSearchValue(searchValue);
			paging.setNumberOfRecords(myboardDao.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch(request, response, "boardlist.jsp");

		}
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
