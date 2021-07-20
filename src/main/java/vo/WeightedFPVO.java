package vo;

public class WeightedFPVO {
	
	private String projectName;

	private int ilf_rets_low;
	private int ilf_rets_mid;
	private int ilf_rets_high;
	
	private int ilf_dets_low;
	private int ilf_dets_mid;
	private int ilf_dets_high;

	private int eif_rets_low;
	private int eif_rets_mid;
	private int eif_rets_high;
	
	private int eif_dets_low;
	private int eif_dets_mid;
	private int eif_dets_high;
	
	private int ei_ftrs_low;
	private int ei_ftrs_mid;
	private int ei_ftrs_high;
	
	private int ei_dets_low;
	private int ei_dets_mid;
	private int ei_dets_high;
	
	private int eo_ftrs_low;
	private int eo_ftrs_mid;
	private int eo_ftrs_high;
	
	private int eo_dets_low;
	private int eo_dets_mid;
	private int eo_dets_high;
	
	private int eq_ftrs_low;
	private int eq_ftrs_mid;
	private int eq_ftrs_high;
	
	private int eq_dets_low;
	private int eq_dets_mid;
	private int eq_dets_high;
	
	//결과반영 기능정수 가중치 
	private int ilf_tot;
	private int eif_tot;
	private int ei_tot;
	private int eo_tot;
	private int eq_tot;
	
	public WeightedFPVO() {}

	public WeightedFPVO(String projectName, int ilf_rets_low, int ilf_rets_mid, int ilf_rets_high, int ilf_dets_low,
			int ilf_dets_mid, int ilf_dets_high, int eif_rets_low, int eif_rets_mid, int eif_rets_high,
			int eif_dets_low, int eif_dets_mid, int eif_dets_high, int ei_ftrs_low, int ei_ftrs_mid, int ei_ftrs_high,
			int ei_dets_low, int ei_dets_mid, int ei_dets_high, int eo_ftrs_low, int eo_ftrs_mid, int eo_ftrs_high,
			int eo_dets_low, int eo_dets_mid, int eo_dets_high, int eq_ftrs_low, int eq_ftrs_mid, int eq_ftrs_high,
			int eq_dets_low, int eq_dets_mid, int eq_dets_high, int ilf_tot, int eif_tot, int ei_tot, int eo_tot,
			int eq_tot) {
		super();
		this.projectName = projectName;
		this.ilf_rets_low = ilf_rets_low;
		this.ilf_rets_mid = ilf_rets_mid;
		this.ilf_rets_high = ilf_rets_high;
		this.ilf_dets_low = ilf_dets_low;
		this.ilf_dets_mid = ilf_dets_mid;
		this.ilf_dets_high = ilf_dets_high;
		this.eif_rets_low = eif_rets_low;
		this.eif_rets_mid = eif_rets_mid;
		this.eif_rets_high = eif_rets_high;
		this.eif_dets_low = eif_dets_low;
		this.eif_dets_mid = eif_dets_mid;
		this.eif_dets_high = eif_dets_high;
		this.ei_ftrs_low = ei_ftrs_low;
		this.ei_ftrs_mid = ei_ftrs_mid;
		this.ei_ftrs_high = ei_ftrs_high;
		this.ei_dets_low = ei_dets_low;
		this.ei_dets_mid = ei_dets_mid;
		this.ei_dets_high = ei_dets_high;
		this.eo_ftrs_low = eo_ftrs_low;
		this.eo_ftrs_mid = eo_ftrs_mid;
		this.eo_ftrs_high = eo_ftrs_high;
		this.eo_dets_low = eo_dets_low;
		this.eo_dets_mid = eo_dets_mid;
		this.eo_dets_high = eo_dets_high;
		this.eq_ftrs_low = eq_ftrs_low;
		this.eq_ftrs_mid = eq_ftrs_mid;
		this.eq_ftrs_high = eq_ftrs_high;
		this.eq_dets_low = eq_dets_low;
		this.eq_dets_mid = eq_dets_mid;
		this.eq_dets_high = eq_dets_high;
		this.ilf_tot = ilf_tot;
		this.eif_tot = eif_tot;
		this.ei_tot = ei_tot;
		this.eo_tot = eo_tot;
		this.eq_tot = eq_tot;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public int getIlf_rets_low() {
		return ilf_rets_low;
	}

	public void setIlf_rets_low(int ilf_rets_low) {
		this.ilf_rets_low = ilf_rets_low;
	}

	public int getIlf_rets_mid() {
		return ilf_rets_mid;
	}

	public void setIlf_rets_mid(int ilf_rets_mid) {
		this.ilf_rets_mid = ilf_rets_mid;
	}

	public int getIlf_rets_high() {
		return ilf_rets_high;
	}

	public void setIlf_rets_high(int ilf_rets_high) {
		this.ilf_rets_high = ilf_rets_high;
	}

	public int getIlf_dets_low() {
		return ilf_dets_low;
	}

	public void setIlf_dets_low(int ilf_dets_low) {
		this.ilf_dets_low = ilf_dets_low;
	}

	public int getIlf_dets_mid() {
		return ilf_dets_mid;
	}

	public void setIlf_dets_mid(int ilf_dets_mid) {
		this.ilf_dets_mid = ilf_dets_mid;
	}

	public int getIlf_dets_high() {
		return ilf_dets_high;
	}

	public void setIlf_dets_high(int ilf_dets_high) {
		this.ilf_dets_high = ilf_dets_high;
	}

	public int getEif_rets_low() {
		return eif_rets_low;
	}

	public void setEif_rets_low(int eif_rets_low) {
		this.eif_rets_low = eif_rets_low;
	}

	public int getEif_rets_mid() {
		return eif_rets_mid;
	}

	public void setEif_rets_mid(int eif_rets_mid) {
		this.eif_rets_mid = eif_rets_mid;
	}

	public int getEif_rets_high() {
		return eif_rets_high;
	}

	public void setEif_rets_high(int eif_rets_high) {
		this.eif_rets_high = eif_rets_high;
	}

	public int getEif_dets_low() {
		return eif_dets_low;
	}

	public void setEif_dets_low(int eif_dets_low) {
		this.eif_dets_low = eif_dets_low;
	}

	public int getEif_dets_mid() {
		return eif_dets_mid;
	}

	public void setEif_dets_mid(int eif_dets_mid) {
		this.eif_dets_mid = eif_dets_mid;
	}

	public int getEif_dets_high() {
		return eif_dets_high;
	}

	public void setEif_dets_high(int eif_dets_high) {
		this.eif_dets_high = eif_dets_high;
	}

	public int getEi_ftrs_low() {
		return ei_ftrs_low;
	}

	public void setEi_ftrs_low(int ei_ftrs_low) {
		this.ei_ftrs_low = ei_ftrs_low;
	}

	public int getEi_ftrs_mid() {
		return ei_ftrs_mid;
	}

	public void setEi_ftrs_mid(int ei_ftrs_mid) {
		this.ei_ftrs_mid = ei_ftrs_mid;
	}

	public int getEi_ftrs_high() {
		return ei_ftrs_high;
	}

	public void setEi_ftrs_high(int ei_ftrs_high) {
		this.ei_ftrs_high = ei_ftrs_high;
	}

	public int getEi_dets_low() {
		return ei_dets_low;
	}

	public void setEi_dets_low(int ei_dets_low) {
		this.ei_dets_low = ei_dets_low;
	}

	public int getEi_dets_mid() {
		return ei_dets_mid;
	}

	public void setEi_dets_mid(int ei_dets_mid) {
		this.ei_dets_mid = ei_dets_mid;
	}

	public int getEi_dets_high() {
		return ei_dets_high;
	}

	public void setEi_dets_high(int ei_dets_high) {
		this.ei_dets_high = ei_dets_high;
	}

	public int getEo_ftrs_low() {
		return eo_ftrs_low;
	}

	public void setEo_ftrs_low(int eo_ftrs_low) {
		this.eo_ftrs_low = eo_ftrs_low;
	}

	public int getEo_ftrs_mid() {
		return eo_ftrs_mid;
	}

	public void setEo_ftrs_mid(int eo_ftrs_mid) {
		this.eo_ftrs_mid = eo_ftrs_mid;
	}

	public int getEo_ftrs_high() {
		return eo_ftrs_high;
	}

	public void setEo_ftrs_high(int eo_ftrs_high) {
		this.eo_ftrs_high = eo_ftrs_high;
	}

	public int getEo_dets_low() {
		return eo_dets_low;
	}

	public void setEo_dets_low(int eo_dets_low) {
		this.eo_dets_low = eo_dets_low;
	}

	public int getEo_dets_mid() {
		return eo_dets_mid;
	}

	public void setEo_dets_mid(int eo_dets_mid) {
		this.eo_dets_mid = eo_dets_mid;
	}

	public int getEo_dets_high() {
		return eo_dets_high;
	}

	public void setEo_dets_high(int eo_dets_high) {
		this.eo_dets_high = eo_dets_high;
	}

	public int getEq_ftrs_low() {
		return eq_ftrs_low;
	}

	public void setEq_ftrs_low(int eq_ftrs_low) {
		this.eq_ftrs_low = eq_ftrs_low;
	}

	public int getEq_ftrs_mid() {
		return eq_ftrs_mid;
	}

	public void setEq_ftrs_mid(int eq_ftrs_mid) {
		this.eq_ftrs_mid = eq_ftrs_mid;
	}

	public int getEq_ftrs_high() {
		return eq_ftrs_high;
	}

	public void setEq_ftrs_high(int eq_ftrs_high) {
		this.eq_ftrs_high = eq_ftrs_high;
	}

	public int getEq_dets_low() {
		return eq_dets_low;
	}

	public void setEq_dets_low(int eq_dets_low) {
		this.eq_dets_low = eq_dets_low;
	}

	public int getEq_dets_mid() {
		return eq_dets_mid;
	}

	public void setEq_dets_mid(int eq_dets_mid) {
		this.eq_dets_mid = eq_dets_mid;
	}

	public int getEq_dets_high() {
		return eq_dets_high;
	}

	public void setEq_dets_high(int eq_dets_high) {
		this.eq_dets_high = eq_dets_high;
	}

	public int getIlf_tot() {
		return ilf_tot;
	}

	public void setIlf_tot(int ilf_tot) {
		this.ilf_tot = ilf_tot;
	}

	public int getEif_tot() {
		return eif_tot;
	}

	public void setEif_tot(int eif_tot) {
		this.eif_tot = eif_tot;
	}

	public int getEi_tot() {
		return ei_tot;
	}

	public void setEi_tot(int ei_tot) {
		this.ei_tot = ei_tot;
	}

	public int getEo_tot() {
		return eo_tot;
	}

	public void setEo_tot(int eo_tot) {
		this.eo_tot = eo_tot;
	}

	public int getEq_tot() {
		return eq_tot;
	}

	public void setEq_tot(int eq_tot) {
		this.eq_tot = eq_tot;
	}

	

}
