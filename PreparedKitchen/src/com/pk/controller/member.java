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

import com.pk.biz.CartBiz;
import com.pk.biz.InterestListBiz;
import com.pk.biz.MaterialBiz;
import com.pk.biz.MemberBiz;
import com.pk.biz.PaymentBiz;
import com.pk.biz.RecipeBiz;
import com.pk.biz.RecipeBoardBiz;
import com.pk.dto.CartDto;
import com.pk.dto.InterestListDto;
import com.pk.dto.MaterialDto;
import com.pk.dto.MemberDto;
import com.pk.dto.PagingDto;
import com.pk.dto.PaymentDto;
import com.pk.dto.RecipeBoardDto;
import com.pk.dto.RecipeDto;

@WebServlet("/member.do")
public class member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		MemberBiz biz = new MemberBiz();
		PaymentBiz pBiz = new PaymentBiz();
		RecipeBoardBiz rbBiz = new RecipeBoardBiz();	
		CartBiz cBiz = new CartBiz();
		RecipeBiz rBiz = new RecipeBiz();
		InterestListBiz iBiz = new InterestListBiz();
		MaterialBiz mBiz = new MaterialBiz();
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		MemberDto mDto = (MemberDto)session.getAttribute("memberDto");
		
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
		
		
		
		if(command.equals("mypage")) {
			dispatch(request, response, "userinfo.jsp");
				
		}else if(command.equals("id")) {
			List<RecipeBoardDto> rList = rbBiz.selectListId(offset, paging.getRecordsPerPage(),mDto.getId());
			
			paging.setNumberOfRecords(rBiz.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("paging", paging);
			request.setAttribute("rList", rList);
			
			dispatch(request, response, "myboard.jsp");
			
		}else if(command.equals("cal")) {
			dispatch(request, response, "mycalendar.jsp");
			
			
		}else if(command.equals("paymentinfo")) {
			List<PaymentDto> pList = pBiz.mySelectList(offset, paging.getRecordsPerPage(), mDto.getId());
			
			paging.setNumberOfRecords(rBiz.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("paging", paging);
			request.setAttribute("pList", pList);
			
			dispatch(request, response, "paymentinfo.jsp");
			
		}else if(command.equals("cart")) {
			List<CartDto> cList = cBiz.selectListRecipe(mDto.getId());
			
			
			List<Integer> recipe_no_list = new ArrayList<Integer>();
			for(CartDto cDto : cList) {
				recipe_no_list.add(cDto.getRecipe_no());
			}
			
			List<RecipeDto> rList = rBiz.selectListOne(recipe_no_list);

			paging.setNumberOfRecords(rBiz.getNoOfRecords());
			paging.makePaging();

			request.setAttribute("paging", paging);
			request.setAttribute("rList", rList);
			
			dispatch(request, response, "cart.jsp");
			
		}else if(command.equals("interest")) {
			List<InterestListDto> iList = iBiz.selectList(mDto.getId());
			List<Integer> recipe_no_list = new ArrayList<Integer>();
			for(InterestListDto iDto : iList) {
				recipe_no_list.add(iDto.getRecipe_no());
			}
			List<RecipeDto> rList = rBiz.selectListOne(recipe_no_list);
			
			request.setAttribute("rList", rList);
			
			dispatch(request, response, "interest.jsp");
			
			
		}else if(command.equals("updateinfo")) {
			MemberDto dto = new MemberDto();
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setBirth(birth);
			dto.setEmail(email);
			
			int res = biz.updateinfo(dto);
			
			if(res>0) {
				out.println("<script>");
				out.println("alert('입력 성공');");
				out.println("location.href='login.do?command=mypage';");
				out.println("</script>");
			}
			else {
				out.println("<script>");
				out.println("alert('입력 실패');");
				out.println("location.href='login.do?command=mypage';");
				out.println("</script>");
			}
			
		}else if(command.equals("usermanagement")) {
			List<MemberDto>list = biz.selectList();
			
			request.setAttribute("list", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("usermanagement.jsp");
			dispatch.forward(request, response);
	
		}else if(command.equals("goodbyeuser")) {
			String id = request.getParameter("id");
		
			MemberDto dto = new MemberDto();
			dto.setId(id);
			
			int res = biz.goodbyeUser(dto);
			if(res>0) {
				out.println("<script>");
				out.println("alert('회원탈퇴 완료');");
				out.println("location.href='member.do?command=usermanagement'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원탈퇴 실패');");
				out.println("location.href='member.do?command=usermanagement'");
				out.println("</script>");
			}
		}else if(command.equals("managergrant")) {
			String id = request.getParameter("id");
			
			MemberDto dto = new MemberDto();
			dto.setId(id);
			
			int res = biz.managerGrant(dto);
			if(res>0) {
				out.println("<script>");
				out.println("alert('권한부여 완료');");
				out.println("location.href='member.do?command=usermanagement'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('권한부여 실패');");
				out.println("location.href='member.do?command=usermanagement'");
				out.println("</script>");
			}
		}else if(command.equals("managercollect")) {
			String id = request.getParameter("id");
			
			MemberDto dto = new MemberDto();
			dto.setId(id);
			
			int res = biz.managerCollect(dto);
			if(res>0) {
				out.println("<script>");
				out.println("alert('권한회수 완료');");
				out.println("location.href='member.do?command=usermanagement'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('권한회수 실패');");
				out.println("location.href='member.do?command=usermanagement'");
				out.println("</script>");
			}
		}else if(command.equals("hiuser")) {
			List<MemberDto>list = biz.selectList();
			
			request.setAttribute("list", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("usermanagement2.jsp");
			dispatch.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
