package vo;

public class CorrectionFactorsVO {

	private String projectName ;
	private int fp_tot;
	private int fp_unitcost;
	private int fp_cost_before_correction;
	private int fp_cost_after_correction;

	
	private Double scalCorrectionFactor;
	private Double linkageComplexity;
	private Double performance;
	private Double operarionalCompatibility;
	private Double security;
	
	public CorrectionFactorsVO() {}

	public CorrectionFactorsVO(String projectName, int fp_tot, int fp_unitcost, int fp_cost_before_correction,
			int fp_cost_after_correction, Double scalCorrectionFactor, Double linkageComplexity, Double performance,
			Double operarionalCompatibility, Double security) {
		super();
		this.projectName = projectName;
		this.fp_tot = fp_tot;
		this.fp_unitcost = fp_unitcost;
		this.fp_cost_before_correction = fp_cost_before_correction;
		this.fp_cost_after_correction = fp_cost_after_correction;
		this.scalCorrectionFactor = scalCorrectionFactor;
		this.linkageComplexity = linkageComplexity;
		this.performance = performance;
		this.operarionalCompatibility = operarionalCompatibility;
		this.security = security;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public int getFp_tot() {
		return fp_tot;
	}

	public void setFp_tot(int fp_tot) {
		this.fp_tot = fp_tot;
	}

	public int getFp_unitcost() {
		return fp_unitcost;
	}

	public void setFp_unitcost(int fp_unitcost) {
		this.fp_unitcost = fp_unitcost;
	}

	public int getFp_cost_before_correction() {
		return fp_cost_before_correction;
	}

	public void setFp_cost_before_correction(int fp_cost_before_correction) {
		this.fp_cost_before_correction = fp_cost_before_correction;
	}

	public int getFp_cost_after_correction() {
		return fp_cost_after_correction;
	}

	public void setFp_cost_after_correction(int fp_cost_after_correction) {
		this.fp_cost_after_correction = fp_cost_after_correction;
	}

	public Double getScalCorrectionFactor() {
		return scalCorrectionFactor;
	}

	public void setScalCorrectionFactor(Double scalCorrectionFactor) {
		this.scalCorrectionFactor = scalCorrectionFactor;
	}

	public Double getLinkageComplexity() {
		return linkageComplexity;
	}

	public void setLinkageComplexity(Double linkageComplexity) {
		this.linkageComplexity = linkageComplexity;
	}

	public Double getPerformance() {
		return performance;
	}

	public void setPerformance(Double performance) {
		this.performance = performance;
	}

	public Double getOperarionalCompatibility() {
		return operarionalCompatibility;
	}

	public void setOperarionalCompatibility(Double operarionalCompatibility) {
		this.operarionalCompatibility = operarionalCompatibility;
	}

	public Double getSecurity() {
		return security;
	}

	public void setSecurity(Double security) {
		this.security = security;
	};
	
	
	
	
	
	
}
