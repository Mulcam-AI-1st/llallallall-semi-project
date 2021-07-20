package vo;

public class ImprovementOpinionVO {
	
	private String name;
	private String opinion;
	
	public ImprovementOpinionVO() {};
	
	public ImprovementOpinionVO(String name, String opinion) {
		super();
		this.name = name;
		this.opinion = opinion;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getOpinion() {
		return opinion;
	}


	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	
	
	
	
	

}
