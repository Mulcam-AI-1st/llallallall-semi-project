package vo;

public class TransactionFPMeasureVO {
	
	private int trans_fp_num; 
	private int uni_pro_num;
	private String trans_fp_type;
	private Double ftrs;
	private String ftrs_status;
	private Double dets;
	private String dets_status;
	private Double complexity;

	
	public TransactionFPMeasureVO() {}


	public TransactionFPMeasureVO(int trans_fp_num, int uni_pro_num, String trans_fp_type, Double ftrs,
			String ftrs_status, Double dets, String dets_status, Double complexity) {
		super();
		this.trans_fp_num = trans_fp_num;
		this.uni_pro_num = uni_pro_num;
		this.trans_fp_type = trans_fp_type;
		this.ftrs = ftrs;
		this.ftrs_status = ftrs_status;
		this.dets = dets;
		this.dets_status = dets_status;
		this.complexity = complexity;
	}


	public int getTrans_fp_num() {
		return trans_fp_num;
	}


	public void setTrans_fp_num(int trans_fp_num) {
		this.trans_fp_num = trans_fp_num;
	}


	public int getUni_pro_num() {
		return uni_pro_num;
	}


	public void setUni_pro_num(int uni_pro_num) {
		this.uni_pro_num = uni_pro_num;
	}


	public String getTrans_fp_type() {
		return trans_fp_type;
	}


	public void setTrans_fp_type(String trans_fp_type) {
		this.trans_fp_type = trans_fp_type;
	}


	public Double getFtrs() {
		return ftrs;
	}


	public void setFtrs(Double ftrs) {
		this.ftrs = ftrs;
	}


	public String getFtrs_status() {
		return ftrs_status;
	}


	public void setFtrs_status(String ftrs_status) {
		this.ftrs_status = ftrs_status;
	}


	public Double getDets() {
		return dets;
	}


	public void setDets(Double dets) {
		this.dets = dets;
	}


	public String getDets_status() {
		return dets_status;
	}


	public void setDets_status(String dets_status) {
		this.dets_status = dets_status;
	}


	public Double getComplexity() {
		return complexity;
	}


	public void setComplexity(Double complexity) {
		this.complexity = complexity;
	}

	
	
	
	
	
}
