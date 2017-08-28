package cn.gatherlife.wms.business.vo;

public class MethodBean {
	private long id;
	private String remark;
	private String methodUrl;
	private String param;
	private String returnCode;
	private String returnText;
	private String programName;
	private long programId;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getMethodUrl() {
		return methodUrl;
	}
	public void setMethodUrl(String methodUrl) {
		this.methodUrl = methodUrl;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getReturnCode() {
		return returnCode;
	}
	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}
	public String getReturnText() {
		return returnText;
	}
	public void setReturnText(String returnText) {
		this.returnText = returnText;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public long getProgramId() {
		return programId;
	}
	public void setProgramId(long programId) {
		this.programId = programId;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	private int state;
}
