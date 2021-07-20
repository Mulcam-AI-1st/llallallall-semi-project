package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ProjectInfoDelivery;

import service.EstimationCostService;
import vo.CorrectionFactorsVO;
import vo.ProjectInfoVO;


@WebServlet("/EstimationServlet")
public class EstimationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EstimationController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");


		ProjectInfoDelivery pid = new ProjectInfoDelivery();
		ProjectInfoVO pi = pid.doProjectInfoDelivery(request, response);
		String projectName = pi.getProjectName();
		
		CorrectionFactorsVO cf = new CorrectionFactorsVO();
		
		RequestDispatcher dispatcher = null;
		
		try {
			
			if ( projectName !=null ) {
			EstimationCostService service =  new EstimationCostService();
			cf = service.searchEstimationCost(projectName);
			System.out.println("EstimationServlet" + " searchEstimationCost " + projectName);
			
			request.setAttribute("cf", cf);
			System.out.println( cf.getFp_tot());
			System.out.println( cf.getFp_unitcost());
			System.out.println( cf.getFp_cost_before_correction());
			System.out.println( cf.getFp_cost_after_correction());

			}
		
			dispatcher = request.getRequestDispatcher("./est_of_dev_cost.jsp");
		} catch (Exception e) {
			request.setAttribute("err", e.getMessage());
			dispatcher = request.getRequestDispatcher("./error.jsp");
		}
		dispatcher.forward(request, response);

	}

}
