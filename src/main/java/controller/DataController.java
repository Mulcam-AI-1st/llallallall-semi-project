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

import service.DataFPMeasureService;
import service.UnitProcessDefinitionService;
import vo.DataFPMeasureListVO;
import vo.DataFPMeasureVO;
import vo.ProjectInfoVO;
import vo.UnitProcessDefinitionListVO;

@WebServlet("/DataServlet")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DataController() {
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
			dispatcher = request.getRequestDispatcher("./data_fp_meas.jsp");

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
		String[] uni_pro_num_list = request.getParameterValues("uni_pro_list");
		String[] data_fp_type_list = request.getParameterValues("data_fp_type");
		String[] rets_list = request.getParameterValues("rets");
		String[] rets_status_list = request.getParameterValues("rets_status");
		String[] dets_list = request.getParameterValues("dets");
		String[] dets_status_list = request.getParameterValues("dets_status");
		String[] complexity_list = request.getParameterValues("complexity");

		DataFPMeasureVO dfp = null;
		ArrayList<DataFPMeasureVO> data_fp_list = new ArrayList<DataFPMeasureVO>();
		for (int i = 0; i < uni_pro_num_list.length; i++) {
			dfp = new DataFPMeasureVO();
			dfp.setData_fp_num(i + 1);
			dfp.setUni_pro_num(Integer.parseInt(uni_pro_num_list[i].replace(" ", "")));
			System.out.println("uni_pro_list[i]" + uni_pro_num_list[i]);

			dfp.setData_fp_type(data_fp_type_list[i]);

			dfp.setRets(Double.parseDouble(rets_list[i]));
			if (rets_list[i] == null || rets_list[i].isEmpty()) {
				rets_list[i] = "0";
				System.out.println(rets_list[i] + "null");
			}
			dfp.setRets_status(rets_status_list[i]);

			dfp.setDets(Double.parseDouble(dets_list[i]));
			if (dets_list[i] == null || dets_list[i].isEmpty()) {
				dets_list[i] = "0";
				System.out.println(dets_list[i] + "null");
			}

			dfp.setDets_status(dets_status_list[i]);

			dfp.setComplexity(Double.parseDouble(complexity_list[i]));

			data_fp_list.add(dfp);

		}

		DataFPMeasureListVO dfpl = new DataFPMeasureListVO();
		dfpl.setProjectName(projectName);
		dfpl.setData_fp_list(data_fp_list);
		RequestDispatcher dispatcher = null;
		try {
			DataFPMeasureService service = new DataFPMeasureService();
			service.registerDataFP(dfpl);

			// response에 성공여부 저장
			out.print("success");
			out.flush();

			dispatcher = request.getRequestDispatcher("./data_fp_meas.jsp");

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
