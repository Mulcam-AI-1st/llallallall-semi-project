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

import service.RequirementDefinitionService;
import vo.RequirementDefinitionListVO;
import vo.RequirementDefinitionVO;


@WebServlet("/RequirementServlet")
public class RequirementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RequirementController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		pid.doProjectInfoDelivery(request, response);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./requirement_definition.jsp");
		dispatcher.forward(request, response);
	
	}



	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("submitChk", null);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		String projectName = pid.doProjectInfoDelivery(request, response).getProjectName();
			

        String[] requirement_list = request.getParameterValues("requirement_list");
        String[] requirement_desc_list = request.getParameterValues("requirement_desc_list");

        RequirementDefinitionVO rd = null;
        ArrayList<RequirementDefinitionVO> requirementDefList = new ArrayList<>();
        for(int i=0; i<requirement_list.length ;i++ ) {
        	rd = new RequirementDefinitionVO();
        	rd.setReq_def_num(i+1);
        	rd.setReq_def(requirement_list[i].toString());
        	rd.setReq_def_desc(requirement_desc_list[i].toString()); 
        	requirementDefList.add(rd);
        }

        RequirementDefinitionListVO rdl = new RequirementDefinitionListVO(projectName, requirementDefList);

        
        RequestDispatcher dispatcher = null;	
		try {
			RequirementDefinitionService service = new RequirementDefinitionService();
			service.registerRequirement(rdl);
			
			//response에 성공여부 저장
		    out.print("success");
		    out.flush();
		    
		    
			dispatcher = request.getRequestDispatcher("./requirement_definition.jsp");
			
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
