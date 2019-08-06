package dto;

public class FreQna {

	private int freqna_idx;
	private String question;
	private String answer;
	
	@Override
	public String toString() {
		return "FreQna [freqna_idx=" + freqna_idx + ", question=" + question + ", answer=" + answer + "]";
	}
	
	public int getFreqna_idx() {
		return freqna_idx;
	}
	public void setFreqna_idx(int freqna_idx) {
		this.freqna_idx = freqna_idx;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
