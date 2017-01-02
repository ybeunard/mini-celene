package ejb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Reponse {
	@Id @GeneratedValue
	private int id;
	private String rep;
	private boolean bonneRep;
	
	@ManyToOne
	private QuestionReponse QCM;

	public String getRep() {
		return rep;
	}

	public void setRep(String rep) {
		this.rep = rep;
	}

	public boolean isBonneRep() {
		return bonneRep;
	}

	public void setBonneRep(boolean bonneRep) {
		this.bonneRep = bonneRep;
	}

	public QuestionReponse getQCM() {
		return QCM;
	}

	public void setQCM(QuestionReponse qCM) {
		QCM = qCM;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
