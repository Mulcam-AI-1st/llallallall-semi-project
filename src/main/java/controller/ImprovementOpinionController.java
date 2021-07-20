package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ImprovementOpinionService;
import vo.ImprovementOpinionVO;

@WebServlet("/ImprovementOpinion")
public class ImprovementOpinionController  extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ImprovementOpinionController() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("submitChk", null);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("ImprovementOpinionController");

		// 값들을 받는다.
		String name = request.getParameter("recipient-name");
		String opinion = request.getParameter("message-text");
		
		System.out.println("ImprovementOpinionController" + name);
		System.out.println("ImprovementOpinionController" + opinion);
		
		ImprovementOpinionVO io = new ImprovementOpinionVO(name, opinion);
		try {
			ImprovementOpinionService service = new ImprovementOpinionService();
			service.registerOpinion(io);
			
			
			//response에 성공여부 저장
		    out.print("success");
		    out.flush();


		} catch (Exception e) {
			//response에 성공여부 저장
			out.print(e.getMessage().toString());
			out.flush();
			
		} finally {
			out.close();
		}

		
	}
	
	

}
