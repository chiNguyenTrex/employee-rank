package dao;

public class CustomRecord {
	private String id;
	private Long bonusScore;
	private Long penaltyScore;
	
	public CustomRecord() {
		
	}
	
	public CustomRecord(String id, Long bonusScore, Long penaltyScore) {
		super();
		this.id = id;
		this.bonusScore = bonusScore;
		this.penaltyScore = penaltyScore;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getBonusScore() {
		return bonusScore;
	}

	public void setBonusScore(Long bonusScore) {
		this.bonusScore = bonusScore;
	}

	public Long getPenaltyScore() {
		return penaltyScore;
	}

	public void setPenaltyScore(Long penaltyScore) {
		this.penaltyScore = penaltyScore;
	}
	
}
