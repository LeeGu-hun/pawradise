package xml;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="member")
public class XmlMemDataList {
	
	@XmlElement(name="list")
	private List<MemData> list;
		
	public XmlMemDataList(List<MemData> list) {
		this.list = list;
	}

	public XmlMemDataList() {
		super();
	}

	public List<MemData> getList() {
		return list;
	}

	public void setList(List<MemData> list) {
		this.list = list;
	}

	@Override
	public String toString(){
		return "MemDataList [lsit=" + list + "]";
	}
	
	
}
