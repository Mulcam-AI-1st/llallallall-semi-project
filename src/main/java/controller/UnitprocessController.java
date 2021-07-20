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

import service.UnitProcessDefinitionService;
import vo.UnitProcessDefinitionListVO;
import vo.UnitProcessDefinitionVO;


@WebServlet("/UnitprocessServlet")
public class UnitprocessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UnitprocessController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");


		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		pid.doProjectInfoDelivery(request, response);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./unit_process_definition.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("submitChk", null);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		String projectName = pid.doProjectInfoDelivery(request, response).getProjectName();
		
		//jsp에서 값들을 받아와 리스트로 만든다.
		//uni_pro_list 개수 미정, uni_pro_desc_list 개수 미정 
	    //스트링 배열로 받아와 ArrayList 로 변경한다.
		//변경이 다되면 UnitProcessListVO 에 다시 담는다.
		String[] uni_pro_list = request.getParameterValues("uni_pro_list");
        String[] uni_pro_desc_list = request.getParameterValues("uni_pro_desc_list");
        UnitProcessDefinitionVO upd = null;
        //먼저 UnitProcessDefinitionVO 객체에 하나씩 데이터를 담아 unitProcessDefList 배열로 만든다.
        ArrayList<UnitProcessDefinitionVO> unitProcessDefList = new  ArrayList<>();
        for(int i=0; i<uni_pro_list.length ;i++ ) {
        	upd = new UnitProcessDefinitionVO();
        	upd.setUni_pro_num(i+1);
        	upd.setUni_pro(uni_pro_list[i].toString());
        	upd.setUni_pro_desc(uni_pro_desc_list[i].toString());
        	unitProcessDefList.add(upd);

        }
        
        //프로젝트 이름, 단위프로세스 리스트 VO(UnitProcessDefinitionVO) 가 들어간다.
        UnitProcessDefinitionListVO upl = new UnitProcessDefinitionListVO(projectName, unitProcessDefList);
	           
        RequestDispatcher dispatcher = null;	
		try {
			UnitProcessDefinitionService service = new UnitProcessDefinitionService();
			service.registerUnitProcess(upl);
			
			
			//response에 성공여부 저장
		    out.print("success");
		    out.flush();
			
			
			dispatcher = request.getRequestDispatcher("./unit_process_definition.jsp");
			
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
