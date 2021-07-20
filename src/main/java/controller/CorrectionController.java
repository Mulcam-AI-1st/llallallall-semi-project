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

import service.CorrectionFactorsService;
import service.SystemChatacteristicsService;
import service.WeightedFPService;
import vo.CorrectionFactorsVO;
import vo.ProjectInfoVO;
import vo.SystemChatacteristicsVO;
import vo.WeightedFPVO;

@WebServlet("/CorrectionServlet")
public class CorrectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CorrectionController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		ProjectInfoVO pi = pid.doProjectInfoDelivery(request, response);
		String projectName = pi.getProjectName();

		WeightedFPVO wfp = new WeightedFPVO();
		SystemChatacteristicsVO sc = new SystemChatacteristicsVO();

		RequestDispatcher dispatcher = null;

		try {
			WeightedFPService service = new WeightedFPService();
			SystemChatacteristicsService service2 = new SystemChatacteristicsService();

			if (projectName != null) {
				wfp = service.searchWeightedFP(projectName);
				request.setAttribute("ilf_tot", wfp.getIlf_tot());
				request.setAttribute("eif_tot", wfp.getEif_tot());
				request.setAttribute("ei_tot", wfp.getEi_tot());
				request.setAttribute("eo_tot", wfp.getEo_tot());
				request.setAttribute("eq_tot", wfp.getEq_tot());

				sc = service2.searchSystemChatacteristics(projectName);
				request.setAttribute("LINKAGECOMPLEXITY", sc.getLinkageComplexity());
				request.setAttribute("PERFORMANCE", sc.getPerformance());
				request.setAttribute("OPERATIONALCOMPATIBILITY", sc.getOperationalCompatibility());
				request.setAttribute("SECURITY", sc.getSecurity());
			}

			dispatcher = request.getRequestDispatcher("./correction_factors.jsp");
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			dispatcher = request.getRequestDispatcher("./error.jsp");
		}
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("submitChk", null);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		String projectName = pid.doProjectInfoDelivery(request, response).getProjectName();

		CorrectionFactorsVO cf = new CorrectionFactorsVO();

		// 기능점수
		int fp_tot = Integer.parseInt(request.getParameter("fp_tot"));
		int fp_unitcost = Integer
				.parseInt(request.getParameter("fp_unitcost").replace("원", "").replace(",", "").replace(" ", ""));
		int fp_cost_before_correction = Integer.parseInt(
				request.getParameter("fp_cost_before_correction").replace("원", "").replace(",", "").replace(" ", ""));
		int fp_cost_after_correction = Integer.parseInt(
				request.getParameter("fp_cost_after_correction").replace("원", "").replace(",", "").replace(" ", ""));

		// 보정계수
		Double scalCorrectionFactor = Double.parseDouble(request.getParameter("scalCorrectionFactor"));
		Double linkageComplexity = Double.parseDouble(request.getParameter("LINKAGECOMPLEXITY"));
		Double performance = Double.parseDouble(request.getParameter("PERFORMANCE"));
		Double operarionalCompatibility = Double.parseDouble(request.getParameter("OPERATIONALCOMPATIBILITY"));
		Double security = Double.parseDouble(request.getParameter("SECURITY"));

		cf.setProjectName(projectName);
		cf.setFp_tot(fp_tot);
		cf.setFp_unitcost(fp_unitcost);
		cf.setFp_cost_before_correction(fp_cost_before_correction);
		cf.setFp_cost_after_correction(fp_cost_after_correction);

		cf.setScalCorrectionFactor(scalCorrectionFactor);
		cf.setLinkageComplexity(linkageComplexity);
		cf.setPerformance(performance);
		cf.setOperarionalCompatibility(operarionalCompatibility);
		cf.setSecurity(security);

		RequestDispatcher dispatcher = null;

		try {
			CorrectionFactorsService service = new CorrectionFactorsService();
			service.registerCorrectionFactors(cf);

			// response에 성공여부 저장
			out.print("success");
			out.flush();

			dispatcher = request.getRequestDispatcher("./correction_factors.jsp");
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
