package com.koreait.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserRegister 서블릿 연결");		
		System.out.println("UserRegister 서블릿의 actionDo() 메소드");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userID = request.getParameter("userID");
//		System.out.println(userID);
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2"); 
		String userName = request.getParameter("userName"); 
		/*int userAge = Integer.parseInt(request.getParameter("userAge"));*/
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender"); 
		String userEmail = request.getParameter("userEmail");
		
//		입력 체크
		if (userID == null || userID.trim().length() == 0 ||
			userPassword1 == null || userPassword1.trim().length() == 0 ||
			userPassword2 == null || userPassword2.trim().length() == 0 ||
			userName == null || userName.trim().equals("") ||
			userAge == null || userAge.trim().equals("") ||
			userGender == null || userGender.trim().equals("") ||
			userEmail == null || userEmail.trim().equals("")) {
			
//			작업의 성공 여부에 따른 메시지를 session에 저장한다.
//			getSession() : 서블릿에서 세션을 얻어온다.
//			request.getSession().setAttribute("messageType", "오류메시지");
//			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
//			response.sendRedirect("index.jsp");		// 여긴 왜 forward를 안 쓸까?? 세션을 넘겨주는 거라서 그래~(?)
//			return;
			
			response.getWriter().write("data error! 모든 내용을 입력하세요");
			return;
		}
		
//		비번 체크
		if (!userPassword1.trim().equals(userPassword2.trim())) {
			/* <!-- 버전1.  --> */
//			request.getSession().setAttribute("messageType", "오류메시지");
//			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
//			response.sendRedirect("index.jsp");
//			return;
			/* <!-- 버전2. Ajax --> */
			response.getWriter().write("data error! 비밀번호가 일치하지 않습니다.");
			return;
		}

//		넘어온 데이터가 정상이므로 RegisterVO 클래스 객체를 만들어 저장한다.
		RegisterVO vo = new RegisterVO(userID, userPassword1, userName, Integer.parseInt(userAge), userGender, userEmail);
//		System.out.println(vo);
		
//		테이블에 회원 정보를 저장하는 메소드를 실행한다.
		int result = new RegisterDAO().register(vo);
//		System.out.println(result);
		
		if (result == 1) {
//			request.getSession().setAttribute("messageType", "성공메시지");
//			request.getSession().setAttribute("messageContent", "회원 가입이 완료되었습니다.");
//			response.sendRedirect("index.jsp");
//			return;
			
			response.getWriter().write("회원 가입이 완료되었습니다.");
			return;
			
		} else {
//			request.getSession().setAttribute("messageType", "오류메시지");
//			request.getSession().setAttribute("messageContent", "이미 존재하는 ID입니다.");
//			response.sendRedirect("index.jsp");
//			return;
			
			response.getWriter().write("이미 존재하는 ID입니다.");
			return;
		}
		
	}	// === actionDo() 메소드

}
