package bean;

public class Comment {
	
	 public int seq;       //게시글 번호
     public String name;   //이름
     public String comment;//커멘트
     
     public Comment() {}
     
     public Comment(String name, String comment) {
           this.name = name;
           this.comment = comment;
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
     public String getComment() {
           return comment;
     }
     public void setComment(String comment) {
           this.comment = comment;
     } 
     
}
