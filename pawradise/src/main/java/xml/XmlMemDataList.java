package xml;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="member")
public class XmlMemDataList {
	
	@XmlElement(name="mylist")
	private List<MemData> mylist;
		
	
	public XmlMemDataList(List<MemData> mylist) {
		super();
		this.mylist = mylist;
	}


	public List<MemData> getMylist() {
		return mylist;
	}


	public void setMylist(List<MemData> mylist) {
		this.mylist = mylist;
	}


	@Override
	public String toString(){
		return "MemDataList [list=" + mylist + "]";
	}
	
	
}
