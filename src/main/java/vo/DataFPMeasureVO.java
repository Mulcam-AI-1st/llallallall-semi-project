package vo;

public class DataFPMeasureVO {
	
	private int data_fp_num; 
	private int uni_pro_num;
	private String data_fp_type;
	private Double rets;
	private String rets_status;
	private Double dets;
	private String dets_status;
	private Double complexity;
	
	public DataFPMeasureVO() {}

	public DataFPMeasureVO(int data_fp_num, int uni_pro_num, String data_fp_type, Double rets, String rets_status,
			Double dets, String dets_status, Double complexity) {
		super();
		this.data_fp_num = data_fp_num;
		this.uni_pro_num = uni_pro_num;
		this.data_fp_type = data_fp_type;
		this.rets = rets;
		this.rets_status = rets_status;
		this.dets = dets;
		this.dets_status = dets_status;
		this.complexity = complexity;
	}

	public int getData_fp_num() {
		return data_fp_num;
	}

	public void setData_fp_num(int data_fp_num) {
		this.data_fp_num = data_fp_num;
	}

	public int getUni_pro_num() {
		return uni_pro_num;
	}

	public void setUni_pro_num(int uni_pro_num) {
		this.uni_pro_num = uni_pro_num;
	}

	public String getData_fp_type() {
		return data_fp_type;
	}

	public void setData_fp_type(String data_fp_type) {
		this.data_fp_type = data_fp_type;
	}

	public Double getRets() {
		return rets;
	}

	public void setRets(Double rets) {
		this.rets = rets;
	}

	public String getRets_status() {
		return rets_status;
	}

	public void setRets_status(String rets_status) {
		this.rets_status = rets_status;
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
