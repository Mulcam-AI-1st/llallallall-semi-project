package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ProjectInfoDelivery;

import service.TransactionFPMeasureService;
import service.UnitProcessDefinitionService;
import vo.ProjectInfoVO;
import vo.TransactionFPMeasureListVO;
import vo.TransactionFPMeasureVO;
import vo.UnitProcessDefinitionListVO;

@WebServlet("/TransactionServlet")
public class TransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TransactionController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		ProjectInfoVO pi = pid.doProjectInfoDelivery(request, response);

		String projectName = pi.getProjectName();

		UnitProcessDefinitionListVO upl = null;
		RequestDispatcher dispatcher = null;

		try {

			if (projectName != null) {
				UnitProcessDefinitionService serviceUpd = new UnitProcessDefinitionService();

				upl = serviceUpd.searchUnitProcess(projectName);

				request.setAttribute("unitProcess_list", upl.getUni_pro_def_list());

			}
			dispatcher = request.getRequestDispatcher("./trans_fp_meas.jsp");

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

		// form 보내는 부분
		String[] trans_fp_num_list = request.getParameterValues("uni_pro_list");
		String[] trans_fp_type_list = request.getParameterValues("trans_fp_type");
		String[] ftrs_list = request.getParameterValues("ftrs");
		String[] ftrs_status_list = request.getParameterValues("ftrs_status");
		String[] dets_list = request.getParameterValues("dets");
		String[] dets_status_list = request.getParameterValues("dets_status");
		String[] complexity_list = request.getParameterValues("complexity");

		TransactionFPMeasureVO tfp = null;
		ArrayList<TransactionFPMeasureVO> trans_fp_list = new ArrayList<TransactionFPMeasureVO>();

		for (int i = 0; i < trans_fp_num_list.length; i++) {
			tfp = new TransactionFPMeasureVO();
			tfp.setTrans_fp_num(i + 1);
			tfp.setUni_pro_num(Integer.parseInt(trans_fp_num_list[i].replace(" ", "")));
			System.out.println("trans_pro_num_list[i]" + trans_fp_num_list[i]);

			tfp.setTrans_fp_type(trans_fp_type_list[i]);

			if (ftrs_list[i] == null || ftrs_list[i].isEmpty()) {
				ftrs_list[i] = "0";
				System.out.println(ftrs_list[i] + "null");
			}
			tfp.setFtrs(Double.parseDouble(ftrs_list[i]));

			tfp.setFtrs_status(ftrs_status_list[i]);

			if (dets_list[i] == null || dets_list[i].isEmpty()) {
				dets_list[i] = "0";
				System.out.println(dets_list[i] + "null");
			}
			tfp.setDets(Double.parseDouble(dets_list[i]));

			tfp.setDets_status(dets_status_list[i]);

			tfp.setComplexity(Double.parseDouble(complexity_list[i]));

			trans_fp_list.add(tfp);

		}

		TransactionFPMeasureListVO tfpl = new TransactionFPMeasureListVO();
		tfpl.setProjectName(projectName);
		tfpl.setTrans_fp_list(trans_fp_list);
		RequestDispatcher dispatcher = null;

		try {
			TransactionFPMeasureService service = new TransactionFPMeasureService();
			service.registerTransactionFP(tfpl);

			// response에 성공여부 저장
			out.print("success");
			out.flush();

			dispatcher = request.getRequestDispatcher("./trans_fp_meas.jsp");

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
