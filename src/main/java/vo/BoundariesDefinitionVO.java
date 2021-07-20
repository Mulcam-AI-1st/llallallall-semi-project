package vo;

public class BoundariesDefinitionVO {
	
	private int req_def_num;
	private int uni_pro_num;
	
	public BoundariesDefinitionVO() {};
	
	public BoundariesDefinitionVO(int req_def_num, int uni_pro_num) {
		super();
		this.req_def_num = req_def_num;
		this.uni_pro_num = uni_pro_num;
	}


	public int getReq_def_num() {
		return req_def_num;
	}

	public void setReq_def_num(int req_def_num) {
		this.req_def_num = req_def_num;
	}

	public int getUni_pro_num() {
		return uni_pro_num;
	}

	public void setUni_pro_num(int uni_pro_num) {
		this.uni_pro_num = uni_pro_num;
	}
	
	
	

}
