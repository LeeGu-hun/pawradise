package xml;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="board")
public class XmlDataList {
	
	@XmlElement(name="item")
	private List<Data> list;
		
	public XmlDataList(List<Data> list) {
		this.list = list;
	}

	public XmlDataList() {
		super();
	}

	public List<Data> getList() {
		return list;
	}

	public void setList(List<Data> list) {
		this.list = list;
	}

	@Override
	public String toString(){
		return "DataList [item=" + list + "]";
	}
	
	
}
