package bean;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board{
	
	
	
	
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String file;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private int readcount;
	private Date regDate;
	
	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String fileName;
	private String upDir;
	
	
	
	public MultipartFile getMultiFile() {
		return multiFile;
	}

	public void setMultiFile(MultipartFile multiFile) {
		this.multiFile = multiFile;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUpDir() {
		return upDir;
	}

	public void setUpDir(String upDir) {
		this.upDir = upDir;
	}

	public Board(int num, String writer, String subject, String content, String file, int re_ref, int re_lev,
			int re_seq, int readcount, Date regDate) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.file = file;
		this.re_ref = re_ref;
		this.re_lev = re_lev;
		this.re_seq = re_seq;
		this.readcount = readcount;
		this.regDate = regDate;
	}
	
	public Board(){}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getFile() {
		return file;
	}
	
	public void setFile(String file) {
		this.file = file;
	}
	
	public int getRe_ref() {
		return re_ref;
	}
	
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	
	public int getRe_lev() {
		return re_lev;
	}
	
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	
	public int getRe_seq() {
		return re_seq;
	}
	
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	
	public int getReadcount() {
		return readcount;
	}
	
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
