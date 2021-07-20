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

import service.BoundariesDefinitionService;
import service.RequirementDefinitionService;
import service.UnitProcessDefinitionService;
import vo.BoundariesDefinitionListVO;
import vo.BoundariesDefinitionVO;
import vo.ProjectInfoVO;
import vo.RequirementDefinitionListVO;
import vo.UnitProcessDefinitionListVO;

@WebServlet("/BoundariesServlet")
public class BoundariesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoundariesController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		System.out.println("BoundariesController doGet");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		ProjectInfoVO pi = pid.doProjectInfoDelivery(request, response);
		
		
		String projectName = pi.getProjectName();

		RequirementDefinitionListVO rdl = null;
		UnitProcessDefinitionListVO upl = null;
		RequestDispatcher dispatcher = null;

		try {
			
			if ( projectName != null ) {
			RequirementDefinitionService serviceRd = new RequirementDefinitionService();
			UnitProcessDefinitionService serviceUpd = new UnitProcessDefinitionService();

			rdl = serviceRd.searchRequirement(projectName);
			upl = serviceUpd.searchUnitProcess(projectName);

			request.setAttribute("requirement_list", rdl.getReq_def_list());
			request.setAttribute("unitProcess_list", upl.getUni_pro_def_list());
			}
		
			dispatcher = request.getRequestDispatcher("./setting_application_boundaries.jsp");
		
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

		// select 옵션 값들을 받는다.
		String[] requirement_list = request.getParameterValues("requirement_list");
		String[] uni_pro_list = request.getParameterValues("uni_pro_list");

		// 스트링 배열을 ArrayList 배열에 담는다.
		BoundariesDefinitionVO bd = null;
		ArrayList<BoundariesDefinitionVO> boundariesDefList = new ArrayList<>();
		for (int i = 0; i < requirement_list.length; i++) {
			bd = new BoundariesDefinitionVO();
			bd.setReq_def_num(Integer.parseInt(requirement_list[i].replaceAll(" ", "")));
			bd.setUni_pro_num(Integer.parseInt(uni_pro_list[i].replaceAll(" ", "")));
			boundariesDefList.add(bd);
		}

		// BoundariesListVO 객체에 프로젝트 이름과 boundariesDefList 를 담는다.
		BoundariesDefinitionListVO bdl = new BoundariesDefinitionListVO(projectName, boundariesDefList);

		RequestDispatcher dispatcher = null;
		try {
			BoundariesDefinitionService service = new BoundariesDefinitionService();
			service.registerBoundaries(bdl);
			
			
			//response에 성공여부 저장
		    out.print("success");
		    out.flush();

			
		    // 요구사항, 단위업무를 다시 불러온다.
		    RequirementDefinitionListVO rdl = null;
			UnitProcessDefinitionListVO upl = null;
		    
			RequirementDefinitionService serviceRd = new RequirementDefinitionService();
			UnitProcessDefinitionService serviceUpd = new UnitProcessDefinitionService();

			rdl = serviceRd.searchRequirement(projectName);
			upl = serviceUpd.searchUnitProcess(projectName);

			request.setAttribute("requirement_list", rdl.getReq_def_list());
			request.setAttribute("unitProcess_list", upl.getUni_pro_def_list());
		    
		    
			//페이지 이동 
			dispatcher = request.getRequestDispatcher("./setting_application_boundaries.jsp");

		} catch (Exception e) {
			//response에 성공여부 저장
			out.print(e.getMessage().toString());
			out.flush();
			
			dispatcher = request.getRequestDispatcher("./error.jsp");
			
		} finally {
			out.close();
		}

		dispatcher.forward(request, response);
	}

}
