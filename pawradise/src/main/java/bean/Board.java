package bean;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board{
	
	private int seq;
	private String name;
	private String password;
	private String title;
	private String content;
	private String fileName;
	private Date regdate;
	private int readCount;
	private int reply;


	private MultipartFile multiFile;
	private List<MultipartFile> files;
	private String upDir;

	public Board() {}

	

	public Board(int seq, String name, String title, String content, String fileName, 
			Date regdate, int readCount, int reply) {
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.regdate = regdate;
		this.readCount = readCount;
		this.reply = reply;

	}	


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

	public String getUpDir() {
		return upDir;
	}

	public void setUpDir(String upDir) {
		this.upDir = upDir;
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

	public String getPassword() {
	      return password;
	}

	public void setPassword(String password) {
	      this.password = password;
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

	public int getReadCount() {
	      return readCount;
	}

	public void setReadCount(int readCount) {
	      this.readCount = readCount;
	}

	public int getReply() {
	      return reply;
	}

	public void setReply(int reply) {
	      this.reply = reply;
	}
    

	}