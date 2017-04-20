package xml;

import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="data", 
	propOrder={"seq","name","title", "content", "fileName", "regdate"})
public class Data{  
	
	private int seq;
	private String name;
	private String title;
	private String content;
	private String fileName;
	private Date regdate;

	public Data() {}
	
	@Override
	public String toString(){
//		if(fileName != null){
			return "data [seq=" + seq +
					", title=" + title +
					", name=" + name +
					", content=" + content +	
					", fileName=" + fileName +
					", regdate=" + regdate +
					"]";
//		} else {
//			return "data [seq=" + seq +
//					", title=" + title +
//					", name=" + name +
//					", content=" + content +	
//					", regdate=" + regdate +
//					"]";
//		}
	}	

	public Data(int seq, String name, String title, String content, String fileName, Date regdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.regdate = regdate;
	}

	public Data(int seq, String name, String title, String content, Date regdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

	public int getSeq() {
	      return seq;
	}

	public void setSeq(int seq) {
	      this.seq = seq;
	}

	public String getName() {
	      return name;
	}

	public void setName(String name) {
	      this.name = name;
	}

	public String getTitle() {
	      return title;
	}

	public void setTitle(String title) {
	      this.title = title;
	}

	public String getContent() {
	      return content;
	}

	public void setContent(String content) {
	      this.content = content;
	}

	public String getFileName() {
	      return fileName;
	}

	public void setFileName(String fileName) {
	      this.fileName = fileName;
	}

	public Date getRegdate() {		
		return regdate;
	}

	public void setRegdate(Date regdate) {
		
		this.regdate = regdate;
	}

}