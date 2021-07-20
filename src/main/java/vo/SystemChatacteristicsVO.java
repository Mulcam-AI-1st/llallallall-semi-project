package vo;

public class SystemChatacteristicsVO {
	//프로젝트 이름
	private String ProjectName;
	
	//연계 복잡성
	private Double LinkageComplexity;
	//성능 요구 
	private Double Performance;
	//운영환경 호환성
	private Double OperationalCompatibility;
	//보안성
	private Double Security;
	
	public SystemChatacteristicsVO() {}

	public SystemChatacteristicsVO(String projectName, Double linkageComplexity, Double performance,
			Double operationalCompatibility, Double security) {
		super();
		ProjectName = projectName;
		LinkageComplexity = linkageComplexity;
		Performance = performance;
		OperationalCompatibility = operationalCompatibility;
		Security = security;
	}

	public String getProjectName() {
		return ProjectName;
	}

	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}

	public Double getLinkageComplexity() {
		return LinkageComplexity;
	}

	public void setLinkageComplexity(Double linkageComplexity) {
		LinkageComplexity = linkageComplexity;
	}

	public Double getPerformance() {
		return Performance;
	}

	public void setPerformance(Double performance) {
		Performance = performance;
	}

	public Double getOperationalCompatibility() {
		return OperationalCompatibility;
	}

	public void setOperationalCompatibility(Double operationalCompatibility) {
		OperationalCompatibility = operationalCompatibility;
	}

	public Double getSecurity() {
		return Security;
	}

	public void setSecurity(Double security) {
		Security = security;
	}

	
	
	
	
	
	
	
	
}
