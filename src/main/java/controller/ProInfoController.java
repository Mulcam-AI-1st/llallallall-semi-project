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

import service.ProjectFPService;
import vo.ProjectInfoVO;

@WebServlet("/ProInfoServlet")
public class ProInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProInfoController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		pid.doProjectInfoDelivery(request, response);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./project_infomations.jsp");

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		request.setAttribute("submitChk", null);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		ProjectInfoVO pi = pid.doProjectInfoDelivery(request, response);

		RequestDispatcher dispatcher = null;

		try {
			ProjectFPService service = new ProjectFPService();

			ProjectInfoVO rst_pi = service.registerProjectInfo(pi);
			request.setAttribute("pi", rst_pi);
			System.out.println("rst_pi.getProjectName" + rst_pi.getProjectName());

			// response에 성공여부 저장
			out.print("success");
			out.flush();

			dispatcher = request.getRequestDispatcher("./project_infomations.jsp");

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
