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

import service.WeightedFPService;
import vo.ProjectInfoVO;
import vo.WeightedFPVO;

@WebServlet("/WeightedServlet")
public class WeightedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WeightedController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		System.out.println("WeightedController doGet");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		ProjectInfoVO pi = pid.doProjectInfoDelivery(request, response);
		String projectName = pi.getProjectName();

		WeightedFPVO wfp = new WeightedFPVO();
		RequestDispatcher dispatcher = null;

		try {

			if (projectName != null) {
				WeightedFPService service = new WeightedFPService();

				wfp = service.searchWeightedFP(projectName);

				request.setAttribute("ilf_rets_low", wfp.getIlf_rets_low());
				request.setAttribute("ilf_rets_mid", wfp.getIlf_rets_mid());
				request.setAttribute("ilf_rets_high", wfp.getIlf_rets_high());

				request.setAttribute("ilf_dets_low", wfp.getIlf_dets_low());
				request.setAttribute("ilf_dets_mid", wfp.getIlf_dets_mid());
				request.setAttribute("ilf_dets_high", wfp.getIlf_dets_high());

				request.setAttribute("eif_rets_low", wfp.getEif_rets_low());
				request.setAttribute("eif_rets_mid", wfp.getEif_rets_mid());
				request.setAttribute("eif_rets_high", wfp.getEif_rets_high());

				request.setAttribute("eif_dets_low", wfp.getEif_dets_low());
				request.setAttribute("eif_dets_mid", wfp.getEif_dets_mid());
				request.setAttribute("eif_dets_high", wfp.getEif_dets_high());

				request.setAttribute("ei_ftrs_low", wfp.getEi_ftrs_low());
				request.setAttribute("ei_ftrs_mid", wfp.getEi_ftrs_mid());
				request.setAttribute("ei_ftrs_high", wfp.getEi_ftrs_high());

				request.setAttribute("ei_dets_low", wfp.getEi_dets_low());
				request.setAttribute("ei_dets_mid", wfp.getEi_dets_mid());
				request.setAttribute("ei_dets_high", wfp.getEi_dets_high());

				request.setAttribute("eo_ftrs_low", wfp.getEo_ftrs_low());
				request.setAttribute("eo_ftrs_mid", wfp.getEo_ftrs_mid());
				request.setAttribute("eo_ftrs_high", wfp.getEo_ftrs_high());

				request.setAttribute("eo_dets_low", wfp.getEo_dets_low());
				request.setAttribute("eo_dets_mid", wfp.getEo_dets_mid());
				request.setAttribute("eo_dets_high", wfp.getEo_dets_high());

				request.setAttribute("eq_ftrs_low", wfp.getEq_ftrs_low());
				request.setAttribute("eq_ftrs_mid", wfp.getEq_ftrs_mid());
				request.setAttribute("eq_ftrs_high", wfp.getEq_ftrs_high());

				request.setAttribute("eq_dets_low", wfp.getEq_dets_low());
				request.setAttribute("eq_dets_mid", wfp.getEq_dets_mid());
				request.setAttribute("eq_dets_high", wfp.getEq_dets_high());

				request.setAttribute("ilf_tot", wfp.getIlf_tot());
				request.setAttribute("eif_tot", wfp.getEif_tot());
				request.setAttribute("ei_tot", wfp.getEi_tot());
				request.setAttribute("eo_tot", wfp.getEo_tot());
				request.setAttribute("eq_tot", wfp.getEq_tot());

				System.out.println("ilf_tot " + wfp.getIlf_tot());
				System.out.println("eif_tot " + wfp.getEif_tot());
				System.out.println("ei_tot " + wfp.getEi_tot());
				System.out.println("eo_tot " + wfp.getEo_tot());
				System.out.println("eq_tot " + wfp.getEq_tot());

			}

			dispatcher = request.getRequestDispatcher("./weighted_fp.jsp");
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

		WeightedFPVO wfp = new WeightedFPVO();

		String ilf_tot = request.getParameter("ilf_tot");
		String eif_tot = request.getParameter("eif_tot");
		String ei_tot = request.getParameter("ei_tot");
		String eo_tot = request.getParameter("eo_tot");
		String eq_tot = request.getParameter("eq_tot");

		if (ilf_tot == null || ("".equals(ilf_tot))
				|| ((ilf_tot instanceof String) && (((String) ilf_tot).trim().length() == 0)))
			ilf_tot = "0";
		if (eif_tot == null || ("".equals(eif_tot))
				|| ((eif_tot instanceof String) && (((String) eif_tot).trim().length() == 0)))
			eif_tot = "0";
		if (ei_tot == null || ("".equals(ei_tot))
				|| ((ei_tot instanceof String) && (((String) ei_tot).trim().length() == 0)))
			ei_tot = "0";
		if (eo_tot == null || ("".equals(eo_tot))
				|| ((eo_tot instanceof String) && (((String) eo_tot).trim().length() == 0)))
			eo_tot = "0";
		if (eq_tot == null || ("".equals(eq_tot))
				|| ((eq_tot instanceof String) && (((String) eq_tot).trim().length() == 0)))
			eq_tot = "0";

		System.out.println("ilf_tot " + ilf_tot);
		System.out.println("eif_tot " + eif_tot);
		System.out.println("ei_tot " + ei_tot);
		System.out.println("eo_tot " + eo_tot);
		System.out.println("eq_tot " + eq_tot);

		wfp.setProjectName(projectName);
		wfp.setIlf_tot(Integer.parseInt(ilf_tot));
		wfp.setEif_tot(Integer.parseInt(eif_tot));
		wfp.setEi_tot(Integer.parseInt(ei_tot));
		wfp.setEo_tot(Integer.parseInt(eo_tot));
		wfp.setEq_tot(Integer.parseInt(eq_tot));

		RequestDispatcher dispatcher = null;

		try {
			WeightedFPService service = new WeightedFPService();
			service.registerWeightedFP(wfp);

			request.setAttribute("ilf_rets_low", wfp.getIlf_rets_low());
			request.setAttribute("ilf_rets_mid", wfp.getIlf_rets_mid());
			request.setAttribute("ilf_rets_high", wfp.getIlf_rets_high());

			request.setAttribute("ilf_dets_low", wfp.getIlf_dets_low());
			request.setAttribute("ilf_dets_mid", wfp.getIlf_dets_mid());
			request.setAttribute("ilf_dets_high", wfp.getIlf_dets_high());

			request.setAttribute("eif_rets_low", wfp.getEif_rets_low());
			request.setAttribute("eif_rets_mid", wfp.getEif_rets_mid());
			request.setAttribute("eif_rets_high", wfp.getEif_rets_high());

			request.setAttribute("eif_dets_low", wfp.getEif_dets_low());
			request.setAttribute("eif_dets_mid", wfp.getEif_dets_mid());
			request.setAttribute("eif_dets_high", wfp.getEif_dets_high());

			request.setAttribute("ei_ftrs_low", wfp.getEi_ftrs_low());
			request.setAttribute("ei_ftrs_mid", wfp.getEi_ftrs_mid());
			request.setAttribute("ei_ftrs_high", wfp.getEi_ftrs_high());

			request.setAttribute("ei_dets_low", wfp.getEi_dets_low());
			request.setAttribute("ei_dets_mid", wfp.getEi_dets_mid());
			request.setAttribute("ei_dets_high", wfp.getEi_dets_high());

			request.setAttribute("eo_ftrs_low", wfp.getEo_ftrs_low());
			request.setAttribute("eo_ftrs_mid", wfp.getEo_ftrs_mid());
			request.setAttribute("eo_ftrs_high", wfp.getEo_ftrs_high());

			request.setAttribute("eo_dets_low", wfp.getEo_dets_low());
			request.setAttribute("eo_dets_mid", wfp.getEo_dets_mid());
			request.setAttribute("eo_dets_high", wfp.getEo_dets_high());

			request.setAttribute("eq_ftrs_low", wfp.getEq_ftrs_low());
			request.setAttribute("eq_ftrs_mid", wfp.getEq_ftrs_mid());
			request.setAttribute("eq_ftrs_high", wfp.getEq_ftrs_high());

			request.setAttribute("eq_dets_low", wfp.getEq_dets_low());
			request.setAttribute("eq_dets_mid", wfp.getEq_dets_mid());
			request.setAttribute("eq_dets_high", wfp.getEq_dets_high());

			request.setAttribute("ilf_tot", wfp.getIlf_tot());
			request.setAttribute("eif_tot", wfp.getEif_tot());
			request.setAttribute("ei_tot", wfp.getEi_tot());
			request.setAttribute("eo_tot", wfp.getEo_tot());
			request.setAttribute("eq_tot", wfp.getEq_tot());

			// response에 성공여부 저장
			out.print("success");
			out.flush();

			dispatcher = request.getRequestDispatcher("./weighted_fp.jsp");
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
