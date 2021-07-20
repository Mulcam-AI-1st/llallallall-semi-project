package vo;

public class ProjectInfoVO {
	
		private String projectName;
		private String projectDesc;
		private String codingLanguage;
		private String systemType;
		
		public ProjectInfoVO() {}

		public ProjectInfoVO(String projectName, String projectDesc, String codingLanguage, String systemType) {
			super();
			this.projectName = projectName;
			this.projectDesc = projectDesc;
			this.codingLanguage = codingLanguage;
			this.systemType = systemType;
		}

		public String getProjectName() {
			return projectName;
		}

		public void setProjectName(String projectName) {
			this.projectName = projectName;
		}

		public String getProjectDesc() {
			return projectDesc;
		}

		public void setProjectDesc(String projectDesc) {
			this.projectDesc = projectDesc;
		}

		public String getCodingLanguage() {
			return codingLanguage;
		}

		public void setCodingLanguage(String codingLanguage) {
			this.codingLanguage = codingLanguage;
		}

		public String getSystemType() {
			return systemType;
		}

		public void setSystemType(String systemType) {
			this.systemType = systemType;
		};
		
		
		
		
			
		

}
