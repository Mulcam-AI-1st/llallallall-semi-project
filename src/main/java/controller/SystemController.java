package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ProjectInfoDelivery;

import service.SystemChatacteristicsService;
import vo.SystemChatacteristicsVO;

@WebServlet("/SystemServlet")
public class SystemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SystemController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		pid.doProjectInfoDelivery(request, response);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./system_chatacteristics.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		request.setAttribute("submitChk", null);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		String projectName = pid.doProjectInfoDelivery(request, response).getProjectName();

		Double linkageComplexity = Double.parseDouble(request.getParameter("linkageComplexity"));
		Double performance = Double.parseDouble(request.getParameter("performance"));
		Double operationalCompatibility = Double.parseDouble(request.getParameter("operationalCompatibility"));
		Double security = Double.parseDouble(request.getParameter("security"));
		SystemChatacteristicsVO sc = new SystemChatacteristicsVO(projectName, linkageComplexity, performance,
				operationalCompatibility, security);
		System.out.println(projectName);
		System.out.println(linkageComplexity);
		System.out.println(performance);
		System.out.println(operationalCompatibility);
		System.out.println(security);

		RequestDispatcher dispatcher = null;

		try {
			SystemChatacteristicsService service = new SystemChatacteristicsService();
			service.registerSystemChatacteristics(sc);

			// response에 성공여부 저장
			out.print("success");
			out.flush();

			dispatcher = request.getRequestDispatcher("./system_chatacteristics.jsp");

		} catch (Exception e) {

			// response에 성공여부 저장
			out.print(e.getMessage().toString());
			out.flush();

			dispatcher = request.getRequestDispatcher("./error.jsp");
		} finally {
			out.close();
		}

		dispatcher.forward(request, response);

	}

}
