package dto;

import java.util.Date;

public class Qna {
	private int qna_idx;
	private String title;
	private String question;
	private String answer;
	private int member_idx;
	private Date question_date;
	private Date answer_date;
	@Override
	public String toString() {
		return "Qna [qna_idx=" + qna_idx + ", title=" + title + ", question=" + question + ", answer=" + answer
				+ ", member_idx=" + member_idx + ", question_date=" + question_date + ", answer_date=" + answer_date
				+ "]";
	}
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public Date getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}
	
}
