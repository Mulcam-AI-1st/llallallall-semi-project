package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ProjectInfoVO;

public class ProjectInfoDelivery {

	public ProjectInfoVO doProjectInfoDelivery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.setCharacterEncoding("utf-8");

		String projectName = request.getParameter("projectName");
		String projectDesc = request.getParameter("projectDesc");
		String codingLanguage = request.getParameter("codingLanguage");
		String systemType = request.getParameter("systemType");

		HttpSession session = request.getSession();

		String SSprojectName = (String) session.getAttribute("projectName");
		String SSprojectDesc = (String) session.getAttribute("projectDesc");
		String SScodingLanguage = (String) session.getAttribute("codingLanguage");
		String SSsystemType = (String) session.getAttribute("systemType");

		if (projectName == null && SSprojectName != null)
			projectName = SSprojectName;
		if (projectDesc == null && SSprojectDesc != null)
			projectDesc = SSprojectDesc;
		if (codingLanguage == null && SScodingLanguage != null)
			codingLanguage = SScodingLanguage;
		if (systemType == null && SSsystemType != null)
			systemType = SSsystemType;

		ProjectInfoVO pi = new ProjectInfoVO(projectName, projectDesc, codingLanguage, systemType);

			// 리퀘스트 저장 
			request.setAttribute("pi", pi);
			
			// 세션저장
			session.setAttribute("projectName", projectName);
			session.setAttribute("projectDesc", projectDesc);
			session.setAttribute("codingLanguage", codingLanguage);
			session.setAttribute("systemType", systemType);
			
			
		return pi;
	}

}
