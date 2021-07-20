package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ProjectInfoDelivery;


@WebServlet("/PreStepCompletionController")
public class PreStepCompletionController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public PreStepCompletionController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		System.out.println("PreStepCompletionController");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		pid.doProjectInfoDelivery(request, response);
		
		//세션의 성공여부를 인풋 박스에 저장 
		HttpSession session = request.getSession();
		request.setAttribute("submitChk", (String) session.getAttribute("submitChk"));

		RequestDispatcher dispatcher = request.getRequestDispatcher("./unit_process_definition_success.jsp");

		dispatcher.forward(request, response);

	}


}
