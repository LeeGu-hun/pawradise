package command;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ListCommand {
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date from;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date to;

	public Date getFrom() {
		return from;
	}
	public void setFrom(Date from) {
		this.from = transDate(from, " 00:00:00");
	}
	public Date getTo() {
		return to;
	}
	public void setTo(Date to) {
		this.to = transDate(to, " 23:59:59");
	}
	public Date transDate(Date d, String times){
		if(d != null){
			SimpleDateFormat transFormat; 
			transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String toWord = transFormat.format(d) + times;
			transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try { d = transFormat.parse(toWord);
			} catch (Exception e) { e.printStackTrace(); }
		}
		return d;
	}
}
