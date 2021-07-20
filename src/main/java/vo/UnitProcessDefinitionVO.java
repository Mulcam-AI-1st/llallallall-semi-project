package vo;



public class UnitProcessDefinitionVO {
	
		
	private int uni_pro_num;

	private String uni_pro;

	private String uni_pro_desc;
	
	
	public UnitProcessDefinitionVO() {}
	
	public UnitProcessDefinitionVO(int uni_pro_num, String uni_pro) {
		super();
		this.uni_pro_num = uni_pro_num;
		this.uni_pro = uni_pro;
	}

	public UnitProcessDefinitionVO(int uni_pro_num, String uni_pro, String uni_pro_desc) {
		super();
		this.uni_pro_num = uni_pro_num;
		this.uni_pro = uni_pro;
		this.uni_pro_desc = uni_pro_desc;
	}


	public int getUni_pro_num() {
		return uni_pro_num;
	}


	public void setUni_pro_num(int uni_pro_num) {
		this.uni_pro_num = uni_pro_num;
	}


	public String getUni_pro() {
		return uni_pro;
	}


	public void setUni_pro(String uni_pro) {
		this.uni_pro = uni_pro;
	}


	public String getUni_pro_desc() {
		return uni_pro_desc;
	}


	public void setUni_pro_desc(String uni_pro_desc) {
		this.uni_pro_desc = uni_pro_desc;
	};

	
	
	
	
}
