package bloggy.helper;

public class Message {
	private String msg;
	private String msgType;
	private String msgClass;
	public Message() {
		// TODO Auto-generated constructor stub
	}
	public Message(String msg, String msgType, String msgClass) {
		super();
		this.msg = msg;
		this.msgType = msgType;
		this.msgClass = msgClass;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getMsgClass() {
		return msgClass;
	}
	public void setMsgClass(String msgClass) {
		this.msgClass = msgClass;
	}
	@Override
	public String toString() {
		return "Message [msg=" + msg + ", msgType=" + msgType + ", msgClass=" + msgClass + "]";
	}
}
