package vo;

import java.util.ArrayList;

public class BoundariesDefinitionListVO {
	
	private String projactName; 
	
	private ArrayList<BoundariesDefinitionVO> boundariesDefList = new ArrayList<BoundariesDefinitionVO>();

	public BoundariesDefinitionListVO() {};
	
	public BoundariesDefinitionListVO(String projactName, ArrayList<BoundariesDefinitionVO> boundariesDefList) {
		super();
		this.projactName = projactName;
		this.boundariesDefList = boundariesDefList;
	}

	public String getProjactName() {
		return projactName;
	}

	public void setProjactName(String projactName) {
		this.projactName = projactName;
	}

	public ArrayList<BoundariesDefinitionVO> getBoundariesDefList() {
		return boundariesDefList;
	}

	public void setBoundariesDefList(ArrayList<BoundariesDefinitionVO> boundariesDefList) {
		this.boundariesDefList = boundariesDefList;
	}
	
	
	

}
