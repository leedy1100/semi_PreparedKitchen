package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pk.biz.MemberBiz;
import com.pk.dto.MemberDto;
import com.pk.util.Gmail;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+ command +"]");
		
		MemberBiz biz = new MemberBiz();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		if(command.equals("gologin")) {
			
			response.sendRedirect("login.jsp");
			
		} else if(command.equals("signup")) {
			
			response.sendRedirect("signup.jsp");
			
		} else if(command.equals("signupres")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email") + request.getParameter("emailback");
			String phone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
			String addr = request.getParameter("addr1") + request.getParameter("addr2");
			String birth = request.getParameter("birth");
			
			MemberDto dto = new MemberDto();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setBirth(birth);
			
			int res = biz.signup(dto);
			
			if(res > 0) {
				System.out.println("회원가입 성공");
				response.sendRedirect("login.jsp");
				
			} else {
				System.out.println("회원가입 실패");
				response.sendRedirect("signup.jsp");
			}
			
			
		} else if(command.equals("idchk")) {
			
			String id = request.getParameter("id");
			
			MemberDto dto = biz.idchk(id);
			
			if(dto != null) {
				out.println(dto.getId());
			}
			
		} else if(command.equals("login")) {
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberDto dto = biz.login(id,pw);
			
			if(dto != null) {
				
				session.setAttribute("memberDto", dto);
				response.sendRedirect("index.jsp");
				
			} else {
				response.sendRedirect("login.jsp");
			}
			
		} else if(command.equals("logout")) {
			
			session.invalidate();
			response.sendRedirect("index.jsp");
			
		} else if(command.equals("emailchk")) {
			
			String email = request.getParameter("email");
			System.out.println(email);
			MemberDto dto = biz.emailchk(email);
			if(dto != null) {
				out.println(dto.getEmail());
				System.out.println(dto.getEmail());
			}
			
		} else if(command.equals("sendemail")) {
			
			String email = request.getParameter("email");
			
			String ran = "";
			for(int i = 0; i < 4; i++) {
				ran += (int)(Math.random() * 10);
			}
			
			String from = "kmh5969@gmail.com";
			String to = email;
			String subject = "Prepared Kitchen 메일 인증입니다.";
			String content = "인증번호 : " + ran;
			
			out.println(ran);
			
			Properties prop = new Properties();
			prop.put("mail.smtp.user", from);
			prop.put("mail.smtp.host", "smtp.googlemail.com");
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.debug", "true");
			prop.put("mail.smtp.socketFactory.port", "465");
			prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			prop.put("mail.smtp.socketFactory.fallback", "false");
			
			try {
				
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(prop, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html; charset=UTF-8");
				Transport.send(msg);
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("noemail")) {
			
			out.println("<script>");
			out.println("alert('메일인증을 해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			
		} else if(command.equals("kakaologin")) {
			
			String id = request.getParameter("id");
			String name = request.getParameter("nickname");
			
			MemberDto dto = biz.idchk(id);
			
			if(dto == null) {
				
				int res = biz.kakaoLogin(id, name);
				
				if(res > 0) {
					System.out.println("카카오 로그인 회원 db저장");
					dto = biz.idchk(id);
				}
			}
			
			session.setAttribute("memberDto", dto);
			response.sendRedirect("index.jsp");
			
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
